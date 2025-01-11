import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_with/apis/init/config.dart';
import 'package:connect_with/models/organization/job_model.dart';
import 'package:connect_with/providers/organization_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class OrganizationProfile {
  static final _collectionRefOrg = Config.firestore.collection("organizations");
  static final _collectionRefJob = Config.firestore.collection("jobs");

  // upload image
  static Future<String?> uploadMediaOrganization(
      File file, String path, String userId) async {
    final fileName = basename(file.path);
    final ext = fileName.split('.').last;

    log('Uploading media file: $fileName, extension: $ext');

    final ref = Config.storage
        .ref()
        .child('connect_with_images/$userId/media/$fileName');

    try {
      final uploadTask =
          await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));
      log('Data Transferred: ${uploadTask.bytesTransferred / 1000} kb');

      final downloadUrl = await ref.getDownloadURL();
      log('Media uploaded successfully: $downloadUrl');

      return downloadUrl;
    } catch (e) {
      log('Error uploading media: $e');
      return null;
    }
  }

  // update logo and coverimage
  static Future<void> updatePictureOrganization(File file, String path,
      bool isLogo, OrganizationProvider provider) async {
    final currentOrganization = provider.organization;

    if (currentOrganization == null) {
      log('Organization is not logged in.');
      return;
    }

    final fileName = basename(file.path);
    final ext = fileName.split('.').last;

    log('Uploading file: $fileName, extension: $ext');

    final ref = Config.storage.ref().child(
        'connect_with_images/${currentOrganization.organizationId}${isLogo ? "/logo" : "/cover"}/$fileName');

    try {
      final uploadTask =
          await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'));
      log('Data Transferred: ${uploadTask.bytesTransferred / 1000} kb');

      final downloadUrl = await ref.getDownloadURL();

      if (isLogo) {
        currentOrganization.logo = downloadUrl;
        await Config.firestore
            .collection('organizations')
            .doc(currentOrganization.organizationId)
            .update({
          'logo': currentOrganization.logo,
        });
      } else {
        currentOrganization.coverPath = downloadUrl;
        await Config.firestore
            .collection('organizations')
            .doc(currentOrganization.organizationId)
            .update({
          'coverPath': currentOrganization.coverPath,
        });
      }
      await provider.initOrganization();
      log('Image uploaded successfully: $downloadUrl');
    } catch (e) {
      log('Error uploading image: $e');
    }
  }

  // get organization by id
  static Future<Map<dynamic, dynamic>?> getOrganization(
      String organizationId) async {
    return await _collectionRefOrg
        .doc(organizationId)
        .get()
        .then((value) => value.data())
        .onError(
            (error, stackTrace) => {"error": error, "stackTrace": stackTrace});
  }

  // get all organization
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllOrganization() {
    return _collectionRefOrg.snapshots();
  }

  // update company profile details
  static Future<bool> updateOrganizationProfile(
      String? organizationId, Map<String, dynamic> fields) async {
    return await _collectionRefOrg
        .doc("$organizationId")
        .update(fields)
        .then((value) {
      log("#organization Details updated");
      return true;
    }).onError((error, stackTrace) {
      log("#update-e: $error, $stackTrace");
      return false;
    });
  }

  // adding job
  static Future<bool> addJob(String? orgID,CompanyJob cjob) async {
    try {

      // add job in job collection
      DocumentReference docRef = await _collectionRefJob.add({
        'companyId': cjob.companyId,
        'jobId' : "",
        'companyName': cjob.companyName,
        'jobTitle': cjob.jobTitle,
        'easyApply': cjob.easyApply,
        'applyLink': cjob.applyLink,
        'location': cjob.location,
        'experienceLevel': cjob.experienceLevel,
        'locationType': cjob.locationType,
        'postDate': cjob.postDate,
        'jobOpen': cjob.jobOpen,
        'employmentType': cjob.employmentType,
        'applicants': cjob.applicants,
        'applications': cjob.applications,
        'about': cjob.about,
        'salary': cjob.salary,
        'requirements': cjob.requirements,
      });

      String jobId = docRef.id;

      // store id to org collection
      DocumentSnapshot orgDoc = await _collectionRefOrg.doc(orgID).get();
      if (orgDoc.exists) {

        List<dynamic> existingJobIDs = orgDoc['jobs'] ?? [];

        existingJobIDs.add(jobId);

        await _collectionRefOrg.doc(orgID).update({
          'jobs': existingJobIDs,
        });

        log("#JobIDs added successfully");
      }

      await docRef.update({'jobId': jobId});

      return true;

    } catch (e) {
      print('Error adding job: $e');
      return false;
    }
  }

  //fetch job by id
  static Future<dynamic> getJobById(String jobId) async {
    try {
      final docSnapshot = await _collectionRefJob.doc(jobId).get();
      if (docSnapshot.exists) {
        // print(docSnapshot.data());
        return docSnapshot.data();
      } else {
        return false;
      }
    } catch (error, stackTrace) {
      return {
        "error": error.toString(),
        "stackTrace": stackTrace.toString(),
      };
    }
  }

}
