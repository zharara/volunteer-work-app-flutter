import 'api.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'api.enums.swagger.dart' as enums;
export 'api.enums.swagger.dart';
export 'api.models.swagger.dart';

part 'api.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Api(newClient);
  }

  ///
  Future<chopper.Response<List<AnnouncementDto>>> apiAnnouncementsGetAllGet() {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsGetAllGet();
  }

  ///
  @Get(path: '/api/Announcements/GetAll')
  Future<chopper.Response<List<AnnouncementDto>>> _apiAnnouncementsGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param isManagementAnnouncment
  ///@param isOrganizationAnnouncment
  ///@param organizationId
  ///@param volunteerProgramId
  Future<chopper.Response<List<AnnouncementDto>>> apiAnnouncementsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    bool? isManagementAnnouncment,
    bool? isOrganizationAnnouncment,
    int? organizationId,
    int? volunteerProgramId,
  }) {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        isManagementAnnouncment: isManagementAnnouncment,
        isOrganizationAnnouncment: isOrganizationAnnouncment,
        organizationId: organizationId,
        volunteerProgramId: volunteerProgramId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param isManagementAnnouncment
  ///@param isOrganizationAnnouncment
  ///@param organizationId
  ///@param volunteerProgramId
  @Get(path: '/api/Announcements/GetList')
  Future<chopper.Response<List<AnnouncementDto>>> _apiAnnouncementsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('isManagementAnnouncment') bool? isManagementAnnouncment,
    @Query('isOrganizationAnnouncment') bool? isOrganizationAnnouncment,
    @Query('organizationId') int? organizationId,
    @Query('volunteerProgramId') int? volunteerProgramId,
  });

  ///
  ///@param id
  Future<chopper.Response<AnnouncementDto>> apiAnnouncementsGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Announcements/Get/{id}')
  Future<chopper.Response<AnnouncementDto>> _apiAnnouncementsGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<AnnouncementDto>> apiAnnouncementsCreatePost(
      {required CreateAnnouncementDto? body}) {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Announcements/Create',
    optionalBody: true,
  )
  Future<chopper.Response<AnnouncementDto>> _apiAnnouncementsCreatePost(
      {@Body() required CreateAnnouncementDto? body});

  ///
  Future<chopper.Response<AnnouncementDto>> apiAnnouncementsUpdatePut(
      {required UpdateAnnouncementDto? body}) {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Announcements/Update',
    optionalBody: true,
  )
  Future<chopper.Response<AnnouncementDto>> _apiAnnouncementsUpdatePut(
      {@Body() required UpdateAnnouncementDto? body});

  ///
  ///@param id
  Future<chopper.Response<AnnouncementDto>> apiAnnouncementsDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        AnnouncementDto, () => AnnouncementDto.fromJsonFactory);

    return _apiAnnouncementsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Announcements/Delete/{id}')
  Future<chopper.Response<AnnouncementDto>> _apiAnnouncementsDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<ManagementEmployeeAccount>>
      apiAuthLoginManagementPost({required AuthenticateRequest? body}) {
    generatedMapping.putIfAbsent(ManagementEmployeeAccount,
        () => ManagementEmployeeAccount.fromJsonFactory);

    return _apiAuthLoginManagementPost(body: body);
  }

  ///
  @Post(
    path: '/api/Auth/LoginManagement',
    optionalBody: true,
  )
  Future<chopper.Response<ManagementEmployeeAccount>>
      _apiAuthLoginManagementPost({@Body() required AuthenticateRequest? body});

  ///
  Future<chopper.Response<OrganizationAccount>> apiAuthLoginOrganizationPost(
      {required AuthenticateRequest? body}) {
    generatedMapping.putIfAbsent(
        OrganizationAccount, () => OrganizationAccount.fromJsonFactory);

    return _apiAuthLoginOrganizationPost(body: body);
  }

  ///
  @Post(
    path: '/api/Auth/LoginOrganization',
    optionalBody: true,
  )
  Future<chopper.Response<OrganizationAccount>> _apiAuthLoginOrganizationPost(
      {@Body() required AuthenticateRequest? body});

  ///
  Future<chopper.Response<StudentAccount>> apiAuthLoginStudentPost(
      {required AuthenticateRequest? body}) {
    generatedMapping.putIfAbsent(
        StudentAccount, () => StudentAccount.fromJsonFactory);

    return _apiAuthLoginStudentPost(body: body);
  }

  ///
  @Post(
    path: '/api/Auth/LoginStudent',
    optionalBody: true,
  )
  Future<chopper.Response<StudentAccount>> _apiAuthLoginStudentPost(
      {@Body() required AuthenticateRequest? body});

  ///
  ///@param currentUserPassword
  ///@param newUserPassword
  Future<chopper.Response<AuthToken>> apiAuthChangePasswordPost({
    String? currentUserPassword,
    String? newUserPassword,
  }) {
    generatedMapping.putIfAbsent(AuthToken, () => AuthToken.fromJsonFactory);

    return _apiAuthChangePasswordPost(
        currentUserPassword: currentUserPassword,
        newUserPassword: newUserPassword);
  }

  ///
  ///@param currentUserPassword
  ///@param newUserPassword
  @Post(
    path: '/api/Auth/ChangePassword',
    optionalBody: true,
  )
  Future<chopper.Response<AuthToken>> _apiAuthChangePasswordPost({
    @Query('currentUserPassword') String? currentUserPassword,
    @Query('newUserPassword') String? newUserPassword,
  });

  ///
  ///@param studentId
  ///@param newPassword
  Future<chopper.Response<ApplicationUser>>
      apiAuthResetStudentPasswordByManagementPost({
    int? studentId,
    String? newPassword,
  }) {
    generatedMapping.putIfAbsent(
        ApplicationUser, () => ApplicationUser.fromJsonFactory);

    return _apiAuthResetStudentPasswordByManagementPost(
        studentId: studentId, newPassword: newPassword);
  }

  ///
  ///@param studentId
  ///@param newPassword
  @Post(
    path: '/api/Auth/ResetStudentPasswordByManagement',
    optionalBody: true,
  )
  Future<chopper.Response<ApplicationUser>>
      _apiAuthResetStudentPasswordByManagementPost({
    @Query('studentId') int? studentId,
    @Query('newPassword') String? newPassword,
  });

  ///
  Future<chopper.Response<List<CategoryDto>>> apiCategoriesGetAllGet() {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesGetAllGet();
  }

  ///
  @Get(path: '/api/Categories/GetAll')
  Future<chopper.Response<List<CategoryDto>>> _apiCategoriesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param conversationId
  Future<chopper.Response<List<CategoryDto>>> apiCategoriesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? conversationId,
  }) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        conversationId: conversationId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param conversationId
  @Get(path: '/api/Categories/GetList')
  Future<chopper.Response<List<CategoryDto>>> _apiCategoriesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('conversationId') int? conversationId,
  });

  ///
  ///@param id
  Future<chopper.Response<CategoryDto>> apiCategoriesGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Categories/Get/{id}')
  Future<chopper.Response<CategoryDto>> _apiCategoriesGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<CategoryDto>> apiCategoriesCreatePost(
      {required CreateCategoryDto? body}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Categories/Create',
    optionalBody: true,
  )
  Future<chopper.Response<CategoryDto>> _apiCategoriesCreatePost(
      {@Body() required CreateCategoryDto? body});

  ///
  Future<chopper.Response<CategoryDto>> apiCategoriesUpdatePut(
      {required UpdateCategoryDto? body}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Categories/Update',
    optionalBody: true,
  )
  Future<chopper.Response<CategoryDto>> _apiCategoriesUpdatePut(
      {@Body() required UpdateCategoryDto? body});

  ///
  ///@param id
  Future<chopper.Response<CategoryDto>> apiCategoriesDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        CategoryDto, () => CategoryDto.fromJsonFactory);

    return _apiCategoriesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Categories/Delete/{id}')
  Future<chopper.Response<CategoryDto>> _apiCategoriesDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<ConversationDto>>> apiConversationsGetAllGet() {
    generatedMapping.putIfAbsent(
        ConversationDto, () => ConversationDto.fromJsonFactory);

    return _apiConversationsGetAllGet();
  }

  ///
  @Get(path: '/api/Conversations/GetAll')
  Future<chopper.Response<List<ConversationDto>>> _apiConversationsGetAllGet();

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param senderId
  ///@param recieverId
  Future<chopper.Response<List<ConversationDto>>> apiConversationsGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? senderId,
    int? recieverId,
  }) {
    generatedMapping.putIfAbsent(
        ConversationDto, () => ConversationDto.fromJsonFactory);

    return _apiConversationsGetListGet(
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        senderId: senderId,
        recieverId: recieverId);
  }

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param senderId
  ///@param recieverId
  @Get(path: '/api/Conversations/GetList')
  Future<chopper.Response<List<ConversationDto>>> _apiConversationsGetListGet({
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('senderId') int? senderId,
    @Query('recieverId') int? recieverId,
  });

  ///
  ///@param peerId
  Future<chopper.Response<ConversationDto>> apiConversationsGetBetweenGet(
      {int? peerId}) {
    generatedMapping.putIfAbsent(
        ConversationDto, () => ConversationDto.fromJsonFactory);

    return _apiConversationsGetBetweenGet(peerId: peerId);
  }

  ///
  ///@param peerId
  @Get(path: '/api/Conversations/GetBetween')
  Future<chopper.Response<ConversationDto>> _apiConversationsGetBetweenGet(
      {@Query('peerId') int? peerId});

  ///
  ///@param id
  Future<chopper.Response<ConversationDto>> apiConversationsGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        ConversationDto, () => ConversationDto.fromJsonFactory);

    return _apiConversationsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Conversations/Get/{id}')
  Future<chopper.Response<ConversationDto>> _apiConversationsGetIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<ConversationDto>> apiConversationsDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        ConversationDto, () => ConversationDto.fromJsonFactory);

    return _apiConversationsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Conversations/Delete/{id}')
  Future<chopper.Response<ConversationDto>> _apiConversationsDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<ManagementEmployeeDto>>>
      apiManagementEmployeesGetAllGet() {
    generatedMapping.putIfAbsent(
        ManagementEmployeeDto, () => ManagementEmployeeDto.fromJsonFactory);

    return _apiManagementEmployeesGetAllGet();
  }

  ///
  @Get(path: '/api/ManagementEmployees/GetAll')
  Future<chopper.Response<List<ManagementEmployeeDto>>>
      _apiManagementEmployeesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  Future<chopper.Response<List<ManagementEmployeeDto>>>
      apiManagementEmployeesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
  }) {
    generatedMapping.putIfAbsent(
        ManagementEmployeeDto, () => ManagementEmployeeDto.fromJsonFactory);

    return _apiManagementEmployeesGetListGet(
        filter: filter, skipCount: skipCount, maxResultCount: maxResultCount);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  @Get(path: '/api/ManagementEmployees/GetList')
  Future<chopper.Response<List<ManagementEmployeeDto>>>
      _apiManagementEmployeesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
  });

  ///
  ///@param id
  Future<chopper.Response<ManagementEmployeeDto>>
      apiManagementEmployeesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(
        ManagementEmployeeDto, () => ManagementEmployeeDto.fromJsonFactory);

    return _apiManagementEmployeesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/ManagementEmployees/Get/{id}')
  Future<chopper.Response<ManagementEmployeeDto>>
      _apiManagementEmployeesGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<ManagementEmployeeAccount>>
      apiManagementEmployeesCreatePost(
          {required CreateManagementEmployeeDto? body}) {
    generatedMapping.putIfAbsent(ManagementEmployeeAccount,
        () => ManagementEmployeeAccount.fromJsonFactory);

    return _apiManagementEmployeesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/ManagementEmployees/Create',
    optionalBody: true,
  )
  Future<chopper.Response<ManagementEmployeeAccount>>
      _apiManagementEmployeesCreatePost(
          {@Body() required CreateManagementEmployeeDto? body});

  ///
  Future<chopper.Response<ManagementEmployeeDto>>
      apiManagementEmployeesUpdatePut(
          {required UpdateManagementEmployeeDto? body}) {
    generatedMapping.putIfAbsent(
        ManagementEmployeeDto, () => ManagementEmployeeDto.fromJsonFactory);

    return _apiManagementEmployeesUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/ManagementEmployees/Update',
    optionalBody: true,
  )
  Future<chopper.Response<ManagementEmployeeDto>>
      _apiManagementEmployeesUpdatePut(
          {@Body() required UpdateManagementEmployeeDto? body});

  ///
  ///@param id
  Future<chopper.Response<ManagementEmployeeDto>>
      apiManagementEmployeesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        ManagementEmployeeDto, () => ManagementEmployeeDto.fromJsonFactory);

    return _apiManagementEmployeesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/ManagementEmployees/Delete/{id}')
  Future<chopper.Response<ManagementEmployeeDto>>
      _apiManagementEmployeesDeleteIdDelete({@Path('id') required int? id});

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param conversationId
  Future<chopper.Response<List<MessageDto>>> apiMessagesGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? conversationId,
  }) {
    generatedMapping.putIfAbsent(MessageDto, () => MessageDto.fromJsonFactory);

    return _apiMessagesGetListGet(
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        conversationId: conversationId);
  }

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param conversationId
  @Get(path: '/api/Messages/GetList')
  Future<chopper.Response<List<MessageDto>>> _apiMessagesGetListGet({
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('conversationId') int? conversationId,
  });

  ///
  ///@param id
  Future<chopper.Response<MessageDto>> apiMessagesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(MessageDto, () => MessageDto.fromJsonFactory);

    return _apiMessagesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Messages/Get/{id}')
  Future<chopper.Response<MessageDto>> _apiMessagesGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<MessageDto>> apiMessagesCreatePost(
      {required CreateMessageDto? body}) {
    generatedMapping.putIfAbsent(MessageDto, () => MessageDto.fromJsonFactory);

    return _apiMessagesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Messages/Create',
    optionalBody: true,
  )
  Future<chopper.Response<MessageDto>> _apiMessagesCreatePost(
      {@Body() required CreateMessageDto? body});

  ///
  Future<chopper.Response<MessageDto>> apiMessagesUpdatePut(
      {required UpdateMessageDto? body}) {
    generatedMapping.putIfAbsent(MessageDto, () => MessageDto.fromJsonFactory);

    return _apiMessagesUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Messages/Update',
    optionalBody: true,
  )
  Future<chopper.Response<MessageDto>> _apiMessagesUpdatePut(
      {@Body() required UpdateMessageDto? body});

  ///
  ///@param id
  Future<chopper.Response<MessageDto>> apiMessagesDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(MessageDto, () => MessageDto.fromJsonFactory);

    return _apiMessagesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Messages/Delete/{id}')
  Future<chopper.Response<MessageDto>> _apiMessagesDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param isRead
  ///@param startDate
  ///@param endDate
  Future<chopper.Response<List<NotificationDto>>> apiNotificationsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    bool? isRead,
    String? startDate,
    String? endDate,
  }) {
    generatedMapping.putIfAbsent(
        NotificationDto, () => NotificationDto.fromJsonFactory);

    return _apiNotificationsGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        isRead: isRead,
        startDate: startDate,
        endDate: endDate);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param isRead
  ///@param startDate
  ///@param endDate
  @Get(path: '/api/Notifications/GetList')
  Future<chopper.Response<List<NotificationDto>>> _apiNotificationsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('isRead') bool? isRead,
    @Query('startDate') String? startDate,
    @Query('endDate') String? endDate,
  });

  ///
  ///@param id
  Future<chopper.Response<NotificationDto>>
      apiNotificationsMarkNotificationAsReadIdPut({required int? id}) {
    generatedMapping.putIfAbsent(
        NotificationDto, () => NotificationDto.fromJsonFactory);

    return _apiNotificationsMarkNotificationAsReadIdPut(id: id);
  }

  ///
  ///@param id
  @Put(
    path: '/api/Notifications/MarkNotificationAsRead/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<NotificationDto>>
      _apiNotificationsMarkNotificationAsReadIdPut(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<OrganizationDto>>> apiOrganizationsGetAllGet() {
    generatedMapping.putIfAbsent(
        OrganizationDto, () => OrganizationDto.fromJsonFactory);

    return _apiOrganizationsGetAllGet();
  }

  ///
  @Get(path: '/api/Organizations/GetAll')
  Future<chopper.Response<List<OrganizationDto>>> _apiOrganizationsGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  Future<chopper.Response<List<OrganizationDto>>> apiOrganizationsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
  }) {
    generatedMapping.putIfAbsent(
        OrganizationDto, () => OrganizationDto.fromJsonFactory);

    return _apiOrganizationsGetListGet(
        filter: filter, skipCount: skipCount, maxResultCount: maxResultCount);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  @Get(path: '/api/Organizations/GetList')
  Future<chopper.Response<List<OrganizationDto>>> _apiOrganizationsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
  });

  ///
  ///@param id
  Future<chopper.Response<OrganizationDto>> apiOrganizationsGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        OrganizationDto, () => OrganizationDto.fromJsonFactory);

    return _apiOrganizationsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Organizations/Get/{id}')
  Future<chopper.Response<OrganizationDto>> _apiOrganizationsGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<OrganizationAccount>> apiOrganizationsCreatePost(
      {required CreateOrganizationDto? body}) {
    generatedMapping.putIfAbsent(
        OrganizationAccount, () => OrganizationAccount.fromJsonFactory);

    return _apiOrganizationsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Organizations/Create',
    optionalBody: true,
  )
  Future<chopper.Response<OrganizationAccount>> _apiOrganizationsCreatePost(
      {@Body() required CreateOrganizationDto? body});

  ///
  Future<chopper.Response<OrganizationDto>> apiOrganizationsUpdatePut(
      {required UpdateOrganizationDto? body}) {
    generatedMapping.putIfAbsent(
        OrganizationDto, () => OrganizationDto.fromJsonFactory);

    return _apiOrganizationsUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Organizations/Update',
    optionalBody: true,
  )
  Future<chopper.Response<OrganizationDto>> _apiOrganizationsUpdatePut(
      {@Body() required UpdateOrganizationDto? body});

  ///
  ///@param id
  Future<chopper.Response<OrganizationDto>> apiOrganizationsDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        OrganizationDto, () => OrganizationDto.fromJsonFactory);

    return _apiOrganizationsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Organizations/Delete/{id}')
  Future<chopper.Response<OrganizationDto>> _apiOrganizationsDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<SavedFileDto>> apiSavedFilesGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        SavedFileDto, () => SavedFileDto.fromJsonFactory);

    return _apiSavedFilesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/SavedFiles/Get/{id}')
  Future<chopper.Response<SavedFileDto>> _apiSavedFilesGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<SkillDto>>> apiSkillsGetAllGet() {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsGetAllGet();
  }

  ///
  @Get(path: '/api/Skills/GetAll')
  Future<chopper.Response<List<SkillDto>>> _apiSkillsGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param studentId
  Future<chopper.Response<List<SkillDto>>> apiSkillsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? studentId,
  }) {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        studentId: studentId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param studentId
  @Get(path: '/api/Skills/GetList')
  Future<chopper.Response<List<SkillDto>>> _apiSkillsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('studentId') int? studentId,
  });

  ///
  ///@param id
  Future<chopper.Response<SkillDto>> apiSkillsGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Skills/Get/{id}')
  Future<chopper.Response<SkillDto>> _apiSkillsGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<SkillDto>> apiSkillsCreatePost(
      {required CreateSkillDto? body}) {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Skills/Create',
    optionalBody: true,
  )
  Future<chopper.Response<SkillDto>> _apiSkillsCreatePost(
      {@Body() required CreateSkillDto? body});

  ///
  Future<chopper.Response<SkillDto>> apiSkillsUpdatePut(
      {required UpdateSkillDto? body}) {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Skills/Update',
    optionalBody: true,
  )
  Future<chopper.Response<SkillDto>> _apiSkillsUpdatePut(
      {@Body() required UpdateSkillDto? body});

  ///
  ///@param id
  Future<chopper.Response<SkillDto>> apiSkillsDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(SkillDto, () => SkillDto.fromJsonFactory);

    return _apiSkillsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Skills/Delete/{id}')
  Future<chopper.Response<SkillDto>> _apiSkillsDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<StudentApplicationDto>>>
      apiStudentApplicationsGetAllGet() {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsGetAllGet();
  }

  ///
  @Get(path: '/api/StudentApplications/GetAll')
  Future<chopper.Response<List<StudentApplicationDto>>>
      _apiStudentApplicationsGetAllGet();

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param studentId
  ///@param volunteerOpportunityId
  ///@param organizationId
  Future<chopper.Response<List<StudentApplicationDto>>>
      apiStudentApplicationsGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? studentId,
    int? volunteerOpportunityId,
    int? organizationId,
  }) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsGetListGet(
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        studentId: studentId,
        volunteerOpportunityId: volunteerOpportunityId,
        organizationId: organizationId);
  }

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param studentId
  ///@param volunteerOpportunityId
  ///@param organizationId
  @Get(path: '/api/StudentApplications/GetList')
  Future<chopper.Response<List<StudentApplicationDto>>>
      _apiStudentApplicationsGetListGet({
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('studentId') int? studentId,
    @Query('volunteerOpportunityId') int? volunteerOpportunityId,
    @Query('organizationId') int? organizationId,
  });

  ///
  ///@param id
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/StudentApplications/Get/{id}')
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsGetIdGet({@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsOrganizationAcceptApplicationIdPut(
          {required int? id}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsOrganizationAcceptApplicationIdPut(id: id);
  }

  ///
  ///@param id
  @Put(
    path: '/api/StudentApplications/OrganizationAcceptApplication/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsOrganizationAcceptApplicationIdPut(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsOrganizationRejectApplicationPut(
          {required RejectStudentApplication? body}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsOrganizationRejectApplicationPut(body: body);
  }

  ///
  @Put(
    path: '/api/StudentApplications/OrganizationRejectApplication',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsOrganizationRejectApplicationPut(
          {@Body() required RejectStudentApplication? body});

  ///
  ///@param id
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsManagementAcceptApplicationIdPut(
          {required int? id}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsManagementAcceptApplicationIdPut(id: id);
  }

  ///
  ///@param id
  @Put(
    path: '/api/StudentApplications/ManagementAcceptApplication/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsManagementAcceptApplicationIdPut(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsManagementRejectApplicationPut(
          {required RejectStudentApplication? body}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsManagementRejectApplicationPut(body: body);
  }

  ///
  @Put(
    path: '/api/StudentApplications/ManagementRejectApplication',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsManagementRejectApplicationPut(
          {@Body() required RejectStudentApplication? body});

  ///
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsCreatePost(
          {required CreateStudentApplicationDto? body}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/StudentApplications/Create',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsCreatePost(
          {@Body() required CreateStudentApplicationDto? body});

  ///
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsUpdatePut(
          {required UpdateStudentApplicationDto? body}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/StudentApplications/Update',
    optionalBody: true,
  )
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsUpdatePut(
          {@Body() required UpdateStudentApplicationDto? body});

  ///
  ///@param id
  Future<chopper.Response<StudentApplicationDto>>
      apiStudentApplicationsDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        StudentApplicationDto, () => StudentApplicationDto.fromJsonFactory);

    return _apiStudentApplicationsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/StudentApplications/Delete/{id}')
  Future<chopper.Response<StudentApplicationDto>>
      _apiStudentApplicationsDeleteIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<StudentDto>>> apiStudentsGetAllGet() {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsGetAllGet();
  }

  ///
  @Get(path: '/api/Students/GetAll')
  Future<chopper.Response<List<StudentDto>>> _apiStudentsGetAllGet();

  ///
  ///@param filter
  ///@param isNotVolunteer
  ///@param skipCount
  ///@param maxResultCount
  Future<chopper.Response<List<StudentDto>>> apiStudentsGetListGet({
    String? filter,
    bool? isNotVolunteer,
    int? skipCount,
    int? maxResultCount,
  }) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsGetListGet(
        filter: filter,
        isNotVolunteer: isNotVolunteer,
        skipCount: skipCount,
        maxResultCount: maxResultCount);
  }

  ///
  ///@param filter
  ///@param isNotVolunteer
  ///@param skipCount
  ///@param maxResultCount
  @Get(path: '/api/Students/GetList')
  Future<chopper.Response<List<StudentDto>>> _apiStudentsGetListGet({
    @Query('filter') String? filter,
    @Query('isNotVolunteer') bool? isNotVolunteer,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
  });

  ///
  ///@param id
  Future<chopper.Response<StudentDto>> apiStudentsGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/Students/Get/{id}')
  Future<chopper.Response<StudentDto>> _apiStudentsGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<StudentAccount>> apiStudentsCreatePost(
      {required CreateStudentDto? body}) {
    generatedMapping.putIfAbsent(
        StudentAccount, () => StudentAccount.fromJsonFactory);

    return _apiStudentsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/Students/Create',
    optionalBody: true,
  )
  Future<chopper.Response<StudentAccount>> _apiStudentsCreatePost(
      {@Body() required CreateStudentDto? body});

  ///
  Future<chopper.Response<StudentDto>> apiStudentsUpdatePut(
      {required UpdateStudentDto? body}) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/Students/Update',
    optionalBody: true,
  )
  Future<chopper.Response<StudentDto>> _apiStudentsUpdatePut(
      {@Body() required UpdateStudentDto? body});

  ///
  Future<chopper.Response<StudentDto>> apiStudentsUpdateByManagementPut(
      {required UpdateStudentByManagementDto? body}) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsUpdateByManagementPut(body: body);
  }

  ///
  @Put(
    path: '/api/Students/UpdateByManagement',
    optionalBody: true,
  )
  Future<chopper.Response<StudentDto>> _apiStudentsUpdateByManagementPut(
      {@Body() required UpdateStudentByManagementDto? body});

  ///
  Future<chopper.Response<StudentDto>> apiStudentsUpdateSkillsPut(
      {required UpdateStudentSkills? body}) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsUpdateSkillsPut(body: body);
  }

  ///
  @Put(
    path: '/api/Students/UpdateSkills',
    optionalBody: true,
  )
  Future<chopper.Response<StudentDto>> _apiStudentsUpdateSkillsPut(
      {@Body() required UpdateStudentSkills? body});

  ///
  ///@param id
  Future<chopper.Response<StudentDto>> apiStudentsDeleteIdDelete(
      {required int? id}) {
    generatedMapping.putIfAbsent(StudentDto, () => StudentDto.fromJsonFactory);

    return _apiStudentsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Students/Delete/{id}')
  Future<chopper.Response<StudentDto>> _apiStudentsDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<TempFileDto>> apiTempFilesUploadOneFilePost() {
    generatedMapping.putIfAbsent(
        TempFileDto, () => TempFileDto.fromJsonFactory);

    return _apiTempFilesUploadOneFilePost();
  }

  ///
  @Post(
    path: '/api/TempFiles/UploadOneFile',
    optionalBody: true,
  )
  Future<chopper.Response<TempFileDto>> _apiTempFilesUploadOneFilePost();

  ///
  Future<chopper.Response<List<TempFileDto>>> apiTempFilesUploadFilesPost() {
    generatedMapping.putIfAbsent(
        TempFileDto, () => TempFileDto.fromJsonFactory);

    return _apiTempFilesUploadFilesPost();
  }

  ///
  @Post(
    path: '/api/TempFiles/UploadFiles',
    optionalBody: true,
  )
  Future<chopper.Response<List<TempFileDto>>> _apiTempFilesUploadFilesPost();

  ///
  Future<chopper.Response<List<VolunteerOpportunityDto>>>
      apiVolunteerOpportunitiesGetAllGet() {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerOpportunities/GetAll')
  Future<chopper.Response<List<VolunteerOpportunityDto>>>
      _apiVolunteerOpportunitiesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param organizationId
  Future<chopper.Response<List<VolunteerOpportunityDto>>>
      apiVolunteerOpportunitiesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? organizationId,
  }) {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        organizationId: organizationId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param organizationId
  @Get(path: '/api/VolunteerOpportunities/GetList')
  Future<chopper.Response<List<VolunteerOpportunityDto>>>
      _apiVolunteerOpportunitiesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('organizationId') int? organizationId,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerOpportunityDto>>
      apiVolunteerOpportunitiesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerOpportunities/Get/{id}')
  Future<chopper.Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerOpportunityDto>>
      apiVolunteerOpportunitiesCreatePost(
          {required CreateVolunteerOpportunityDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerOpportunities/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesCreatePost(
          {@Body() required CreateVolunteerOpportunityDto? body});

  ///
  Future<chopper.Response<VolunteerOpportunityDto>>
      apiVolunteerOpportunitiesUpdatePut(
          {required UpdateVolunteerOpportunityDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesUpdatePut(body: body);
  }

  ///
  @Put(
    path: '/api/VolunteerOpportunities/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesUpdatePut(
          {@Body() required UpdateVolunteerOpportunityDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerOpportunityDto>>
      apiVolunteerOpportunitiesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerOpportunityDto, () => VolunteerOpportunityDto.fromJsonFactory);

    return _apiVolunteerOpportunitiesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerOpportunities/Delete/{id}')
  Future<chopper.Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesDeleteIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerProgramActivityDto>>>
      apiVolunteerProgramActivitiesGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerProgramActivities/GetAll')
  Future<chopper.Response<List<VolunteerProgramActivityDto>>>
      _apiVolunteerProgramActivitiesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  Future<chopper.Response<List<VolunteerProgramActivityDto>>>
      apiVolunteerProgramActivitiesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
  }) {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerProgramId: volunteerProgramId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  @Get(path: '/api/VolunteerProgramActivities/GetList')
  Future<chopper.Response<List<VolunteerProgramActivityDto>>>
      _apiVolunteerProgramActivitiesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerProgramId') int? volunteerProgramId,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramActivityDto>>
      apiVolunteerProgramActivitiesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerProgramActivities/Get/{id}')
  Future<chopper.Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerProgramActivityDto>>
      apiVolunteerProgramActivitiesCreatePost(
          {required CreateVolunteerProgramActivityDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramActivities/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesCreatePost(
          {@Body() required CreateVolunteerProgramActivityDto? body});

  ///
  Future<chopper.Response<VolunteerProgramActivityDto>>
      apiVolunteerProgramActivitiesUpdatePost(
          {required UpdateVolunteerProgramActivityDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramActivities/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesUpdatePost(
          {@Body() required UpdateVolunteerProgramActivityDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramActivityDto>>
      apiVolunteerProgramActivitiesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramActivityDto,
        () => VolunteerProgramActivityDto.fromJsonFactory);

    return _apiVolunteerProgramActivitiesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerProgramActivities/Delete/{id}')
  Future<chopper.Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesDeleteIdDelete(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerProgramGalleryPhotoDto>>>
      apiVolunteerProgramGalleryPhotosGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerProgramGalleryPhotos/GetAll')
  Future<chopper.Response<List<VolunteerProgramGalleryPhotoDto>>>
      _apiVolunteerProgramGalleryPhotosGetAllGet();

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param isApproved
  Future<chopper.Response<List<VolunteerProgramGalleryPhotoDto>>>
      apiVolunteerProgramGalleryPhotosGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    bool? isApproved,
  }) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosGetListGet(
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerProgramId: volunteerProgramId,
        isApproved: isApproved);
  }

  ///
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param isApproved
  @Get(path: '/api/VolunteerProgramGalleryPhotos/GetList')
  Future<chopper.Response<List<VolunteerProgramGalleryPhotoDto>>>
      _apiVolunteerProgramGalleryPhotosGetListGet({
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerProgramId') int? volunteerProgramId,
    @Query('isApproved') bool? isApproved,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerProgramGalleryPhotos/Get/{id}')
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosCreatePost(
          {required CreateGalleryPhotoDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramGalleryPhotos/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosCreatePost(
          {@Body() required CreateGalleryPhotoDto? body});

  ///
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosCreateByStudentPost(
          {required CreateGalleryPhotoByStudentDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosCreateByStudentPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramGalleryPhotos/CreateByStudent',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosCreateByStudentPost(
          {@Body() required CreateGalleryPhotoByStudentDto? body});

  ///
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosUpdatePost(
          {required UpdateGalleryPhotoDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramGalleryPhotos/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosUpdatePost(
          {@Body() required UpdateGalleryPhotoDto? body});

  ///
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosUpdateByStudentPost(
          {required UpdateGalleryPhotoByStudentDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosUpdateByStudentPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramGalleryPhotos/UpdateByStudent',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosUpdateByStudentPost(
          {@Body() required UpdateGalleryPhotoByStudentDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      apiVolunteerProgramGalleryPhotosDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramGalleryPhotoDto,
        () => VolunteerProgramGalleryPhotoDto.fromJsonFactory);

    return _apiVolunteerProgramGalleryPhotosDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerProgramGalleryPhotos/Delete/{id}')
  Future<chopper.Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosDeleteIdDelete(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerProgramDto>>>
      apiVolunteerProgramsGetAllGet() {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerPrograms/GetAll')
  Future<chopper.Response<List<VolunteerProgramDto>>>
      _apiVolunteerProgramsGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param organizationId
  ///@param isInternalProgram
  Future<chopper.Response<List<VolunteerProgramDto>>>
      apiVolunteerProgramsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? organizationId,
    bool? isInternalProgram,
  }) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        organizationId: organizationId,
        isInternalProgram: isInternalProgram);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param organizationId
  ///@param isInternalProgram
  @Get(path: '/api/VolunteerPrograms/GetList')
  Future<chopper.Response<List<VolunteerProgramDto>>>
      _apiVolunteerProgramsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('organizationId') int? organizationId,
    @Query('isInternalProgram') bool? isInternalProgram,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramDto>> apiVolunteerProgramsGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerPrograms/Get/{id}')
  Future<chopper.Response<VolunteerProgramDto>> _apiVolunteerProgramsGetIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerProgramDto>>
      apiVolunteerProgramsCreateOrganizationProgramPost(
          {required CreateVolunteerProgramDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsCreateOrganizationProgramPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerPrograms/CreateOrganizationProgram',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramDto>>
      _apiVolunteerProgramsCreateOrganizationProgramPost(
          {@Body() required CreateVolunteerProgramDto? body});

  ///
  Future<chopper.Response<VolunteerProgramDto>>
      apiVolunteerProgramsCreateInternalProgramPost(
          {required CreateInternalVolunteerProgramDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsCreateInternalProgramPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerPrograms/CreateInternalProgram',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramDto>>
      _apiVolunteerProgramsCreateInternalProgramPost(
          {@Body() required CreateInternalVolunteerProgramDto? body});

  ///
  Future<chopper.Response<VolunteerProgramDto>>
      apiVolunteerProgramsUpdateOrganizationProgramPut(
          {required UpdateVolunteerProgramDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsUpdateOrganizationProgramPut(body: body);
  }

  ///
  @Put(
    path: '/api/VolunteerPrograms/UpdateOrganizationProgram',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramDto>>
      _apiVolunteerProgramsUpdateOrganizationProgramPut(
          {@Body() required UpdateVolunteerProgramDto? body});

  ///
  Future<chopper.Response<VolunteerProgramDto>>
      apiVolunteerProgramsUpdateInternalProgramPut(
          {required UpdateInternalVolunteerProgramDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsUpdateInternalProgramPut(body: body);
  }

  ///
  @Put(
    path: '/api/VolunteerPrograms/UpdateInternalProgram',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramDto>>
      _apiVolunteerProgramsUpdateInternalProgramPut(
          {@Body() required UpdateInternalVolunteerProgramDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramDto>>
      apiVolunteerProgramsDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramDto, () => VolunteerProgramDto.fromJsonFactory);

    return _apiVolunteerProgramsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerPrograms/Delete/{id}')
  Future<chopper.Response<VolunteerProgramDto>>
      _apiVolunteerProgramsDeleteIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerProgramTaskDto>>>
      apiVolunteerProgramTasksGetAllGet() {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerProgramTasks/GetAll')
  Future<chopper.Response<List<VolunteerProgramTaskDto>>>
      _apiVolunteerProgramTasksGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  Future<chopper.Response<List<VolunteerProgramTaskDto>>>
      apiVolunteerProgramTasksGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
  }) {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerProgramId: volunteerProgramId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  @Get(path: '/api/VolunteerProgramTasks/GetList')
  Future<chopper.Response<List<VolunteerProgramTaskDto>>>
      _apiVolunteerProgramTasksGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerProgramId') int? volunteerProgramId,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramTaskDto>>
      apiVolunteerProgramTasksGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerProgramTasks/Get/{id}')
  Future<chopper.Response<VolunteerProgramTaskDto>>
      _apiVolunteerProgramTasksGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerProgramTaskDto>>
      apiVolunteerProgramTasksCreatePost(
          {required CreateVolunteerProgramTaskDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramTasks/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramTaskDto>>
      _apiVolunteerProgramTasksCreatePost(
          {@Body() required CreateVolunteerProgramTaskDto? body});

  ///
  Future<chopper.Response<VolunteerProgramTaskDto>>
      apiVolunteerProgramTasksUpdatePost(
          {required UpdateVolunteerProgramTaskDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramTasks/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramTaskDto>>
      _apiVolunteerProgramTasksUpdatePost(
          {@Body() required UpdateVolunteerProgramTaskDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramTaskDto>>
      apiVolunteerProgramTasksDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerProgramTaskDto, () => VolunteerProgramTaskDto.fromJsonFactory);

    return _apiVolunteerProgramTasksDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerProgramTasks/Delete/{id}')
  Future<chopper.Response<VolunteerProgramTaskDto>>
      _apiVolunteerProgramTasksDeleteIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerProgramWorkDayDto>>>
      apiVolunteerProgramWorkDaysGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerProgramWorkDays/GetAll')
  Future<chopper.Response<List<VolunteerProgramWorkDayDto>>>
      _apiVolunteerProgramWorkDaysGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param startDate
  ///@param endDate
  Future<chopper.Response<List<VolunteerProgramWorkDayDto>>>
      apiVolunteerProgramWorkDaysGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    String? startDate,
    String? endDate,
  }) {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerProgramId: volunteerProgramId,
        startDate: startDate,
        endDate: endDate);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param startDate
  ///@param endDate
  @Get(path: '/api/VolunteerProgramWorkDays/GetList')
  Future<chopper.Response<List<VolunteerProgramWorkDayDto>>>
      _apiVolunteerProgramWorkDaysGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerProgramId') int? volunteerProgramId,
    @Query('startDate') String? startDate,
    @Query('endDate') String? endDate,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      apiVolunteerProgramWorkDaysGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerProgramWorkDays/Get/{id}')
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysGetIdGet({@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      apiVolunteerProgramWorkDaysCreatePost(
          {required CreateVolunteerProgramWorkDayDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramWorkDays/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysCreatePost(
          {@Body() required CreateVolunteerProgramWorkDayDto? body});

  ///
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      apiVolunteerProgramWorkDaysUpdatePost(
          {required UpdateVolunteerProgramWorkDayDto? body}) {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerProgramWorkDays/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysUpdatePost(
          {@Body() required UpdateVolunteerProgramWorkDayDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      apiVolunteerProgramWorkDaysDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerProgramWorkDayDto,
        () => VolunteerProgramWorkDayDto.fromJsonFactory);

    return _apiVolunteerProgramWorkDaysDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerProgramWorkDays/Delete/{id}')
  Future<chopper.Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysDeleteIdDelete(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerStudentActivityAttendanceDto>>>
      apiVolunteerStudentActivityAttendancesGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerStudentActivityAttendances/GetAll')
  Future<chopper.Response<List<VolunteerStudentActivityAttendanceDto>>>
      _apiVolunteerStudentActivityAttendancesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param activityId
  ///@param isAttended
  Future<chopper.Response<List<VolunteerStudentActivityAttendanceDto>>>
      apiVolunteerStudentActivityAttendancesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? activityId,
    bool? isAttended,
  }) {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerStudentId: volunteerStudentId,
        activityId: activityId,
        isAttended: isAttended);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param activityId
  ///@param isAttended
  @Get(path: '/api/VolunteerStudentActivityAttendances/GetList')
  Future<chopper.Response<List<VolunteerStudentActivityAttendanceDto>>>
      _apiVolunteerStudentActivityAttendancesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerStudentId') int? volunteerStudentId,
    @Query('activityId') int? activityId,
    @Query('isAttended') bool? isAttended,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      apiVolunteerStudentActivityAttendancesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerStudentActivityAttendances/Get/{id}')
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesGetIdGet(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      apiVolunteerStudentActivityAttendancesCreatePost(
          {required CreateVolunteerStudentActivityAttendanceDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentActivityAttendances/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesCreatePost(
          {@Body() required CreateVolunteerStudentActivityAttendanceDto? body});

  ///
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      apiVolunteerStudentActivityAttendancesUpdatePost(
          {required UpdateVolunteerStudentActivityAttendanceDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentActivityAttendances/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesUpdatePost(
          {@Body() required UpdateVolunteerStudentActivityAttendanceDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      apiVolunteerStudentActivityAttendancesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentActivityAttendanceDto,
        () => VolunteerStudentActivityAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentActivityAttendancesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerStudentActivityAttendances/Delete/{id}')
  Future<chopper.Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesDeleteIdDelete(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerStudentDto>>>
      apiVolunteerStudentsGetAllGet() {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerStudents/GetAll')
  Future<chopper.Response<List<VolunteerStudentDto>>>
      _apiVolunteerStudentsGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param organizationId
  Future<chopper.Response<List<VolunteerStudentDto>>>
      apiVolunteerStudentsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    int? organizationId,
  }) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerProgramId: volunteerProgramId,
        organizationId: organizationId);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerProgramId
  ///@param organizationId
  @Get(path: '/api/VolunteerStudents/GetList')
  Future<chopper.Response<List<VolunteerStudentDto>>>
      _apiVolunteerStudentsGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerProgramId') int? volunteerProgramId,
    @Query('organizationId') int? organizationId,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentDto>> apiVolunteerStudentsGetIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerStudents/Get/{id}')
  Future<chopper.Response<VolunteerStudentDto>> _apiVolunteerStudentsGetIdGet(
      {@Path('id') required int? id});

  ///
  ///@param studentId
  Future<chopper.Response<VolunteerStudentDto>>
      apiVolunteerStudentsGetOfStudentByIdStudentIdGet(
          {required int? studentId}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsGetOfStudentByIdStudentIdGet(
        studentId: studentId);
  }

  ///
  ///@param studentId
  @Get(path: '/api/VolunteerStudents/GetOfStudentById/{studentId}')
  Future<chopper.Response<VolunteerStudentDto>>
      _apiVolunteerStudentsGetOfStudentByIdStudentIdGet(
          {@Path('studentId') required int? studentId});

  ///
  Future<chopper.Response<VolunteerStudentDto>> apiVolunteerStudentsCreatePost(
      {required CreateVolunteerStudentDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudents/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentDto>> _apiVolunteerStudentsCreatePost(
      {@Body() required CreateVolunteerStudentDto? body});

  ///
  Future<chopper.Response<VolunteerStudentDto>>
      apiVolunteerStudentsUpdateOrganizationAssessmentPost(
          {required UpdateVolunteerStudentOrgAssessmentDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsUpdateOrganizationAssessmentPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudents/UpdateOrganizationAssessment',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentDto>>
      _apiVolunteerStudentsUpdateOrganizationAssessmentPost(
          {@Body() required UpdateVolunteerStudentOrgAssessmentDto? body});

  ///
  Future<chopper.Response<VolunteerStudentDto>>
      apiVolunteerStudentsUpdateManagementFinalEvaluationPost(
          {required UpdateVolunteerStudentFinalEvaluationDto? body}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsUpdateManagementFinalEvaluationPost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudents/UpdateManagementFinalEvaluation',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentDto>>
      _apiVolunteerStudentsUpdateManagementFinalEvaluationPost(
          {@Body() required UpdateVolunteerStudentFinalEvaluationDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentDto>>
      apiVolunteerStudentsDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(
        VolunteerStudentDto, () => VolunteerStudentDto.fromJsonFactory);

    return _apiVolunteerStudentsDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerStudents/Delete/{id}')
  Future<chopper.Response<VolunteerStudentDto>>
      _apiVolunteerStudentsDeleteIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerStudentTaskAccomplishDto>>>
      apiVolunteerStudentTaskAccomplishesGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerStudentTaskAccomplishes/GetAll')
  Future<chopper.Response<List<VolunteerStudentTaskAccomplishDto>>>
      _apiVolunteerStudentTaskAccomplishesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param taskId
  ///@param isAccomplished
  Future<chopper.Response<List<VolunteerStudentTaskAccomplishDto>>>
      apiVolunteerStudentTaskAccomplishesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? taskId,
    bool? isAccomplished,
  }) {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerStudentId: volunteerStudentId,
        taskId: taskId,
        isAccomplished: isAccomplished);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param taskId
  ///@param isAccomplished
  @Get(path: '/api/VolunteerStudentTaskAccomplishes/GetList')
  Future<chopper.Response<List<VolunteerStudentTaskAccomplishDto>>>
      _apiVolunteerStudentTaskAccomplishesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerStudentId') int? volunteerStudentId,
    @Query('taskId') int? taskId,
    @Query('isAccomplished') bool? isAccomplished,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      apiVolunteerStudentTaskAccomplishesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerStudentTaskAccomplishes/Get/{id}')
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesGetIdGet(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      apiVolunteerStudentTaskAccomplishesCreatePost(
          {required CreateVolunteerStudentTaskAccomplishDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentTaskAccomplishes/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesCreatePost(
          {@Body() required CreateVolunteerStudentTaskAccomplishDto? body});

  ///
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      apiVolunteerStudentTaskAccomplishesUpdatePost(
          {required UpdateVolunteerStudentTaskAccomplishDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentTaskAccomplishes/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesUpdatePost(
          {@Body() required UpdateVolunteerStudentTaskAccomplishDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      apiVolunteerStudentTaskAccomplishesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentTaskAccomplishDto,
        () => VolunteerStudentTaskAccomplishDto.fromJsonFactory);

    return _apiVolunteerStudentTaskAccomplishesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerStudentTaskAccomplishes/Delete/{id}')
  Future<chopper.Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesDeleteIdDelete(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<VolunteerStudentWorkAttendanceDto>>>
      apiVolunteerStudentWorkAttendancesGetAllGet() {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesGetAllGet();
  }

  ///
  @Get(path: '/api/VolunteerStudentWorkAttendances/GetAll')
  Future<chopper.Response<List<VolunteerStudentWorkAttendanceDto>>>
      _apiVolunteerStudentWorkAttendancesGetAllGet();

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param workDayId
  ///@param isAttended
  Future<chopper.Response<List<VolunteerStudentWorkAttendanceDto>>>
      apiVolunteerStudentWorkAttendancesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? workDayId,
    bool? isAttended,
  }) {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesGetListGet(
        filter: filter,
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        volunteerStudentId: volunteerStudentId,
        workDayId: workDayId,
        isAttended: isAttended);
  }

  ///
  ///@param filter
  ///@param skipCount
  ///@param maxResultCount
  ///@param volunteerStudentId
  ///@param workDayId
  ///@param isAttended
  @Get(path: '/api/VolunteerStudentWorkAttendances/GetList')
  Future<chopper.Response<List<VolunteerStudentWorkAttendanceDto>>>
      _apiVolunteerStudentWorkAttendancesGetListGet({
    @Query('filter') String? filter,
    @Query('skipCount') int? skipCount,
    @Query('maxResultCount') int? maxResultCount,
    @Query('volunteerStudentId') int? volunteerStudentId,
    @Query('workDayId') int? workDayId,
    @Query('isAttended') bool? isAttended,
  });

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      apiVolunteerStudentWorkAttendancesGetIdGet({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesGetIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/VolunteerStudentWorkAttendances/Get/{id}')
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesGetIdGet(
          {@Path('id') required int? id});

  ///
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      apiVolunteerStudentWorkAttendancesCreatePost(
          {required CreateVolunteerStudentWorkAttendanceDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesCreatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentWorkAttendances/Create',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesCreatePost(
          {@Body() required CreateVolunteerStudentWorkAttendanceDto? body});

  ///
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      apiVolunteerStudentWorkAttendancesUpdatePost(
          {required UpdateVolunteerStudentWorkAttendanceDto? body}) {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesUpdatePost(body: body);
  }

  ///
  @Post(
    path: '/api/VolunteerStudentWorkAttendances/Update',
    optionalBody: true,
  )
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesUpdatePost(
          {@Body() required UpdateVolunteerStudentWorkAttendanceDto? body});

  ///
  ///@param id
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      apiVolunteerStudentWorkAttendancesDeleteIdDelete({required int? id}) {
    generatedMapping.putIfAbsent(VolunteerStudentWorkAttendanceDto,
        () => VolunteerStudentWorkAttendanceDto.fromJsonFactory);

    return _apiVolunteerStudentWorkAttendancesDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/VolunteerStudentWorkAttendances/Delete/{id}')
  Future<chopper.Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesDeleteIdDelete(
          {@Path('id') required int? id});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
