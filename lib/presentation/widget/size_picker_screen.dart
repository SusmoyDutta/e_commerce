import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:flutter/material.dart';

class SizePickerScreen extends StatefulWidget {
  const SizePickerScreen({
    super.key,
    required this.size,
    required this.onChange,
    this.isRounded = true,
  });

  final List<String> size;
  final Function(String) onChange;
  final bool isRounded;


  @override
  State<SizePickerScreen> createState() => _SizePickerScreenState();
}

class _SizePickerScreenState extends State<SizePickerScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.size.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectedIndex = index;
              widget.size[index];
              setState(() {});
            },
            child: Container(
              height: 40,
              width: widget.isRounded ? 40 : null,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: _getSelectedTextColors(index == _selectedIndex),
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(widget.isRounded ? 100 : 8),
              ),
              child: Text(
                widget.size[index],
                style: TextStyle(
                  fontSize: 16,
                  backgroundColor: _getSelectedTextColors(
                    index == _selectedIndex,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _getSelectedTextColors(bool isSelected) {
    return isSelected ? AppColorsPath.primaryColors : Colors.transparent;
  }
}
