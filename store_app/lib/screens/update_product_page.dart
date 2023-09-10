import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  dynamic price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Update Product',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: ' Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: ' Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: ' Image',
                ),
                const SizedBox(
                  height: 75,
                ),
                CustomButton(
                  onTap: ()async {
                    isLoading = true;
                    setState(() {});
                    try {
                     await updateProduct(product);
                      print('sucess');
                     
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isLoading=false;
                      setState(() {
                        
                      });
                    
                  },
                  buttonText: 'Update',
                ),
              ],
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product)async {
   await UpdateProductService().updateProduct(
    id: product.id,
        title: productName== null ? product.title : productName!,
        price: price== null ? product.title : price!,
        description: description== null ? product.title : description!,
        image: image== null ? product.title : image!,
        category: product.category,
        
        
        );
  }
}
