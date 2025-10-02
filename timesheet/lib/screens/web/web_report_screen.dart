// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:timesheet/utils/colors.dart';

// class WebReportScreen extends StatefulWidget {
//   const WebReportScreen({super.key});

//   @override
//   State<WebReportScreen> createState() => _WebReportScreenState();
// }

// class _WebReportScreenState extends State<WebReportScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   final List<Map<String, dynamic>> reports = [
//     {
//       "employee": "John Smith",
//       "projectName": "Project A, Project B",
//       "hoursWorked": "20h",
//       "break": "1h 00m",
//       "overtime": "25m",
//       "totalPay": "\$400.00",
//       "status": "Approved"
//     },
//     {
//       "employee": "Maria Lopez",
//       "projectName": "Project B, Project D",
//       "hoursWorked": "20h",
//       "break": "1h 00m",
//       "overtime": "25m",
//       "totalPay": "\$400.00",
//       "status": "Pending"
//     },
//     {
//       "employee": "James Lee",
//       "projectName": "Project A, Project B",
//       "hoursWorked": "20h",
//       "break": "1h 00m",
//       "overtime": "25m",
//       "totalPay": "\$400.00",
//       "status": "Approved"
//     },
//     {
//       "employee": "John Smith",
//       "projectName": "Project D",
//       "hoursWorked": "20h",
//       "break": "1h 00m",
//       "overtime": "25m",
//       "totalPay": "\$400.00",
//       "status": "Pending"
//     },
//     {
//       "employee": "Maria Lopez",
//       "projectName": "Project A, Project B",
//       "hoursWorked": "20h",
//       "break": "1h 00m",
//       "overtime": "25m",
//       "totalPay": "\$400.00",
//       "status": "Approved"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isDesktop = screenWidth > 1024;

//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.white,
//       body: Row(
//         children: [
//           // Main content
//           Expanded(
//             child: Builder(
//               builder: (context) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header
//                     Container(
//                       margin: EdgeInsets.all(isDesktop ? 24 : 16),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: isDesktop ? 24 : 16,
//                         vertical: 12,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.08),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               if (!isDesktop)
//                                 IconButton(
//                                   icon: const Icon(Icons.menu,
//                                       color: Color(0xFF111827)),
//                                   onPressed: () {
//                                     _scaffoldKey.currentState?.openDrawer();
//                                   },
//                                 ),
//                               SizedBox(
//                                 width: 12,
//                               ),
//                               const Text(
//                                 "Reports",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF111827),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFFE0E7FF),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Center(
//                                   child: Text(
//                                     "O",
//                                     style: TextStyle(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     "Olivia Rhye",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14,
//                                       color: Color(0xFF111827),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Client",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Color(0xFF6B7280),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Summary cards row
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         children: [
//                           _summaryCard("Hours Logged (This Week)", "420h 35m"),
//                           _summaryCard("Total Overtime", "32h 15m"),
//                           _summaryCard("Payroll (Approved)", "\$12,540.50"),
//                           _summaryCard("Projects Active", "6"),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // Table title
//                     Container(
//                       padding: const EdgeInsets.all(20.0),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(color: Color(0xFFE5E7EB)),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "All Reports",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF111827),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 280,
//                                 height: 40,
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     hintText: "Search",
//                                     hintStyle: const TextStyle(
//                                       color: Color(0xFF9CA3AF),
//                                       fontSize: 14,
//                                     ),
//                                     prefixIcon: const Icon(
//                                       Icons.search,
//                                       size: 20,
//                                       color: Color(0xFF9CA3AF),
//                                     ),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 12,
//                                       vertical: 10,
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: const BorderSide(
//                                         color: Color(0xFFD1D5DB),
//                                       ),
//                                     ),
//                                     enabledBorder:  OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide:  BorderSide(
//                                         color: Colors.grey.shade300,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                                SizedBox(
//                             height: 40,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.primaryColor,
//                                 foregroundColor: Colors.white,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 elevation: 0,
//                               ),
//                               onPressed: () {
                              
//                               },
//                               child: const Text(
//                                 "Export",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Report Table
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.all(isDesktop ? 24 : 16),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: const Color(0xFFE5E7EB)),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.08),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: DataTable2(
//                             columnSpacing: isDesktop ? 60 : 30,
//                             horizontalMargin: 20,
//                             headingRowHeight: 48,
//                             dataRowHeight: 72,
//                             dividerThickness: 1, // horizontal line between rows
//                             border: TableBorder.all(
//                               color: const Color(0xFFE5E7EB),
//                               width: 1,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             headingRowColor:
//                                 MaterialStateProperty.all(const Color(0xFFF9FAFB)),
//                             headingTextStyle: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                               color: Color(0xFF6B7280),
//                             ),
//                             columns: const [
//                               DataColumn(label: Text("Employee")),
//                               DataColumn(label: Text("Project Name")),
//                               DataColumn(label: Text("Hours Worked")),
//                               DataColumn(label: Text("Break")),
//                               DataColumn(label: Text("Overtime")),
//                               DataColumn(label: Text("Total Pay")),
//                               DataColumn(label: Text("Status")),
//                               DataColumn(label: Text("Action")),
//                             ],
//                             rows: reports.map((entry) {
//                               return DataRow(
//                                 cells: [
//                                   DataCell(Text(entry["employee"])),
//                                   DataCell(Text(entry["projectName"])),
//                                   DataCell(Text(entry["hoursWorked"])),
//                                   DataCell(Text(entry["break"])),
//                                   DataCell(Text(entry["overtime"])),
//                                   DataCell(Text(entry["totalPay"])),
//                                   DataCell(_statusBadge(entry["status"])),
//                                   DataCell(_actionMenu(entry)),
//                                 ],
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _summaryCard(String title, String value) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.only(right: 12),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFFE5E7EB)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
//             const SizedBox(height: 6),
//             Text(value,
//                 style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF111827))),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _statusBadge(String status) {
//     final approved = status == "Approved";
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//       decoration: BoxDecoration(
//         color: approved
//             ? const Color(0xFFDCFCE7)
//             : const Color.fromARGB(255, 244, 225, 205),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: approved
//               ? const Color.fromARGB(255, 107, 186, 136)
//               : const Color.fromARGB(255, 189, 125, 109),
//         ),
//       ),
//       child: Text(
//         status,
//         style: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w600,
//           color: approved ? const Color(0xFF16A34A) : const Color(0xFFB93815),
//         ),
//       ),
//     );
//   }

