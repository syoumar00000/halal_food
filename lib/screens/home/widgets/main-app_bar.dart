import 'package:flutter/material.dart';
import 'package:h_food/screens/home/widgets/icon_container.dart';
import 'package:h_food/styles/input/outline_input.dart';
import 'package:h_food/styles/spacing_style.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: KscreenWidth(context),
      height: KscreenHeight(context) / 3.5,
      decoration: const BoxDecoration(
        color: Color(0xfff45a08),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                //SizedBox(height: 200),
                IconContainer(icon: Icons.place_outlined),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cocody, cote d'ivoire",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "cité des arts, cocody",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconContainer(icon: Icons.notifications_outlined),
              ],
            ),
            SizedBox(height: 30),
            OutlineInput(
              prefix: Icon(Icons.search, color: Color(0xfff45a08)),
              hint: "Find your meal",
              suffix: UnconstrainedBox(
                // pour resize mon icone
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/icons/settings-sliders.png",
                    fit: BoxFit.contain,
                    color: Color(0xfff45a08),
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
