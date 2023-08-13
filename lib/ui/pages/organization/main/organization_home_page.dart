import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/on_change_application_status.dart';
import 'package:volunteer_work_app/ui/pages/organization/account/organization_edit_profile_page.dart';
import 'package:volunteer_work_app/ui/pages/organization/announcements/create_organization_announcement_page.dart';
import 'package:volunteer_work_app/ui/pages/organization/announcements/org_manage_announcements_page.dart';
import 'package:volunteer_work_app/ui/pages/organization/volunteers/view_all_organization_volunteers_page.dart';

import '../../../../blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import '../../../../blocs/organizations/get_organization_by_id/get_organization_by_id_cubit.dart';
import '../../../../blocs/student_applications/get_home_applications/get_home_applications_cubit.dart';
import '../../../../blocs/student_applications/organization_accept_application/organization_accept_application_cubit.dart';
import '../../../../blocs/student_applications/organization_reject_application/organization_reject_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/types.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/org_application_item_card.dart';
import '../../../common_components/profile_picture_widget.dart';
import '../../../common_components/title_with_action.dart';
import '../../common_pages/login_page.dart';
import '../../common_pages/notifications_page.dart';
import '../../common_pages/reset_password_page.dart';
import '../../common_pages/view_announcement_page.dart';
import '../applications/organization_view_all_applications_page.dart';
import '../opportunities/create_volunteer_opportunity_page.dart';
import '../opportunities/view_organization_opportunities_page.dart';
import '../programs/create_volunteer_program_page.dart';
import '../programs/view_organization_programs_page.dart';

class OrganizationHomePage extends StatefulWidget {
  const OrganizationHomePage({Key? key, required this.organizationDto})
      : super(key: key);

  final OrganizationDto organizationDto;

  @override
  State<OrganizationHomePage> createState() => _OrganizationHomePageState();
}

class _OrganizationHomePageState extends State<OrganizationHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    final getManagementAnnouncementsCubit =
        BlocProvider.of<GetManagementAnnouncementsCubit>(context);
    if (getManagementAnnouncementsCubit.state
            is! GetManagementAnnouncementsSuccess &&
        getManagementAnnouncementsCubit.state
            is! GetManagementAnnouncementsLoading) {
      getManagementAnnouncementsCubit.getManagementAnnouncements();
    }

    BlocProvider.of<GetHomeApplicationsCubit>(context)
        .getHomeApplications(AccountType.organization);

    if (globalAppStorage.getOrganizationAccount()?.profilePicture == null) {
      if (context.read<GetOrganizationByIdCubit>()
          is! GetOrganizationByIdSuccess) {
        context.read<GetOrganizationByIdCubit>().getOrganizationAccount(
            globalAppStorage.getOrganizationAccount()?.id ?? 0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrganizationAcceptApplicationCubit,
        OrganizationAcceptApplicationState>(
      listener: (context, state) {
        if (state is OrganizationAcceptApplicationSuccess) {
          onOrganizationChangeApplicationStatus(
            context: context,
            applicationDto: state.data,
          );

          context.read<OrganizationAcceptApplicationCubit>().resetState();
        }
      },
      child: BlocListener<OrganizationRejectApplicationCubit,
          OrganizationRejectApplicationState>(
        listener: (context, state) {
          if (state is OrganizationRejectApplicationSuccess) {
            onOrganizationChangeApplicationStatus(
              context: context,
              applicationDto: state.data,
            );

            context.read<OrganizationRejectApplicationCubit>().resetState();
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
                              .getOrganizationAccount()
                              ?.profilePicture !=
                          null
                      ? ProfilePictureWidget(
                          savedFileDto: globalAppStorage
                              .getOrganizationAccount()
                              ?.profilePicture)
                      : BlocConsumer<GetOrganizationByIdCubit,
                          GetOrganizationByIdState>(
                          listener: (context, state) {
                            if (state is GetOrganizationByIdSuccess) {
                              globalAppStorage
                                  .setOrganizationAccount(state.data);
                            }
                          },
                          builder: (context, state) {
                            if (state is GetOrganizationByIdLoading) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            }
                            if (state is GetOrganizationByIdSuccess) {
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
                  accountName: Text(widget.organizationDto.fullName ?? '-'),
                  accountEmail: Text(widget.organizationDto.email ?? ''),
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
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('الملف التعريفي للمؤسسة'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const OrganizationEditProfilePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active),
                  title: const Text('الإشعارات'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const NotificationsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.campaign),
                  title: const Text('إدارة إعلانات المؤسسة'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const OrgManageAnnouncementsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_circle_outline),
                  title: const Text('إنشاء فرصة تطوع'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            const CreateVolunteerOpportunityPage(),
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
                            const ViewOrganizationOpportunitiesPage(),
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
                            const OrganizationViewAllApplicationsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_circle_outline),
                  title: const Text('إنشاء برنامج تطوع'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CreateVolunteerProgramPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.workspace_premium),
                  title: const Text('برامج التطوع'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ViewOrganizationProgramsPage(),
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
                            const ViewAllOrganizationVolunteersPage(),
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
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dContext);
                                  },
                                  child: const Text('رجوع'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (await globalAppStorage.logout()) {
                                      if (mounted) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => const LoginPage(),
                                          ),
                                          (route) => false,
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'خروج',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ));
                  },
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
                                const CreateOrganizationAnnouncementPage(),
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
                    title: 'طلبات التطوع',
                    action: 'عرض الكل',
                    icon: Icons.arrow_forward,
                    onIconPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const OrganizationViewAllApplicationsPage(),
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
                            OrgApplicationItemCard(item: item)
                        ]);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
