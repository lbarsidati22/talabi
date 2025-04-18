import 'package:flutter/material.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/core/widgets/main_bottom.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Edit Name'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter New Name',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MainBottom(text: "Update", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
