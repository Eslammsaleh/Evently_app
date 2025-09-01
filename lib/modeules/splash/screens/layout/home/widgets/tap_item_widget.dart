import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';
import 'package:flutter_application_1/core/Theme/app_theme.dart';
import 'package:flutter_application_1/models/category_data.dart';

class TapItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final bool isSelected;
  TapItemWidget({super.key, required this.categoryData,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected? Colors.white:Colors.transparent,
        borderRadius: BorderRadius.circular(38),
        border: Border.all(color:isSelected? theme.primaryColor:Colors.white,),
      ),
      child: Row(
        children: [
          Icon(Icons.menu_book_rounded,color:isSelected? theme.primaryColor:Colors.white,),
          const SizedBox(width: 8),
          Text(
            categoryData.categoryTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color:isSelected? theme.primaryColor:Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
