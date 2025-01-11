import 'package:connect_with/utils/widgets/common_widgets/filter_container.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_14.dart';
import 'package:flutter/material.dart';
import 'package:connect_with/models/organization/job_model.dart';
import 'package:connect_with/utils/theme/colors.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/heading_text.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_16.dart';
import 'package:connect_with/utils/widgets/common_widgets/text_style_formats/text_18.dart';
import 'package:connect_with/utils/widgets/organization_widgets/custom_container_org/jobs_widgets/job_card_company.dart';

class JobShowMoreScreenCompany extends StatefulWidget {
  const JobShowMoreScreenCompany({Key? key}) : super(key: key);

  @override
  State<JobShowMoreScreenCompany> createState() =>
      _JobShowMoreScreenCompanyState();
}

class _JobShowMoreScreenCompanyState extends State<JobShowMoreScreenCompany> {

  final List<CompanyJob> jobs = [
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Internship",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 150000,
    ),
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Internship",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 150000,
    ),
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Associate",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 150000,
    ),
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Internship",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Part Time",
      about: "Recently posted",
      salary: 150000,
    ),
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Internship",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 150000,
    ),
    CompanyJob(
      jobOpen: true,
      postDate: DateTime(2014, 1, 5),
      experienceLevel: "Internship",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Apyarsh Development",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "On-site",
      employmentType: "Internship",
      about: "Recently posted",
      salary: 120000,
    ),
    CompanyJob(
      jobOpen: false,
      postDate: DateTime(2025, 1, 3),
      experienceLevel: "Entry level",
      requirements: [
        "Flutter",
        "Data structure",
        "Operating System",
        "Database Management System"
      ],
      companyName: "Google",
      jobTitle: "Software Engineer",
      location: "Ahmedabad, Gujarat, India",
      locationType: "Remote",
      employmentType: "Full Time",
      about: "Recently posted",
      salary: 150000,
    ),
  ];

  String _selectedLocationType = "";
  String _selectedEmployementType = "";
  String _selectedJobOpen = "";
  String _selectedPostDate = "";
  String _selectedExperienceType = "";
  List<CompanyJob> _filteredJobs = [];

  @override
  void initState() {
    super.initState();
    _filteredJobs = List.from(jobs);
  }

  void _applyFilter() {
    setState(() {

      _filteredJobs = jobs;

      if (_selectedJobOpen.isNotEmpty) {
        _filteredJobs = _filteredJobs
            .where((job) =>
                (_selectedJobOpen == "Job Open" && job.jobOpen!) ||
                (_selectedJobOpen == "Job Closed" && !job.jobOpen!))
            .toList();
      }

      if (_selectedPostDate.isNotEmpty) {
        _filteredJobs.sort((a, b) => b.postDate!.compareTo(a.postDate!));
      }

      if (_selectedLocationType.isNotEmpty) {
        _filteredJobs = _filteredJobs
            .where((job) => job.locationType == _selectedLocationType)
            .toList();
      }
      if (_selectedEmployementType.isNotEmpty) {
        _filteredJobs = _filteredJobs
            .where((job) => job.employmentType == _selectedEmployementType)
            .toList();
      }

      if (_selectedExperienceType.isNotEmpty) {
        _filteredJobs = _filteredJobs
            .where((job) => job.experienceLevel == _selectedExperienceType)
            .toList();
      }
    });
  }

  void _showLocationTypeFilter() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.theme['secondaryColor'],
      context: context,
      builder: (context) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                HeadingText(heading: "Choose Location Type"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterContainer(
                      name: "On-Site",
                      onTap: () {
                        setState(() {
                          _selectedLocationType = "On-site";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: "Hybrid",
                      onTap: () {
                        setState(() {
                          _selectedLocationType = "Hybrid";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: "Remote",
                      onTap: () {
                        setState(() {
                          _selectedLocationType = "Remote";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEmployementTypeFilter() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.theme['secondaryColor'],
      context: context,
      builder: (context) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Center(child: HeadingText(heading: "Choose Employment Type")),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterContainer(
                      name: 'Full Time',
                      onTap: () {
                        setState(() {
                          _selectedEmployementType = "Full Time";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Part Time',
                      onTap: () {
                        setState(() {
                          _selectedEmployementType = "Part Time";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Internship',
                      onTap: () {
                        setState(() {
                          _selectedEmployementType = "Internship";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showExperienceLevelFilter() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.theme['secondaryColor'],
      context: context,
      builder: (context) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Center(child: HeadingText(heading: "Choose Experience Level")),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterContainer(
                      name: 'Internship',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Internship";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Entry Level',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Entry Level";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Associate',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Associate";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterContainer(
                      name: 'Senior Associate',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Senior Associate";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Mid-Senior Level',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Mid-Senior Level";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Director',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Director";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterContainer(
                      name: 'Executive',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Executive";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterContainer(
                      name: 'Others',
                      onTap: () {
                        setState(() {
                          _selectedExperienceType = "Others";
                        });
                        Navigator.pop(context);
                        _applyFilter();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text18(
            text: "JOBS",
            isWhite: true,
          ),
          centerTitle: true,
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
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.push(context, LeftToRight(EditProfile()));
              },
              child: Text(
                "CREATE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.theme['secondaryColor'],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // filter Chips
            Center(
              child: Container(
                height: 40,
                width: mq.width * 1,
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        ChoiceChip(
                          checkmarkColor: AppColors.theme['secondaryColor'],
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.theme['secondaryColor'],
                          selectedColor: AppColors.theme['primaryColor'],
                          label: Text(
                            "Most Recents",
                            style: TextStyle(
                              color: _selectedPostDate.isNotEmpty
                                  ? AppColors.theme['secondaryColor']
                                  : Colors.black,
                            ),
                          ),
                          selected: _selectedPostDate.isNotEmpty,
                          onSelected: (bool selected) {
                            if (selected) {
                              setState(() {
                                _selectedPostDate = "Post Date";
                              });
                            } else {
                              setState(() {
                                _selectedPostDate = "";
                              });
                            }
                            _applyFilter();
                          },
                        ),
                        SizedBox(width: 5),
                        ChoiceChip(
                          checkmarkColor: AppColors.theme['secondaryColor'],
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.theme['secondaryColor'],
                          selectedColor: AppColors.theme['primaryColor'],
                          label: Text(
                            "Open Jobs",
                            style: TextStyle(
                              color: _selectedJobOpen.isNotEmpty
                                  ? AppColors.theme['secondaryColor']
                                  : Colors.black,
                            ),
                          ),
                          selected: _selectedJobOpen.isNotEmpty,
                          onSelected: (bool selected) {
                            if (selected) {
                              setState(() {
                                _selectedJobOpen = "Job Open";
                              });
                            } else {
                              setState(() {
                                _selectedJobOpen = "";
                              });
                            }
                            _applyFilter();
                          },
                        ),
                        SizedBox(width: 5),
                        SizedBox(width: 5),
                        ChoiceChip(
                          padding: EdgeInsets.zero,
                          checkmarkColor: AppColors.theme['secondaryColor'],
                          backgroundColor: AppColors.theme['secondaryColor'],
                          selectedColor: AppColors.theme['primaryColor'],
                          label: Row(
                            children: [
                              Text(
                                "Location Type",
                                style: TextStyle(
                                  color: _selectedLocationType.isNotEmpty
                                      ? AppColors.theme['secondaryColor']
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              if (_selectedLocationType.isEmpty)
                                Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                          selected: _selectedLocationType.isNotEmpty,
                          onSelected: (bool selected) {
                            if (selected) {
                              _showLocationTypeFilter();
                            } else {
                              setState(() {
                                _selectedLocationType = "";
                              });
                              _applyFilter();
                            }
                          },
                        ),
                        SizedBox(width: 5),

                        //here
                        ChoiceChip(
                          padding: EdgeInsets.zero,
                          checkmarkColor: AppColors.theme['secondaryColor'],
                          backgroundColor: AppColors.theme['secondaryColor'],
                          selectedColor: AppColors.theme['primaryColor'],
                          label: Row(
                            children: [
                              Text(
                                "Experience Level",
                                style: TextStyle(
                                  color: _selectedExperienceType.isNotEmpty
                                      ? AppColors.theme['secondaryColor']
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              if (_selectedExperienceType.isEmpty)
                                Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                          selected: _selectedExperienceType.isNotEmpty,
                          onSelected: (bool selected) {
                            if (selected) {
                              _showExperienceLevelFilter();
                            } else {
                              setState(() {
                                _selectedExperienceType = "";
                              });
                              _applyFilter();
                            }
                          },
                        ),
                        SizedBox(width: 5),
                        ChoiceChip(
                          padding: EdgeInsets.zero,
                          checkmarkColor: AppColors.theme['secondaryColor'],
                          backgroundColor: AppColors.theme['secondaryColor'],
                          selectedColor: AppColors.theme['primaryColor'],
                          label: Row(
                            children: [
                              Text(
                                "Employment Type",
                                style: TextStyle(
                                  color: _selectedEmployementType.isNotEmpty
                                      ? AppColors.theme['secondaryColor']
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              if (_selectedEmployementType.isEmpty)
                                Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                          selected: _selectedEmployementType.isNotEmpty,
                          onSelected: (bool selected) {
                            if (selected) {
                              _showEmployementTypeFilter();
                            } else {
                              setState(() {
                                _selectedEmployementType = "";
                              });
                              _applyFilter();
                            }
                          },
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Job cards list (scrollable)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    if (_filteredJobs.isNotEmpty)
                      ListView.builder(
                        itemCount: _filteredJobs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return JobCardCompany(cjob: _filteredJobs[index]);
                        },
                      )
                    else
                      Container(
                          height: mq.height * 0.8,
                          width: mq.width * 1,
                          child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/other_images/no_job.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "N O , J O B S",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey),
                              )
                            ],
                          ))),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
