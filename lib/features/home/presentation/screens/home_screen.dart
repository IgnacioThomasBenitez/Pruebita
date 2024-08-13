import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/shared/presentation/widgets/sh_app_bar.dart';

import '../widgets/lighted_background.dart';
import '../widgets/page_indicators.dart';
import '../widgets/sm_home_bottom_navigation.dart';
import '../widgets/smart_room_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> roomSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    controller.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ShAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text("SELECT A ROOM", style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 32),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    SmartRoomsPageView(
                      pageNotifier: pageNotifier,
                      roomSelectorNotifier: roomSelectorNotifier,
                      controller: controller,
                    ),
                    Positioned.fill(
                      top: null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PageIndicators(
                            roomSelectorNotifier: roomSelectorNotifier,
                            pageNotifier: pageNotifier,
                          ),
                          SmHomeBottomNavigationBar(
                            roomSelectorNotifier: roomSelectorNotifier,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LightedBackground extends StatelessWidget {
  final Widget child;

  const LightedBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
