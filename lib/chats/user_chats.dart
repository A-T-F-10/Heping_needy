import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/widgets/text_form_field.dart';
import 'package:intl/intl.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  State<UserChats> createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
  List<Message> messages = [
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
  ];

  TextEditingController controller = TextEditingController();
  OutlineInputBorder left = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
    topRight: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ));
  OutlineInputBorder right = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chats Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: ColorsTheme.darkPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  color: message.isSentByMe
                      ? Colors.black12
                      : ColorsTheme.darkPrimaryColor,
                  shape: message.isSentByMe ? right : left,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          row()
        ],
      ),
    );
  }

  row() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: ColorsTheme.darkPrimaryColor,
            radius: 25,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            width: MediaQuery.of(context).size.width / 1.28,
            child: TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type your message here...',
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none),
              onSubmitted: (String text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );
                setState(() => messages.add(message));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  String text;
  DateTime date;
  bool isSentByMe;
  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
