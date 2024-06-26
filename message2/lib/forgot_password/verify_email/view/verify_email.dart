import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/forgot_password/verify_email/cubit/verify_email_cubit.dart';
import 'package:message2/forgot_password/verify_otp/view/verify_otp_page.dart';
import 'package:message2/shared/custom_app_bar.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/text_field_widget.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  static const String routePath = '/verify-email';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyEmailCubit(),
      child: const VerifyEmailView(),
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  bool get isOpened => MediaQuery.of(context).viewInsets.bottom != 0;

  void closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: '',
          ),
          body: GestureDetector(
            onTap: closeKeyboard,
            child: Padding(
              padding: const EdgeInsets.all(AppFontSize.md),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: AppFontSize.lg),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor.withOpacity(.8),
                      ),
                    ),
                    const SizedBox(height: AppFontSize.md),
                    Text(
                      'Recover your password account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor.withOpacity(.6),
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xxxlg),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor.withOpacity(.6),
                            ),
                          ),
                          const SizedBox(height: AppFontSize.md),
                          TextFieldWidget(
                            controller: controller,
                            hintText: 'Enter your email',
                          ),
                          const SizedBox(height: AppFontSize.xxxlg),
                          ElevatedButtonWidget(
                              title: 'Continue',
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(VerifyOtpPage.routePath);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
