import 'package:flutter/material.dart';
import 'package:playground/data/constant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<String> _items = ["S", "M", "X", "XL"];

  String? _selectedItem = "S";
  int? _selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      Text(
                        "Chart",
                        style: KTextStyle.textStyleforcc,
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  2,
                  (index) {
                    return Card(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(9),
                            child: Image.asset(
                              "images/coilproduct13.jpeg",
                              fit: BoxFit.contain,
                              height: 110,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(9),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "OutSide Ready",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: DropdownButton<String>(
                                        value: _selectedItem,
                                        items: _items.map(
                                          (String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _selectedItem = newValue;
                                          });
                                        },
                                        icon: Icon(Icons.arrow_drop_down),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.teal, // Underline color
                                        ),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 20.0,
                                      child: VerticalDivider(),
                                    ),
                                    Container(
                                      child: DropdownButton(
                                        value: _selectedQty,
                                        items: List.generate(
                                          5,
                                          (index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text("${index + 1}"),
                                          ),
                                        ),
                                        onChanged: (int? newValue) {
                                          setState(
                                            () {
                                              _selectedQty = newValue;
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.arrow_drop_down),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.teal, // Underline color
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                Text(
                                  "50,99 €",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 16, bottom: 85),
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Delivery Address",
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Shipment",
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Payment",
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
