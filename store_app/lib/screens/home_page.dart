import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProductService().getAllProduct() ,
          builder: (context , snapshot){
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

  return GridView.builder(
    itemCount: products.length,
            clipBehavior: Clip.none,
  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1,
    crossAxisSpacing: 20,
    mainAxisSpacing: 10
  ),
  itemBuilder: (context, index) {
    return  CustomCard(product: products[index],);
  });
}else{
 return const Center(child:  CircularProgressIndicator());
}
      } ),
      ),
    );
  }
}
