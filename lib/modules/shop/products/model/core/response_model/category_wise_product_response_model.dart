import 'dart:convert';
/// id : 5
/// title : "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet"
/// price : 695
/// description : "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection."
/// category : "jewelery"
/// image : "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg"
/// rating : {"rate":4.6,"count":400}

CategoryWiseProductResponseModel categoryWiseProductResponseModelFromJson(String str) => CategoryWiseProductResponseModel.fromJson(json.decode(str));
String categoryWiseProductResponseModelToJson(CategoryWiseProductResponseModel data) => json.encode(data.toJson());
class CategoryWiseProductResponseModel {
  CategoryWiseProductResponseModel({
      dynamic id, 
      dynamic title, 
      dynamic price, 
      dynamic description, 
      dynamic category, 
      dynamic image, 
      Rating? rating,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _image = image;
    _rating = rating;
}

  CategoryWiseProductResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category = json['category'];
    _image = json['image'];
    _rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  dynamic _id;
  dynamic _title;
  dynamic _price;
  dynamic _description;
  dynamic _category;
  dynamic _image;
  Rating? _rating;
CategoryWiseProductResponseModel copyWith({  dynamic id,
  dynamic title,
  dynamic price,
  dynamic description,
  dynamic category,
  dynamic image,
  Rating? rating,
}) => CategoryWiseProductResponseModel(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  description: description ?? _description,
  category: category ?? _category,
  image: image ?? _image,
  rating: rating ?? _rating,
);
  dynamic get id => _id;
  dynamic get title => _title;
  dynamic get price => _price;
  dynamic get description => _description;
  dynamic get category => _category;
  dynamic get image => _image;
  Rating? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['category'] = _category;
    map['image'] = _image;
    if (_rating != null) {
      map['rating'] = _rating?.toJson();
    }
    return map;
  }

}

/// rate : 4.6
/// count : 400

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));
String ratingToJson(Rating data) => json.encode(data.toJson());
class Rating {
  Rating({
      dynamic rate, 
      dynamic count,}){
    _rate = rate;
    _count = count;
}

  Rating.fromJson(dynamic json) {
    _rate = json['rate'];
    _count = json['count'];
  }
  dynamic _rate;
  dynamic _count;
Rating copyWith({  dynamic rate,
  dynamic count,
}) => Rating(  rate: rate ?? _rate,
  count: count ?? _count,
);
  dynamic get rate => _rate;
  dynamic get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = _rate;
    map['count'] = _count;
    return map;
  }

}