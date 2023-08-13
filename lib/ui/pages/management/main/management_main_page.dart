import 'package:flutter/material.dart';
import 'package:volunteer_work_app/ui/pages/management/programs/list_internal_programs_page.dart';

import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../common_pages/list_conversations_page.dart';
import 'management_home_page.dart';

class ManagementMainPage extends StatefulWidget {
  const ManagementMainPage({Key? key, required this.managementEmployeeDto})
      : super(key: key);

  final ManagementEmployeeDto managementEmployeeDto;

  @override
  State<ManagementMainPage> createState() => _ManagementMainPageState();
}

class _ManagementMainPageState extends State<ManagementMainPage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      ManagementHomePage(managementEmployeeDto: widget.managementEmployeeDto),
      const ListInternalProgramsPage(),
      const ListConversationsPage()
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
            BottomNavigationBarItem(
                label: 'البرامج', icon: Icon(Icons.workspace_premium)),
            BottomNavigationBarItem(
                label: 'المحادثات', icon: Icon(Icons.chat_outlined)),
          ]),
    );
  }
}
