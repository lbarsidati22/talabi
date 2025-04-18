import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/navigate_to.dart';
import 'package:talabi/views/profile/ui/edit_name_page.dart';
import 'package:talabi/views/profile/ui/my_orders.dart';
import 'package:talabi/views/profile/ui/widgets/cusstom_row_botton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("User Email"),
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
            CustomRowBtn(
              icon: Icons.logout,
              text: 'LogOut',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
