import 'package:flutter/material.dart';
import 'package:timesheet/screens/home_screen.dart';
import 'package:timesheet/utils/colors.dart';

class BreakOvertimeScreen extends StatelessWidget {
  const BreakOvertimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu, color: Colors.black),
          //   onPressed: () {},
          // ),
          centerTitle: true,
          title: const Text(
            "Break & Overtime",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset(
                "assets/ic_notification.png", // notification icon
                height: 22,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Today Section
              const Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
      
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
                children: [
                  _buildStatCard(
                    "assets/shift.png",
                    "Shift",
                    "9:00 AM - 6:15 PM",
                    "(9h 15m)",
                  ),
                  _buildStatCard(
                    "assets/breaks.png",
                    "Breaks\n(Auto-Tracked)",
                    "45 min",
                  ),
                  _buildStatCard(
                    "assets/clock1.png",
                    "Net Working Hours",
                    "8h 30m",
                  ),
                  _buildStatCard(
                    "assets/overtime.png",
                    "Overtime\n(Auto-Calculated)",
                    "45 min",
                  ),
                ],
              ),
      
              const SizedBox(height: 20),
      
              // 🔹 Weekly Summary
              const Text(
                "Weekly Summary",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
      
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
                children: [
                  _buildStatCard("assets/clock2.png", "Standard Hours", "40h"),
                  _buildStatCard("assets/clock1.png", "Worked Hours", "44h 15m"),
                  _buildStatCard("assets/breaks.png", "Breaks", "3h 10m"),
                  _buildStatCard("assets/overtime.png",
                      "Overtime\n(Auto-Calculated)", "4h 15m"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Card Widget
  Widget _buildStatCard(
    String icon,
    String title,
    String value, [
    String? subtitle,
  ]) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 32),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          if (value.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
