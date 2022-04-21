import 'package:flutter/material.dart';
import 'package:flutter_kalpesh_artivatic/common/app_colors.dart';
import 'package:flutter_kalpesh_artivatic/model/row_model.dart';

/*
Title:RowWidget
Purpose:To Display Rowdata in a HomePageScreen
Required Parameters:rowModelDataTxt
Author:Kalpesh Khandla
Created On: 21 April 2022
Last Edited On: 21 April 2022
*/

class RowWidget extends StatefulWidget {
  final RowModel rowModelDataTxt;

  RowWidget(
    this.rowModelDataTxt,
  );

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  late double height, width;
  @override
  void initState() {
    super.initState();
    print("INit State Row Widget : ${widget.rowModelDataTxt}");
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 15,
        ),
        child: Row(
          children: [
            widget.rowModelDataTxt.imageHref != null
                ? Container(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      widget.rowModelDataTxt.imageHref ?? "",
                    ),
                  )
                : Container(
                    height: 80,
                    width: 80,
                    child: 
                     Image.asset(
                      "assets/images/user.png",
                    ),
                  ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.rowModelDataTxt.title ?? "",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 16,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Container(
                  width: width * 0.6,
                  child: Text(
                    widget.rowModelDataTxt.description ?? "",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 14,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
