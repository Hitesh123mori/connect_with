import 'package:connect_with/models/user/user.dart';
import 'package:connect_with/providers/current_user_provider.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/normal_user_widgets/custom_containers/profile_screen_container/experience_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowMoreExperienceScreen extends StatefulWidget {
  final AppUser user ;
  const ShowMoreExperienceScreen({super.key, required this.user});

  @override
  State<ShowMoreExperienceScreen> createState() =>
      _ShowMoreExperienceScreenState();
}

class _ShowMoreExperienceScreenState extends State<ShowMoreExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.theme['secondaryColor'],
        appBar: AppBar(
          backgroundColor: AppColors.theme['primaryColor'],
          toolbarHeight: 50,
          centerTitle: true,
          title: Text(
            "Experiences",
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
                itemCount: widget.user.experiences?.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExperienceCard(
                          experience:
                          widget.user.experiences![index]),
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
  }
}
