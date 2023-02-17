import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:revamph/screens/login_screen.dart';
import 'package:revamph/services/auth_service.dart';
import 'package:revamph/shared_widgets/text_field_input.dart';
import 'package:revamph/utils/colors.dart';
import 'package:revamph/utils/utils.dart';

class SignUpAlumni extends StatefulWidget {
  const SignUpAlumni({super.key});

  @override
  State<SignUpAlumni> createState() => _SignUpAlumniState();
}

class _SignUpAlumniState extends State<SignUpAlumni> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cllgnameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  Uint8List? _image;
  Uint8List? _resume;
  String _file = 'Upload resume (optional)';
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _cllgnameController.dispose();
    _mobileController.dispose();
    _yearController.dispose();
  }

  void selectImage() async {
    dynamic image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        withData: true, allowedExtensions: ['pdf'], type: FileType.custom);
    if (result != null) {
      setState(() {
        _resume = result.files.first.bytes;
        _file = result.files.first.name;
      });
    } else {
      return;
    }
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      cllgName: _cllgnameController.text,
      mobile: _mobileController.text,
      year: _yearController.text,
      isAlumni: true,
      profilePic: _image,
      resume: _resume,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      snackBar(res);
    } else {
      toLogin();
    }
  }

  void snackBar(String data) {
    showSnackBar(context, data);
  }

  void toLogin() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //instagram logo svg

                //text area username
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    AssetImage('assets/avatar.jpg'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                              onPressed: selectImage,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    width: 500,
                    iconData: Icons.mail,
                    hintText: 'Enter your email id',
                    isPass: false,
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                //text area password
                CustomTextField(
                    width: 500,
                    iconData: Icons.lock,
                    hintText: 'Enter your password',
                    isPass: true,
                    textEditingController: _passwordController,
                    textInputType: TextInputType.text),

                //button login
                //signup
                const SizedBox(
                  height: 20,
                ),
                //text area password
                CustomTextField(
                    width: 500,
                    iconData: Icons.perm_identity_sharp,
                    hintText: 'Enter your name',
                    isPass: false,
                    textEditingController: _nameController,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    width: 500,
                    iconData: Icons.school,
                    hintText: 'Enter your college name',
                    isPass: false,
                    textEditingController: _cllgnameController,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                //text area password
                CustomTextField(
                    width: 500,
                    iconData: Icons.phone,
                    hintText: 'Enter your mobile number',
                    isPass: false,
                    textEditingController: _mobileController,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    width: 200,
                    iconData: Icons.date_range,
                    hintText: 'Passout Year',
                    isPass: false,
                    textEditingController: _yearController,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.attach_file_outlined,
                    ),
                    TextButton(
                        onPressed: selectFile,
                        child: Text(
                          _file,
                          style: const TextStyle(
                              fontSize: 15, color: primaryColor),
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: signUpUser,
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _isLoading == false
                                ? const [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ]
                                : const [
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
