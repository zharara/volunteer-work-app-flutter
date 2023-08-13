import 'package:flutter/material.dart';
import 'package:volunteer_work_app/ui/pages/organization/account/organization_edit_profile_page.dart';

import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../common_pages/list_conversations_page.dart';
import '../../common_pages/login_page.dart';
import '../../common_pages/notifications_page.dart';

import '../applications/organization_view_all_applications_page.dart';
import '../opportunities/create_volunteer_opportunity_page.dart';
import '../opportunities/view_organization_opportunities_page.dart';
import '../programs/create_volunteer_program_page.dart';
import '../programs/view_organization_programs_page.dart';
import 'organization_home_page.dart';

class OrganizationMainPage extends StatefulWidget {
  const OrganizationMainPage({Key? key, required this.organizationDto})
      : super(key: key);

  final OrganizationDto organizationDto;

  @override
  State<OrganizationMainPage> createState() => _OrganizationMainPageState();
}

class _OrganizationMainPageState extends State<OrganizationMainPage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      OrganizationHomePage(organizationDto: widget.organizationDto),
      const OrganizationEditProfilePage(),
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
                label: 'الملف التعريفي', icon: Icon(Icons.account_balance)),
            BottomNavigationBarItem(
                label: 'المحادثات', icon: Icon(Icons.chat_outlined)),
          ]),
    );
  }
}
