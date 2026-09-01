import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';

class OnboardingSlide extends StatelessWidget {
  final int? id;
  final String? title;
  final String? description;
  final String? image; 
  const OnboardingSlide({
    super.key,
    this.id,
    this.title,
    this.description,
    this.image,
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // image slide
        Container(
          width: KscreenWidth(context),
          height: KscreenHeight(context),
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.cover,
              ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
             height: KscreenHeight(context)/3,
             width: KscreenWidth(context),
             decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
             ),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                    title!,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Color(0xff303030),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xff727272),
                        fontSize: 18
                      ),
                    ),
                  ),
              ],
             ),
          ),
          ),
      ],
    );
  }
}