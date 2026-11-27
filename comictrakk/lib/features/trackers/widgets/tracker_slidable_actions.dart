import 'package:comictrakk/features/trackers/constants/tracker_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TrackerSlidableAction extends StatelessWidget {
  final Color iconBgColor;
  final IconData icon;
  final TrackerStatus status;
  final Function onStatusSelected;

  const TrackerSlidableAction({super.key, required this.icon, required this.iconBgColor, required this.status, required this.onStatusSelected});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (action) => onStatusSelected(status),
      backgroundColor: iconBgColor,
      foregroundColor: Colors.white,
      icon: icon,
      label: status.name,
    );
  }
}

class WishAction extends TrackerSlidableAction {
  const WishAction({super.key, required super.onStatusSelected}): super(
      icon: Icons.shopping_bag,
      iconBgColor: Colors.deepPurple,
      status: .wish,
  );
}

class HaveAction extends TrackerSlidableAction {
  const HaveAction({super.key, required super.onStatusSelected}): super(
      icon: Icons.shelves,
      iconBgColor: Colors.orange,
      status: .have
  );
}

class ReadAction extends TrackerSlidableAction {
  const ReadAction({super.key, required super.onStatusSelected}): super(
      icon: Icons.shelves,
      iconBgColor: Colors.green,
      status: .read
  );
}