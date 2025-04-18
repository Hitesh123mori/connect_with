import 'dart:developer';

import 'package:connect_with/apis/common/auth_apis.dart';
import 'package:connect_with/apis/common/post/post_api.dart';
import 'package:connect_with/apis/init/config.dart';
import 'package:connect_with/apis/normal/user_crud_operations/user_details_update.dart';
import 'package:connect_with/apis/organization/organization_crud_operation/organization_crud.dart';
import 'package:connect_with/main.dart';
import 'package:connect_with/models/common/post_models/post_model.dart';
import 'package:connect_with/models/organization/organization.dart';
import 'package:connect_with/models/user/user.dart';
import 'package:connect_with/providers/current_user_provider.dart';
import 'package:connect_with/providers/organization_provider.dart';
import 'package:connect_with/screens/home_screens/normal_user_home_screens/profile_screen/other_user_profile_screen.dart';
import 'package:connect_with/screens/home_screens/organization_home_screens/profile_screen_org/other_company_profile.dart';
import 'package:connect_with/side_transitions/left_right.dart';
import 'package:connect_with/utils/helper_functions/helper_functions.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_14.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final Comment cm ;
  final String postId;
  final String postCreater ;
  const CommentCard({super.key, required this.cm, required this.postCreater, required this.postId});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {

  bool showMore = false;

  bool isCommentOrg = false;
  bool isAuthIsOrg = false;

  AppUser? user;
  Organization? org ;

  List<Map<String, dynamic>> refinedUsers = [];

  GlobalKey<FlutterMentionsState> mentions_key = GlobalKey<FlutterMentionsState>();

  Future<List<Map<String, dynamic>>> fetchUsers() async {

    List<Map<String, dynamic>> users = await UserProfile.getAllAppUsersList();

    refinedUsers = users.map((user) {
      return {
        'id': user['userID'],
        'display': user['userName'],
        'full_name': user['userName'],
        'description': user['headLine'],
        'photo': user['profilePath'] ?? "",
      };
    }).toList();


    return refinedUsers;

  }

  Future<void> fetchUser() async {
    try {

      isAuthIsOrg = await AuthApi.userExistsById(Config.auth.currentUser!.uid, true);

      isCommentOrg  =  await AuthApi.userExistsById(widget.cm.userId ?? "", true);

      // print("isCommentOrg : ${isCommentOrg} ") ;

      if(isCommentOrg){

        var userData = await OrganizationProfile.getOrganizationById(widget.cm.userId ?? "");

        setState(() {
          org = Organization.fromJson(userData);
          // print("Org Name : ${org?.name} ") ;
        });
      }else{
        var userData = await UserProfile.getUser(widget.cm.userId ?? "");

        setState(() {
          user = AppUser.fromJson(userData);
          // print("User Name : ${user?.userName} ") ;
        });
      }


    } catch (e) {
      log("Error while fetching user in comment card: $e");
    }
  }

  @override
  void initState(){
    super.initState() ;
    fetchUser() ;
    fetchUsers() ;
  }

  void toggleLike(String likeUserID,bool isLiked) async {
    setState(() {
      isLiked = !isLiked;
    });

    try {
      if (isLiked) {
        await PostApis.addLikeComment(
            widget.postId ?? "",widget.cm.commentId ?? "" ,likeUserID ?? "");
      } else {
        await PostApis.removeLikeComment(
            widget.postId ?? "", widget.cm.commentId ?? "",likeUserID ?? "");
      }
      setState(() {});
    } catch (e) {
      log("Error updating like  in comment: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer2<AppUserProvider,OrganizationProvider>(builder: (context,appUserProvider,orgProvider,child){
      return Column(
        children: [

          Row(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Container(
                  width: mq.width * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.theme['secondaryColor'],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 0,
                        spreadRadius: 0.1,
                        offset: Offset(0, 0.1),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // user details and time
                      GestureDetector(
                      onTap :isCommentOrg? (){
                        Navigator.push(context, LeftToRight(OtherCompanyProfile(org: org ?? Organization()))) ;
                        }  :(){
                        Navigator.push(context, LeftToRight(OtherUserProfileScreen(user: user ?? AppUser()))) ;
                      },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isCommentOrg ?
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: org?.logo == ""? AssetImage("assets/other_images/org_logo.png") :NetworkImage(org?.logo ?? ""),
                                      backgroundColor: AppColors
                                          .theme['primaryColor']
                                          .withOpacity(0.1),
                                     )
                                         : CircleAvatar(
                                      radius: 20,
                                      backgroundImage: user?.profilePath == ""? AssetImage("assets/other_images/photo.png") :NetworkImage(user?.profilePath ?? ""),
                                      backgroundColor: AppColors
                                          .theme['primaryColor']
                                          .withOpacity(0.1),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(isCommentOrg ? (org?.name??"")  : (user?.userName ?? ""),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .theme['tertiaryColor'])),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            if ((isCommentOrg ? (org?.organizationId) : (user?.userID)) == widget.postCreater)
                                              Container(
                                                height: 20,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(6),
                                                  color: AppColors
                                                      .theme['primaryColor'],
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      "Author",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    )),
                                              )
                                          ],
                                        ),
                                        Text(
                                          (isCommentOrg? (org?.domain ?? "")  : (user?.headLine ?? "")),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors
                                                  .theme['tertiaryColor']
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            if((isAuthIsOrg ? (orgProvider.organization?.organizationId) : (appUserProvider.user?.userID)) == widget.cm.userId)
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0,),
                                  child: CustomPopup(
                                    barrierColor: Colors.transparent,
                                    backgroundColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 2),
                                    content: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          TextButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                                showEditCommentDialog(
                                                  context,
                                                  widget.postId,
                                                  widget.cm.commentId ?? "",
                                                  HelperFunctions.base64ToString(widget.cm.description?? "") , (updatedComment) {
                                                    print("Updated Comment: $updatedComment");
                                                  },
                                                );

                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(color: Colors.black),
                                              )
                                          ),
                                             TextButton(
                                              onPressed: ()async{

                                                Navigator.pop(context);

                                                await PostApis.deleteComment(widget.postId,widget.cm.commentId ?? "") ;
                                                setState(() {
                                                });

                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.more_vert_rounded),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // main description
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              )),
                          child: buildDescription(HelperFunctions.base64ToString(widget.cm.description ?? "")),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                // GestureDetector(
                                //   onTap: () {
                                //     setState(() {
                                //       toggleLike(appUserProvider.user ?? AppUser(),widget.cm.likes?[appUserProvider.user?.userID] ?? false);
                                //     });
                                //   },
                                //   child: Text("Likes ",
                                //       style: TextStyle(
                                //           fontSize: 12,
                                //           color: AppColors.theme['tertiaryColor']
                                //               .withOpacity(0.5))
                                //   ),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      toggleLike(isAuthIsOrg? (orgProvider.organization?.organizationId ?? "") :(appUserProvider.user?.userID ?? ""), isAuthIsOrg ? (widget.cm.likes?[orgProvider.organization?.organizationId] ?? false)  : (widget.cm.likes?[appUserProvider.user?.userID] ?? false));
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation) {
                                          return ScaleTransition(
                                              scale: animation, child: child);
                                        },
                                        child: (isAuthIsOrg ? (widget.cm.likes?[orgProvider.organization?.organizationId] ?? false)  : (widget.cm.likes?[appUserProvider.user?.userID] ?? false))
                                            ? FaIcon(
                                          FontAwesomeIcons.solidThumbsUp,
                                          key: ValueKey<bool>(isAuthIsOrg ? (widget.cm.likes?[orgProvider.organization?.organizationId] ?? false)  : (widget.cm.likes?[appUserProvider.user?.userID] ?? false)),
                                          color: Colors.blueAccent,
                                          size: 18,
                                        )
                                            : FaIcon(
                                          FontAwesomeIcons.thumbsUp,
                                          key: ValueKey<bool>(isAuthIsOrg ? (widget.cm.likes?[orgProvider.organization?.organizationId] ?? false)  : (widget.cm.likes?[appUserProvider.user?.userID] ?? false)),
                                          color: AppColors.theme['tertiaryColor']!
                                              .withOpacity(0.5),
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                    widget.cm.likes==null ? "0" : widget.cm.likes!.length.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.theme['tertiaryColor']
                                            .withOpacity(0.5))),
                                Text(" | ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.theme['tertiaryColor']
                                            .withOpacity(0.5))),
                                Text("Comments ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.theme['tertiaryColor']
                                            .withOpacity(0.5))),
                                Text("0",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.theme['tertiaryColor']
                                            .withOpacity(0.5))),
                              ],
                            ),

                            Text(
                              HelperFunctions.timeAgo(
                                widget.cm.time != null
                                    ? DateTime.parse(widget.cm.time!)
                                    : DateTime.now(),),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.theme['tertiaryColor']
                                      .withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),

          // // this is reply comment
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: BouncingScrollPhysics(),
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Padding(
          //           padding:
          //           const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          //           child: Container(
          //             width: mq.width * 0.8,
          //             decoration: BoxDecoration(
          //               color: AppColors.theme['secondaryColor'],
          //               borderRadius: BorderRadius.circular(10),
          //               border: Border.all(
          //                 color: Colors.grey.shade200,
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.black.withOpacity(0.1),
          //                   blurRadius: 0,
          //                   spreadRadius: 0.1,
          //                   offset: Offset(0, 0.1),
          //                 )
          //               ],
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 // user details and time
          //                 Row(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       height: 70,
          //                       decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.only(
          //                             topRight: Radius.circular(5),
          //                             topLeft: Radius.circular(5),
          //                           )),
          //                       child: Padding(
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 10.0, vertical: 10),
          //                         child: Row(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             CircleAvatar(
          //                               radius: 20,
          //                               backgroundImage: AssetImage(
          //                                   "assets/other_images/photo.png"),
          //                               backgroundColor: AppColors
          //                                   .theme['primaryColor']
          //                                   .withOpacity(0.1),
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Column(
          //                               crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                               children: [
          //                                 Row(
          //                                   children: [
          //                                     Text("Hitesh Mori",
          //                                         style: TextStyle(
          //                                             fontSize: 12,
          //                                             fontWeight: FontWeight.bold,
          //                                             color: AppColors.theme[
          //                                             'tertiaryColor'])),
          //                                     SizedBox(
          //                                       width: 5,
          //                                     ),
          //                                     if (appUserProvider.user?.userID== user?.userID)
          //                                       Container(
          //                                         height: 20,
          //                                         width: 60,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius:
          //                                           BorderRadius.circular(6),
          //                                           color: AppColors
          //                                               .theme['primaryColor'],
          //                                         ),
          //                                         child: Center(
          //                                             child: Text(
          //                                               "Author",
          //                                               style: TextStyle(
          //                                                   fontWeight:
          //                                                   FontWeight.bold,
          //                                                   fontSize: 12,
          //                                                   color: Colors.white),
          //                                             )),
          //                                       )
          //                                   ],
          //                                 ),
          //                                 Text(
          //                                   user?.headLine ?? "",
          //                                   style: TextStyle(
          //                                       fontSize: 12,
          //                                       color: AppColors
          //                                           .theme['tertiaryColor']
          //                                           .withOpacity(0.5)),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     Row(
          //                       children: [
          //                         Text(
          //                           "8h",
          //                           style: TextStyle(
          //                               fontSize: 12,
          //                               color: AppColors.theme['tertiaryColor']
          //                                   .withOpacity(0.5)),
          //                         ),
          //                         IconButton(
          //                             onPressed: () {},
          //                             icon: Icon(
          //                               Icons.more_vert_rounded,
          //                               size: 20,
          //                             )),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //
          //                 // main description
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(
          //                       horizontal: 10.0, vertical: 5),
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                           topRight: Radius.circular(5),
          //                           topLeft: Radius.circular(5),
          //                         )),
          //                     child: buildDescription(
          //                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          //                   ),
          //                 ),
          //
          //                 Padding(
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 10.0, vertical: 15),
          //                   child: Row(
          //                     children: [
          //                       Text("0",
          //                           style: TextStyle(
          //                               fontSize: 12,
          //                               color: AppColors.theme['tertiaryColor']
          //                                   .withOpacity(0.5))
          //                       ),
          //                       Text(" reactions",
          //                           style: TextStyle(
          //                               fontSize: 12,
          //                               color: AppColors.theme['tertiaryColor']
          //                                   .withOpacity(0.5))),
          //
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      );
    }) ;
  }

  Widget buildDescription(String text) {
    return HelperFunctions.parseText(text, context, true);
  }


  void showEditCommentDialog(
      BuildContext context,
      String postId,
      String commentId,
      String initialText,

      Function(String) onCommentEdited) {


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Center(
            child: Text(
              "Edit Comment",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
          ),
          content:buildDescriptionTextField(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: ()async{
                if (mentions_key.currentState?.controller?.markupText!="") {
                  await PostApis.editComment(postId, commentId, HelperFunctions.stringToBase64(mentions_key.currentState?.controller?.markupText.trim() ?? ""));
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.theme['primaryColor'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Edit",style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  String editFormatText(String input) {

    final regex = RegExp(r'([#@])\[\S+\]\(__(.+?)__\)');

    return input.replaceAllMapped(regex, (match) => '${match.group(1)}${match.group(2)}');

  }

  Widget buildDescriptionTextField() {

    String defaultText = "" ;

    defaultText =  editFormatText(HelperFunctions.base64ToString(widget.cm.description ?? ""));

    return Container(
      width: 100,
      child: Theme(
        data: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: AppColors.theme['primaryColor'],
            cursorColor: AppColors.theme['primaryColor'],
            selectionColor: AppColors.theme['primaryColor']!.withOpacity(0.3),
          ),
        ),
        child: FlutterMentions(
          key: mentions_key,
          suggestionPosition: SuggestionPosition.Bottom,
          maxLength: null,
          defaultText: defaultText,
          maxLines: 1000000000000000000,
          minLines: 1,
          decoration: InputDecoration(
            hintText: 'Start writing your comment here',
            border: InputBorder.none,
          ),
          mentions: [
            Mention(
              trigger: '@',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              data: refinedUsers,
              suggestionBuilder: (data) {
                return Container(
                  child: ListTile(
                    leading: data['photo'] == ""
                        ? CircleAvatar(
                        radius: 24,
                        backgroundColor:
                        AppColors.theme['primaryColor'].withOpacity(0.1),
                        backgroundImage:
                        AssetImage("assets/other_images/photo.png"))
                        : CircleAvatar(
                        radius: 24,
                        backgroundColor:
                        AppColors.theme['primaryColor'].withOpacity(0.1),
                        backgroundImage: NetworkImage(data['photo'])),
                    title: Text(
                      data['full_name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${data['description']}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
