import 'package:connect_with/providers/current_user_provider.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/custom_containers/profile_screen_container/education_card.dart';
import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';

class ShowMoreEducation extends StatefulWidget {
  const ShowMoreEducation({super.key});

  @override
  State<ShowMoreEducation> createState() => _ShowMoreEducationState();
}

class _ShowMoreEducationState extends State<ShowMoreEducation> {
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
                centerTitle: true,
                title: Text(
                  "Educations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.theme['secondaryColor']),
                ),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: appUserProvider.user?.educations?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EducationCard(
                                education:
                                appUserProvider.user!.educations![index]),
                            Divider(),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
