final class User {
  User({
    this.id,
    this.userCode,
    this.fullname,
    this.referenceCode,
    this.accountStatus,
    this.referencedBy,
    this.username,
    this.bio,
    this.profilePictureUrl,
    this.followerCount,
    this.followingCount,
    this.likeCount,
    this.commentCount,
    this.likeCountChangeType,
    this.commentCountChangeType,
    this.likeChangeCount,
    this.commentChangeCount,
    this.followerGained,
    this.followerLost,
    this.notFollowingBackCount,
    this.profileViewersList,
    this.verified,
    this.private,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    userCode = json['userCode'] as String?;
    fullname = json['fullname'] as String?;
    referenceCode = json['referenceCode'] as String?;
    accountStatus = json['accountStatus'] as String?;
    referencedBy =
        json['referencedBy'] as String?; // Null ise null olarak alacak
    username = json['username'] as String?;
    bio = json['bio'] as String?;
    profilePictureUrl = json['profilePictureUrl'] as String?;
    followerCount = json['followerCount'] as int?;
    followingCount = json['followingCount'] as int?;
    likeCount = json['likeCount'] as int?;
    commentCount = json['commentCount'] as int?;
    likeCountChangeType = json['likeCountChangeType'] as String?;
    commentCountChangeType = json['commentCountChangeType'] as String?;
    likeChangeCount = json['likeChangeCount'] as int?;
    commentChangeCount = json['commentChangeCount'] as int?;
    followerGained = json['followerGained'] as int?;
    followerLost = json['followerLost'] as int?;
    notFollowingBackCount = json['notFollowingBackCount'] as int?;
    profileViewersList =
        (json['profileViewersList'] as List<dynamic>?)?.cast<String>();
    verified = json['verified'] as bool?;
    private = json['private'] as bool?;
  }
  String? id;
  String? userCode;
  String? fullname;
  String? referenceCode;
  String? accountStatus;
  String? referencedBy; // Null yerine String? kullanıyorum
  String? username;
  String? bio;
  String? profilePictureUrl;
  int? followerCount;
  int? followingCount;
  int? likeCount;
  int? commentCount;
  String? likeCountChangeType;
  String? commentCountChangeType;
  int? likeChangeCount;
  int? commentChangeCount;
  int? followerGained;
  int? followerLost;
  int? notFollowingBackCount;
  List<String>? profileViewersList;
  bool? verified;
  bool? private;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userCode'] = userCode;
    data['fullname'] = fullname;
    data['referenceCode'] = referenceCode;
    data['accountStatus'] = accountStatus;
    data['referencedBy'] = referencedBy;
    data['username'] = username;
    data['bio'] = bio;
    data['profilePictureUrl'] = profilePictureUrl;
    data['followerCount'] = followerCount;
    data['followingCount'] = followingCount;
    data['likeCount'] = likeCount;
    data['commentCount'] = commentCount;
    data['likeCountChangeType'] = likeCountChangeType;
    data['commentCountChangeType'] = commentCountChangeType;
    data['likeChangeCount'] = likeChangeCount;
    data['commentChangeCount'] = commentChangeCount;
    data['followerGained'] = followerGained;
    data['followerLost'] = followerLost;
    data['notFollowingBackCount'] = notFollowingBackCount;
    data['profileViewersList'] = profileViewersList;
    data['verified'] = verified;
    data['private'] = private;
    return data;
  }
}
