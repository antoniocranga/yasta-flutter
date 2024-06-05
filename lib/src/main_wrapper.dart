import 'package:flutter/material.dart';
import 'package:healthkit_plugin/healthkit_plugin.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () async {
            bool? isAuthorized = await HealthkitPlugin().requestAuthorization();
            print("Authorization status: $isAuthorized");
          }, child: Text("Request Authorization"))
        ],
      )
    );
  }
}
