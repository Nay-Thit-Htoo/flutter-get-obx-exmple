// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_getobx_testing/controller/userController.dart';
import 'package:flutter_getobx_testing/main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteUser extends StatelessWidget {
  DeleteUser({Key? key}) : super(key: key);

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Get Example With Obx"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Get.to(MyApp());
              },
            )),
        body: Column(
          children: [
            Flexible(
                child: Obx(() => ListView.builder(
                      itemCount: controller.deletedUserList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(controller
                                        .deletedUserList[index].profileUrl),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name - " +
                                            controller
                                                .deletedUserList[index].name,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        "Email - " +
                                            controller
                                                .deletedUserList[index].email,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        "Phone - " +
                                            controller
                                                .deletedUserList[index].phone,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        "Address - " +
                                            controller
                                                .deletedUserList[index].address,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "DELETED DATE : " +
                                            controller.deletedUserList[index]
                                                .deleteDate
                                                .split(" ")[0],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ],
                          ),
                        );
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}
