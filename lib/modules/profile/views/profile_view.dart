import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:uptodo/core/constants/app_strings.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // avatar & name
          Container(
            height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            child: Icon(Icons.person, color: Colors.white, size: 50,),
          ),

          Container(
            height: 250,
            child: GridView.builder(
              itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),

                  );
                }),
          )
          // task status

          // settings
          //// app settings

          // account
          //// change account name
          //// change password
          //// change image

          // uptodo
          //// about us
          //// FAQ
          //// help and feedback
          //// support us
        ]
    ));}
}