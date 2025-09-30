import 'package:flutter/material.dart';
import 'package:timesheet/utils/colors.dart';

import 'home_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop(); // go back normally
        } else {
          // if no previous screen, go to HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu, color: Colors.black),
          //   onPressed: () {},
          // ),
          centerTitle: true,
          title: const Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/checkingg.png", color: Colors.black, height: 18),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 🔹 Notification 1
            _buildNotificationItem(
              icon: "assets/cc.png",
              iconColor: AppColors.primaryColor,
              title: "You forgot to clock out yesterday.",
              subtitle: "Add clock out time manually",
              time: "2m",
              showDot: true,
              buttonText: "Add Manual Time",
            ),
            _divider(),
      
            // 🔹 Notification 2
            _buildNotificationItem(
              icon: "assets/rocket.png",
              title: "New Project Assigned",
              subtitle: "\"Project Placeholder\"",
              time: "8h",
            ),
            _divider(),
      
            // 🔹 Notification 3
            _buildNotificationItem(
              customIcon: Image.asset(
                "assets/new_version_icon.jpg",
                height: 26,
              ),
              title: "New version available",
              subtitle:
                  "We’re pleased to introduce the latest enhancements in our templating experience.",
              time: "14h",
              buttonText: "Update now",
            ),
          ],
        ),
      ),
    );
  }

  // Common Divider
  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        indent: 50,
        color: Colors.grey.shade300,
        thickness: 1,
      ),
    );
  }

  // 🔹 Notification Item Widget
  Widget _buildNotificationItem({
    String? icon,
    Color? iconColor,
    Widget? customIcon,
    required String title,
    required String subtitle,
    required String time,
    bool showDot = false,
    String? buttonText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Icon
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: customIcon ??
                    Image.asset(
                      icon!,
                      color: iconColor ?? AppColors.primaryColor,
                      height: 22,
                    ),
              ),
              if (showDot)
  Positioned(
    top: 0,
    left: 0,
    child: Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
    ),
  ),

            ],
          ),
          const SizedBox(width: 12),

          // Title + Subtitle + Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
                if (buttonText != null) ...[
                  const SizedBox(height: 8),
                  ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(140, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  onPressed: () {},
  child: Text(
    buttonText!,
    style: const TextStyle(
      fontSize: 13,
      color: Colors.white,
    ),
  ),
),

                ]
              ],
            ),
          ),

          // Time + Options
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.more_horiz, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }
}
