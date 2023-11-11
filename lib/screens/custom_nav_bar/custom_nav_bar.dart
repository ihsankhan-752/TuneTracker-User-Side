import 'package:flick_radio/screens/custom_nav_bar/widgets/custom_bottom_card.dart';
import 'package:flick_radio/theme/colors.dart';
import 'package:flick_radio/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      bottomNavigationBar: Container(
        color: AppColors.primaryBlack,
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Main3DButton(
              widget: CustomBottomCard(
                title: "Home",
                icon: Icons.home,
                selectedIndex: selectedIndex,
                index: 0,
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                    );
                  });
                },
              ),
            ),
            Main3DButton(
              widget: CustomBottomCard(
                title: "Magazine",
                icon: Icons.menu_book_rounded,
                selectedIndex: selectedIndex,
                index: 1,
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                    );
                  });
                },
              ),
            ),
            Main3DButton(
              widget: CustomBottomCard(
                title: "Playlist",
                icon: Icons.music_note,
                selectedIndex: selectedIndex,
                index: 2,
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                    );
                  });
                },
              ),
            ),
            Main3DButton(
              widget: CustomBottomCard(
                title: "Schedule",
                icon: Icons.playlist_add_check_circle_sharp,
                selectedIndex: selectedIndex,
                index: 3,
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                    );
                  });
                },
              ),
            ),
            Main3DButton(
              widget: CustomBottomCard(
                title: "More",
                icon: Icons.more_horiz,
                selectedIndex: selectedIndex,
                index: 4,
                onPressed: () {
                  setState(() {
                    selectedIndex = 4;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
