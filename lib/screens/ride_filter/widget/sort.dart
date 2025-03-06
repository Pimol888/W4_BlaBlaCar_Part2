import 'package:flutter/material.dart';
import '../../../service/rides_service.dart';
import '../../../theme/theme.dart';

class SortByTile extends StatelessWidget {
  //to change the parent value 
  final Function(RideSortType) onPressed;
  RideSortType selectedSortType;
  SortByTile({super.key,required this.onPressed,required this.selectedSortType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         ...RideSortType.values.map((type) => RadioListTile<RideSortType>(
          title: Text(type.title,),
          value: type,
          secondary: Icon(type.icon,color: BlaColors.iconLight,),
          activeColor: BlaColors.primary,
          groupValue: selectedSortType,
          onChanged: (RideSortType? value) {
            if (value != null) {
              onPressed(value);
            }
          },
        )),
      ],
    );
  }
}