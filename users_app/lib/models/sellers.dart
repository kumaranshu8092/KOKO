class Sellers
{
  String? sellerUID;
  String? sellerName;
  String? sellerAvatarURL;
  String? sellerEmail;

  Sellers({
    this.sellerUID,
    this.sellerName,
    this.sellerAvatarURL,
    this.sellerEmail,
  });

  Sellers.fromJson(Map<String, dynamic> json)
  {
    sellerUID = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerAvatarURL = json["sellerAvatarURL"];
    sellerEmail = json["sellerEmail"];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sellerUID"] = this.sellerUID;
    data["sellerName"] = this.sellerName;
    data["sellerAvatarUrl"] = this.sellerAvatarURL;
    data["sellerEmail"] = this.sellerEmail;
    return data;
  }
}