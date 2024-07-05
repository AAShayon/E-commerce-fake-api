import 'dart:developer';

import 'package:e_commerce_complete_fake_api/model/service/api_response.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/core/response_model/product_response_model.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/service/remote/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  ProductsViewModel extends ChangeNotifier{
  ProductService _productService=ProductServiceRemoteDataSource();
  bool _isLoading=false;
  List<ProductResponseModel> _product=[];


 bool get isLoading => _isLoading;
 List<ProductResponseModel> get product => _product;

 Future<bool> productListFetch(BuildContext context) async{
   _isLoading=true;
   bool isProductFetched=false;
   _product=[];
   try{
    ApiResponse apiResponse=await _productService.productList();
    if(apiResponse.response !=null){
      if(apiResponse.response!.statusCode == 200){
        _product = (apiResponse.response!.data as List)
            .map((data) => ProductResponseModel.fromJson(data))
            .toList();

        log('Products List :=========> $_product');
        _isLoading=false;
        isProductFetched=true;
        notifyListeners();
      }else{
        _isLoading=false;
        isProductFetched=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 3),
            backgroundColor: Colors.red,
            content: Center(child: Text('${apiResponse.response!.data['status']}'),),
          ));

        }

      }
      
    }else{
      _isLoading=false;
      isProductFetched=false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 3),
          backgroundColor: Colors.red,
          content: Center(child: Text('${apiResponse.error}'),),
        ));
        
      }
    }
   }catch(e){
     _isLoading=false;
     isProductFetched=false;
     notifyListeners();
     if(context.mounted){
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           duration: const Duration(milliseconds: 3),
           backgroundColor: Colors.red,
           content: Center(child: Text("$e"))));
     }
   }
   notifyListeners();
   return isProductFetched;
 }

}