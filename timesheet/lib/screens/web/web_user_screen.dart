import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/utils/colors.dart';

class WebUserScreen extends StatefulWidget {
  const WebUserScreen({super.key});

  @override
  State<WebUserScreen> createState() => _WebUserScreenState();
}

class _WebUserScreenState extends State<WebUserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> users = [
    {
      "name": "John Smith",
      "email": "johnsmith@gmail.com",
      "dept": "Engineering",
      "role": "Employee",
      "status": "Active"
    },
    {
      "name": "Maria Lopez",
      "email": "marialopez@gmail.com",
      "dept": "HR",
      "role": "Manager",
      "status": "Inactive"
    },
    {
      "name": "James Lee",
      "email": "jameslee@gmail.com",
      "dept": "Finance",
      "role": "Employee",
      "status": "Active"
    },
    {
      "name": "John Smith",
      "email": "johnsmith@gmail.com",
      "dept": "Engineering",
      "role": "Manager",
      "status": "Inactive"
    },
    {
      "name": "Maria Lopez",
      "email": "marialopez@gmail.com",
      "dept": "HR",
      "role": "Employee",
      "status": "Active"
    },
    {
      "name": "James Lee",
      "email": "jameslee@gmail.com",
      "dept": "Finance",
      "role": "Manager",
      "status": "Inactive"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 768 && screenWidth <= 1024;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: (isDesktop) ? null : _buildDrawer(),
      body: Row(
        children: [
          // 🔹 Sidebar - Only show on desktop
          if (isDesktop)
            Container(
              width: 250,
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: const Text(
                      "Timesheet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _sidebarItem(Icons.people_outline, "Users", true),
                  _sidebarItem(
                      Icons.access_time_outlined, "Employee Timesheet", false),
                  _sidebarItem(
                      Icons.folder_outlined, "Project Management", false),
                  _sidebarItem(Icons.bar_chart_outlined, "Reports", false),
                ],
              ),
            ),

          // 🔹 Main Content
          Expanded(
            child: Column(
              children: [
                // 🔹 Top AppBar / Header
                Container(
                  margin: EdgeInsets.all(isDesktop ? 24 : 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 24 : 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (!isDesktop)
                            IconButton(
                              icon: const Icon(Icons.menu,
                                  color: Color(0xFF111827)),
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                          SizedBox(
                            width: 12,
                          ),
                          const Text(
                            "Users",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0E7FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "O",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Olivia Rhye",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              const Text(
                                "Client",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Header row with search and add button
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  child: isDesktop || isTablet
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "All Users",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111827),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 280,
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF9CA3AF),
                                        fontSize: 14,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD1D5DB),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD1D5DB),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      _showAddUserDialog(context);
                                    },
                                    child: const Text(
                                      "Add User",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "All Users",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        hintStyle: const TextStyle(
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 14,
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          size: 20,
                                          color: Color(0xFF9CA3AF),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 10,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Add User",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: isDesktop ? 24.0 : 16.0,
                      right: isDesktop ? 24.0 : 16.0,
                      bottom: isDesktop ? 24.0 : 16.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DataTable2(
                        columnSpacing: isDesktop ? 60 : 30,
                        horizontalMargin: 20,
                        headingRowHeight: 48,
                        dataRowHeight: 72,
                        headingRowColor:
                            MaterialStateProperty.all(const Color(0xFFF9FAFB)),
                        minWidth: MediaQuery.of(context).size.width -
                            (isDesktop ? 298 : 48),

                        // ✅ FIX: This makes body rows scrollable, headers stay fixed
                        headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                        columns: const [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Email")),
                          DataColumn(label: Text("Department")),
                          DataColumn(label: Text("Role")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("Action")),
                        ],

                        rows: users.map((user) {
                          return DataRow(
                            cells: [
                              DataCell(Text(user["name"],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF111827),
                                      fontWeight: FontWeight.w500))),
                              DataCell(Text(user["email"],
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF6B7280)))),
                              DataCell(Text(user["dept"],
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF374151),))),
                              DataCell(Text(user["role"],
                                  style: const TextStyle(
                                      fontSize: 14,color: Color(0xFF374151),))),
                              DataCell(_statusBadge(user["status"])),
                              DataCell(_actionMenu(user)),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                // Pagination
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Page 1 of 10",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              side: const BorderSide(color: Color(0xFFD1D5DB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Previous",
                              style: TextStyle(
                                color: Color(0xFF374151),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              side: const BorderSide(color: Color(0xFFD1D5DB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                               color: Color(0xFF374151),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: const Text(
                "Timesheet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _sidebarItem(Icons.people_outline, "Users", true),
            _sidebarItem(
                Icons.access_time_outlined, "Employee Timesheet", false),
            _sidebarItem(Icons.folder_outlined, "Project Management", false),
            _sidebarItem(Icons.bar_chart_outlined, "Reports", false),
          ],
        ),
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(String status) {
    final isActive = status == "Active";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
        ),
      ),
    );
  }

  Widget _actionMenu(Map<String, dynamic> user) {
    return PopupMenuButton<String>(
      color: Colors.white,
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == "view") {
          _showUserDetailDialog(context, user);
        }
        // Add edit/delete logic here if needed
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "view",
          child: Text("View"),
        ),
        const PopupMenuItem(
          value: "edit",
          child: Text("Edit"),
        ),
        const PopupMenuItem(
          value: "delete",
          child: Text("Delete"),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
        size: 20,
        color: Color(0xFF6B7280),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add a User",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Input Fields
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Name"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Email Address"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Department"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Role"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        side: const BorderSide(color: AppColors.primaryColor,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
      ),
    );
  }

  void _showUserDetailDialog(BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 450,
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "User Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // User Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _userDetailItem("Name", user["name"]),
                    _userDetailItem("Email", user["email"]),
                    _userDetailItem("Department", user["dept"]),
                  ],
                ),
                const SizedBox(height: 12),
                _userDetailItem("Role", user["role"]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _userDetailItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }
}
