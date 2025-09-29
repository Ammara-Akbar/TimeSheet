import 'package:flutter/material.dart';
import 'package:timesheet/screens/home_screen.dart';
import 'package:timesheet/utils/colors.dart';

import 'notification_screen.dart';

class TimesheetScreen extends StatefulWidget {
  const TimesheetScreen({super.key});

  @override
  State<TimesheetScreen> createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
   String? selectedOption;
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            "Timesheet",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                   Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
              );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset(
                  "assets/ic_notification.png",
                  height: 22,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Replace your "Select" Container with this:
              PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onSelected: (value) {
                  // 👉 Do something when user selects
                  debugPrint("Selected: $value");
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: "Daily",
                    child: Text("Daily"),
                  ),
                  const PopupMenuItem(
                    value: "Weekly",
                    child: Text("Weekly"),
                  ),
                  const PopupMenuItem(
                    value: "Monthly",
                    child: Text("Monthly"),
                  ),
                ],
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Select",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Stats Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildStatCard(
                      "assets/clocksicon.png", "Today’s Time", "N/A"),
                  _buildStatCard("assets/thisweek.png", "This Week", "18h 20m"),
                  _buildStatCard("assets/overtime.png", "Overtime", "1h 15m"),
                  _buildStatCard(
                      "assets/absents.png", "Total Absents", "2 Days"),
                  _buildStatCard("assets/leaves.png", "Total Leaves", "1 Day"),
                  _buildStatCard(
                      "assets/latetime.png", "Total Late Time", "30 mints"),
                ],
              ),
              const SizedBox(height: 16),

              // Logs
              _buildLogCard(
                date: "01 Sep 2025 - Monday",
                clockIn: "09:00 AM",
                clockOut: "07:05 PM",
                breakTime: "01:02 hrs",
                extraTime: "01:05 hrs",
                statusIn: "On time",
                statusOut: "On time",
                statusColor: Colors.green,
              ),
              _buildLogCard(
                date: "02 Sep 2025 - Tuesday",
                clockIn: "-- : -- AM",
                clockOut: "-- : -- AM",
                breakTime: "-- : -- hrs",
                extraTime: "-- : -- hrs",
                statusIn: "On leave",
                statusColor: Colors.red,
              ),
              _buildLogCard(
                date: "07 Sep 2025 - Sunday",
                clockIn: "-- : -- AM",
                clockOut: "-- : -- AM",
                breakTime: "-- : -- hrs",
                extraTime: "-- : -- hrs",
                statusIn: "Rest Day",
                statusColor: Colors.purple,
              ),
              const SizedBox(height: 20),

              // Bottom Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Projects",
                        style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text("Manual Entry",style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Stat Card
  Widget _buildStatCard(String icon, String title, String value) {
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
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Log Card
  Widget _buildLogCard({
    required String date,
    required String clockIn,
    required String clockOut,
    required String breakTime,
    required String extraTime,
    required String statusIn,
    String? statusOut,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: statusColor
                  ),
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusOut ?? statusIn,
                  style: TextStyle(color: statusColor, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Clock In & Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Clock In"),
                  Text(clockIn,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Clock Out"),
                  Text(clockOut,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Break + Extra Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Break\n$breakTime"),
              Text("Extra Time\n$extraTime"),
            ],
          ),
        ],
      ),
    );
  }
}
