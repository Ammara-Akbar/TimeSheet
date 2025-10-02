import 'package:flutter/material.dart';
import 'package:timesheet/screens/add_time_manually_screen.dart';
import 'package:timesheet/screens/break_overtime_screen.dart';
import 'package:timesheet/screens/notification_screen.dart';
import 'package:timesheet/screens/select_project_screen.dart';
import 'package:timesheet/screens/time_sheet_screen.dart';
import 'package:timesheet/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum WorkStatus { notClockedIn, clockedIn, onBreak }

class _HomeScreenState extends State<HomeScreen> {
  WorkStatus _status = WorkStatus.notClockedIn;
  DateTime? _clockInTime;
  DateTime? _clockOutTime;

  // Start work
  void _clockIn() {
    setState(() {
      _status = WorkStatus.clockedIn;
      _clockInTime = DateTime.now();
      _clockOutTime = null;
    });
  }

  // Take a break
  void _takeBreak() {
    setState(() {
      _status = WorkStatus.onBreak;
    });
  }

  // Resume work
  void _resumeWork() {
    setState(() {
      _status = WorkStatus.clockedIn;
    });
  }

  // Clock out confirmation
  void _clockOut() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Title with back arrow
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Clock Out",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // balance for centering
                ],
              ),

              const SizedBox(height: 8),

              // ✅ Content
              const Text(
                "Are you sure you want to clock out? Once clocked out the time will be added to the Timesheet and cannot be changed.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),
              const Divider(height: 1, color: Colors.black26),
              const SizedBox(height: 16),

              // ✅ Buttons row
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
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
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        "Clock Out",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (confirm == true) {
      setState(() {
        _status = WorkStatus.notClockedIn;
        _clockOutTime = DateTime.now();
      });
    }
  }

  String _getWorkedTime() {
    if (_clockInTime == null) return "--:--:--";

    final endTime =
        (_status == WorkStatus.notClockedIn && _clockOutTime != null)
            ? _clockOutTime!
            : DateTime.now();

    final diff = endTime.difference(_clockInTime!);
    return diff.toString().split('.').first; // hh:mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
      surfaceTintColor: Colors.white,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        "Home",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
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

    // ✅ Drawer added
  drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        
        decoration: const BoxDecoration(
          
          color: AppColors.primaryColor,
        ),
        accountName: const Text(
          "Olivia Rhye",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        accountEmail: const Text(
          "olivia.rhye@gmail.com",
          style: TextStyle(fontSize: 14),
        ),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150?img=5", // Replace with your profile pic URL
          ),
        ),
      ),
      ListTile(
        leading:  Icon(Icons.home,color: Colors.grey.shade500,),
        title: const Text("Home"),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
      ),
      ListTile(
        leading:  Icon(Icons.list_alt,color: Colors.grey.shade500,),
        title: const Text("projects"),
        onTap: () {
          
        },
      ),
      ListTile(
        leading:  Icon(Icons.access_time,color: Colors.grey.shade500,),
        title: const Text("Time Sheet"),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const TimesheetScreen()),
          );
        },
      ),
      ListTile(
        leading:  Icon(Icons.breakfast_dining,color: Colors.grey.shade500,),
        title: const Text("Break & Overtime"),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => BreakOvertimeScreen()),
          );
        },
      ),
    ],
  ),
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Good Morning, Alex!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _status == WorkStatus.notClockedIn
                    ? "You are not clocked in"
                    : "You are clocked in",
                style: const TextStyle(fontSize: 14.5, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),

            Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=5"),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Talal Ahmad",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text(
                  "UX/UI Designer",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 15),

                // ✅ Integrated ClockInOutWidget
                if (_status == WorkStatus.notClockedIn)
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _clockIn,
                      child: const Text("Clock In",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  )
                else
                  ClockInOutWidget(
                    clockInTime: _clockInTime != null
                        ? "${_clockInTime!.hour.toString().padLeft(2, '0')}:${_clockInTime!.minute.toString().padLeft(2, '0')} AM"
                        : "--:--",
                    clockOutTime: _clockOutTime != null
                        ? "${_clockOutTime!.hour.toString().padLeft(2, '0')}:${_clockOutTime!.minute.toString().padLeft(2, '0')} PM"
                        : "-- : --",
                    workedTime: _getWorkedTime(),
                    onBreak: _status == WorkStatus.onBreak
                        ? _resumeWork
                        : _takeBreak,
                    onClockOut: _clockOut,
                    isOnBreak: _status == WorkStatus.onBreak,
                  ),
              ],
            ),

            const SizedBox(height: 25),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard(
                    "assets/clocksicon.png", "Today’s Time", "N/A"),
                _buildStatCard("assets/thisweek.png", "This Week", "18h 20m"),
                _buildStatCard(
                    "assets/overtime.png", "Overtime", "1h 15m"),
                _buildStatCard("assets/absents.png", "Total Absents", "2 Days"),
                _buildStatCard("assets/leaves.png", "Total Leaves", "1 Day"),
                _buildStatCard(
                    "assets/latetime.png", "Total Late Time", "30 mints"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16, top: 5),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SelectProjectScreen()),
                  );
                },
                child: const Text(
                  "Projects",
                  style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => AddTimeManuallyScreen()),
                  );
                },
                child: const Text(
                  "Manual Entry",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String icon, String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 32),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Updated ClockInOutWidget with Resume toggle
class ClockInOutWidget extends StatelessWidget {
  final String clockInTime;
  final String clockOutTime;
  final String workedTime;
  final VoidCallback onBreak;
  final VoidCallback onClockOut;
  final bool isOnBreak;

  const ClockInOutWidget({
    super.key,
    required this.clockInTime,
    required this.clockOutTime,
    required this.workedTime,
    required this.onBreak,
    required this.onClockOut,
    required this.isOnBreak,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clock In / Clock Out row
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      clockInTime,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Clock In",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      clockOutTime,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Clock Out",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Worked Time
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // ✅ Blue filled portion (left side)
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor:
                    0.5, // 🔹 Adjust this value (0.0 - 1.0) to control fill %
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff93B5FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // ✅ Center Text (Worked Time)
              Center(
                child: Text(
                  workedTime, // e.g. "03:52:23"
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Break / Resume + Clock Out
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: onBreak,
                child: Text(
                  isOnBreak ? "Resume" : "Break",
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
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
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: onClockOut,
                child: const Text(
                  "Clock Out",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
