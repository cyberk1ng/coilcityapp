import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/data/constant.dart';
import 'package:playground/pages/product_view_page.dart';
import 'package:playground/providers/products_provider.dart';


class ShopProducts extends ConsumerStatefulWidget {
  const ShopProducts({super.key});

  @override
  ConsumerState<ShopProducts> createState() => _ShopProductsState();
}

class _ShopProductsState extends ConsumerState<ShopProducts> {
  //final List<bool> _isLiked = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(productsProvider);
    return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  child: GridView.builder(
                    // shrinking the GridView to take only as much height as needed
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6),
                    itemCount: allProducts.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 1.0,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 8, top: 3),
                                  child: GestureDetector(
                                    onTap: () {
                                     /*  setState(() {
                                        _isLiked[index] = !_isLiked[index];
                                      }); */
                                    },
                                    child: Icon(
                                      Icons.favorite
                                      /* _isLiked[index]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: _isLiked[index]
                                          ? Color.fromRGBO(212, 112, 100, 0.9)
                                          : Colors.teal,
                                      size: 40, */
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      allProducts[index].image,
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductviewPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.only(bottom: 5),
                                child: Column(
                                  children: [
                                    Text(allProducts[index].name,
                                        style: KTextStyle.textStyleforcc),
                                        Text(
                                      "${allProducts[index].price},00 €",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(1),
                               
                                
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: Colors.teal,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
         
  }
}