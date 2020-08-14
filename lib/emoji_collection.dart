import 'emoji_data.dart';

class EmojiCollection {
  List<EmojiData> emojiCollection = [];

  void add(EmojiData emojiData) {
    this.emojiCollection.add(emojiData);
  }

  List<EmojiData> getCollection() {
    return this.emojiCollection;
  }
}
