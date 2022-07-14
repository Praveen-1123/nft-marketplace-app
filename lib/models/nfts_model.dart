// To parse this JSON data, do
//
//     final nftToken = nftTokenFromJson(jsonString);

import 'dart:convert';

NftToken nftTokenFromJson(String str) => NftToken.fromJson(json.decode(str));

String nftTokenToJson(NftToken data) => json.encode(data.toJson());

class NftToken {
  NftToken({
    this.id,
    this.active,
    this.status,
    this.popularity,
    this.userId,
    this.title,
    this.description,
    this.previewImage,
    this.attachments,
    this.tokenId,
    this.totalSupply,
    this.likes,
    this.comments,
    this.tokenPrice,
    this.stockAvailable,
    this.chainName,
    this.assetType,
    this.marketAddress,
    this.nftAddress,
    this.txHash,
    this.royalty,
    this.createdAt,
    this.updatedAt,
    this.isLiked,
    this.v,
  });

  String id;
  String active;
  String status;
  String popularity;
  UserId userId;
  String title;
  String description;
  String previewImage;
  List<Attachment> attachments;
  int tokenId;
  int totalSupply;
  int likes;
  int comments;
  int tokenPrice;
  int stockAvailable;
  String chainName;
  String assetType;
  String marketAddress;
  String nftAddress;
  String txHash;
  int royalty;
  DateTime createdAt;
  DateTime updatedAt;
  bool isLiked;
  int v;

  factory NftToken.fromJson(Map<String, dynamic> json) => NftToken(
        id: json["_id"],
        active: json["active"],
        status: json["status"],
        popularity: json["popularity"],
        userId: UserId.fromJson(json["userId"]),
        title: json["title"],
        description: json["description"],
        previewImage: json["previewImage"],
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
        tokenId: json["tokenId"],
        totalSupply: json["totalSupply"],
        likes: json["likes"],
        comments: json["comments"],
        tokenPrice: json["tokenPrice"],
        stockAvailable: json["stockAvailable"],
        chainName: json["chainName"],
        assetType: json["assetType"],
        marketAddress: json["marketAddress"],
        nftAddress: json["nftAddress"],
        txHash: json["txHash"],
        royalty: json["royalty"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "active": active,
        "status": status,
        "popularity": popularity,
        "userId": userId.toJson(),
        "title": title,
        "description": description,
        "previewImage": previewImage,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "tokenId": tokenId,
        "totalSupply": totalSupply,
        "likes": likes,
        "comments": comments,
        "tokenPrice": tokenPrice,
        "stockAvailable": stockAvailable,
        "chainName": chainName,
        "assetType": assetType,
        "marketAddress": marketAddress,
        "nftAddress": nftAddress,
        "txHash": txHash,
        "royalty": royalty,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Attachment {
  Attachment({
    this.url,
    this.fileType,
    this.id,
  });

  String url;
  String fileType;
  String id;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        url: json["url"],
        fileType: json["fileType"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "fileType": fileType,
        "_id": id,
      };
}

class UserId {
  UserId({
    this.id,
    this.email,
    this.active,
    this.address,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.followers,
    this.followings,
    this.popularity,
    this.private,
  });

  String id;
  String email;
  bool active;
  String address;
  String imageUrl;
  String firstName;
  String lastName;
  int followers;
  int followings;
  int popularity;
  bool private;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        email: json["email"],
        active: json["active"],
        address: json["address"],
        imageUrl: json["imageUrl"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        followers: json["followers"],
        followings: json["followings"],
        popularity: json["popularity"],
        private: json["private"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "active": active,
        "address": address,
        "imageUrl": imageUrl,
        "firstName": firstName,
        "lastName": lastName,
        "followers": followers,
        "followings": followings,
        "popularity": popularity,
        "private": private,
      };
}
