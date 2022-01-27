// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_getobx_testing/controller/userController.dart';
import 'package:flutter_getobx_testing/view/editUser.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class userList extends StatelessWidget {
  userList({Key? key}) : super(key: key);

  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Obx(() => ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                controller.users[index].profileUrl),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name - " + controller.users[index].name,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Email - " + controller.users[index].email,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Phone - " + controller.users[index].phone,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Address - " + controller.users[index].address,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: -5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => EditUserPage(
                                      userId: controller.users[index].userId,
                                      name: controller.users[index].name,
                                      email: controller.users[index].email,
                                      address: controller.users[index].address,
                                      phone: controller.users[index].phone,
                                      profileUrl:
                                          controller.users[index].profileUrl,
                                    ));
                              },
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller
                                    .deletingUser(controller.users[index]);
                              },
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                          ],
                        ))
                  ],
                );
              },
            )));
  }
}