//   Widget _actionMenu(Map<String, dynamic> entry) {
//     return PopupMenuButton<String>(
//       color: Colors.white,
//       onSelected: (value) {
//         if (value == "view") {
//          _showTimesheetDetailDialog(context,entry);
//         }
//       },
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: "view", child: Text("View Detail")),
//       ],
//       icon: const Icon(Icons.more_vert, color: Color(0xFF6B7280)),
//     );
//   }
// void _showTimesheetDetailDialog(
//     BuildContext context, Map<dynamic, dynamic> entry) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Container(
//           width: 500,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Employee Timesheet Detail",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Detail rows with lines
//               Row(
//                 children: [
//                   _detailItem("Employee Name", entry["name"] ?? "N/A"),
//                   _detailItem("Projects", entry["date"] ?? "N/A"),
//                   _detailItem("Hours Worked", entry["clockIn"] ?? "N/A"),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   _detailItem("Break", entry["clockOut"] ?? "N/A"),
//                   _detailItem("Overtime", entry["break"] ?? "N/A"),
//                   _detailItem("Total Pay", entry["overtime"] ?? "N/A"),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
                
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 50, vertical: 20),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       "Export",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget _detailItem(String title, String value) {
//   return Expanded(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF374151))),
//         const SizedBox(height: 4),
//         Text(value,
//             style: const TextStyle(fontSize: 14, color: Color(0xFF111827))),
//       ],
//     ),
//   );
// }

// }

import 'package:flutter/material.dart';
import 'package:timesheet/utils/colors.dart';

class WebReportScreen extends StatefulWidget {
  const WebReportScreen({super.key});

  @override
  State<WebReportScreen> createState() =>
      _WebReportScreenState();
}

class _WebReportScreenState
    extends State<WebReportScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  final List<Map<String, dynamic>> reports = [
    {
      "employee": "John Smith",
      "projectName": "Project A, Project B",
      "hoursWorked": "20h",
      "break": "1h 00m",
      "overtime": "25m",
      "totalPay": "\$400.00",
      "status": "Approved",
    },
    {
      "employee": "Maria Lopez",
      "projectName": "Project B, Project D",
      "hoursWorked": "20h",
      "break": "1h 00m",
      "overtime": "25m",
      "totalPay": "\$400.00",
      "status": "Pending",
    },
    {
      "employee": "James Lee",
      "projectName": "Project A, Project B",
      "hoursWorked": "20h",
      "break": "1h 00m",
      "overtime": "25m",
      "totalPay": "\$400.00",
      "status": "Approved",
    },
    {
      "employee": "John Smith",
      "projectName": "Project C, Project D",
      "hoursWorked": "20h",
      "break": "1h 00m",
      "overtime": "25m",
      "totalPay": "\$400.00",
      "status": "Pending",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
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
                        "Reports",
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
                        children: const [
                          Text(
                            "Olivia Rhye",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF111827),
                            ),
                          ),
                          Text(
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
           // 🔹 Summary cards row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _summaryCard("Hours Logged (This Week)", "420h 35m"),
                  _summaryCard("Total Overtime", "32h 15m"),
                  _summaryCard("Payroll (Approved)", "\$12,540.50"),
                  _summaryCard("Projects Active", "6"),
                ],
              ),
            ),
            const SizedBox(height: 16),
          
            // Table title and search bar
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Projects",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
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
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
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
                            _showAddProjectDialog(context);
                          },
                          child: const Text(
                            "Export",
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
           
            // Data table for projects
            Padding(
              padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
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
                child: isDesktop
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width - 12,
                        ),
                        child: _buildDataTable())
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width - 32,
                          ),
                          child: _buildDataTable(),
                        ),
                      ),
              ),
            ),
            // Pagination
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      ),
    );
  }
  
  Widget _summaryCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
            const SizedBox(height: 6),
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827))),
          ],
        ),
      ),
    );
  }
