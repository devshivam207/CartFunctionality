import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/cartcontroller.dart';
import 'package:restaurant/models/fmodel.dart';

class MyItemList extends StatefulWidget {
  final Future<Food> flist;
  const MyItemList({super.key, required this.flist});

  @override
  State<MyItemList> createState() => _MyItemListState();
}

class _MyItemListState extends State<MyItemList> {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Food>(
      future: widget.flist,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var foodData = snapshot.data!.products;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: foodData.length,
                itemBuilder: ((context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                color: Colors.amber),
                            child: Image.network(
                              foodData[index].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            foodData[index].name,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.remove),
                              Container(
                                child: Text(
                                  foodData[index].price.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    cartController.additem(1, foodData[index]);
                                  },
                                  child: Icon(Icons.add)),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                  );
                }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }

        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
