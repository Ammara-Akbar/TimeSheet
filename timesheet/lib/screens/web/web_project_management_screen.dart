// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:timesheet/utils/colors.dart';

// class WebProjectManagementScreen extends StatefulWidget {
//   const WebProjectManagementScreen({super.key});

//   @override
//   State<WebProjectManagementScreen> createState() =>
//       _WebProjectManagementScreenState();
// }

// class _WebProjectManagementScreenState
//     extends State<WebProjectManagementScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   final List<Map<String, dynamic>> projects = [
//     {
//       "name": "Project A",
//       "employeesAssigned": 5,
//       "hoursLogged": "120h",
//       "status": "Active",
//     },
//     {
//       "name": "Project B",
//       "employeesAssigned": 6,
//       "hoursLogged": "190h",
//       "status": "Completed",
//     },
//     {
//       "name": "Project C",
//       "employeesAssigned": 8,
//       "hoursLogged": "85h",
//       "status": "Active",
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
//                                 "Project Management",
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
//                             "All Projects",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF111827),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
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
//                                       borderSide:
//                                            BorderSide(color: Colors.grey.shade300),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide:
//                                            BorderSide(color: Colors.grey.shade300),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               SizedBox(
//                                 height: 40,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: AppColors.primaryColor,
//                                     foregroundColor: Colors.white,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     elevation: 0,
//                                   ),
//                                   onPressed: () {
//                                 _showAddUserDialog(context);
//                               },
//                                   child: const Text(
//                                     "Create a New Project",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Project Table
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
//                             dividerThickness: 1,
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
//                               DataColumn(label: Text("Project Name")),
//                               DataColumn(label: Text("Employees Assigned")),
//                               DataColumn(label: Text("Hours Logged")),
//                               DataColumn(label: Text("Status")),
//                               DataColumn(label: Text("Action")),
//                             ],
//                             rows: projects.map((entry) {
//                               return DataRow(
//                                 cells: [
//                                   DataCell(Text(entry["name"])),
//                                   DataCell(Text(entry["employeesAssigned"].toString())),
//                                   DataCell(Text(entry["hoursLogged"])),
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

//   Widget _statusBadge(String status) {
//     final approved = status == "Active";
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//       decoration: BoxDecoration(
//         color: approved ? Color(0xFFABEFC6).withOpacity(0.2) : Color(0xffB2DDFF).withOpacity(0.2),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: approved ? Color(0xFF16A34A).withOpacity(0.4) : const Color(0xffB2DDFF),
//         ),
//       ),
//       child: Text(
//         status,
//         style: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w600,
//           color: approved ? const Color(0xFF16A34A) : const Color(0xff175CD3),
//         ),
//       ),
//     );
//   }
  
//   void _showAddUserDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Container(
//             width: 500,
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Add a Project",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF111827),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.black),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 // Input Fields
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: _inputDecoration("Enter Project Name"),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: TextField(
//                         decoration: _inputDecoration("Enter Hours Limit"),
//                       ),
//                     ),
//                   ],
//                 ),
               
//                 const SizedBox(height: 20),

//                 // Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () => Navigator.pop(context),
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 70, vertical: 20),
//                         side: const BorderSide(
//                           color: AppColors.primaryColor,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         "Cancel",
//                         style: TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryColor,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 70, vertical: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         "Save",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

// void _showAddProjectDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Container(
//           width: 500,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Project Detail",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF111827),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.black),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Project Details
//               Row(
//                 children: [
//                   _detailItem("Project Name", "Project A"),
                 
//                   _detailItem("Employees Assigned", "5"),
//                     _detailItem("Hours Logged", "120h"),
//                 ],
//               ),
             
//               const SizedBox(height: 20),

//               // Note Section
//               const Text(
//                 "Note",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF374151),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//                 style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
//               ),
          

//             ],
//           ),
//         ),
//       );
//     },
//   );
// }


//   InputDecoration _inputDecoration(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
//       ),
//     );
//   }

//   Widget _actionMenu(Map<String, dynamic> entry) {
//     return PopupMenuButton<String>(
//       color: Colors.white,
//       onSelected: (value) {
//         if (value == "view") {
//           _showAddProjectDialog(context);
//         }
//       },
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: "view", child: Text("View Detail")),
//       ],
//       icon: const Icon(Icons.more_vert, color: Color(0xFF6B7280)),
//     );
//   }

//   Widget _detailItem(String title, String value) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF374151))),
//           const SizedBox(height: 4),
//           Text(value,
//               style: const TextStyle(fontSize: 14, color: Color(0xFF111827))),
//         ],
//       ),
//     );
//   }

// }
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/utils/colors.dart';

class WebProjectManagementScreen extends StatefulWidget {
  const WebProjectManagementScreen({super.key});

  @override
  State<WebProjectManagementScreen> createState() =>
      _WebProjectManagementScreenState();
}

class _WebProjectManagementScreenState
    extends State<WebProjectManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> projects = [
    {
      "name": "Project A",
      "employeesAssigned": 5,
      "hoursLogged": "120h",
      "status": "Active",
    },
    {
      "name": "Project B",
      "employeesAssigned": 6,
      "hoursLogged": "190h",
      "status": "Completed",
    },
    {
      "name": "Project C",
      "employeesAssigned": 8,
      "hoursLogged": "85h",
      "status": "Active",
    },
    {
      "name": "Project D",
      "employeesAssigned": 1,
      "hoursLogged": "210h",
      "status": "Completed",
    },
    {
      "name": "Project E",
      "employeesAssigned": 0,
      "hoursLogged": "120h",
      "status": "Active",
    },
    {
      "name": "Project F",
      "employeesAssigned": 2,
      "hoursLogged": "85h",
      "status": "Completed",
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
                        "Project Management",
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
                            "Create a New Project",
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

void _showUserDetailDialog(BuildContext context) {
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
                    "Project Detail",
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

              // Project Details
              Row(
                children: [
                  _detailItem("Project Name", "Project A"),
                 
                  _detailItem("Employees Assigned", "5"),
                    _detailItem("Hours Logged", "120h"),
                ],
              ),
             
              const SizedBox(height: 20),

              // Note Section
              const Text(
                "Note",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
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
            _buildHeaderCell("Employees Assigned"),
            _buildHeaderCell("Hours Logged"),
            _buildHeaderCell("Status"),
            _buildHeaderCell("Action"),
          ],
        ),
        // Data Rows
        ...projects.map((project) {
          return TableRow(
            children: [
              _buildDataCell(Text(
                project["name"],
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF111827),
                  fontWeight: FontWeight.w500,
                ),
              )),
              _buildDataCell(Text(
                project["employeesAssigned"].toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              )),
              _buildDataCell(Text(
                project["hoursLogged"],
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
          _showUserDetailDialog(context);
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
