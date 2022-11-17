class Sellers {
  String? sellerUID;
  String? sellerName;
  String? sellerAvatarURL;
  String? sellerEmail;

  Sellers(
      {this.sellerAvatarURL,
      this.sellerEmail,
      this.sellerName,
      this.sellerUID});

  Sellers.fromJson(Map<String, dynamic> json) {
    sellerUID = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerAvatarURL = json["sellerAvatarURL"];
    sellerEmail = json["sellerEmail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data["sellerUID"] = sellerUID;
    data["sellerName"] = sellerName;
    data["sellerAvatarURL"] = sellerAvatarURL;
    data["sellerEmail"] = sellerEmail;
    return data;
  }
}
