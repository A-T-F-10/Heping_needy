import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/widgets/text_form_field.dart';

class UserChats extends StatelessWidget {
  UserChats({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chats Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.unspecified,
              decoration: InputDecoration(
                hintText: 'Chat with volunteers',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
