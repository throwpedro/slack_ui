import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slack_ui/chat_message.dart';
import 'emoji_data.dart';
import 'emoji_collection.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
  ));
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      home: Slack(),
    ),
  );
}

class Slack extends StatelessWidget {
  EmojiCollection elizabethEmojiCollection() {
    EmojiCollection collection = EmojiCollection();
    collection.add(EmojiData('1', Icons.mail));
    collection.add(EmojiData('1', Icons.alarm));
    collection.add(EmojiData('1', Icons.tag_faces));
    collection.add(EmojiData('', Icons.add));
    return collection;
  }

  EmojiCollection janEmojiCollection() {
    EmojiCollection collection = EmojiCollection();
    collection.add(EmojiData('1', Icons.thumb_up));
    collection.add(EmojiData('1', Icons.thumbs_up_down));
    collection.add(EmojiData('', Icons.add));
    return collection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView(
        padding: EdgeInsets.all(
          16.0,
        ),
        children: [
          Column(
            children: [
              ChatMessage(
                sender: 'Zoltan',
                time: '09:45 AM',
                bodyText: 'Check out flutter.',
                showFileAttachment: true,
              ),
            ],
          ),
          ChatMessage(
            sender: 'Shinta Darling',
            time: '10:10 PM',
            bodyText: 'Super presentations and easy to understand.. '
                'thank you for sharing..👍',
          ),
          Text(
            'August 4th, 2020',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(),
          ChatMessage(
            sender: 'Esben Darling',
            time: '10:29 AM',
            bodyText: 'Please remove following projects in Asana '
                'from "Company Projects" to marketing / dev.: '
                'Jobpage, cookie, pay&Go and CMS (if all done)',
            showReplyRow: true,
          ),
          ChatMessage(
            sender: 'Elizabeth Schweitzer',
            time: '11:51 AM',
            bodyText: 'Alright everyone. Email Deletion happening '
                'in 5 min. Any objections- Speak now or forever'
                'hold your peace.',
            emojiCollection: elizabethEmojiCollection(),
          ),
          ChatMessage(
            sender: 'Jan Christensen',
            time: '3:15 PM',
            bodyText: 'The WiFi is up again. As a fallback, '
                'we used our old routers. So you need to login to either'
                '"frontend" or "office" network. '
                'The password is colboxnetwork',
            emojiCollection: janEmojiCollection(),
          ),
          ChatMessage(
            sender: 'Shinta Darling',
            time: '3:35 PM',
            bodyText: '👍',
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Message #general',
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.flash_on,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.featured_play_list,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1.0,
      titleSpacing: 0.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Text(
                  '#',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15.0,
                  ),
                ),
              ),
              Text(
                'general',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '24 members',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
