import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<String> _items = ["S", "M", "L", "X", "XL"];

  final List<int?> _selectedQty = List.generate(10, (index) => 1);
  final List<String> _selectedSize = List.generate(5, (index) => "S");

  String _selectedContent = "Bill & Ship Address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                Text(
                  "Chart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                            value: _selectedSize[index],
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
                                                _selectedSize[index] =
                                                    newValue!;
                                              });
                                            },
                                            icon: Icon(Icons.arrow_drop_down),
                                            underline: Container(
                                              height: 2,
                                              color: Colors
                                                  .teal, // Underline color
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
                                            value: _selectedQty[index],
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
                                                  _selectedQty[index] =
                                                      newValue;
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.arrow_drop_down),
                                            underline: Container(
                                              height: 2,
                                              color: Colors
                                                  .teal, // Underline color
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Text("50,99 €",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 16, bottom: 85),
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
                              onPressed: () {
                                setState(() {
                                  _selectedContent = "Bill & Ship Address";
                                });
                              },
                              child: Text(
                                "Bill & Ship Address",
                                style: TextStyle(
                                  color:
                                      _selectedContent == "Bill & Ship Address"
                                          ? Colors.teal
                                          : Colors.grey,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectedContent = "Shipping Opt";
                                });
                              },
                              child: Text(
                                "Shipping Opt",
                                style: TextStyle(
                                  color: _selectedContent == "Shipping Opt"
                                      ? Colors.teal
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _selectedContent = "Payment";
                                  },
                                );
                              },
                              child: Text(
                                "Payment",
                                style: TextStyle(
                                  color: _selectedContent == "Payment"
                                      ? Colors.teal
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.teal),
                    Align(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: _buildContent(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedContent) {
      case "Bill & Ship Address":
        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fullname *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ZIP *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "City *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Country *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile Number *",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        CheckboxListTile(
                          title: Text(
                              "Delivery and billing addresses are the same"),
                          value: true,
                          onChanged: (bool? newBool) {},
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: Container(
                            width: 50,
                            child: Row(
                              children: [
                                Icon(Icons.save),
                                Text(
                                  "Save",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      case "Shipping Opt":
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // ignore: avoid_types_as_parameter_names
                RadioMenuButton(
                  value: true,
                  groupValue: 1,
                  onChanged: (bool) {},
                  child: Text(
                    "Standard Shippment - 5 Working days",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                RadioMenuButton(
                  value: false,
                  groupValue: 1,
                  onChanged: (bool) {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Express Shippment - 1 Working day",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("- Hermes")
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Container(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(Icons.save),
                        Text(
                          "Save",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case "Payment":
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Article total: "),
                        Text(
                          "100,00 €",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery: "),
                        Text(
                          "free",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total: "),
                        Text(
                          "100,00 €",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
              Text(
                "We Accept: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioMenuButton(
                value: false,
                groupValue: 1,
                onChanged: (bool) {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Paypal"), Icon(Icons.paypal_sharp)],
                    ),
                  ],
                ),
              ),
              RadioMenuButton(
                value: false,
                groupValue: 1,
                onChanged: (bool) {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Visa, Mastercard, America Express",
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                    Icon(Icons.credit_card),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.teal,
              ),
              FilledButton(
                onPressed: () {},
                child: Container(
                  width: 50,
                  child: Row(
                    children: [
                      Icon(Icons.save),
                      Text(
                        "Pay",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Container(
          alignment: Alignment.center,
          child: Text(
            "Select an option",
            style: TextStyle(fontSize: 18),
          ),
        );
    }
  }
}
