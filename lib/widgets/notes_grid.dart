import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/configs/routes.dart';

import '../configs/colors.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemCount: 10,
        itemBuilder: (context, index) => index == 0
            ? DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(5),
                strokeWidth: 1,
                dashPattern: const [10, 10, 10, 10],
                color: AppColors.primaryColor,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.drawingScreen);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: (index % 5 + 3) * 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.lightblackColor,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "New",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Lemonade",
                              fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: (index % 5 + 3) * 50,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index % 5 == 0
                      ? AppColors.yellowColor
                      : index % 5 == 1
                          ? AppColors.lightBlueColor
                          : index % 5 == 2
                              ? AppColors.greenColor
                              : index % 5 == 3
                                  ? AppColors.pinkColor
                                  : AppColors.primaryColor,
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      color: AppColors.lightblackColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "New Document",
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.primaryColor,
                            fontSize: 12),
                      ),
                      Text(
                        "Dec 14, 2024",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
