import 'package:fingerprint_authentication/UI/homeview/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("FingerPrint Authentication")),
              backgroundColor: Color.fromARGB(255, 99, 104, 168),
            ),
            backgroundColor: Color.fromARGB(255, 99, 104, 168),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.symmetric(vertical: 50.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/images/e9a30fe9e5299be75e99f836e4f09809-gradient-fingerprint-illustration-removebg-preview.png",
                            width: 120,
                          ),
                          const Text(
                            "FingerPrint Auth",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsetsDirectional.symmetric(
                                vertical: 15.0),
                            child: const Text(
                              "Authentication using your fingerprint instead of pasword",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, height: 1.5),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 15.0),
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll(0.0),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF04A5ED)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      30.0)))),
                                  onPressed: () {
                                    viewModel.authenticate();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 14),
                                    child: Text(
                                      "Authentication",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )))
                        ]),
                      )
                    ]),
              ),
            ),
          );
        });
  }
}
