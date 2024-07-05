import 'package:any_image_view/any_image_view.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/core/response_model/product_response_model.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/viewModel/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryProductScreen extends StatelessWidget {
  final dynamic name;
   const CategoryProductScreen({super.key, this.name,});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsViewModel>(
      builder: (context,productViewModel,child) {
        return Scaffold(
          appBar:AppBar(
            title: Text(name),

          ),
          body: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Container(
              decoration:  BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff00ff0d),
                      Color(0xff278cff),
                    ],
                    stops: [0.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10)

              ),
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child:  !productViewModel.isLoading && productViewModel.product.isNotEmpty && productViewModel.product!=null ?  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productViewModel.product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 150/180,
                        mainAxisSpacing: 10.w,crossAxisSpacing: 20.h
                    ),
                    itemBuilder: (context,index) {
                      final product=productViewModel.product[index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('${product.title}',style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,),
                              Container(
                                width: 170.w,height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AnyImageView(
                                  imagePath: product.image,boxFit: BoxFit.fill,borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Text('\$${product.price}'),
                              SizedBox(height: 2.h,),
                              Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,
                                ),
                                child: productViewModel.getItemCount(index) > 0 ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: (){
                                        productViewModel.decrementItemCount(index);
                                      }, icon:  Icon(Icons.remove,size: 10.sp,)),
                                      Text("${productViewModel.getItemCount(index)}",style: Theme.of(context).textTheme.labelMedium,),
                                      IconButton(onPressed: (){
                                        productViewModel.incrementItemCount(index);
                                      }, icon:  Icon(Icons.add,size: 10.sp,))
                                    ],
                                  ),
                                ):InkWell(
                                    onTap: (){
                                      productViewModel.incrementItemCount(index);
                                    },child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
                                  child: const Text('Add To Cart'),
                                )),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ) :Center(child: CircularProgressIndicator()),
              )
            ),
          )
        );
      }
    );
  }
}
