import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revamph/models/user_model.dart';
import 'package:revamph/providers/user_provider.dart';
import 'package:revamph/services/auth_service.dart';
import 'package:revamph/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        backgroundColor: mobileBackgroundColor,
        actions: [
          TextButton.icon(
            onPressed: () {
              AuthMethods().signout();
            },
            icon: const Icon(Icons.power_settings_new),
            label: const Text('Sign out'),
          )
        ],
      ),
    );
  }
}
