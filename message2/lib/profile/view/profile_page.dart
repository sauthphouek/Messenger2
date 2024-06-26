import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/forgot_password/verify_email/view/view.dart';
import 'package:message2/notification/notification.dart';
import 'package:message2/profile/profile.dart';
import 'package:message2/profile/profile_editing/view/view.dart';
import 'package:message2/profile/security/security.dart';
import 'package:message2/profile/view_profile/view/view.dart';
import 'package:message2/profile/widget/change_password.dart';
import 'package:message2/profile/widget/legal_&_policy.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: .5,
            toolbarHeight: 92,
            title: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.2),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sticker.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Shaut Meaz',
                      style: TextStyle(
                        fontSize: AppFontSize.xlg,
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xs),
                    Text(
                      'Junior Flutter Developer',
                      style: TextStyle(
                        fontSize: AppFontSize.md,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/edit.svg',
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(ProfileEditingPage.routePath);
                  },
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppFontSize.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppFontSize.lg),

                // personal info section
                Text(
                  'Personal Info',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: AppFontSize.md,
                  ),
                ),
                buildCardListTile(
                  'assets/svg/Profile.svg',
                  'View Profile',
                  () {
                    GoRouter.of(context).push(ViewProfilePage.routePath);
                  },
                ),

                // security section
                const SizedBox(height: AppFontSize.lg),
                Text(
                  'Security',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: AppFontSize.md,
                  ),
                ),
                buildCardListTile(
                  'assets/svg/change_password.svg',
                  'Change Password',
                  () {
                    GoRouter.of(context).push(ChangePassword.routePath);
                  },
                ),
                buildCardListTile(
                  'assets/svg/change_password.svg',
                  'Forgot Password',
                  () {
                    GoRouter.of(context).push(VerifyEmailPage.routePath);
                  },
                ),
                buildCardListTile(
                  'assets/svg/security.svg',
                  'Security',
                  () {
                    GoRouter.of(context).push(SecurityPage.routePath);
                  },
                ),

                // general section
                const SizedBox(
                  height: AppFontSize.lg,
                ),
                Text(
                  'General',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: AppFontSize.md,
                  ),
                ),
                buildCardListTile(
                  'assets/svg/bx-bell.svg',
                  'Notifications',
                  () {
                    GoRouter.of(context).push(NotificationPage.routePath);
                  },
                ),
                buildCardListTile(
                  'assets/svg/trash.svg',
                  'Clear Cache',
                  () {},
                ),

                const SizedBox(
                  height: AppFontSize.lg,
                ),
                // about section
                Text(
                  'About',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: AppFontSize.md,
                  ),
                ),
                buildCardListTile(
                  'assets/svg/help_icon.svg',
                  'Legal and Policies',
                  () {
                    GoRouter.of(context).push(
                      LegalAndPolicy.routePath,
                    );
                  },
                ),
                // buildCardListTile(
                //   PhosphorIcons.light.question,
                //   'Help & Support',
                //   () {},
                // ),

                // log out button
                const SizedBox(height: AppFontSize.xxlg),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(AppFontSize.md),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      showAnimatedDialog(
                        context: context,
                        animationType: DialogTransitionType.fadeScale,
                        barrierDismissible: true,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppFontSize.lg),
                            ),
                            backgroundColor: Colors.grey.shade200,
                            actionsPadding:
                                const EdgeInsets.all(AppFontSize.xlg),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Are you sure you want to logout?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: AppFontWeight.semiBold,
                                        fontSize: AppFontSize.xxlg,
                                      ),
                                ),
                                const SizedBox(
                                  height: AppFontSize.xxxlg,
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButtonWidget(
                                title: 'Cancel',
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  child: const Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: AppFontSize.lg,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.pop();
                                    GoRouter.of(context)
                                        .pushReplacement('/login');
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppFontSize.xxlg),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCardListTile(
    String leadingIcon,
    String title,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: .2,
      child: InkWell(
        splashColor: AppColors.primaryColor.withOpacity(.2),
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.sm,
            vertical: AppFontSize.xlg,
          ),
          child: Row(
            children: [
              // svg
              SizedBox(
                child: SvgPicture.asset(
                  leadingIcon,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(
                width: AppFontSize.md,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: AppFontWeight.medium,
                  fontSize: AppFontSize.lg,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: AppFontSize.lg,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
