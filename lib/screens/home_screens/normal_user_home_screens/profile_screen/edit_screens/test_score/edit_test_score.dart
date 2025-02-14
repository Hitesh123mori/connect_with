import 'package:connect_with/models/user/experience.dart';
import 'package:connect_with/models/user/skills.dart';
import 'package:connect_with/models/user/test_score.dart';
import 'package:connect_with/providers/current_user_provider.dart';
import 'package:connect_with/screens/home_screens/normal_user_home_screens/profile_screen/edit_screens/Experience/edit_screen_experience.dart';
import 'package:connect_with/screens/home_screens/normal_user_home_screens/profile_screen/edit_screens/Skills/edit_screen_skill.dart';
import 'package:connect_with/screens/home_screens/normal_user_home_screens/profile_screen/edit_screens/test_score/edit_screen_test_score.dart';
import 'package:connect_with/screens/home_screens/normal_user_home_screens/profile_screen/profile_screen.dart';
import 'package:connect_with/side_transitions/left_right.dart';
import 'package:connect_with/side_transitions/right_left.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/normal_user_widgets/custom_containers/profile_screen_container/skill_card.dart';
import 'package:connect_with/utils/widgets/normal_user_widgets/custom_containers/profile_screen_container/test_score_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTestScore extends StatefulWidget {
  const EditTestScore({super.key});

  @override
  State<EditTestScore> createState() => _EditTestScoreState();
}

class _EditTestScoreState extends State<EditTestScore> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppUserProvider>(
        builder: (context, appUserProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: AppColors.theme['secondaryColor'],
              appBar: AppBar(
                backgroundColor: AppColors.theme['primaryColor'],
                toolbarHeight: 50,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: appUserProvider.user?.testScores != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edit TestScores",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: appUserProvider.user?.testScores?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, LeftToRight(EditScreenTestScore(scores:appUserProvider.user?.testScores?[index] ?? TestScores())));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Container(
                                  child: TestScoreCard(
                                      testScores: appUserProvider
                                          .user!.testScores![index]),
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                            "Please add Score first",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
