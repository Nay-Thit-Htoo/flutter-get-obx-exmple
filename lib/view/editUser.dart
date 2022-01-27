// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_getobx_testing/controller/userController.dart';
import 'package:flutter_getobx_testing/main.dart';
import 'package:flutter_getobx_testing/model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage(
      {Key? key,
      required this.userId,
      required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.profileUrl})
      : super(key: key);
  final String name, email, phone, address, profileUrl;
  final int userId;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    FocusNode nameFocusNode = new FocusNode();
    FocusNode emailFocusNode = new FocusNode();
    FocusNode phoneFocusNode = new FocusNode();
    FocusNode addressFocusNode = new FocusNode();

    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    addressController.text = address;
    final UserController userController = Get.find();

//for update btn
    void updateUserInfo() {
      if (nameController.text.isEmpty) {
        nameFocusNode.requestFocus();
        return;
      }

      if (emailController.text.isEmpty) {
        emailFocusNode.requestFocus();
        return;
      }

      if (phoneController.text.isEmpty) {
        phoneFocusNode.requestFocus();
        return;
      }

      if (addressController.text.isEmpty) {
        addressFocusNode.requestFocus();
        return;
      }

      User user = User(
          userId,
          nameController.text,
          emailController.text,
          addressController.text,
          phoneController.text,
          profileUrl,
          DateTime.now().toString(),
          DateTime.now().toString());
      userController.updatingUser(user);

      Get.to(MyApp());
    }

//for cancel btn
    void cancelUserInfo() {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
      Get.to(MyApp());
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.to(MyApp());
              },
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(top: 40, left: 10),
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 20, color: Colors.white70),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Updating Information",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: addressController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateUserInfo();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cancelUserInfo();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
