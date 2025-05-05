import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/navigate_to.dart';
import 'package:talabi/views/home/ui/screens/category_page.dart';
import 'package:talabi/views/home/ui/screens/search_page.dart';
import 'package:talabi/views/home/ui/widgets/category_list.dart';
import 'package:talabi/views/home/ui/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              controller: searchController,
              // validator: (value) {
              //   return value == null || value.isEmpty ? null : null;
              // },
              decoration: InputDecoration(
                suffixIcon: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 28,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        if (searchController.text.isNotEmpty) {
                          navigateTo(
                            context,
                            SearchPage(
                              quirySearch: searchController.text,
                            ),
                          );
                          searchController.clear();
                        }
                      },
                    ),
                  ),
                ),
                // suffixIcon: IconButton(
                //   onPressed: () {
                //     setState(() {
                //       widget.isSecured != widget.isSecured;
                //     });
                //   },
                //   icon: Icon(
                //     widget.isSecured ? Icons.remove_red_eye : Icons.visibility_off,
                //   ),
                // ),
                hintText: 'Search in Talabi ...',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            height: size.height * 0.21,
          ),
        ),
        SizedBox(
          height: size.height * 0.021,
        ),
        Text(
          'Category',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: size.height * 0.021,
        ),
        //Category list
        CategoriesList(
          size: size,
        ),
        SizedBox(
          height: size.height * 0.021,
        ),
        //prudact Item
        Text(
          'Products Recommended',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
        ProductList(),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
