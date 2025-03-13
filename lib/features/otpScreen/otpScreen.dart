import 'package:agrictools/features/homepage/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpScreen> {
  final _pinCodeController = TextEditingController();

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFFF7F23),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF7F23), Color(0xFFFF9447)],
              begin: AlignmentDirectional(1.0, 0.0),
              end: AlignmentDirectional(-1.0, 0.0),
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Check your phone', style: textTheme.bodyMedium?.copyWith(color: Colors.white)),
              const SizedBox(height: 8),
              Text('We’ve sent the code to your phone', style: textTheme.bodyLarge?.copyWith(color: Colors.white)),
              const SizedBox(height: 16),
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: _pinCodeController,
                textStyle: textTheme.bodySmall,
                pinTheme: PinTheme(
                  fieldHeight: 50.0,
                  fieldWidth: 50.0,
                  shape: PinCodeFieldShape.circle,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.white,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: const Color(0xFFFFE4D1),
                  selectedFillColor: const Color(0xFFFFE4D1),
                ),
                enableActiveFill: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Text('Code expires in: 2:00', style: textTheme.bodyMedium?.copyWith(color: Colors.white)),
              const SizedBox(height: 34),
              _buildButton(context, 'Verify', Colors.white, Colors.black, () => Get.to(() => const MyHomePage())),

              const SizedBox(height: 16),
              _buildOutlinedButton(context, 'Send again', Colors.white, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        ),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, String text, Color borderColor, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: borderColor)),
      ),
    );
  }
}