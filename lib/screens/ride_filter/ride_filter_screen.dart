import 'package:blabla_part2/screens/ride_filter/widget/checkbox_detail.dart';
import 'package:blabla_part2/screens/ride_filter/widget/sort.dart';
import 'package:flutter/material.dart';
import '../../service/filture_service.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import '../../widgets/actions/bla_button.dart';
import '../../widgets/display/bla_divider.dart';

class RideFilterScreen extends StatefulWidget {
  final VoidCallback onSubmit;
  const RideFilterScreen({super.key, required this.onSubmit});

  @override
  State<RideFilterScreen> createState() => _RideFilterScreenState();
}

class _RideFilterScreenState extends State<RideFilterScreen> {

  RideSortType currentSortType = RideSortType.timeOfDeparture;
  RidesFilter currentFilter = RidesFilter(false);

  void onPressedSortByTile(RideSortType rideSortType){
    setState(() {
      currentSortType = rideSortType;
    });
  }

  void onPressedFilter(RidesFilter newFilter){
    setState(() {
      currentFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: BlaColors.primary,),
                  onPressed: (){
                    Navigator.pop(context);
                }),
                TextButton(onPressed: (){
        
                }, 
                child: Text("Clear all",style: BlaTextStyles.body.copyWith(color: BlaColors.primary,))),
              ],
            )
            ,SizedBox(height: BlaSpacings.xl,),
            Text("Filter",style: BlaTextStyles.heading.copyWith(fontWeight: FontWeight.bold,color: BlaColors.neutral),),
            SizedBox(height: BlaSpacings.xxl,),
            Text("Sort by",style: BlaTextStyles.title.copyWith(fontWeight: FontWeight.bold,color: BlaColors.neutral),),
            SortByTile(onPressed: onPressedSortByTile, selectedSortType: currentSortType,),
            BlaDivider(),
            Text("Details",style: BlaTextStyles.title.copyWith(color: BlaColors.neutral),),
            SizedBox(height: BlaSpacings.xxl,),
            DetailCheckBox(initRidesFilter: currentFilter,onPressed: onPressedFilter),
            SizedBox(height: BlaSpacings.xxl,),
            BlaButton(
              type: ButtonType.primary,
              text: "See rides",
              onPressed: (){
                
                // assign new value to the service
                FilterService.instance.rideSortType = currentSortType;
                FilterService.instance.ridesFilter = currentFilter;

                //trigger rebuild ride screen
                widget.onSubmit();
                Navigator.pop(context);
              },
              )


          ],
        ),
      ),
    );
  }
}