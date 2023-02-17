import 'package:flutter/material.dart';
import 'package:revamph/screens/signup_screens/signup_alumni_screen.dart';
import 'package:revamph/screens/signup_screens/signup_student_screen.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({super.key});

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  final List<String> userType = ['Student', 'Faculty', 'Alumni'];
  String dropdownValue = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose the category you fall under:',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: DropdownButtonFormField(
                dropdownColor: Colors.blueGrey[700],
                borderRadius: BorderRadius.circular(20),
                value: dropdownValue,
                items: userType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                if (dropdownValue == "Student" || dropdownValue == 'Faculty') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SignUpAlumni()),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
