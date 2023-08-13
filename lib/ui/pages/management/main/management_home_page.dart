import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import 'package:volunteer_work_app/blocs/management_employees/get_management_employee_by_id/get_management_employee_by_id_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/get_organizations_for_home/get_organizations_for_home_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_home_applications/get_home_applications_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/management_accept_application/management_accept_application_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/mng_application_item_card.dart';
import 'package:volunteer_work_app/ui/common_components/on_change_application_status.dart';
import 'package:volunteer_work_app/ui/common_components/title_with_action.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/reset_password_page.dart';
import 'package:volunteer_work_app/ui/pages/common_pages/view_announcement_page.dart';
import 'package:volunteer_work_app/ui/pages/management/announcements/create_management_announcement_page.dart';
import 'package:volunteer_work_app/ui/pages/management/applications/management_list_applications_page.dart';
import 'package:volunteer_work_app/ui/pages/management/management_accounts/view_management_accounts_page.dart';
import 'package:volunteer_work_app/ui/pages/management/organizations/manage_organizations_accounts_page.dart';
import 'package:volunteer_work_app/ui/pages/management/programs/create_internal_program_page.dart';
import 'package:volunteer_work_app/ui/pages/management/programs/mng_list_organizations_programs_page.dart';
import 'package:volunteer_work_app/utils/types.dart';

import '../../../../blocs/student_applications/management_reject_application/management_reject_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/organization_item_card.dart';
import '../../../common_components/profile_picture_widget.dart';
import '../../common_pages/login_page.dart';
import '../../common_pages/notifications_page.dart';
import '../announcements/manage_announcements_page.dart';
import '../categories/manage_categories_page.dart';
import '../opportunities/management_view_opportunities_page.dart';
import '../programs/list_internal_programs_page.dart';
import '../skills/manage_skills_page.dart';
import '../students/manage_students_accounts_page.dart';
import '../volunteers/list_all_volunteers_page.dart';

class ManagementHomePage extends StatefulWidget {
  const ManagementHomePage({Key? key, required this.managementEmployeeDto})
      : super(key: key);

  final ManagementEmployeeDto managementEmployeeDto;

  @override
  State<ManagementHomePage> createState() => _ManagementHomePageState();
}

