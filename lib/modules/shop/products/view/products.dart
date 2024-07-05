import 'package:any_image_view/any_image_view.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/model/core/category_model.dart';
import 'package:e_commerce_complete_fake_api/modules/shop/products/viewModel/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _loadData(context);
    });

  }
  Future<void> _loadData(BuildContext context) async{
  final productViewModel=Provider.of<ProductsViewModel>(context,listen: false);
  await productViewModel.productListFetch(context);
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel=Provider.of<ProductsViewModel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WellCome Demo User'),
        leading: IconButton(
            onPressed: () async{
              await productViewModel.productListFetch(context);

            }, icon: const Icon(AntDesign.account_book_fill)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w
            ,vertical: 10.h
        ),
        child: Container(
          width: 380.w,
          height: 800.h,
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
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: ListView(
               children: [
                 Container(
                   height: 140.h,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     gradient: const LinearGradient(colors: [
                       Colors.blue,Colors.green
                     ],stops: [0.0,1.1],
                     begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                     )
                   ),
                   child: Padding(
                     padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Category',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                           color: Colors.white
                         ),),
                         SizedBox(height: 10.h,),
                         SizedBox(
                           height: 100.h,
                           child: Center(
                             child: GridView.builder(
                               scrollDirection: Axis.horizontal,
                               shrinkWrap: true,
                               itemCount: categories.length,
                               gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2,
                                 childAspectRatio: 40/60,
                                 crossAxisSpacing: 10.h,
                                 mainAxisSpacing: 10.w

                               ),
                               itemBuilder: (context,index) {
                                 return Container(
                                   height: 50.h,
                                   width: 50.w,

                                   decoration: BoxDecoration(
                                     color: Colors.white.withOpacity(.5),
                                     borderRadius: BorderRadius.circular(10)
                                   ),
                                   child: Padding(
                                     padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                                     child: Column(
                                       children: [
                                         Image.asset(
                                           categories[index].imageUrl ,color: Colors.green.withOpacity(.5),
                                           height: 20.sp,
                                           width: 20.sp,

                                         ),
                                         Text(categories[index].categoryName,style: Theme.of(context).textTheme.labelSmall,overflow: TextOverflow.ellipsis,)
                                       ],
                                     ),
                                   ),
                                 );
                               }
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 20.h,),
                 GridView.builder(
                   shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                   itemCount: 200,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                   childAspectRatio: 150/180,
                     mainAxisSpacing: 10.w,crossAxisSpacing: 20.h
                   ),
                   itemBuilder: (context,child) {
                     return Container(
                       decoration: BoxDecoration(
                         color: Colors.white.withOpacity(.2),
                         borderRadius: BorderRadius.circular(10)
                       ),
                       child: Padding(
                         padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text('Products Name ',style: Theme.of(context).textTheme.labelMedium,),
                             Container(
                               width: 170.w,height: 100.h,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.red
                               ),
                             ),
                             const Text('\$6000'),
                             SizedBox(height: 2.h,),
                             InkWell(
                               onTap: (){},
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: Colors.green,
                                 ),
                                 child: Padding(
                                   padding:  EdgeInsets.symmetric(vertical: 5.h
                                       ,horizontal: 8.w),
                                   child: const Text('Add To Cart'),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     );
                   }
                 )
               ],
            ),
          ),
        ),
      ),
    );
  }
}