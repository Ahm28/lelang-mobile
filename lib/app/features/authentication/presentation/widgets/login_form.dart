import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/shared.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool togglePassword = true;

  void handleTogglePassword() {
    setState(() {
      togglePassword = !togglePassword;
    });
  }

  void handleSubmit() {
    if (formKey.currentState!.validate()) {
      context.loader.show();

      Future.delayed(const Duration(seconds: 3), () {
        context.loader.dismiss();
        context.toast.show(type: ToastType.success, message: 'Login Berhasil');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            label: 'Email',
            hintText: 'Masukan Email',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email harus diisi'),
              FormBuilderValidators.email(errorText: 'Email tidak valid'),
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
          AppDimensions.gap2.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                formKey.currentState?.reset();
                context.router.pushNamed('/forgot-password');
              },
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Text('Lupa password?'),
            ),
          ),
          AppDimensions.gap2.verticalSpace,
          CustomButton(
            onPressed: handleSubmit,
            expanded: true,
            child: const Text('Masuk'),
          ),
          AppDimensions.gap6.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Belum punya akun? ',
              style: GoogleFonts.inter(
                color: AppColors.base900,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Daftar disini',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      formKey.currentState?.reset();
                      context.router.pushNamed('/register');
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
