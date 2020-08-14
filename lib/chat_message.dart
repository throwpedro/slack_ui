import 'package:flutter/material.dart';
import 'package:slack_ui/emoji_button.dart';
import 'package:slack_ui/file_attachment.dart';
import 'emoji_collection.dart';

class ChatMessage extends StatelessWidget {
  final String image;
  final String sender;
  final String time;
  final String bodyText;
  final bool showFileAttachment;
  final bool showReplyRow;
  final EmojiCollection emojiCollection;

  const ChatMessage({
    this.sender,
    this.time,
    this.bodyText,
    this.image = 'images/slack-person.png',
    this.showFileAttachment = false,
    this.showReplyRow = false,
    this.emojiCollection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.asset(
              this.image,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      this.sender,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text(
                        this.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    this.bodyText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (showFileAttachment) ...[
                  SizedBox(
                    height: 8,
                  ),
                  FileAttachment(),
                ],
                if (showReplyRow)
                  Row(children: [
                    Icon(Icons.person),
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Text(
                        '2 replies',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ]),
                if (this.emojiCollection != null) ...[
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: this.emojiCollection.getCollection().length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: EmojiButton(
                            icon: this
                                .emojiCollection
                                .getCollection()[index]
                                .icon,
                            count: this
                                .emojiCollection
                                .getCollection()[index]
                                .count,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
