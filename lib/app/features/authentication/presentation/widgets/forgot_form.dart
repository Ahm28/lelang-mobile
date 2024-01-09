import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../shared/shared.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  void handleSubmit() {
    if (formKey.currentState!.validate()) {
      context.loader.show();
      Future.delayed(const Duration(seconds: 3), () {
        context.loader.dismiss();

        context.toast.show(
          type: ToastType.error,
          message: 'Email tidak terdaftar',
        );
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
            label: 'Email',
            controller: emailController,
            hintText: 'Masukan email',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email harus diisi'),
              FormBuilderValidators.email(errorText: 'Email tidak valid')
            ]),
          ),
          AppDimensions.gap6.verticalSpace,
          CustomButton(
            onPressed: handleSubmit,
            expanded: true,
            child: const Text('Kirim'),
          )
        ],
      ),
    );
  }
}
