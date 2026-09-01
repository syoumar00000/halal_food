import 'package:flutter/material.dart';
import 'package:h_food/configs/app_config.dart';
import 'package:h_food/styles/spacing_style.dart';

class StaticHeader extends StatelessWidget {
  final bool showBackButton;
  final Widget? icon;
  const StaticHeader({super.key, this.showBackButton = false, this.icon});

  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    return Container(
      width: KscreenWidth(context),
      height: KscreenHeight(context) / 3,
      decoration: const BoxDecoration(
        color: brandOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(KAppLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              KAppTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xffffffff),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null) ...[
              GestureDetector(
                onTap: () {},
                child: Transform.translate(
                  offset: Offset(-155, -140),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffffffff).withAlpha(60),
                    ),
                    child: icon,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