class _ManagementHomePageState extends State<ManagementHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    if (globalAppStorage.getManagementAccount()?.profilePicture == null) {
      if (context.read<GetManagementEmployeeByIdCubit>()
          is! GetManagementEmployeeByIdSuccess) {
        context.read<GetManagementEmployeeByIdCubit>().getManagementAccount(
            globalAppStorage.getManagementAccount()?.id ?? 0);
      }
    }

    final getOrganizationsForHomeCubit =
        BlocProvider.of<GetOrganizationsForHomeCubit>(context);
    if (getOrganizationsForHomeCubit.state is! GetOrganizationsForHomeSuccess &&
        getOrganizationsForHomeCubit.state is! GetOrganizationsForHomeLoading) {
      getOrganizationsForHomeCubit.getOrganizationsForHome();
    }

    BlocProvider.of<GetHomeApplicationsCubit>(context)
        .getHomeApplications(AccountType.management);

    final getManagementAnnouncementsCubit =
        BlocProvider.of<GetManagementAnnouncementsCubit>(context);
    if (getManagementAnnouncementsCubit.state
            is! GetManagementAnnouncementsSuccess &&
        getManagementAnnouncementsCubit.state
            is! GetManagementAnnouncementsLoading) {
      getManagementAnnouncementsCubit.getManagementAnnouncements();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManagementAcceptApplicationCubit,
        ManagementAcceptApplicationState>(
      listener: (context, state) {
        if (state is ManagementAcceptApplicationSuccess) {
          onManagementChangeApplicationStatus(
            context: context,
            applicationDto: state.data,
          );

          context.read<ManagementAcceptApplicationCubit>().resetState();
        }
      },
      child: BlocListener<ManagementRejectApplicationCubit,
          ManagementRejectApplicationState>(
        listener: (context, state) {
          if (state is ManagementRejectApplicationSuccess) {
            onManagementChangeApplicationStatus(
              context: context,
              applicationDto: state.data,
            );

            context.read<ManagementRejectApplicationCubit>().resetState();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('الرئيسية'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const NotificationsPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications_active),
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: globalAppStorage
                              .getManagementAccount()
                              ?.profilePicture !=
                          null
                      ? ProfilePictureWidget(
                          savedFileDto: globalAppStorage
                              .getManagementAccount()
                              ?.profilePicture)
                      : BlocConsumer<GetManagementEmployeeByIdCubit,
                          GetManagementEmployeeByIdState>(
                          listener: (context, state) {
                            if (state is GetManagementEmployeeByIdSuccess) {
                              globalAppStorage.setManagementAccount(state.data);
                            }
                          },
                          builder: (context, state) {
                            if (state is GetManagementEmployeeByIdLoading) {
                              return const CircularProgressIndicator();
                            }
                            if (state is GetManagementEmployeeByIdSuccess) {
                              return ProfilePictureWidget(
                                  savedFileDto: state.data.profilePicture);
                            }

                            return const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                maxRadius: 34,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                  accountName:
                      Text(widget.managementEmployeeDto.fullName ?? '-'),
                  accountEmail: Text(widget.managementEmployeeDto.email ?? ''),
                  otherAccountsPictures: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ResetPasswordPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ))
                  ],
                ),
                const Divider(),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.admin_panel_settings),
                            title: const Text('حسابات الإدارة'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ViewManagementAccountsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.account_balance),
                            title: const Text('المؤسسات'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManageOrganizationsAccountsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.people),
                            title: const Text('حسابات الطلبة'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManageStudentsAccountsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.campaign),
                            title: const Text('الإعلانات'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManageAnnouncementsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.volunteer_activism),
                            title: const Text('فرص التطوع'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManagementViewOpportunitiesPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.library_books_sharp),
                            title: const Text('طلبات التطوع'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManagementListApplicationsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.add_circle_outline),
                            title: const Text('إنشاء برنامج تطوع داخلي'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const CreateInternalProgramPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.admin_panel_settings),
                            title: const Text('برامج التطوع الداخلية'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ListInternalProgramsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.workspace_premium),
                            title: const Text('برامج المؤسسات'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const MngListOrganizationsProgramsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.nature_people_outlined),
                            title: const Text('المتطوعون'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ListAllVolunteersPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.category),
                            title: const Text('إدارة تصنيفات مجالات التطوع'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ManageCategoriesPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.accessibility),
                            title: const Text('مهارات الطلبة'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const ManageSkillsPage(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text('تسجيل الخروج'),
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (dContext) => AlertDialog(
                                        title: Row(
                                          children: const [
                                            Icon(
                                              Icons.logout,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('تسجيل الخروج',
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                        content: const Text(
                                          'هل أنت متأكد من تسجيل الخروج؟',
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(dContext);
                                            },
                                            child: const Text('رجوع'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if (await globalAppStorage
                                                  .logout()) {
                                                if (mounted) {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          const LoginPage(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                }
                                              }
                                            },
                                            child: const Text(
                                              'خروج',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addVerticalSize(15),
                TitleWithAction(
                    title: 'الإعلانات',
                    action: 'إضافة إعلان جديد',
                    icon: Icons.add,
                    onIconPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const CreateManagementAnnouncementPage(),
                          ));
                    }),
                BlocBuilder<GetManagementAnnouncementsCubit,
                    GetManagementAnnouncementsState>(
                  builder: (context, state) {
                    if (state is GetManagementAnnouncementsError) {
                      return const CenteredErrorMessage(
                        verticalPadding: 50,
                      );
                    }

                    if (state is GetManagementAnnouncementsLoading) {
                      return const CenteredProgressIndicator(
                        verticalPadding: 50,
                      );
                    }

                    if (state is GetManagementAnnouncementsEmpty) {
                      return const CenteredEmptyData();
                    }

                    if (state is GetManagementAnnouncementsSuccess) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                            items: state.data
                                .map((item) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                ViewAnnouncementPage(
                                                    announcementDto: item),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                item.image == null
                                                    ? Image.asset(
                                                        'assets/img/announcement.jpg',
                                                        fit: BoxFit.cover,
                                                        width: 1000.0)
                                                    : Image.network(
                                                        '$kDownloadFilesURL/${item.image!.fileKey ?? ''}',
                                                        headers: {
                                                          'Authorization':
                                                              'Bearer ${globalAppStorage.getAccessToken()}'
                                                        },
                                                        errorBuilder: (c, e,
                                                                s) =>
                                                            Image.asset(
                                                                'assets/img/announcement.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 1000.0),
                                                        fit: BoxFit.cover,
                                                        width: 1000.0),
                                                Positioned(
                                                  bottom: 0.0,
                                                  left: 0.0,
                                                  right: 0.0,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              200, 0, 0, 0),
                                                          Color.fromARGB(
                                                              0, 0, 0, 0)
                                                        ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                    child: Text(
                                                      item.title ?? '-',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ))
                                .toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: state.data.map((item) {
                              return GestureDetector(
                                onTap: () => _controller
                                    .animateToPage(state.data.indexOf(item)),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                          .withOpacity(_current ==
                                                  state.data.indexOf(item)
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
                const Divider(
                  endIndent: 5,
                  indent: 5,
                ),
                TitleWithAction(
                    title: 'المؤسسات',
                    action: 'عرض الكل',
                    icon: Icons.arrow_forward,
                    onIconPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ManageOrganizationsAccountsPage(),
                          ));
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BlocConsumer<GetOrganizationsForHomeCubit,
                      GetOrganizationsForHomeState>(
                    listener: (context, state) {
                      if (state is GetOrganizationsForHomeError) {
                        showNetworkException(
                            context: context, error: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetOrganizationsForHomeLoading) {
                        return const CenteredProgressIndicator(
                          verticalPadding: 50,
                        );
                      }
                      if (state is GetOrganizationsForHomeError) {
                        return const CenteredErrorMessage(
                          verticalPadding: 50,
                        );
                      }

                      if (state is GetOrganizationsForHomeEmpty) {
                        return const CenteredEmptyData();
                      }
                      if (state is GetOrganizationsForHomeSuccess) {
                        return Column(
                          children: [
                            for (final item in state.data)
                              MngHomeOrganizationItemCard(
                                organizationDto: item,
                              )
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
                addVerticalSize(15),
                const Divider(
                  endIndent: 5,
                  indent: 5,
                ),
                TitleWithAction(
                    title: 'طلبات التطوع',
                    action: 'عرض الكل',
                    icon: Icons.arrow_forward,
                    onIconPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ManagementListApplicationsPage(),
                          ));
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BlocConsumer<GetHomeApplicationsCubit,
                      GetHomeApplicationsState>(
                    listener: (context, state) {
                      if (state is GetHomeApplicationsError) {
                        showNetworkException(
                            context: context, error: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetHomeApplicationsLoading) {
                        return const CenteredProgressIndicator(
                          verticalPadding: 50,
                        );
                      }
                      if (state is GetHomeApplicationsError) {
                        return const CenteredErrorMessage(
                          verticalPadding: 50,
                        );
                      }

                      if (state is GetHomeApplicationsEmpty) {
                        return const CenteredEmptyData();
                      }
                      if (state is GetHomeApplicationsSuccess) {
                        return Column(children: [
                          for (final item in state.data)
                            MngApplicationItemCard(item: item),
                        ]);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
                addVerticalSize(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
