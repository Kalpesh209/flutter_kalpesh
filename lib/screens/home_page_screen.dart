import 'package:flutter/material.dart';
import 'package:flutter_kalpesh_artivatic/common/app_colors.dart';
import 'package:flutter_kalpesh_artivatic/common/app_strings.dart';
import 'package:flutter_kalpesh_artivatic/model/row_model.dart';
import 'package:flutter_kalpesh_artivatic/utility/api_manager.dart';
import 'package:flutter_kalpesh_artivatic/widget/row_widget.dart';

/*
Title:HomePageScreen
Purpose:To Display data in a HomePage Screen
Author:Kalpesh Khandla
Created On: 21 April 2022
Last Edited On: 21 April 2022
*/

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isLoading = false;
  late double height, width;
  String titleTxt = "";
  List<RowModel> arrRowDataList = List.from([RowModel()]);
  @override
  void initState() {
    super.initState();
    getFeedData();
  }



  // To get a Data From a PostMan URL
  getFeedData() {
    var apiURL = "https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";
    getresponse(apiURL).then((value) {
      if (value is Map) {
        if (value['title'] != null && value['rows'] != null) {
          print("VALUE TITLE Line 38 : ${value['rows']}");
          setState(() {
            titleTxt = value['title'];
          });
          handleListRowResponse(value['rows']);
        }
      }
    });
  }
  

  // Handle List Response
  handleListRowResponse(value) {
    print("HANDLE LIST RESPONSE : $value");
    var arrData =
        value.map<RowModel>((json) => RowModel.fromJson(json)).toList();
    setState(() {
      arrRowDataList = arrData;
    });
    print("ARRAY DATA LIST : ${arrRowDataList.length}");
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  titleTxt ?? "",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 16,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: arrRowDataList.length,
                    itemBuilder: (context, index) {
                      var rowData = arrRowDataList[index];
                      return RowWidget(rowData);
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    getFeedData();
                  },
                );
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.refreshTxt,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 16,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
