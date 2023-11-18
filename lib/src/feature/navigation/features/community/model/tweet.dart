class Tweet {
  final String tweetId;
  String userId;
  final String username;
  final String content;
  int likes;
  int comments;
  int saves;
  int shares;
  bool isShared;

  Tweet({
    required this.tweetId,
    required this.userId,
    required this.username,
    required this.content,
    this.likes = 0,
    this.comments = 0,
    this.saves = 0,
    this.shares = 0,
    this.isShared = false,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      tweetId: json['tweetId'],
      userId: json['userId'],
      username: json['username'],
      content: json['content'],
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      saves: json['saves'] ?? 0,
      shares: json['shares'] ?? 0,
      isShared: json['isShared'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tweetId': tweetId,
      'userId': userId,
      'username': username,
      'content': content,
      'likes': likes,
      'comments': comments,
      'saves': saves,
      'shares': shares,
      'isShared': isShared,
    };
  }
}
