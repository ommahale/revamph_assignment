import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revamph/screens/user_type.dart';
import 'package:revamph/services/auth_service.dart';
import 'package:revamph/shared_widgets/text_field_input.dart';
import 'package:revamph/utils/colors.dart';
import 'package:revamph/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().logInUser(
        email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != "success" && mounted) {
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset(
          'assets/bg.svg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle_sharp,
                      size: 100,
                      color: Colors.tealAccent,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: 'Enter your email',
                      isPass: false,
                      textEditingController: _emailController,
                      textInputType: TextInputType.emailAddress,
                      iconData: Icons.mail,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Enter your password',
                      isPass: true,
                      textEditingController: _passwordController,
                      textInputType: TextInputType.emailAddress,
                      iconData: Icons.lock_outline_sharp,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: logInUser,
                        child: _isLoading == false
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Log in',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              )
                            : const CircularProgressIndicator(
                                color: primaryColor,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          child: const Text(
                            'Sign-up',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => const ChooseType()),
                              ),
                            ); //Navigator
                          }, //onpressed
                        )
                      ], //children Row
                    ),
                  ], //children
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
