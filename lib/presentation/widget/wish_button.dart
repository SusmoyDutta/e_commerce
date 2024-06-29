import 'package:e_commerce/presentation/utils/app_colors_path.dart';
import 'package:flutter/material.dart';

class WishButton extends StatelessWidget {
  const WishButton({
    super.key,
    this.showProductIcon = true,
    this.isSelected = false,
    required this.onTap,
  });

  final bool showProductIcon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showProductIcon,
      replacement: _getProductCar(Icons.delete_outline),
      child: InkWell(
        onTap: onTap,
        child: _getProductCar(_getIconSelected()),
      ),
    );
  }

  Widget _getProductCar(IconData icon) {
    return Card.filled(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      color: AppColorsPath.primaryColors,
      child: Icon(
        icon,
        size: 19,
        color: Colors.white,
      ),
    );
  }

  IconData _getIconSelected() {
    return isSelected ? Icons.favorite : Icons.favorite_border;
  }
}
