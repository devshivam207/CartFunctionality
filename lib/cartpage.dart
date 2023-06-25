import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/cartcontroller.dart';
import 'package:restaurant/homepage.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
        ),
        body: GetBuilder<CartController>(builder: (cart) {
          return ListView.builder(
            itemCount: cart.cartlist.length,
            itemBuilder: (context, index) {
              final dish = cart.cartlist.values.toList()[index];

              return Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.amber,
                          ),
                          child: Image.network(
                            dish.img.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          dish.name,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.remove),
                            Container(
                              child: Text(
                                dish.quantity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Icon(Icons.add),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => MyHomePage());
                },
                child: Icon(
                  Icons.home,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(() => MyCartPage());
                },
                child: Icon(Icons.shopping_basket),
              ),
              label: 'Cart',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ));
  }
}