void _showTimesheetDetailDialog(
    BuildContext context, Map<dynamic, dynamic> entry) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Employee Timesheet Detail",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Detail rows with lines
              Row(
                children: [
                  _detailItem("Employee Name", entry["name"] ?? "N/A"),
                  _detailItem("Projects", entry["date"] ?? "N/A"),
                  _detailItem("Hours Worked", entry["clockIn"] ?? "N/A"),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _detailItem("Break", entry["clockOut"] ?? "N/A"),
                  _detailItem("Overtime", entry["break"] ?? "N/A"),
                  _detailItem("Total Pay", entry["overtime"] ?? "N/A"),
                ],
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Export",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
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

Widget _detailItem(String title, String value) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151))),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontSize: 14, color: Color(0xFF111827))),
      ],
    ),
  );
}

  Widget _buildDataTable() {
    return Table(
      border: TableBorder.all(
        color: const Color(0xFFE5E7EB),
        width: 0.5,
        borderRadius: BorderRadius.circular(8),
      ),
      columnWidths: {
        0: const FixedColumnWidth(150),
        1: const FixedColumnWidth(150),
        2: const FixedColumnWidth(150),
        3: const FixedColumnWidth(150),
        4: const FixedColumnWidth(100),
        5: const FixedColumnWidth(80),
        6: const FixedColumnWidth(80),
        7: const FixedColumnWidth(80),
      },
      children: [
        // Header Row
        TableRow(
          decoration: const BoxDecoration(
            color: Color(0xFFF9FAFB),
          ),
          children: [
            _buildHeaderCell("Name"),
            _buildHeaderCell("Project Name"),
            _buildHeaderCell("Hours Worked"),
            _buildHeaderCell("Break"),
            _buildHeaderCell("Total Pay"),
            _buildHeaderCell("Status"),
            _buildHeaderCell("Action"),

          ],
        ),
        // Data Rows
        ...reports.map((project) {
          return TableRow(
            children: [
              _buildDataCell(Text(
                project["employee"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF111827),
                  fontWeight: FontWeight.w500,
                ),
              )),
              _buildDataCell(Text(
                project["projectName"].toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              )),
              _buildDataCell(Text(
                project["hoursWorked"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF374151),
                ),
              )),
                _buildDataCell(Text(
                project["break"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF374151),
                ),
              )),
                _buildDataCell(Text(
                project["overtime"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF374151),
                ),
              )),
                 _buildDataCell(Text(
                project["totalPay"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF374151),
                ),
              )),
              _buildDataCell(_statusBadge(project["status"])),
              _buildDataCell(_actionMenu(project)),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Color(0xFF6B7280),
        ),
      ),
    );
  }

  Widget _buildDataCell(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: child,
    );
  }

  Widget _statusBadge(String status) {
    final approved = status == "Active";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      decoration: BoxDecoration(
        color: approved ? Color(0xFFABEFC6).withOpacity(0.2) : Color(0xffB2DDFF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: approved ? Color(0xFF16A34A).withOpacity(0.4) : const Color(0xffB2DDFF),
        ),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: approved ? const Color(0xFF16A34A) : const Color(0xff175CD3),
          ),
        ),
      ),
    );
  }

  Widget _actionMenu(Map<String, dynamic> entry) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (value) {
        if (value == "view") {
          _showTimesheetDetailDialog(context,entry);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: "view", child: Text("View Detail")),
      ],
      icon: const Icon(Icons.more_vert, color: Color(0xFF6B7280)),
    );
  }

  void _showAddProjectDialog(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add a Project",
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
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Project Name"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: _inputDecoration("Enter Hours Limit"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        side: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
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
                            color: Colors.white),
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


}
