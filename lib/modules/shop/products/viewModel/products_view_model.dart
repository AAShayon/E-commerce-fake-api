import 'dart:developer';

import 'package:e_commerce_complete_fake_api/model/service/api_response.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/core/response_model/category_wise_product_response_model.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/core/response_model/product_response_model.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/service/remote/product_service.dart';
import 'package:flutter/material.dart';

class  ProductsViewModel extends ChangeNotifier{
  ProductService _productService=ProductServiceRemoteDataSource();
  bool _isLoading=false;
  List<ProductResponseModel> _product=[];
  // List<CategoryWiseProductResponseModel> _categoryProduct=[];
  final Map<int ,int> _itemCounts={};

 bool get isLoading => _isLoading;
 List<ProductResponseModel> get product => _product;
 Map<int ,int> get itemCounts=> _itemCounts;

 Future<bool> productListFetch(BuildContext context) async{
   _isLoading=true;
   bool isProductFetched=false;
   _product=[];
   try{
    ApiResponse apiResponse=await _productService.productList();
    if(apiResponse.response !=null){
      if(apiResponse.response!.statusCode == 200){
        _product=(apiResponse.response!.data as List).map((data) => ProductResponseModel.fromJson(data)).toList();

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
 Future<bool> categoriesProduct(BuildContext context,{required String categoryName})async{
   _isLoading=true;
   bool isFetch=false;
   _product=[];
   try{
     ApiResponse apiResponse=await _productService.category(categoryName);
     if(apiResponse.response!.statusCode != null){
       if(apiResponse.response!.statusCode == 200){
         _product=(apiResponse.response!.data as List).map((data)=>ProductResponseModel.fromJson(data)).toList();
         isFetch=true;
         _isLoading=false;
         notifyListeners();
         if(context.mounted){
           ScaffoldMessenger.of(context).removeCurrentSnackBar();
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red,duration: Duration(milliseconds: 3),content:Text('SuccessFully')));
         }

       }else{
         isFetch=false;
         _isLoading=false;
         notifyListeners();
         if(context.mounted){
           ScaffoldMessenger.of(context).removeCurrentSnackBar();
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,duration: const Duration(milliseconds: 3),content:Text('${apiResponse.response!.statusCode}')));
         }
       }

     }else{
       isFetch=false;
       _isLoading=false;
       notifyListeners();
       if(context.mounted){
         ScaffoldMessenger.of(context).removeCurrentSnackBar();
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,duration: const Duration(milliseconds: 3),content:Text('${apiResponse.error}')));
       }
     }

   }catch(e){
     _isLoading=false;
     isFetch=false;
     notifyListeners();
     if(context.mounted){
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,duration: const Duration(milliseconds: 3),content:Text('$e')));
     }
   }
   notifyListeners();
   return isFetch;

 }
 //  final ProductService _productService=ProductServiceRemoteDataSource();
 //  bool _isLoading=false;
 //  List<ProductResponseModel> _product=[];
 //
 //  bool get isLoading => _isLoading;
 //  List<ProductResponseModel>? get product => _product;
 //
 //  Future<bool> productListFetch(BuildContext context) async{
 //    _isLoading=true;
 //    bool isFetch=false;
 //
 //    _product=[];
 //    try{
 //      ApiResponse apiResponse=await _productService.productList();
 //      if(apiResponse.response != null){
 //        if(apiResponse.response!.statusCode == 200){
 //          _product=(apiResponse.response!.data as List).map((data)=>ProductResponseModel.fromJson(data)).toList();
 //          _isLoading=false;
 //          isFetch=true;
 //          if(context.mounted){
 //            ScaffoldMessenger.of(context).removeCurrentSnackBar();
 //            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 3),backgroundColor: Colors.green,content:Center(child: Text('Successfull')) ));
 //            // customSnackBar(context: context, message: '${apiResponse.response!.statusCode}',backgroundColor: Colors.blue);
 //          }
 //        }else{
 //          isFetch=false;
 //          _isLoading=false;
 //          notifyListeners();
 //          if(context.mounted){
 //            ScaffoldMessenger.of(context).removeCurrentSnackBar();
 //            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${apiResponse.response!.statusCode}')));
 //          }
 //        }
 //      }else{
 //        isFetch=false;
 //        _isLoading=false;
 //        notifyListeners();
 //        if(context.mounted){
 //          ScaffoldMessenger.of(context).removeCurrentSnackBar();
 //          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error)));
 //        }
 //
 //      }
 //
 //    }catch(e){
 //      isFetch=false;
 //      _isLoading=false;
 //      notifyListeners();
 //      if(context.mounted){
 //        ScaffoldMessenger.of(context).removeCurrentSnackBar();
 //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
 //      }
 //    }
 //    return isFetch;
 //  }
 void incrementItemCount(int index){
   if(_itemCounts.containsKey(index)){
     _itemCounts[index] =(_itemCounts[index] ?? 0) + 1;
   }else{
     _itemCounts[index] =1 ;
   }
   notifyListeners();
 }
 void decrementItemCount(int index){
   if(_itemCounts.containsKey(index) && _itemCounts[index]! >0){
     _itemCounts[index]=(_itemCounts[index] ?? 0) -1;
     if(_itemCounts[index] == 0){
       _itemCounts.remove(index);
     }
   }
   notifyListeners();
 }
 int getItemCount(int index){
   return _itemCounts[index] ?? 0;
 }
  double getSubtotal(){
   double subtotal=0.0;
   _itemCounts.forEach((index ,count){
     subtotal += (count * _product[index].price);
   });
   return subtotal;
  }
  double getVat(){
   double subtotal=getSubtotal();
   return subtotal * 0.05;
  }
  double getTotal(){
   double subtotal=getSubtotal();
   double vat=getVat();
   return subtotal + vat ;
  }

}