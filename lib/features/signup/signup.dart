import 'package:agrictools/features/login/screens/login.dart';
import 'package:agrictools/features/login/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utils/constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisibility = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: TColors.primaryBackground,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: TColors.primaryBackground),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/content/AgrictoolLogo.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 32.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Lottie.network(
                  'https://lottie.host/0f16c71a-a200-4068-bf7a-951d5a5b3b9b/HLIyYcvYEp.json',
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 140.0,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text('Sign up', style: textTheme.headlineLarge),
                        ),
                        _buildTextField(controller: _emailController, icon: Icons.mail_outline, label: 'Email'),
                        _buildTextField(
                          controller: _passwordController,
                          icon: Icons.lock_outline,
                          label: 'Password',
                          obscureText: !_passwordVisibility,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisibility ? Icons.visibility : Icons.visibility_off,
                              color: TColors.iconPrimary,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50.0, top: 8.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: textTheme.bodySmall?.copyWith(color: TColors.warning),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                            ),
                            child: Text('Signup', style: textTheme.titleLarge?.copyWith(color: TColors.white)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'signup');
                            },
                            child: Text(
                              'Already have an account? Login',
                              style: textTheme.bodyMedium?.copyWith(color: TColors.textSecondary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const divider(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 50.0,
        decoration: BoxDecoration(color: TColors.lightGrey, borderRadius: BorderRadius.circular(24.0)),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.only(left: 12.0), child: Icon(icon, color: TColors.iconPrimary)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: label,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    suffixIcon: suffixIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
