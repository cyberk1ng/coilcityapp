import 'package:flutter/material.dart';

class ProductQty extends StatefulWidget {
  final int selectedQty; // this is the current selected qty
  final int maxQty; // the max number of qty allowed
  final ValueChanged<int> onChanged; // callback func when qty is changed.
  final Color? underlineColor; // Custom underline color
  final TextStyle? textStyle;

  const ProductQty({
    super.key,
    required this.selectedQty,
    required this.onChanged,
    required this.maxQty,
    required this.underlineColor,
    required this.textStyle,
  });

  @override
  State<ProductQty> createState() => _ProductQtyState();
}

class _ProductQtyState extends State<ProductQty> {
  late int _currentQty;

  @override
  void initState(){
    super.initState();
    _currentQty = widget.selectedQty;
  }

   @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<int>(
        value: _currentQty,
        items: List.generate(widget.maxQty, (index) => index + 1)
        .map((qty) => DropdownMenuItem<int>(
              value: qty,
              child: Text(qty.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ))
            .toList(),
        onChanged: (int? newValue) {
          if(newValue != null){
            setState(() {
              _currentQty = newValue;
            widget.onChanged(newValue);
            });
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
