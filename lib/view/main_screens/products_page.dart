import 'package:flutter/material.dart';
import 'package:hng_shopper/mock/global_list.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8).copyWith(bottom: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        shrinkWrap: true,
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 150,
                        minWidth: 500,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4).copyWith(
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                        image: DecorationImage(
                          image: AssetImage(allProducts[index].imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  allProducts[index].name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  allProducts[index].price,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Center(
                  child: MaterialButton(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4).copyWith(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                      ),
                    ),
                    textColor: Colors.white,
                    height: 40,
                    minWidth: 200,
                    onPressed: () {
                      setState(() {
                        cartList.add(allProducts[index]);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              const Text('Product Successfully added to cart'),
                          duration: const Duration(seconds: 2),
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: const Text(
                      'Add to Cart',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
