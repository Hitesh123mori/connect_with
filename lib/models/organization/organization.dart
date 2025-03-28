import 'package:connect_with/models/common/address_info.dart';
import 'package:connect_with/models/common/custom_button.dart';

class Organization {
  String? organizationId;
  String? name;
  String? email;
  String? domain;
  String? latestNews;
  String? coverPath;
  String? logo;
  Address? address;
  int? searchCount;
  int? profileView;
  List<String>? employees;
  List<String>? followers;
  List<String>? followings;
  String? about;
  String? website;
  String? companySize;
  String? type;
  List<String>? services;
  String? createAt;
  List<String>? jobs;
  bool? isOrganization ;

  Organization({
    this.organizationId,
    this.name,
    this.jobs,
    this.email,
    this.domain,
    this.createAt,
    this.isOrganization,
    this.coverPath,
    this.latestNews,
    this.profileView,
    this.searchCount,
    this.logo,
    this.address,
    this.followers,
    this.employees,
    this.about,
    this.website,
    this.companySize,
    this.type,
    this.services,
    this.followings,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['organizationId'] = organizationId;
    map['name'] = name;
    map['isOrganization'] = isOrganization ;
    map['latestNews'] = latestNews;
    map['profileView'] = profileView ;
    map['searchCount'] = searchCount ;
    map['email'] = email;
    map['createAt'] = createAt;
    map['domain'] = domain;
    map['coverPath'] = coverPath;
    map['logo'] = logo;
    if (address != null) {
      map['address'] = address!.toJson();
    }
    map['followers'] = followers;
    map['followings'] = followings;
    if (employees != null) {
      map['employees'] = employees;
    }
    map['about'] = about;
    map['website'] = website;
    map['companySize'] = companySize;
    map['type'] = type;
    if (services != null) {
      map['services'] = services;
    }
    if (jobs != null) {
      map['jobs'] = jobs;
    }
    return map;
  }

  // Create an Organization object from JSON
  factory Organization.fromJson(dynamic json) {
    return Organization(
      organizationId: json['organizationId'],
      name: json['name'],
      isOrganization : json['isOrganization'],
      latestNews : json['latestNews'],
      searchCount : json['searchCount'],
      profileView: json['profileView'],
      email: json['email'],
      domain: json['domain'],
      createAt: json['createAt'],
      coverPath: json['coverPath'],
      logo: json['logo'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      employees: json['employees'] != null
          ? List<String>.from(json['employees'])
          : null,
      followers:  json['followers'] != null
          ? List<String>.from(json['followers'])
          : null ,
      followings :json['followings'] != null
          ? List<String>.from(json['followings'])
          : null ,
      about: json['about'],
      website: json['website'],
      companySize: json['companySize'],
      type: json['type'],
      services: json['services'] != null ? List<String>.from(json['services']) : null,
      jobs: json['jobs'] != null ? List<String>.from(json['jobs']) : null,
    );
  }
}
