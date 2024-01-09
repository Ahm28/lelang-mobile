import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/shared.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool togglePassword = true;

  void handleTogglePassword() {
    setState(() {
      togglePassword = !togglePassword;
    });
  }

  void handleSubmit() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nama lengkap',
            controller: nameController,
            hintText: 'Masukan nama lengkap',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Nama lengkap harus diisi',
              )
            ]),
          ),
          AppDimensions.gap3.verticalSpace,
          CustomTextFormField(
            label: 'Email',
            controller: emailController,
            hintText: 'Masukan email',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email harus diisi'),
              FormBuilderValidators.email(errorText: 'Email tidak valid')
            ]),
          ),
          AppDimensions.gap3.verticalSpace,
          CustomTextFormField(
            controller: passwordController,
            label: 'Password',
            obscureText: togglePassword,
            hintText: 'Masukan Password',
            suffixIcon: GestureDetector(
              onTap: handleTogglePassword,
              child: Icon(
                togglePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.base700,
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Password harus diisi')
            ]),
          ),
          AppDimensions.gap6.verticalSpace,
          CustomButton(
            onPressed: handleSubmit,
            expanded: true,
            child: const Text('Daftar'),
          ),
          AppDimensions.gap6.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Sudah punya akun? ',
              style: GoogleFonts.inter(
                color: AppColors.base900,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Login',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      formKey.currentState?.reset();
                      context.router.pop();
                    },
                  style: TextStyle(
                    color: AppColors.primary700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
