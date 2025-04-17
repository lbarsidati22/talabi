import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/views/favorite/ui/favorite_page.dart';
import 'package:talabi/views/home/ui/home_page.dart';
import 'package:talabi/views/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:talabi/views/nav_bar/logic/cubit/nav_bar_state.dart';
import 'package:talabi/views/profile/ui/profile_page.dart';
import 'package:talabi/views/store/ui/store_page.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final List<Widget> views = [
    HomePage(),
    StorePage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final navBarCubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: views[navBarCubit.currentIndex],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                child: GNav(
                  onTabChange: (index) {
                    navBarCubit.changCurrentIndex(index);
                  },
                  rippleColor: Colors
                      .grey.shade800, // tab button ripple color when pressed
                  hoverColor: Colors.grey.shade700, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(
                      color: AppColors.grey4, width: 1), // tab button border
                  // tabBorder:
                  //     Border.all(color: AppColors.grey, width: 2), // tab button border
                  tabShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 8)
                  ], // tab button shadow
                  curve: Curves.easeOutExpo, // tab animation curves
                  duration:
                      Duration(milliseconds: 400), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: AppColors.primaryColor, // unselected icon color
                  activeColor: AppColors.black, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  // tabBackgroundColor:
                  //     Colors.purple.withOpacity(0.1), // selected tab background color
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: 8), // navigation bar padding
                  tabs: [
                    GButton(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      icon: Icons.shopping_cart,
                      text: 'Stor',
                    ),
                    GButton(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      icon: Icons.favorite,
                      text: 'Favorite',
                    ),
                    GButton(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      icon: Icons.person,
                      text: 'Profile',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
