import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.product
  });
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.popAndPushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        children: [
          
          Container(
            margin:const EdgeInsets.only(top: 50),
            
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(10, 10),
              )
            ]),
            child:  Card(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0,15),
                      style:const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                   const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         r'$' '${product.price.toString()}',
                          style:const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      const  Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        
          Positioned(
            bottom: 85,
            left: 90,
            child: Image.network(
                product.image,
                height: 85,
                width: 85,
                ),
          ),
        ],
      ),
    );
  }
}
