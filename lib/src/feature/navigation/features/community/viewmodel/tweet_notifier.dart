import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/navigation/features/community/model/tweet.dart';

class TweetNotifier extends ChangeNotifier {
  List<Tweet> _tweets = [];

  List<Tweet> get tweets => _tweets;

  void addTweet(Tweet tweet) {
    _tweets = [tweet, ..._tweets];
    notifyListeners();
  }

  void likeTweet(int index) {
    _tweets[index].likes++;
    notifyListeners();
  }

  void commentTweet(int index) {
    _tweets[index].comments++;
    notifyListeners();
  }

  void saveTweet(int index) {
    _tweets[index].saves++;
    notifyListeners();
  }

  void shareTweet(int index) {
    _tweets[index].shares++;
    _tweets[index].isShared = true;
    notifyListeners();
  }

  void unShareTweet(int index) {
    _tweets[index].shares--;
    _tweets[index].isShared = false;
    notifyListeners();
  }
}
