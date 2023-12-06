import 'package:fingerprint_authentication/UI/profileView/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(viewModelBuilder:()=> ProfileViewModel(), builder: (context, viewModel, child){

      return const Scaffold(
        body: Center(
          child: Text("Authentication Successfull"),
        ),
      );
    });
  }
}