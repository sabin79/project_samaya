import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../controller/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assects/profile.png"),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  "Sabin Dahal",
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  "sabin.dahal@gmail.com",
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
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
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, color: Colors.white),
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
                            ])),
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
      ),
    );
  }
}
