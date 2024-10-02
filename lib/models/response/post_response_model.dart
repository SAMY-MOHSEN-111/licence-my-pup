class Attachment {
  final int id;
  final String url;

  Attachment({
    required this.id,
    required this.url,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}

class Author {
  final int id;
  final String email;
  final String fullName;
  final String? avatar;
  final String birthDate;
  final String gender;

  Author({
    required this.id,
    required this.email,
    required this.fullName,
    required this.avatar,
    required this.birthDate,
    required this.gender,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      avatar: json['avatar'],
      birthDate: json['birthDate'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'avatar': avatar,
      'birthDate': birthDate,
      'gender': gender,
    };
  }
}

class Reply {
  final int id;
  final String text;
  final Author author;
  final String createdAt;
  final String updatedAt;
  final bool isModified;

  Reply({
    required this.id,
    required this.text,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.isModified,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      id: json['id'],
      text: json['text'],
      author: Author.fromJson(json['author']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isModified: json['isModified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isModified': isModified,
    };
  }
}

class Post {
  final int id;
  final String text;
  final Author author;
  final String createdAt;
  final String updatedAt;
  final bool isModified;
  final String title;
  final List<Attachment> attachments;
  final List<Reply> replies;

  Post({
    required this.id,
    required this.text,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.isModified,
    required this.title,
    required this.attachments,
    required this.replies,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var attachmentList = json['attachments'] as List;
    var replyList = json['replies'] as List;

    return Post(
      id: json['id'],
      text: json['text'],
      author: Author.fromJson(json['author']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isModified: json['isModified'],
      title: json['title'],
      attachments: attachmentList.map((i) => Attachment.fromJson(i)).toList(),
      replies: replyList.map((i) => Reply.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isModified': isModified,
      'title': title,
      'attachments': attachments.map((i) => i.toJson()).toList(),
      'replies': replies.map((i) => i.toJson()).toList(),
    };
  }
}
