import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;
  bool isActive;
  AccountWidget({
    super.key,
    this.icon,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isActive == true
                  ? Icon(icon, size: 20, color: Color(0xfff45a08))
                  : Container(),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff727272),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xff303030),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
