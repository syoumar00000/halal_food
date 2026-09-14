import 'package:flutter/material.dart';
import 'package:h_food/styles/spacing_style.dart';

class AccountHeader extends StatelessWidget {
  final String title;
  const AccountHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const Color brandOrange = Color(0xfff45a08);
    return Container(
      width: KscreenWidth(context),
      height: KscreenHeight(context) / 4.7,
      decoration: const BoxDecoration(
        color: brandOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffffff).withAlpha(60),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xffffffff),
                    size: 18,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -40,
            right: 0,
            left: 0,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/misc/avatar.jpg",
                        fit: BoxFit.cover, // Empêche l'image de se déformer
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    width: 35,
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2, // Légère ombre pour le faire décoller
                        backgroundColor: const Color(0xfff45a08),
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -110,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Oumar Sy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff303030),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "sytakef@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff727272),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
