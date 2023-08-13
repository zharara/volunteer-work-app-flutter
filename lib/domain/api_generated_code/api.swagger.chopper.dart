// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Api;

  @override
  Future<Response<List<AnnouncementDto>>> _apiAnnouncementsGetAllGet() {
    final Uri $url = Uri.parse('/api/Announcements/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AnnouncementDto>, AnnouncementDto>($request);
  }

  @override
  Future<Response<List<AnnouncementDto>>> _apiAnnouncementsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    bool? isManagementAnnouncment,
    bool? isOrganizationAnnouncment,
    int? organizationId,
    int? volunteerProgramId,
  }) {
    final Uri $url = Uri.parse('/api/Announcements/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'isManagementAnnouncment': isManagementAnnouncment,
      'isOrganizationAnnouncment': isOrganizationAnnouncment,
      'organizationId': organizationId,
      'volunteerProgramId': volunteerProgramId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<AnnouncementDto>, AnnouncementDto>($request);
  }

  @override
  Future<Response<AnnouncementDto>> _apiAnnouncementsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Announcements/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AnnouncementDto, AnnouncementDto>($request);
  }

  @override
  Future<Response<AnnouncementDto>> _apiAnnouncementsCreatePost(
      {required CreateAnnouncementDto? body}) {
    final Uri $url = Uri.parse('/api/Announcements/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AnnouncementDto, AnnouncementDto>($request);
  }

  @override
  Future<Response<AnnouncementDto>> _apiAnnouncementsUpdatePut(
      {required UpdateAnnouncementDto? body}) {
    final Uri $url = Uri.parse('/api/Announcements/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AnnouncementDto, AnnouncementDto>($request);
  }

  @override
  Future<Response<AnnouncementDto>> _apiAnnouncementsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Announcements/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<AnnouncementDto, AnnouncementDto>($request);
  }

  @override
  Future<Response<ManagementEmployeeAccount>> _apiAuthLoginManagementPost(
      {required AuthenticateRequest? body}) {
    final Uri $url = Uri.parse('/api/Auth/LoginManagement');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ManagementEmployeeAccount, ManagementEmployeeAccount>($request);
  }

  @override
  Future<Response<OrganizationAccount>> _apiAuthLoginOrganizationPost(
      {required AuthenticateRequest? body}) {
    final Uri $url = Uri.parse('/api/Auth/LoginOrganization');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<OrganizationAccount, OrganizationAccount>($request);
  }

  @override
  Future<Response<StudentAccount>> _apiAuthLoginStudentPost(
      {required AuthenticateRequest? body}) {
    final Uri $url = Uri.parse('/api/Auth/LoginStudent');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentAccount, StudentAccount>($request);
  }

  @override
  Future<Response<AuthToken>> _apiAuthChangePasswordPost({
    String? currentUserPassword,
    String? newUserPassword,
  }) {
    final Uri $url = Uri.parse('/api/Auth/ChangePassword');
    final Map<String, dynamic> $params = <String, dynamic>{
      'currentUserPassword': currentUserPassword,
      'newUserPassword': newUserPassword,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<AuthToken, AuthToken>($request);
  }

  @override
  Future<Response<ApplicationUser>>
      _apiAuthResetStudentPasswordByManagementPost({
    int? studentId,
    String? newPassword,
  }) {
    final Uri $url = Uri.parse('/api/Auth/ResetStudentPasswordByManagement');
    final Map<String, dynamic> $params = <String, dynamic>{
      'studentId': studentId,
      'newPassword': newPassword,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApplicationUser, ApplicationUser>($request);
  }

  @override
  Future<Response<List<CategoryDto>>> _apiCategoriesGetAllGet() {
    final Uri $url = Uri.parse('/api/Categories/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryDto>, CategoryDto>($request);
  }

  @override
  Future<Response<List<CategoryDto>>> _apiCategoriesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? conversationId,
  }) {
    final Uri $url = Uri.parse('/api/Categories/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'conversationId': conversationId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<CategoryDto>, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiCategoriesGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/Categories/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiCategoriesCreatePost(
      {required CreateCategoryDto? body}) {
    final Uri $url = Uri.parse('/api/Categories/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiCategoriesUpdatePut(
      {required UpdateCategoryDto? body}) {
    final Uri $url = Uri.parse('/api/Categories/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<CategoryDto>> _apiCategoriesDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Categories/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDto, CategoryDto>($request);
  }

  @override
  Future<Response<List<ConversationDto>>> _apiConversationsGetAllGet() {
    final Uri $url = Uri.parse('/api/Conversations/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ConversationDto>, ConversationDto>($request);
  }

  @override
  Future<Response<List<ConversationDto>>> _apiConversationsGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? senderId,
    int? recieverId,
  }) {
    final Uri $url = Uri.parse('/api/Conversations/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'senderId': senderId,
      'recieverId': recieverId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<ConversationDto>, ConversationDto>($request);
  }

  @override
  Future<Response<ConversationDto>> _apiConversationsGetBetweenGet(
      {int? peerId}) {
    final Uri $url = Uri.parse('/api/Conversations/GetBetween');
    final Map<String, dynamic> $params = <String, dynamic>{'peerId': peerId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ConversationDto, ConversationDto>($request);
  }

  @override
  Future<Response<ConversationDto>> _apiConversationsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Conversations/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ConversationDto, ConversationDto>($request);
  }

  @override
  Future<Response<ConversationDto>> _apiConversationsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Conversations/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ConversationDto, ConversationDto>($request);
  }

  @override
  Future<Response<List<ManagementEmployeeDto>>>
      _apiManagementEmployeesGetAllGet() {
    final Uri $url = Uri.parse('/api/ManagementEmployees/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ManagementEmployeeDto>, ManagementEmployeeDto>($request);
  }

  @override
  Future<Response<List<ManagementEmployeeDto>>>
      _apiManagementEmployeesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
  }) {
    final Uri $url = Uri.parse('/api/ManagementEmployees/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<ManagementEmployeeDto>, ManagementEmployeeDto>($request);
  }

  @override
  Future<Response<ManagementEmployeeDto>> _apiManagementEmployeesGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/ManagementEmployees/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ManagementEmployeeDto, ManagementEmployeeDto>($request);
  }

  @override
  Future<Response<ManagementEmployeeAccount>> _apiManagementEmployeesCreatePost(
      {required CreateManagementEmployeeDto? body}) {
    final Uri $url = Uri.parse('/api/ManagementEmployees/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ManagementEmployeeAccount, ManagementEmployeeAccount>($request);
  }

  @override
  Future<Response<ManagementEmployeeDto>> _apiManagementEmployeesUpdatePut(
      {required UpdateManagementEmployeeDto? body}) {
    final Uri $url = Uri.parse('/api/ManagementEmployees/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ManagementEmployeeDto, ManagementEmployeeDto>($request);
  }

  @override
  Future<Response<ManagementEmployeeDto>> _apiManagementEmployeesDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/ManagementEmployees/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ManagementEmployeeDto, ManagementEmployeeDto>($request);
  }

  @override
  Future<Response<List<MessageDto>>> _apiMessagesGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? conversationId,
  }) {
    final Uri $url = Uri.parse('/api/Messages/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'conversationId': conversationId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<MessageDto>, MessageDto>($request);
  }

  @override
  Future<Response<MessageDto>> _apiMessagesGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/Messages/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MessageDto, MessageDto>($request);
  }

  @override
  Future<Response<MessageDto>> _apiMessagesCreatePost(
      {required CreateMessageDto? body}) {
    final Uri $url = Uri.parse('/api/Messages/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MessageDto, MessageDto>($request);
  }

  @override
  Future<Response<MessageDto>> _apiMessagesUpdatePut(
      {required UpdateMessageDto? body}) {
    final Uri $url = Uri.parse('/api/Messages/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MessageDto, MessageDto>($request);
  }

  @override
  Future<Response<MessageDto>> _apiMessagesDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/Messages/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<MessageDto, MessageDto>($request);
  }

  @override
  Future<Response<List<NotificationDto>>> _apiNotificationsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    bool? isRead,
    String? startDate,
    String? endDate,
  }) {
    final Uri $url = Uri.parse('/api/Notifications/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'isRead': isRead,
      'startDate': startDate,
      'endDate': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<NotificationDto>, NotificationDto>($request);
  }

  @override
  Future<Response<NotificationDto>>
      _apiNotificationsMarkNotificationAsReadIdPut({required int? id}) {
    final Uri $url =
        Uri.parse('/api/Notifications/MarkNotificationAsRead/${id}');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<NotificationDto, NotificationDto>($request);
  }

  @override
  Future<Response<List<OrganizationDto>>> _apiOrganizationsGetAllGet() {
    final Uri $url = Uri.parse('/api/Organizations/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<OrganizationDto>, OrganizationDto>($request);
  }

  @override
  Future<Response<List<OrganizationDto>>> _apiOrganizationsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
  }) {
    final Uri $url = Uri.parse('/api/Organizations/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<OrganizationDto>, OrganizationDto>($request);
  }

  @override
  Future<Response<OrganizationDto>> _apiOrganizationsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Organizations/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<OrganizationDto, OrganizationDto>($request);
  }

  @override
  Future<Response<OrganizationAccount>> _apiOrganizationsCreatePost(
      {required CreateOrganizationDto? body}) {
    final Uri $url = Uri.parse('/api/Organizations/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<OrganizationAccount, OrganizationAccount>($request);
  }

  @override
  Future<Response<OrganizationDto>> _apiOrganizationsUpdatePut(
      {required UpdateOrganizationDto? body}) {
    final Uri $url = Uri.parse('/api/Organizations/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<OrganizationDto, OrganizationDto>($request);
  }

  @override
  Future<Response<OrganizationDto>> _apiOrganizationsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/Organizations/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<OrganizationDto, OrganizationDto>($request);
  }

  @override
  Future<Response<SavedFileDto>> _apiSavedFilesGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/SavedFiles/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SavedFileDto, SavedFileDto>($request);
  }

  @override
  Future<Response<List<SkillDto>>> _apiSkillsGetAllGet() {
    final Uri $url = Uri.parse('/api/Skills/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<SkillDto>, SkillDto>($request);
  }

  @override
  Future<Response<List<SkillDto>>> _apiSkillsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? studentId,
  }) {
    final Uri $url = Uri.parse('/api/Skills/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'studentId': studentId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<SkillDto>, SkillDto>($request);
  }

  @override
  Future<Response<SkillDto>> _apiSkillsGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/Skills/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SkillDto, SkillDto>($request);
  }

  @override
  Future<Response<SkillDto>> _apiSkillsCreatePost(
      {required CreateSkillDto? body}) {
    final Uri $url = Uri.parse('/api/Skills/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SkillDto, SkillDto>($request);
  }

  @override
  Future<Response<SkillDto>> _apiSkillsUpdatePut(
      {required UpdateSkillDto? body}) {
    final Uri $url = Uri.parse('/api/Skills/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SkillDto, SkillDto>($request);
  }

  @override
  Future<Response<SkillDto>> _apiSkillsDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/Skills/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<SkillDto, SkillDto>($request);
  }

  @override
  Future<Response<List<StudentApplicationDto>>>
      _apiStudentApplicationsGetAllGet() {
    final Uri $url = Uri.parse('/api/StudentApplications/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<StudentApplicationDto>, StudentApplicationDto>($request);
  }

  @override
  Future<Response<List<StudentApplicationDto>>>
      _apiStudentApplicationsGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? studentId,
    int? volunteerOpportunityId,
    int? organizationId,
  }) {
    final Uri $url = Uri.parse('/api/StudentApplications/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'studentId': studentId,
      'volunteerOpportunityId': volunteerOpportunityId,
      'organizationId': organizationId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<StudentApplicationDto>, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>> _apiStudentApplicationsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/StudentApplications/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>>
      _apiStudentApplicationsOrganizationAcceptApplicationIdPut(
          {required int? id}) {
    final Uri $url = Uri.parse(
        '/api/StudentApplications/OrganizationAcceptApplication/${id}');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>>
      _apiStudentApplicationsOrganizationRejectApplicationPut(
          {required RejectStudentApplication? body}) {
    final Uri $url =
        Uri.parse('/api/StudentApplications/OrganizationRejectApplication');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>>
      _apiStudentApplicationsManagementAcceptApplicationIdPut(
          {required int? id}) {
    final Uri $url =
        Uri.parse('/api/StudentApplications/ManagementAcceptApplication/${id}');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>>
      _apiStudentApplicationsManagementRejectApplicationPut(
          {required RejectStudentApplication? body}) {
    final Uri $url =
        Uri.parse('/api/StudentApplications/ManagementRejectApplication');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>> _apiStudentApplicationsCreatePost(
      {required CreateStudentApplicationDto? body}) {
    final Uri $url = Uri.parse('/api/StudentApplications/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>> _apiStudentApplicationsUpdatePut(
      {required UpdateStudentApplicationDto? body}) {
    final Uri $url = Uri.parse('/api/StudentApplications/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<StudentApplicationDto>> _apiStudentApplicationsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/StudentApplications/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<StudentApplicationDto, StudentApplicationDto>($request);
  }

  @override
  Future<Response<List<StudentDto>>> _apiStudentsGetAllGet() {
    final Uri $url = Uri.parse('/api/Students/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<StudentDto>, StudentDto>($request);
  }

  @override
  Future<Response<List<StudentDto>>> _apiStudentsGetListGet({
    String? filter,
    bool? isNotVolunteer,
    int? skipCount,
    int? maxResultCount,
  }) {
    final Uri $url = Uri.parse('/api/Students/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'isNotVolunteer': isNotVolunteer,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<StudentDto>, StudentDto>($request);
  }

  @override
  Future<Response<StudentDto>> _apiStudentsGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/Students/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<StudentDto, StudentDto>($request);
  }

  @override
  Future<Response<StudentAccount>> _apiStudentsCreatePost(
      {required CreateStudentDto? body}) {
    final Uri $url = Uri.parse('/api/Students/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentAccount, StudentAccount>($request);
  }

  @override
  Future<Response<StudentDto>> _apiStudentsUpdatePut(
      {required UpdateStudentDto? body}) {
    final Uri $url = Uri.parse('/api/Students/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentDto, StudentDto>($request);
  }

  @override
  Future<Response<StudentDto>> _apiStudentsUpdateByManagementPut(
      {required UpdateStudentByManagementDto? body}) {
    final Uri $url = Uri.parse('/api/Students/UpdateByManagement');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentDto, StudentDto>($request);
  }

  @override
  Future<Response<StudentDto>> _apiStudentsUpdateSkillsPut(
      {required UpdateStudentSkills? body}) {
    final Uri $url = Uri.parse('/api/Students/UpdateSkills');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudentDto, StudentDto>($request);
  }

  @override
  Future<Response<StudentDto>> _apiStudentsDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/Students/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<StudentDto, StudentDto>($request);
  }

  @override
  Future<Response<TempFileDto>> _apiTempFilesUploadOneFilePost() {
    final Uri $url = Uri.parse('/api/TempFiles/UploadOneFile');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<TempFileDto, TempFileDto>($request);
  }

  @override
  Future<Response<List<TempFileDto>>> _apiTempFilesUploadFilesPost() {
    final Uri $url = Uri.parse('/api/TempFiles/UploadFiles');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<List<TempFileDto>, TempFileDto>($request);
  }

  @override
  Future<Response<List<VolunteerOpportunityDto>>>
      _apiVolunteerOpportunitiesGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<VolunteerOpportunityDto>, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<List<VolunteerOpportunityDto>>>
      _apiVolunteerOpportunitiesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? organizationId,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'organizationId': organizationId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<VolunteerOpportunityDto>, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<VolunteerOpportunityDto>> _apiVolunteerOpportunitiesGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerOpportunityDto, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesCreatePost(
          {required CreateVolunteerOpportunityDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerOpportunityDto, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<VolunteerOpportunityDto>> _apiVolunteerOpportunitiesUpdatePut(
      {required UpdateVolunteerOpportunityDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/Update');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerOpportunityDto, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<VolunteerOpportunityDto>>
      _apiVolunteerOpportunitiesDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerOpportunities/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerOpportunityDto, VolunteerOpportunityDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramActivityDto>>>
      _apiVolunteerProgramActivitiesGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerProgramActivityDto>,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramActivityDto>>>
      _apiVolunteerProgramActivitiesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerProgramId': volunteerProgramId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerProgramActivityDto>,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramActivityDto,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesCreatePost(
          {required CreateVolunteerProgramActivityDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramActivityDto,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesUpdatePost(
          {required UpdateVolunteerProgramActivityDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramActivityDto,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<VolunteerProgramActivityDto>>
      _apiVolunteerProgramActivitiesDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramActivities/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramActivityDto,
        VolunteerProgramActivityDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramGalleryPhotoDto>>>
      _apiVolunteerProgramGalleryPhotosGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerProgramGalleryPhotos/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerProgramGalleryPhotoDto>,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramGalleryPhotoDto>>>
      _apiVolunteerProgramGalleryPhotosGetListGet({
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    bool? isApproved,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerProgramGalleryPhotos/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerProgramId': volunteerProgramId,
      'isApproved': isApproved,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerProgramGalleryPhotoDto>,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramGalleryPhotos/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosCreatePost(
          {required CreateGalleryPhotoDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramGalleryPhotos/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosCreateByStudentPost(
          {required CreateGalleryPhotoByStudentDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerProgramGalleryPhotos/CreateByStudent');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosUpdatePost(
          {required UpdateGalleryPhotoDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramGalleryPhotos/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosUpdateByStudentPost(
          {required UpdateGalleryPhotoByStudentDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerProgramGalleryPhotos/UpdateByStudent');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<VolunteerProgramGalleryPhotoDto>>
      _apiVolunteerProgramGalleryPhotosDeleteIdDelete({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerProgramGalleryPhotos/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramGalleryPhotoDto,
        VolunteerProgramGalleryPhotoDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramDto>>> _apiVolunteerProgramsGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<VolunteerProgramDto>, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramDto>>> _apiVolunteerProgramsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? organizationId,
    bool? isInternalProgram,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'organizationId': organizationId,
      'isInternalProgram': isInternalProgram,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<VolunteerProgramDto>, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>> _apiVolunteerProgramsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>>
      _apiVolunteerProgramsCreateOrganizationProgramPost(
          {required CreateVolunteerProgramDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerPrograms/CreateOrganizationProgram');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>>
      _apiVolunteerProgramsCreateInternalProgramPost(
          {required CreateInternalVolunteerProgramDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/CreateInternalProgram');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>>
      _apiVolunteerProgramsUpdateOrganizationProgramPut(
          {required UpdateVolunteerProgramDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerPrograms/UpdateOrganizationProgram');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>>
      _apiVolunteerProgramsUpdateInternalProgramPut(
          {required UpdateInternalVolunteerProgramDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/UpdateInternalProgram');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<VolunteerProgramDto>> _apiVolunteerProgramsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerPrograms/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerProgramDto, VolunteerProgramDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramTaskDto>>>
      _apiVolunteerProgramTasksGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<VolunteerProgramTaskDto>, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramTaskDto>>>
      _apiVolunteerProgramTasksGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerProgramId': volunteerProgramId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<VolunteerProgramTaskDto>, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<VolunteerProgramTaskDto>> _apiVolunteerProgramTasksGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerProgramTaskDto, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<VolunteerProgramTaskDto>> _apiVolunteerProgramTasksCreatePost(
      {required CreateVolunteerProgramTaskDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerProgramTaskDto, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<VolunteerProgramTaskDto>> _apiVolunteerProgramTasksUpdatePost(
      {required UpdateVolunteerProgramTaskDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerProgramTaskDto, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<VolunteerProgramTaskDto>>
      _apiVolunteerProgramTasksDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramTasks/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerProgramTaskDto, VolunteerProgramTaskDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramWorkDayDto>>>
      _apiVolunteerProgramWorkDaysGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerProgramWorkDayDto>,
        VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<List<VolunteerProgramWorkDayDto>>>
      _apiVolunteerProgramWorkDaysGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    String? startDate,
    String? endDate,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerProgramId': volunteerProgramId,
      'startDate': startDate,
      'endDate': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerProgramWorkDayDto>,
        VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysGetIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerProgramWorkDayDto, VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysCreatePost(
          {required CreateVolunteerProgramWorkDayDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerProgramWorkDayDto, VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysUpdatePost(
          {required UpdateVolunteerProgramWorkDayDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<VolunteerProgramWorkDayDto, VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<VolunteerProgramWorkDayDto>>
      _apiVolunteerProgramWorkDaysDeleteIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerProgramWorkDays/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client
        .send<VolunteerProgramWorkDayDto, VolunteerProgramWorkDayDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentActivityAttendanceDto>>>
      _apiVolunteerStudentActivityAttendancesGetAllGet() {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerStudentActivityAttendanceDto>,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentActivityAttendanceDto>>>
      _apiVolunteerStudentActivityAttendancesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? activityId,
    bool? isAttended,
  }) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerStudentId': volunteerStudentId,
      'activityId': activityId,
      'isAttended': isAttended,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerStudentActivityAttendanceDto>,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesGetIdGet({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentActivityAttendanceDto,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesCreatePost(
          {required CreateVolunteerStudentActivityAttendanceDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentActivityAttendanceDto,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesUpdatePost(
          {required UpdateVolunteerStudentActivityAttendanceDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentActivityAttendanceDto,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentActivityAttendanceDto>>
      _apiVolunteerStudentActivityAttendancesDeleteIdDelete(
          {required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentActivityAttendances/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentActivityAttendanceDto,
        VolunteerStudentActivityAttendanceDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentDto>>> _apiVolunteerStudentsGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerStudents/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<VolunteerStudentDto>, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentDto>>> _apiVolunteerStudentsGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerProgramId,
    int? organizationId,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerStudents/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerProgramId': volunteerProgramId,
      'organizationId': organizationId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<VolunteerStudentDto>, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>> _apiVolunteerStudentsGetIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerStudents/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>>
      _apiVolunteerStudentsGetOfStudentByIdStudentIdGet(
          {required int? studentId}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudents/GetOfStudentById/${studentId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>> _apiVolunteerStudentsCreatePost(
      {required CreateVolunteerStudentDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerStudents/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>>
      _apiVolunteerStudentsUpdateOrganizationAssessmentPost(
          {required UpdateVolunteerStudentOrgAssessmentDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudents/UpdateOrganizationAssessment');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>>
      _apiVolunteerStudentsUpdateManagementFinalEvaluationPost(
          {required UpdateVolunteerStudentFinalEvaluationDto? body}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudents/UpdateManagementFinalEvaluation');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<VolunteerStudentDto>> _apiVolunteerStudentsDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/VolunteerStudents/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentDto, VolunteerStudentDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentTaskAccomplishDto>>>
      _apiVolunteerStudentTaskAccomplishesGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerStudentTaskAccomplishes/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerStudentTaskAccomplishDto>,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentTaskAccomplishDto>>>
      _apiVolunteerStudentTaskAccomplishesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? taskId,
    bool? isAccomplished,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerStudentTaskAccomplishes/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerStudentId': volunteerStudentId,
      'taskId': taskId,
      'isAccomplished': isAccomplished,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerStudentTaskAccomplishDto>,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesGetIdGet({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentTaskAccomplishes/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentTaskAccomplishDto,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesCreatePost(
          {required CreateVolunteerStudentTaskAccomplishDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerStudentTaskAccomplishes/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentTaskAccomplishDto,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesUpdatePost(
          {required UpdateVolunteerStudentTaskAccomplishDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerStudentTaskAccomplishes/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentTaskAccomplishDto,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<VolunteerStudentTaskAccomplishDto>>
      _apiVolunteerStudentTaskAccomplishesDeleteIdDelete({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentTaskAccomplishes/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentTaskAccomplishDto,
        VolunteerStudentTaskAccomplishDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentWorkAttendanceDto>>>
      _apiVolunteerStudentWorkAttendancesGetAllGet() {
    final Uri $url = Uri.parse('/api/VolunteerStudentWorkAttendances/GetAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<VolunteerStudentWorkAttendanceDto>,
        VolunteerStudentWorkAttendanceDto>($request);
  }

  @override
  Future<Response<List<VolunteerStudentWorkAttendanceDto>>>
      _apiVolunteerStudentWorkAttendancesGetListGet({
    String? filter,
    int? skipCount,
    int? maxResultCount,
    int? volunteerStudentId,
    int? workDayId,
    bool? isAttended,
  }) {
    final Uri $url = Uri.parse('/api/VolunteerStudentWorkAttendances/GetList');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'skipCount': skipCount,
      'maxResultCount': maxResultCount,
      'volunteerStudentId': volunteerStudentId,
      'workDayId': workDayId,
      'isAttended': isAttended,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<VolunteerStudentWorkAttendanceDto>,
        VolunteerStudentWorkAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesGetIdGet({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentWorkAttendances/Get/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentWorkAttendanceDto,
        VolunteerStudentWorkAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesCreatePost(
          {required CreateVolunteerStudentWorkAttendanceDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerStudentWorkAttendances/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentWorkAttendanceDto,
        VolunteerStudentWorkAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesUpdatePost(
          {required UpdateVolunteerStudentWorkAttendanceDto? body}) {
    final Uri $url = Uri.parse('/api/VolunteerStudentWorkAttendances/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VolunteerStudentWorkAttendanceDto,
        VolunteerStudentWorkAttendanceDto>($request);
  }

  @override
  Future<Response<VolunteerStudentWorkAttendanceDto>>
      _apiVolunteerStudentWorkAttendancesDeleteIdDelete({required int? id}) {
    final Uri $url =
        Uri.parse('/api/VolunteerStudentWorkAttendances/Delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<VolunteerStudentWorkAttendanceDto,
        VolunteerStudentWorkAttendanceDto>($request);
  }
}
