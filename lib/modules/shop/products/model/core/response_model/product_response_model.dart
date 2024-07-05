import 'dart:convert';
/// id : 1
/// title : "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
/// price : 109.95
/// description : "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
/// category : "men's clothing"
/// image : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
/// rating : {"rate":3.9,"count":120}

ProductResponseModel productResponseModelFromJson(String str) => ProductResponseModel.fromJson(json.decode(str));
String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());
class ProductResponseModel {
  ProductResponseModel({
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

  ProductResponseModel.fromJson(dynamic json) {
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
ProductResponseModel copyWith({ dynamic id,
 dynamic title,
 dynamic price,
 dynamic description,
 dynamic category,
 dynamic image,
  Rating? rating,
}) => ProductResponseModel(  id: id ?? _id,
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

/// rate : 3.9
/// count : 120

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
Rating copyWith({ dynamic rate,
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