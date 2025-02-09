import 'package:connect_with/apis/organization/organization_crud_operation/organization_crud.dart';
import 'package:connect_with/main.dart';
import 'package:connect_with/models/organization/organization.dart';
import 'package:connect_with/models/user/education.dart';
import 'package:connect_with/side_transitions/left_right.dart';
import 'package:connect_with/utils/helper_functions/photo_view.dart';
import 'package:connect_with/utils/shimmer_effects/normal_user/education_card_shimmer_effect.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_14.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_16.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_18.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatefulWidget {
  final Education education;
  const EducationCard({super.key, required this.education});

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  late Future<Organization?> _organizationFuture;

  @override
  void initState() {
    super.initState();
    _organizationFuture = _fetchOrganization();
  }

  Future<Organization?> _fetchOrganization() async {
    await Future.delayed(Duration(seconds: 2));

    String orgId = widget.education.schoolId ?? "";
    if (await OrganizationProfile.checkOrganizationExists(orgId)) {
      return Organization.fromJson(await OrganizationProfile.getOrganizationById(orgId));
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return FutureBuilder<Organization?>(
        future: _organizationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:EducationCardShimmerEffect(),
            );
          }
          final org = snapshot.data;
          final name = org?.name ?? widget.education.schoolId ??
              "Unknown Company";
          return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.theme['secondaryColor']?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    org==null || org.logo=="" ? CircleAvatar(
                        radius: 20,
                        backgroundColor:
                        AppColors.theme['primaryColor']?.withOpacity(0.2),
                        child: Icon(Icons.business,
                            color: AppColors.theme['primaryColor'])
                    ) : CircleAvatar(
                      radius: 20,
                      backgroundColor:
                      AppColors.theme['primaryColor']?.withOpacity(0.2),
                      backgroundImage: NetworkImage(org.logo ?? ""),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text16(text: name),
                          if (widget.education.location!.isNotEmpty)
                            Text14(
                              text: (widget.education.location ?? "location"),
                              isBold: false,
                            ),

                          Text14(
                            text: widget.education.fieldOfStudy ?? "Degree",
                            isBold: false,
                          ),
                          Text14(
                            isBold: false,
                            text: (widget.education.startDate ?? "Start") +
                                " - " +
                                (widget.education.endDate ?? "End"),
                          ),

                          if (widget.education.grade != "")
                            Text14(
                              text: "Grade: " + (widget.education.grade ??
                                  "Grade"),
                              isBold: false,
                            ),

                          // Allow description to wrap properly
                          if (widget.education.description != "")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  widget.education.description ??
                                      "Description here",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),

                          if (widget.education.skills!.isNotEmpty)
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Wrap(
                                  children: widget.education.skills!
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final skill = entry.value;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text14(
                                            text: skill,
                                            isBold: false,
                                          ),
                                          if (index !=
                                              widget.education.skills!.length -
                                                  1)
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 4.0),
                                              child: Text(
                                                "•", // Dot separator
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),

                          if (widget.education.media != "")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.theme['primaryColor']
                                          .withOpacity(0.2),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        widget.education.media!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        LeftToRight(ImageViewScreen(
                                          path: widget.education.media ?? "",
                                          isFile: false,
                                        )));
                                  },
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
