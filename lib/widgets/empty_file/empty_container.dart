import 'package:flutter/material.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/styles/spacing_style.dart';

class EmptyContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? labelButton;
  const EmptyContainer({
    super.key,
    this.title,
    this.subTitle,
    this.labelButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            title!,
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff727272),
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          DefaultButton(
            width: KscreenWidth(context) - 40,
            onPressed: () {},
            label: labelButton!,
            backgroundColor: Color(0xfff45a08),
            foregroundColor: Color(0xffffffff),
            height: 43,
          ),
          KSpaceH(1),
        ],
      ),
    );
  }
}
