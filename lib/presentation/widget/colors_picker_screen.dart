import 'package:flutter/material.dart';

class ColorsPickerScreen extends StatefulWidget {
  const ColorsPickerScreen(
      {super.key, required this.colors, required this.onChange});

  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorsPickerScreen> createState() => _ColorsPickerScreenState();
}

class _ColorsPickerScreenState extends State<ColorsPickerScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              _selectedIndex = index;
              widget.colors[index];
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: widget.colors[index],
              child: _selectedIndex == index
                  ?  Icon(Icons.radio_button_off_outlined,color: Colors.grey.shade200,)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
