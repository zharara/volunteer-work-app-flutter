import 'package:flutter/material.dart';

import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../common_pages/list_conversations_page.dart';
import '../../common_pages/login_page.dart';
import '../../common_pages/notifications_page.dart';
import '../applications/student_list_applications_page.dart';
import '../opportunities/student_view_opportunities_page.dart';
import '../program/student_view_enrolled_program_page.dart';
import 'student_home_page.dart';
import 'student_personal_profile_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({Key? key, required this.studentDto}) : super(key: key);

  final StudentDto studentDto;
  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      StudentHomePage(studentDto: widget.studentDto),
      // const StudentPersonalProfilePage(),
      const StudentViewEnrolledProgramPage(),
      const ListConversationsPage(),
      // const NotificationsPage()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'الرئيسية', icon: Icon(Icons.home_filled)),
            // BottomNavigationBarItem(label: 'الملف', icon:
            // Icon(Icons.account_circle)),
            BottomNavigationBarItem(label: 'برنامجي', icon:
            Icon(Icons.workspace_premium)),
            BottomNavigationBarItem(label: 'المحادثات', icon:
            Icon(Icons.chat_outlined)),
            // BottomNavigationBarItem(
            //     label: 'الإشعارات', icon: Icon(Icons.notifications_active)),
          ]),
    );
  }
}
