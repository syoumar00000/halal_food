import 'package:flutter/material.dart';
import 'package:h_food/screens/account/account_screen.dart';
import 'package:h_food/screens/cart/cart_screen.dart';
import 'package:h_food/screens/home/home_screen.dart';
import 'package:h_food/screens/wishlist/wishlist_screen.dart';
import 'package:h_food/widgets/navigation/cart_icon.dart';
import 'package:h_food/widgets/navigation/main_bottom_bar_item.dart';

class MainBottomBar extends StatefulWidget {
  final int currentIndex;
  const MainBottomBar({super.key, this.currentIndex = 0});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar>
    with AutomaticKeepAliveClientMixin<MainBottomBar> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void onChange(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (_currentIndex) {
            case 0:
              return HomeScreen();
            case 1:
              return CartScreen();
            case 2:
              return WishlistScreen();
            case 3:
              return AccountScreen();
            default:
              return HomeScreen();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainBottomBarItem(
            index: 0,
            currentIndex: _currentIndex,
            icon: Icon(Icons.home),
            title: "Home",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 1,
            currentIndex: _currentIndex,
            icon: CartIcon(),
            title: "Cart",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 2,
            currentIndex: _currentIndex,
            icon: _currentIndex != 2
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite),
            title: "Wishlist",
            onPressed: onChange,
          ),
          MainBottomBarItem(
            index: 3,
            currentIndex: _currentIndex,
            icon: Icon(Icons.person_outlined),
            title: "Account",
            onPressed: onChange,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
