import 'package:spot/core/utils/exports.dart';

class MainViewModel extends IndexTrackingViewModel {
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(CupertinoIcons.home, size: 20),
    ),
    const BottomNavigationBarItem(
      label: 'Recents',
      icon: Icon(CupertinoIcons.square_list, size: 20),
    )
  ];

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const RecentsView();
      default:
        return const HomeView();
    }
  }
}
