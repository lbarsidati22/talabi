import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/custtom_curcilar_indicator.dart';
import 'package:talabi/core/widgets/main_bottom.dart';
import 'package:talabi/core/widgets/navigate_to.dart';
import 'package:talabi/views/auth/cubit/auth_cubit.dart';
import 'package:talabi/views/auth/ui/login_page.dart';
import 'package:talabi/views/profile/ui/edit_name_page.dart';
import 'package:talabi/views/profile/ui/my_orders.dart';
import 'package:talabi/views/profile/ui/widgets/cusstom_row_botton.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocProvider(
      create: (context) => AuthCubit()..getUserData(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetUserDataLeading
              ? CusttomSicrolIndicator()
              : Card(
                  color: AppColors.white,
                  margin: const EdgeInsets.all(24),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.white,
                          child: Icon(
                            Icons.person,
                            size: 45,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          authCubit.userModel!.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          authCubit.userModel!.email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomRowBtn(
                          icon: Icons.person,
                          text: 'Edit Name',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditNameView(),
                              ),
                            );
                          },
                        ),
                        CustomRowBtn(
                          icon: Icons.shopping_cart,
                          text: 'MyOrder',
                          onTap: () {
                            navigateTo(
                              context,
                              MyOrdersViwe(),
                            );
                          },
                        ),
                        // CustomRowBtn(
                        //   icon: Icons.logout,
                        //   onTap: () async {
                        //     await authCubit.logOut();
                        //   },
                        // ),
                        Spacer(
                          flex: 2,
                        ),
                        BlocConsumer<AuthCubit, AuthState>(
                          listenWhen: (previous, current) =>
                              current is LogOutError ||
                              current is LogOutLeading ||
                              current is LogOutSuccess,
                          listener: (context, state) {
                            if (state is LogOutSuccess) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                            if (state is LogOutError) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: state.message,
                                ),
                              );
                            }
                          },
                          bloc: authCubit,
                          buildWhen: (previous, current) =>
                              current is LogOutError ||
                              current is LogOutLeading ||
                              current is LogOutSuccess,
                          builder: (context, state) {
                            if (state is LogOutLeading) {
                              return MainBottom(
                                // text: 'LogOut',
                                isLeading: true,
                                onTap: () {},
                              );
                            }
                            return MainBottom(
                              text: 'LogOut',
                              onTap: () async {
                                await authCubit.logOut();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
