import 'package:flutter/material.dart';
import 'package:hng_shopper/mock/global_list.dart';
import 'package:hng_shopper/view/main_screens/main_screen.dart';
import 'package:hng_shopper/view/order_successful_screen.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = cartList.fold(
      0,
      (previousValue, element) =>
          previousValue +
          double.parse(
            element.price.replaceAll('£', ''),
          ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Cost:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '£${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          cartList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/illustrations/empty_cart.png'),
                      const Text(
                        'No Product here yet',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8).copyWith(bottom: 0),
                    itemCount: cartList.length,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.deepPurple.withOpacity(.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(cartList[index].imagePath),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartList[index].name,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text('Price: ${cartList[index].price}'),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  cartList.removeAt(index);
                                });
                              },
                              color: Colors.red,
                              minWidth: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                                    .copyWith(
                                        topLeft: Radius.zero,
                                        bottomLeft: Radius.zero),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'remove',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: cartList.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccessfulScreen(),
                  ),
                );
                setState(() {
                  cartList.clear();
                });
              },
              label: const Text('Checkout'),
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
    );
  }
}
