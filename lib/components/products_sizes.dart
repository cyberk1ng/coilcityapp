import 'package:flutter/material.dart';

class ProductsSizes extends StatefulWidget {
  final List<String> items;
  final String selectedSize;
  final ValueChanged<String> onChanged;
  final Color? underlineColor; // Custom underline color
  final TextStyle? textStyle;

  const ProductsSizes({
    super.key,
    required this.items,
    required this.selectedSize,
    required this.onChanged,
    required this.underlineColor,
    required this.textStyle,
  });

  @override
  State<ProductsSizes> createState() => _ProductsSizesState();
}

class _ProductsSizesState extends State<ProductsSizes> {
   @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: widget.selectedSize,
        items: widget.items.map(
          (String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          },
        ).toList(),
        onChanged: (String? newValue) {
          if(newValue != null){
            widget.onChanged(newValue);
          }
        },
        icon: Icon(Icons.arrow_drop_down),
        underline: Container(
          height: 2,
          color: widget.underlineColor, // Underline color
        ),
        style: widget.textStyle,
      ),
    );
  }
}
