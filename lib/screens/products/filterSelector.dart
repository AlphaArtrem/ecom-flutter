import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:flutter/material.dart';

class FilterSelector extends StatefulWidget {
  final Function(String value) onChange;
  final List<String> options;
  final String title;
  FilterSelector({this.onChange, this.options, this.title});
  @override
  _FilterSelectorState createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black54,
            fontSize: Sizing.getProportionateScreenHeight(18.0)
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              widget.onChange(widget.options[index]);
              Navigator.pop(context);
            },
            title: Text(
              widget.options[index],
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: Sizing.getProportionateScreenHeight(15.0)
              ),
            ),
          );
        },
      ),
    );
  }
}
