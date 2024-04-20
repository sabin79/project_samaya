import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_samaya/controller/auth_controller.dart';
import 'package:project_samaya/utils/waveindicator.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  File? pickedImage;
  showAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choose Image From'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.camera);

                    Get.to(context);
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Get.to(context);
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String buildVersion = '0.0.1';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: pickedImage != null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(pickedImage!),
                        )
                      : CircleAvatar(
                          radius: 80,
                          child: Image.asset("assects/profile.png"),
                        )),
              SizedBox(
                height: h * 0.02,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Admin Details')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          '${snapshot.data!.docs[0]['name']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          ' ${snapshot.data!.docs[0]['email']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              // Text(
              //   //   currentUser == null ? "" : name.toString(),
              //   "sabin",
              //   style: GoogleFonts.ubuntu(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //       color: Colors.black),
              // ),
              // SizedBox(
              //   height: h * 0.02,
              // ),
              // Text(
              //   // currentUser == null ? "" : email.toString(),
              //   "ssabin",
              //   style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
              // ),
              SizedBox(
                height: h * 0.01,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Update profile",
                      style:
                          GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              const Divider(),
              SizedBox(
                height: h * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.25, vertical: h * 0.12),
                child: GestureDetector(
                  onTap: () => AuthController().logOutUser(),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          IconlyBold.logout,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Logout',
                          style: GoogleFonts.ubuntuCondensed(
                              fontSize: 15.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Version $buildVersion | By 0_PRTCL',
                style:
                    GoogleFonts.bebasNeue(color: Colors.grey, fontSize: 12.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);

      if (photo == null) {
        return;
      }

      setState(() {
        pickedImage = File(photo.path);
      });
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
