// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementDto _$AnnouncementDtoFromJson(Map json) => AnnouncementDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['image'] as Map)),
      isManagementAnnouncement: json['isManagementAnnouncement'] as bool?,
      isOrganizationAnnouncement: json['isOrganizationAnnouncement'] as bool?,
      organizationId: json['organizationId'] as int?,
      volunteerProgramId: json['volunteerProgramId'] as int?,
    );

Map<String, dynamic> _$AnnouncementDtoToJson(AnnouncementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'image': instance.image?.toJson(),
      'isManagementAnnouncement': instance.isManagementAnnouncement,
      'isOrganizationAnnouncement': instance.isOrganizationAnnouncement,
      'organizationId': instance.organizationId,
      'volunteerProgramId': instance.volunteerProgramId,
    };

ApiError _$ApiErrorFromJson(Map json) => ApiError(
      errorTitle: json['errorTitle'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorDetails: json['errorDetails'] as String?,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'errorTitle': instance.errorTitle,
      'errorMessage': instance.errorMessage,
      'errorDetails': instance.errorDetails,
    };

ApplicationUser _$ApplicationUserFromJson(Map json) => ApplicationUser(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      normalizedUserName: json['normalizedUserName'] as String?,
      email: json['email'] as String?,
      normalizedEmail: json['normalizedEmail'] as String?,
      emailConfirmed: json['emailConfirmed'] as bool?,
      passwordHash: json['passwordHash'] as String?,
      securityStamp: json['securityStamp'] as String?,
      concurrencyStamp: json['concurrencyStamp'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      phoneNumberConfirmed: json['phoneNumberConfirmed'] as bool?,
      twoFactorEnabled: json['twoFactorEnabled'] as bool?,
      lockoutEnd: json['lockoutEnd'] == null
          ? null
          : DateTime.parse(json['lockoutEnd'] as String),
      lockoutEnabled: json['lockoutEnabled'] as bool?,
      accessFailedCount: json['accessFailedCount'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      createdBy: json['createdBy'] as int?,
      modifiedBy: json['modifiedBy'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : SavedFile.fromJson(
              Map<String, dynamic>.from(json['profilePicture'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ApplicationUserToJson(ApplicationUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'normalizedUserName': instance.normalizedUserName,
      'email': instance.email,
      'normalizedEmail': instance.normalizedEmail,
      'emailConfirmed': instance.emailConfirmed,
      'passwordHash': instance.passwordHash,
      'securityStamp': instance.securityStamp,
      'concurrencyStamp': instance.concurrencyStamp,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberConfirmed': instance.phoneNumberConfirmed,
      'twoFactorEnabled': instance.twoFactorEnabled,
      'lockoutEnd': instance.lockoutEnd?.toIso8601String(),
      'lockoutEnabled': instance.lockoutEnabled,
      'accessFailedCount': instance.accessFailedCount,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'isDeleted': instance.isDeleted,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture?.toJson(),
      'fcmToken': instance.fcmToken,
    };

ApplicationUserDto _$ApplicationUserDtoFromJson(Map json) => ApplicationUserDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['profilePicture'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ApplicationUserDtoToJson(ApplicationUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture?.toJson(),
      'fcmToken': instance.fcmToken,
    };

AuthToken _$AuthTokenFromJson(Map json) => AuthToken(
      token: json['token'] as String?,
      expiration: json['expiration'] == null
          ? null
          : DateTime.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration?.toIso8601String(),
    };

AuthenticateRequest _$AuthenticateRequestFromJson(Map json) =>
    AuthenticateRequest(
      userNameOrEmail: json['userNameOrEmail'] as String,
      password: json['password'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$AuthenticateRequestToJson(
        AuthenticateRequest instance) =>
    <String, dynamic>{
      'userNameOrEmail': instance.userNameOrEmail,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
    };

CategoryDto _$CategoryDtoFromJson(Map json) => CategoryDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'name': instance.name,
    };

ConversationDto _$ConversationDtoFromJson(Map json) => ConversationDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      user1Id: json['user1Id'] as int?,
      user2Id: json['user2Id'] as int?,
      user1: json['user1'] == null
          ? null
          : ApplicationUserDto.fromJson(
              Map<String, dynamic>.from(json['user1'] as Map)),
      user2: json['user2'] == null
          ? null
          : ApplicationUserDto.fromJson(
              Map<String, dynamic>.from(json['user2'] as Map)),
    );

Map<String, dynamic> _$ConversationDtoToJson(ConversationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'user1': instance.user1?.toJson(),
      'user2': instance.user2?.toJson(),
    };

CreateAnnouncementDto _$CreateAnnouncementDtoFromJson(Map json) =>
    CreateAnnouncementDto(
      title: json['title'] as String,
      description: json['description'] as String,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      isManagementAnnouncement: json['isManagementAnnouncement'] as bool,
      isOrganizationAnnouncement: json['isOrganizationAnnouncement'] as bool,
      organizationId: json['organizationId'] as int?,
      volunteerProgramId: json['volunteerProgramId'] as int?,
    );

Map<String, dynamic> _$CreateAnnouncementDtoToJson(
        CreateAnnouncementDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'isManagementAnnouncement': instance.isManagementAnnouncement,
      'isOrganizationAnnouncement': instance.isOrganizationAnnouncement,
      'organizationId': instance.organizationId,
      'volunteerProgramId': instance.volunteerProgramId,
    };

CreateCategoryDto _$CreateCategoryDtoFromJson(Map json) => CreateCategoryDto(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateCategoryDtoToJson(CreateCategoryDto instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CreateGalleryPhotoByStudentDto _$CreateGalleryPhotoByStudentDtoFromJson(
        Map json) =>
    CreateGalleryPhotoByStudentDto(
      saveTempFile: SaveTempFile.fromJson(
          Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      volunteerProgramId: json['volunteerProgramId'] as int,
      volunteerStudentUploaderId: json['volunteerStudentUploaderId'] as int,
    );

Map<String, dynamic> _$CreateGalleryPhotoByStudentDtoToJson(
        CreateGalleryPhotoByStudentDto instance) =>
    <String, dynamic>{
      'saveTempFile': instance.saveTempFile.toJson(),
      'volunteerProgramId': instance.volunteerProgramId,
      'volunteerStudentUploaderId': instance.volunteerStudentUploaderId,
    };

CreateGalleryPhotoDto _$CreateGalleryPhotoDtoFromJson(Map json) =>
    CreateGalleryPhotoDto(
      saveTempFile: SaveTempFile.fromJson(
          Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      volunteerProgramId: json['volunteerProgramId'] as int,
    );

Map<String, dynamic> _$CreateGalleryPhotoDtoToJson(
        CreateGalleryPhotoDto instance) =>
    <String, dynamic>{
      'saveTempFile': instance.saveTempFile.toJson(),
      'volunteerProgramId': instance.volunteerProgramId,
    };

CreateInternalVolunteerProgramDto _$CreateInternalVolunteerProgramDtoFromJson(
        Map json) =>
    CreateInternalVolunteerProgramDto(
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$CreateInternalVolunteerProgramDtoToJson(
        CreateInternalVolunteerProgramDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

CreateManagementEmployeeDto _$CreateManagementEmployeeDtoFromJson(Map json) =>
    CreateManagementEmployeeDto(
      userName: json['userName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$CreateManagementEmployeeDtoToJson(
        CreateManagementEmployeeDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'fcmToken': instance.fcmToken,
    };

CreateMessageDto _$CreateMessageDtoFromJson(Map json) => CreateMessageDto(
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      content: json['content'] as String,
      conversationId: json['conversationId'] as int?,
    );

Map<String, dynamic> _$CreateMessageDtoToJson(CreateMessageDto instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'conversationId': instance.conversationId,
    };

CreateOrganizationDto _$CreateOrganizationDtoFromJson(Map json) =>
    CreateOrganizationDto(
      userName: json['userName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String,
      orgNameLocal: json['orgNameLocal'] as String,
      orgNameForeign: json['orgNameForeign'] as String?,
      fieldOfWork: json['fieldOfWork'] as String,
      about: json['about'] as String,
      vision: json['vision'] as String?,
      mission: json['mission'] as String?,
      address: json['address'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$CreateOrganizationDtoToJson(
        CreateOrganizationDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'orgNameLocal': instance.orgNameLocal,
      'orgNameForeign': instance.orgNameForeign,
      'fieldOfWork': instance.fieldOfWork,
      'about': instance.about,
      'vision': instance.vision,
      'mission': instance.mission,
      'address': instance.address,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'fcmToken': instance.fcmToken,
    };

CreateSkillDto _$CreateSkillDtoFromJson(Map json) => CreateSkillDto(
      name: json['name'] as String,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
    );

Map<String, dynamic> _$CreateSkillDtoToJson(CreateSkillDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
    };

CreateStudentApplicationDto _$CreateStudentApplicationDtoFromJson(Map json) =>
    CreateStudentApplicationDto(
      studentId: json['studentId'] as int,
      volunteerOpportunityId: json['volunteerOpportunityId'] as int,
      textInformation: json['textInformation'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$CreateStudentApplicationDtoToJson(
        CreateStudentApplicationDto instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'volunteerOpportunityId': instance.volunteerOpportunityId,
      'textInformation': instance.textInformation,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

CreateStudentDto _$CreateStudentDtoFromJson(Map json) => CreateStudentDto(
      universityIdNumber: json['universityIdNumber'] as int,
      userName: json['userName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      specialization: json['specialization'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      biography: json['biography'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$CreateStudentDtoToJson(CreateStudentDto instance) =>
    <String, dynamic>{
      'universityIdNumber': instance.universityIdNumber,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'specialization': instance.specialization,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'biography': instance.biography,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'fcmToken': instance.fcmToken,
    };

CreateVolunteerOpportunityDto _$CreateVolunteerOpportunityDtoFromJson(
        Map json) =>
    CreateVolunteerOpportunityDto(
      organizationId: json['organizationId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      natureOfWorkOrActivities: json['natureOfWorkOrActivities'] as String,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      actualProgramStartDate:
          DateTime.parse(json['actualProgramStartDate'] as String),
      actualProgramEndDate:
          DateTime.parse(json['actualProgramEndDate'] as String),
      announcementEndDate: json['announcementEndDate'] == null
          ? null
          : DateTime.parse(json['announcementEndDate'] as String),
      receiveApplicationsEndDate:
          DateTime.parse(json['receiveApplicationsEndDate'] as String),
      requiredVolunteerStudentsNumber:
          json['requiredVolunteerStudentsNumber'] as int,
      volunteerSkills: (json['volunteerSkills'] as List<dynamic>?)
              ?.map((e) => ExistingOrCreateNewSkillDto.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      applicantQualifications: json['applicantQualifications'] as String?,
      isRequirementNeededAsText: json['isRequirementNeededAsText'] as bool,
      isRequirementNeededAsFile: json['isRequirementNeededAsFile'] as bool,
      requirementFileDescription: json['requirementFileDescription'] as String?,
      requirementFileMaxAllowedSize:
          (json['requirementFileMaxAllowedSize'] as num?)?.toDouble(),
      requirementFileAllowedTypes:
          json['requirementFileAllowedTypes'] as String?,
    );

Map<String, dynamic> _$CreateVolunteerOpportunityDtoToJson(
        CreateVolunteerOpportunityDto instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'title': instance.title,
      'description': instance.description,
      'natureOfWorkOrActivities': instance.natureOfWorkOrActivities,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
      'actualProgramStartDate':
          instance.actualProgramStartDate.toIso8601String(),
      'actualProgramEndDate': instance.actualProgramEndDate.toIso8601String(),
      'announcementEndDate': instance.announcementEndDate?.toIso8601String(),
      'receiveApplicationsEndDate':
          instance.receiveApplicationsEndDate.toIso8601String(),
      'requiredVolunteerStudentsNumber':
          instance.requiredVolunteerStudentsNumber,
      'volunteerSkills':
          instance.volunteerSkills?.map((e) => e.toJson()).toList(),
      'applicantQualifications': instance.applicantQualifications,
      'isRequirementNeededAsText': instance.isRequirementNeededAsText,
      'isRequirementNeededAsFile': instance.isRequirementNeededAsFile,
      'requirementFileDescription': instance.requirementFileDescription,
      'requirementFileMaxAllowedSize': instance.requirementFileMaxAllowedSize,
      'requirementFileAllowedTypes': instance.requirementFileAllowedTypes,
    };

CreateVolunteerProgramActivityDto _$CreateVolunteerProgramActivityDtoFromJson(
        Map json) =>
    CreateVolunteerProgramActivityDto(
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int,
      saveTempFiles: (json['saveTempFiles'] as List<dynamic>?)
              ?.map((e) =>
                  SaveTempFile.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateVolunteerProgramActivityDtoToJson(
        CreateVolunteerProgramActivityDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
      'saveTempFiles': instance.saveTempFiles?.map((e) => e.toJson()).toList(),
    };

CreateVolunteerProgramDto _$CreateVolunteerProgramDtoFromJson(Map json) =>
    CreateVolunteerProgramDto(
      organizationId: json['organizationId'] as int,
      volunteerOpportunityId: json['volunteerOpportunityId'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$CreateVolunteerProgramDtoToJson(
        CreateVolunteerProgramDto instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'volunteerOpportunityId': instance.volunteerOpportunityId,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

CreateVolunteerProgramTaskDto _$CreateVolunteerProgramTaskDtoFromJson(
        Map json) =>
    CreateVolunteerProgramTaskDto(
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int,
    );

Map<String, dynamic> _$CreateVolunteerProgramTaskDtoToJson(
        CreateVolunteerProgramTaskDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
    };

CreateVolunteerProgramWorkDayDto _$CreateVolunteerProgramWorkDayDtoFromJson(
        Map json) =>
    CreateVolunteerProgramWorkDayDto(
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int,
    );

Map<String, dynamic> _$CreateVolunteerProgramWorkDayDtoToJson(
        CreateVolunteerProgramWorkDayDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
    };

CreateVolunteerStudentActivityAttendanceDto
    _$CreateVolunteerStudentActivityAttendanceDtoFromJson(Map json) =>
        CreateVolunteerStudentActivityAttendanceDto(
          isAttended: json['isAttended'] as bool,
          volunteerStudentId: json['volunteerStudentId'] as int,
          volunteerProgramActivityId: json['volunteerProgramActivityId'] as int,
        );

Map<String, dynamic> _$CreateVolunteerStudentActivityAttendanceDtoToJson(
        CreateVolunteerStudentActivityAttendanceDto instance) =>
    <String, dynamic>{
      'isAttended': instance.isAttended,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerProgramActivityId': instance.volunteerProgramActivityId,
    };

CreateVolunteerStudentDto _$CreateVolunteerStudentDtoFromJson(Map json) =>
    CreateVolunteerStudentDto(
      studentId: json['studentId'] as int,
      volunteerProgramId: json['volunteerProgramId'] as int,
    );

Map<String, dynamic> _$CreateVolunteerStudentDtoToJson(
        CreateVolunteerStudentDto instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'volunteerProgramId': instance.volunteerProgramId,
    };

CreateVolunteerStudentTaskAccomplishDto
    _$CreateVolunteerStudentTaskAccomplishDtoFromJson(Map json) =>
        CreateVolunteerStudentTaskAccomplishDto(
          isAccomplished: json['isAccomplished'] as bool,
          rate: (json['rate'] as num).toDouble(),
          volunteerStudentId: json['volunteerStudentId'] as int,
          volunteerProgramTaskId: json['volunteerProgramTaskId'] as int,
        );

Map<String, dynamic> _$CreateVolunteerStudentTaskAccomplishDtoToJson(
        CreateVolunteerStudentTaskAccomplishDto instance) =>
    <String, dynamic>{
      'isAccomplished': instance.isAccomplished,
      'rate': instance.rate,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerProgramTaskId': instance.volunteerProgramTaskId,
    };

CreateVolunteerStudentWorkAttendanceDto
    _$CreateVolunteerStudentWorkAttendanceDtoFromJson(Map json) =>
        CreateVolunteerStudentWorkAttendanceDto(
          isAttended: json['isAttended'] as bool,
          volunteerStudentId: json['volunteerStudentId'] as int,
          volunteerProgramWorkDayId: json['volunteerProgramWorkDayId'] as int,
        );

Map<String, dynamic> _$CreateVolunteerStudentWorkAttendanceDtoToJson(
        CreateVolunteerStudentWorkAttendanceDto instance) =>
    <String, dynamic>{
      'isAttended': instance.isAttended,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerProgramWorkDayId': instance.volunteerProgramWorkDayId,
    };

ExistingOrCreateNewSkillDto _$ExistingOrCreateNewSkillDtoFromJson(Map json) =>
    ExistingOrCreateNewSkillDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
    );

Map<String, dynamic> _$ExistingOrCreateNewSkillDtoToJson(
        ExistingOrCreateNewSkillDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
    };

ManagementEmployeeAccount _$ManagementEmployeeAccountFromJson(Map json) =>
    ManagementEmployeeAccount(
      managementEmployeeDto: json['managementEmployeeDto'] == null
          ? null
          : ManagementEmployeeDto.fromJson(
              Map<String, dynamic>.from(json['managementEmployeeDto'] as Map)),
      authToken: json['authToken'] == null
          ? null
          : AuthToken.fromJson(
              Map<String, dynamic>.from(json['authToken'] as Map)),
    );

Map<String, dynamic> _$ManagementEmployeeAccountToJson(
        ManagementEmployeeAccount instance) =>
    <String, dynamic>{
      'managementEmployeeDto': instance.managementEmployeeDto?.toJson(),
      'authToken': instance.authToken?.toJson(),
    };

ManagementEmployeeDto _$ManagementEmployeeDtoFromJson(Map json) =>
    ManagementEmployeeDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['profilePicture'] as Map)),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ManagementEmployeeDtoToJson(
        ManagementEmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture?.toJson(),
      'fcmToken': instance.fcmToken,
    };

MessageDto _$MessageDtoFromJson(Map json) => MessageDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      content: json['content'] as String?,
      senderId: json['senderId'] as int?,
      receiverId: json['receiverId'] as int?,
      sender: json['sender'] == null
          ? null
          : ApplicationUserDto.fromJson(
              Map<String, dynamic>.from(json['sender'] as Map)),
      receiver: json['receiver'] == null
          ? null
          : ApplicationUserDto.fromJson(
              Map<String, dynamic>.from(json['receiver'] as Map)),
      conversationId: json['conversationId'] as int?,
      conversation: json['conversation'] == null
          ? null
          : ConversationDto.fromJson(
              Map<String, dynamic>.from(json['conversation'] as Map)),
    );

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'content': instance.content,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'sender': instance.sender?.toJson(),
      'receiver': instance.receiver?.toJson(),
      'conversationId': instance.conversationId,
      'conversation': instance.conversation?.toJson(),
    };

NotificationDto _$NotificationDtoFromJson(Map json) => NotificationDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      title: json['title'] as String?,
      body: json['body'] as String?,
      itemId: json['itemId'] as int?,
      page: notificationPageFromJson(json['page']),
      applicationUserId: json['applicationUserId'] as int?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
      'itemId': instance.itemId,
      'page': notificationPageToJson(instance.page),
      'applicationUserId': instance.applicationUserId,
      'isRead': instance.isRead,
    };

Nullable _$NullableFromJson(Map json) => Nullable();

Map<String, dynamic> _$NullableToJson(Nullable instance) => <String, dynamic>{};

OrganizationAccount _$OrganizationAccountFromJson(Map json) =>
    OrganizationAccount(
      organizationDto: json['organizationDto'] == null
          ? null
          : OrganizationDto.fromJson(
              Map<String, dynamic>.from(json['organizationDto'] as Map)),
      authToken: json['authToken'] == null
          ? null
          : AuthToken.fromJson(
              Map<String, dynamic>.from(json['authToken'] as Map)),
    );

Map<String, dynamic> _$OrganizationAccountToJson(
        OrganizationAccount instance) =>
    <String, dynamic>{
      'organizationDto': instance.organizationDto?.toJson(),
      'authToken': instance.authToken?.toJson(),
    };

OrganizationDto _$OrganizationDtoFromJson(Map json) => OrganizationDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['profilePicture'] as Map)),
      fcmToken: json['fcmToken'] as String?,
      orgNameLocal: json['orgNameLocal'] as String?,
      orgNameForeign: json['orgNameForeign'] as String?,
      fieldOfWork: json['fieldOfWork'] as String?,
      about: json['about'] as String?,
      vision: json['vision'] as String?,
      mission: json['mission'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$OrganizationDtoToJson(OrganizationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture?.toJson(),
      'fcmToken': instance.fcmToken,
      'orgNameLocal': instance.orgNameLocal,
      'orgNameForeign': instance.orgNameForeign,
      'fieldOfWork': instance.fieldOfWork,
      'about': instance.about,
      'vision': instance.vision,
      'mission': instance.mission,
      'address': instance.address,
    };

RejectStudentApplication _$RejectStudentApplicationFromJson(Map json) =>
    RejectStudentApplication(
      studentApplicationId: json['studentApplicationId'] as int,
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$RejectStudentApplicationToJson(
        RejectStudentApplication instance) =>
    <String, dynamic>{
      'studentApplicationId': instance.studentApplicationId,
      'rejectionReason': instance.rejectionReason,
    };

SaveTempFile _$SaveTempFileFromJson(Map json) => SaveTempFile(
      tempFileId: json['tempFileId'] as int,
    );

Map<String, dynamic> _$SaveTempFileToJson(SaveTempFile instance) =>
    <String, dynamic>{
      'tempFileId': instance.tempFileId,
    };

SavedFile _$SavedFileFromJson(Map json) => SavedFile(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      fileKey: json['fileKey'] as String?,
      originalFileName: json['originalFileName'] as String?,
      fileSize: json['fileSize'] as int?,
      fileExtension: json['fileExtension'] as String?,
    );

Map<String, dynamic> _$SavedFileToJson(SavedFile instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'fileKey': instance.fileKey,
      'originalFileName': instance.originalFileName,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
    };

SavedFileDto _$SavedFileDtoFromJson(Map json) => SavedFileDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      fileKey: json['fileKey'] as String?,
      originalFileName: json['originalFileName'] as String?,
      fileSize: json['fileSize'] as int?,
      fileExtension: json['fileExtension'] as String?,
    );

Map<String, dynamic> _$SavedFileDtoToJson(SavedFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'fileKey': instance.fileKey,
      'originalFileName': instance.originalFileName,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
    };

SkillDto _$SkillDtoFromJson(Map json) => SkillDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      name: json['name'] as String?,
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
    );

Map<String, dynamic> _$SkillDtoToJson(SkillDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'name': instance.name,
      'category': instance.category?.toJson(),
    };

StudentAccount _$StudentAccountFromJson(Map json) => StudentAccount(
      studentDto: json['studentDto'] == null
          ? null
          : StudentDto.fromJson(
              Map<String, dynamic>.from(json['studentDto'] as Map)),
      authToken: json['authToken'] == null
          ? null
          : AuthToken.fromJson(
              Map<String, dynamic>.from(json['authToken'] as Map)),
    );

Map<String, dynamic> _$StudentAccountToJson(StudentAccount instance) =>
    <String, dynamic>{
      'studentDto': instance.studentDto?.toJson(),
      'authToken': instance.authToken?.toJson(),
    };

StudentApplicationDto _$StudentApplicationDtoFromJson(Map json) =>
    StudentApplicationDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      studentId: json['studentId'] as int?,
      student: json['student'] == null
          ? null
          : StudentDto.fromJson(
              Map<String, dynamic>.from(json['student'] as Map)),
      volunteerOpportunityId: json['volunteerOpportunityId'] as int?,
      volunteerOpportunity: json['volunteerOpportunity'] == null
          ? null
          : VolunteerOpportunityDto.fromJson(
              Map<String, dynamic>.from(json['volunteerOpportunity'] as Map)),
      statusForOrganization:
          applicationStatusFromJson(json['statusForOrganization']),
      statusForManagement:
          applicationStatusFromJson(json['statusForManagement']),
      textInformation: json['textInformation'] as String?,
      submittedFile: json['submittedFile'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['submittedFile'] as Map)),
      organizationRejectionReason:
          json['organizationRejectionReason'] as String?,
      managementRejectionReason: json['managementRejectionReason'] as String?,
    );

Map<String, dynamic> _$StudentApplicationDtoToJson(
        StudentApplicationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'studentId': instance.studentId,
      'student': instance.student?.toJson(),
      'volunteerOpportunityId': instance.volunteerOpportunityId,
      'volunteerOpportunity': instance.volunteerOpportunity?.toJson(),
      'statusForOrganization':
          applicationStatusToJson(instance.statusForOrganization),
      'statusForManagement':
          applicationStatusToJson(instance.statusForManagement),
      'textInformation': instance.textInformation,
      'submittedFile': instance.submittedFile?.toJson(),
      'organizationRejectionReason': instance.organizationRejectionReason,
      'managementRejectionReason': instance.managementRejectionReason,
    };

StudentDto _$StudentDtoFromJson(Map json) => StudentDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['profilePicture'] as Map)),
      fcmToken: json['fcmToken'] as String?,
      universityIdNumber: json['universityIdNumber'] as int?,
      specialization: json['specialization'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      biography: json['biography'] as String?,
      isEnrolledInProgram: json['isEnrolledInProgram'] as bool?,
      skills: (json['skills'] as List<dynamic>?)
              ?.map(
                  (e) => SkillDto.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$StudentDtoToJson(StudentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture?.toJson(),
      'fcmToken': instance.fcmToken,
      'universityIdNumber': instance.universityIdNumber,
      'specialization': instance.specialization,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'biography': instance.biography,
      'isEnrolledInProgram': instance.isEnrolledInProgram,
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
    };

TempFileDto _$TempFileDtoFromJson(Map json) => TempFileDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      fileKey: json['fileKey'] as String?,
      originalFileName: json['originalFileName'] as String?,
    );

Map<String, dynamic> _$TempFileDtoToJson(TempFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'fileKey': instance.fileKey,
      'originalFileName': instance.originalFileName,
    };

UpdateAnnouncementDto _$UpdateAnnouncementDtoFromJson(Map json) =>
    UpdateAnnouncementDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateAnnouncementDtoToJson(
        UpdateAnnouncementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateCategoryDto _$UpdateCategoryDtoFromJson(Map json) => UpdateCategoryDto(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UpdateCategoryDtoToJson(UpdateCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UpdateGalleryPhotoByStudentDto _$UpdateGalleryPhotoByStudentDtoFromJson(
        Map json) =>
    UpdateGalleryPhotoByStudentDto(
      id: json['id'] as int,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      volunteerStudentUploaderId: json['volunteerStudentUploaderId'] as int,
    );

Map<String, dynamic> _$UpdateGalleryPhotoByStudentDtoToJson(
        UpdateGalleryPhotoByStudentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'volunteerStudentUploaderId': instance.volunteerStudentUploaderId,
    };

UpdateGalleryPhotoDto _$UpdateGalleryPhotoDtoFromJson(Map json) =>
    UpdateGalleryPhotoDto(
      id: json['id'] as int,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      isApproved: json['isApproved'] as bool?,
    );

Map<String, dynamic> _$UpdateGalleryPhotoDtoToJson(
        UpdateGalleryPhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'saveTempFile': instance.saveTempFile?.toJson(),
      'isApproved': instance.isApproved,
    };

UpdateInternalVolunteerProgramDto _$UpdateInternalVolunteerProgramDtoFromJson(
        Map json) =>
    UpdateInternalVolunteerProgramDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateInternalVolunteerProgramDtoToJson(
        UpdateInternalVolunteerProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateManagementEmployeeDto _$UpdateManagementEmployeeDtoFromJson(Map json) =>
    UpdateManagementEmployeeDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateManagementEmployeeDtoToJson(
        UpdateManagementEmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateMessageDto _$UpdateMessageDtoFromJson(Map json) => UpdateMessageDto(
      id: json['id'] as int,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$UpdateMessageDtoToJson(UpdateMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };

UpdateOrganizationDto _$UpdateOrganizationDtoFromJson(Map json) =>
    UpdateOrganizationDto(
      id: json['id'] as int,
      orgNameLocal: json['orgNameLocal'] as String?,
      orgNameForeign: json['orgNameForeign'] as String?,
      fieldOfWork: json['fieldOfWork'] as String?,
      about: json['about'] as String?,
      vision: json['vision'] as String?,
      mission: json['mission'] as String?,
      address: json['address'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateOrganizationDtoToJson(
        UpdateOrganizationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgNameLocal': instance.orgNameLocal,
      'orgNameForeign': instance.orgNameForeign,
      'fieldOfWork': instance.fieldOfWork,
      'about': instance.about,
      'vision': instance.vision,
      'mission': instance.mission,
      'address': instance.address,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateSkillDto _$UpdateSkillDtoFromJson(Map json) => UpdateSkillDto(
      id: json['id'] as int,
      name: json['name'] as String?,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
    );

Map<String, dynamic> _$UpdateSkillDtoToJson(UpdateSkillDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
    };

UpdateStudentApplicationDto _$UpdateStudentApplicationDtoFromJson(Map json) =>
    UpdateStudentApplicationDto(
      id: json['id'] as int,
      textInformation: json['textInformation'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateStudentApplicationDtoToJson(
        UpdateStudentApplicationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'textInformation': instance.textInformation,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateStudentByManagementDto _$UpdateStudentByManagementDtoFromJson(Map json) =>
    UpdateStudentByManagementDto(
      id: json['id'] as int,
      universityIdNumber: json['universityIdNumber'] as int,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      specialization: json['specialization'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UpdateStudentByManagementDtoToJson(
        UpdateStudentByManagementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'universityIdNumber': instance.universityIdNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'specialization': instance.specialization,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };

UpdateStudentDto _$UpdateStudentDtoFromJson(Map json) => UpdateStudentDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      specialization: json['specialization'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      biography: json['biography'] as String?,
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateStudentDtoToJson(UpdateStudentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'specialization': instance.specialization,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'biography': instance.biography,
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateStudentSkills _$UpdateStudentSkillsFromJson(Map json) =>
    UpdateStudentSkills(
      studentId: json['studentId'] as int,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => ExistingOrCreateNewSkillDto.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UpdateStudentSkillsToJson(
        UpdateStudentSkills instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
    };

UpdateVolunteerOpportunityDto _$UpdateVolunteerOpportunityDtoFromJson(
        Map json) =>
    UpdateVolunteerOpportunityDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      natureOfWorkOrActivities: json['natureOfWorkOrActivities'] as String?,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
      actualProgramStartDate: json['actualProgramStartDate'] == null
          ? null
          : DateTime.parse(json['actualProgramStartDate'] as String),
      actualProgramEndDate: json['actualProgramEndDate'] == null
          ? null
          : DateTime.parse(json['actualProgramEndDate'] as String),
      announcementEndDate: json['announcementEndDate'] == null
          ? null
          : DateTime.parse(json['announcementEndDate'] as String),
      receiveApplicationsEndDate: json['receiveApplicationsEndDate'] == null
          ? null
          : DateTime.parse(json['receiveApplicationsEndDate'] as String),
      requiredVolunteerStudentsNumber:
          json['requiredVolunteerStudentsNumber'] as int?,
      volunteerSkills: (json['volunteerSkills'] as List<dynamic>?)
              ?.map((e) => ExistingOrCreateNewSkillDto.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      applicantQualifications: json['applicantQualifications'] as String?,
      isRequirementNeededAsText: json['isRequirementNeededAsText'] as bool?,
      isRequirementNeededAsFile: json['isRequirementNeededAsFile'] as bool?,
      requirementFileDescription: json['requirementFileDescription'] as String?,
      requirementFileMaxAllowedSize:
          (json['requirementFileMaxAllowedSize'] as num?)?.toDouble(),
      requirementFileAllowedTypes:
          json['requirementFileAllowedTypes'] as String?,
    );

Map<String, dynamic> _$UpdateVolunteerOpportunityDtoToJson(
        UpdateVolunteerOpportunityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'natureOfWorkOrActivities': instance.natureOfWorkOrActivities,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
      'actualProgramStartDate':
          instance.actualProgramStartDate?.toIso8601String(),
      'actualProgramEndDate': instance.actualProgramEndDate?.toIso8601String(),
      'announcementEndDate': instance.announcementEndDate?.toIso8601String(),
      'receiveApplicationsEndDate':
          instance.receiveApplicationsEndDate?.toIso8601String(),
      'requiredVolunteerStudentsNumber':
          instance.requiredVolunteerStudentsNumber,
      'volunteerSkills':
          instance.volunteerSkills?.map((e) => e.toJson()).toList(),
      'applicantQualifications': instance.applicantQualifications,
      'isRequirementNeededAsText': instance.isRequirementNeededAsText,
      'isRequirementNeededAsFile': instance.isRequirementNeededAsFile,
      'requirementFileDescription': instance.requirementFileDescription,
      'requirementFileMaxAllowedSize': instance.requirementFileMaxAllowedSize,
      'requirementFileAllowedTypes': instance.requirementFileAllowedTypes,
    };

UpdateVolunteerProgramActivityDto _$UpdateVolunteerProgramActivityDtoFromJson(
        Map json) =>
    UpdateVolunteerProgramActivityDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      saveTempFiles: (json['saveTempFiles'] as List<dynamic>?)
              ?.map((e) =>
                  SaveTempFile.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UpdateVolunteerProgramActivityDtoToJson(
        UpdateVolunteerProgramActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'saveTempFiles': instance.saveTempFiles?.map((e) => e.toJson()).toList(),
    };

UpdateVolunteerProgramDto _$UpdateVolunteerProgramDtoFromJson(Map json) =>
    UpdateVolunteerProgramDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CreateCategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      saveTempFile: json['saveTempFile'] == null
          ? null
          : SaveTempFile.fromJson(
              Map<String, dynamic>.from(json['saveTempFile'] as Map)),
    );

Map<String, dynamic> _$UpdateVolunteerProgramDtoToJson(
        UpdateVolunteerProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'saveTempFile': instance.saveTempFile?.toJson(),
    };

UpdateVolunteerProgramTaskDto _$UpdateVolunteerProgramTaskDtoFromJson(
        Map json) =>
    UpdateVolunteerProgramTaskDto(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$UpdateVolunteerProgramTaskDtoToJson(
        UpdateVolunteerProgramTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

UpdateVolunteerProgramWorkDayDto _$UpdateVolunteerProgramWorkDayDtoFromJson(
        Map json) =>
    UpdateVolunteerProgramWorkDayDto(
      id: json['id'] as int,
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$UpdateVolunteerProgramWorkDayDtoToJson(
        UpdateVolunteerProgramWorkDayDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
    };

UpdateVolunteerStudentActivityAttendanceDto
    _$UpdateVolunteerStudentActivityAttendanceDtoFromJson(Map json) =>
        UpdateVolunteerStudentActivityAttendanceDto(
          id: json['id'] as int,
          isAttended: json['isAttended'] as bool?,
        );

Map<String, dynamic> _$UpdateVolunteerStudentActivityAttendanceDtoToJson(
        UpdateVolunteerStudentActivityAttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAttended': instance.isAttended,
    };

UpdateVolunteerStudentFinalEvaluationDto
    _$UpdateVolunteerStudentFinalEvaluationDtoFromJson(Map json) =>
        UpdateVolunteerStudentFinalEvaluationDto(
          id: json['id'] as int,
          finalGrade: (json['finalGrade'] as num?)?.toDouble(),
          finalGradeNotes: json['finalGradeNotes'] as String?,
        );

Map<String, dynamic> _$UpdateVolunteerStudentFinalEvaluationDtoToJson(
        UpdateVolunteerStudentFinalEvaluationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'finalGrade': instance.finalGrade,
      'finalGradeNotes': instance.finalGradeNotes,
    };

UpdateVolunteerStudentOrgAssessmentDto
    _$UpdateVolunteerStudentOrgAssessmentDtoFromJson(Map json) =>
        UpdateVolunteerStudentOrgAssessmentDto(
          id: json['id'] as int,
          orgAssessmentGrade: (json['orgAssessmentGrade'] as num?)?.toDouble(),
          orgAssessmentGradeNotes: json['orgAssessmentGradeNotes'] as String?,
        );

Map<String, dynamic> _$UpdateVolunteerStudentOrgAssessmentDtoToJson(
        UpdateVolunteerStudentOrgAssessmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgAssessmentGrade': instance.orgAssessmentGrade,
      'orgAssessmentGradeNotes': instance.orgAssessmentGradeNotes,
    };

UpdateVolunteerStudentTaskAccomplishDto
    _$UpdateVolunteerStudentTaskAccomplishDtoFromJson(Map json) =>
        UpdateVolunteerStudentTaskAccomplishDto(
          id: json['id'] as int,
          isAccomplished: json['isAccomplished'] as bool?,
          rate: (json['rate'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$UpdateVolunteerStudentTaskAccomplishDtoToJson(
        UpdateVolunteerStudentTaskAccomplishDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAccomplished': instance.isAccomplished,
      'rate': instance.rate,
    };

UpdateVolunteerStudentWorkAttendanceDto
    _$UpdateVolunteerStudentWorkAttendanceDtoFromJson(Map json) =>
        UpdateVolunteerStudentWorkAttendanceDto(
          id: json['id'] as int,
          isAttended: json['isAttended'] as bool?,
        );

Map<String, dynamic> _$UpdateVolunteerStudentWorkAttendanceDtoToJson(
        UpdateVolunteerStudentWorkAttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAttended': instance.isAttended,
    };

VolunteerOpportunityDto _$VolunteerOpportunityDtoFromJson(Map json) =>
    VolunteerOpportunityDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      organizationId: json['organizationId'] as int?,
      organization: json['organization'] == null
          ? null
          : OrganizationDto.fromJson(
              Map<String, dynamic>.from(json['organization'] as Map)),
      title: json['title'] as String?,
      description: json['description'] as String?,
      natureOfWorkOrActivities: json['natureOfWorkOrActivities'] as String?,
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      logo: json['logo'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['logo'] as Map)),
      actualProgramStartDate: json['actualProgramStartDate'] == null
          ? null
          : DateTime.parse(json['actualProgramStartDate'] as String),
      actualProgramEndDate: json['actualProgramEndDate'] == null
          ? null
          : DateTime.parse(json['actualProgramEndDate'] as String),
      announcementEndDate: json['announcementEndDate'] == null
          ? null
          : DateTime.parse(json['announcementEndDate'] as String),
      receiveApplicationsEndDate: json['receiveApplicationsEndDate'] == null
          ? null
          : DateTime.parse(json['receiveApplicationsEndDate'] as String),
      requiredVolunteerStudentsNumber:
          json['requiredVolunteerStudentsNumber'] as int?,
      volunteerSkills: (json['volunteerSkills'] as List<dynamic>?)
              ?.map(
                  (e) => SkillDto.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      applicantQualifications: json['applicantQualifications'] as String?,
      isRequirementNeededAsText: json['isRequirementNeededAsText'] as bool?,
      isRequirementNeededAsFile: json['isRequirementNeededAsFile'] as bool?,
      requirementFileDescription: json['requirementFileDescription'] as String?,
      requirementFileMaxAllowedSize:
          (json['requirementFileMaxAllowedSize'] as num?)?.toDouble(),
      requirementFileAllowedTypes:
          json['requirementFileAllowedTypes'] as String?,
    );

Map<String, dynamic> _$VolunteerOpportunityDtoToJson(
        VolunteerOpportunityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'organizationId': instance.organizationId,
      'organization': instance.organization?.toJson(),
      'title': instance.title,
      'description': instance.description,
      'natureOfWorkOrActivities': instance.natureOfWorkOrActivities,
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'logo': instance.logo?.toJson(),
      'actualProgramStartDate':
          instance.actualProgramStartDate?.toIso8601String(),
      'actualProgramEndDate': instance.actualProgramEndDate?.toIso8601String(),
      'announcementEndDate': instance.announcementEndDate?.toIso8601String(),
      'receiveApplicationsEndDate':
          instance.receiveApplicationsEndDate?.toIso8601String(),
      'requiredVolunteerStudentsNumber':
          instance.requiredVolunteerStudentsNumber,
      'volunteerSkills':
          instance.volunteerSkills?.map((e) => e.toJson()).toList(),
      'applicantQualifications': instance.applicantQualifications,
      'isRequirementNeededAsText': instance.isRequirementNeededAsText,
      'isRequirementNeededAsFile': instance.isRequirementNeededAsFile,
      'requirementFileDescription': instance.requirementFileDescription,
      'requirementFileMaxAllowedSize': instance.requirementFileMaxAllowedSize,
      'requirementFileAllowedTypes': instance.requirementFileAllowedTypes,
    };

VolunteerProgramActivityDto _$VolunteerProgramActivityDtoFromJson(Map json) =>
    VolunteerProgramActivityDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int?,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) =>
                  SavedFileDto.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VolunteerProgramActivityDtoToJson(
        VolunteerProgramActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
    };

VolunteerProgramDto _$VolunteerProgramDtoFromJson(Map json) =>
    VolunteerProgramDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      isInternalProgram: json['isInternalProgram'] as bool?,
      organizationId: json['organizationId'] as int?,
      organization: json['organization'] == null
          ? null
          : OrganizationDto.fromJson(
              Map<String, dynamic>.from(json['organization'] as Map)),
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      categoryId: json['categoryId'] as int?,
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      logo: json['logo'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['logo'] as Map)),
    );

Map<String, dynamic> _$VolunteerProgramDtoToJson(
        VolunteerProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'isInternalProgram': instance.isInternalProgram,
      'organizationId': instance.organizationId,
      'organization': instance.organization?.toJson(),
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'categoryId': instance.categoryId,
      'category': instance.category?.toJson(),
      'logo': instance.logo?.toJson(),
    };

VolunteerProgramGalleryPhotoDto _$VolunteerProgramGalleryPhotoDtoFromJson(
        Map json) =>
    VolunteerProgramGalleryPhotoDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      isApproved: json['isApproved'] as bool?,
      photo: json['photo'] == null
          ? null
          : SavedFileDto.fromJson(
              Map<String, dynamic>.from(json['photo'] as Map)),
      volunteerProgramId: json['volunteerProgramId'] as int?,
      volunteerStudentUploaderId: json['volunteerStudentUploaderId'] as int?,
    );

Map<String, dynamic> _$VolunteerProgramGalleryPhotoDtoToJson(
        VolunteerProgramGalleryPhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'isApproved': instance.isApproved,
      'photo': instance.photo?.toJson(),
      'volunteerProgramId': instance.volunteerProgramId,
      'volunteerStudentUploaderId': instance.volunteerStudentUploaderId,
    };

VolunteerProgramTaskDto _$VolunteerProgramTaskDtoFromJson(Map json) =>
    VolunteerProgramTaskDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int?,
    );

Map<String, dynamic> _$VolunteerProgramTaskDtoToJson(
        VolunteerProgramTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
    };

VolunteerProgramWorkDayDto _$VolunteerProgramWorkDayDtoFromJson(Map json) =>
    VolunteerProgramWorkDayDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      volunteerProgramId: json['volunteerProgramId'] as int?,
    );

Map<String, dynamic> _$VolunteerProgramWorkDayDtoToJson(
        VolunteerProgramWorkDayDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'volunteerProgramId': instance.volunteerProgramId,
    };

VolunteerStudentActivityAttendanceDto
    _$VolunteerStudentActivityAttendanceDtoFromJson(Map json) =>
        VolunteerStudentActivityAttendanceDto(
          id: json['id'] as int?,
          createdDate: json['createdDate'] == null
              ? null
              : DateTime.parse(json['createdDate'] as String),
          isAttended: json['isAttended'] as bool?,
          volunteerStudentId: json['volunteerStudentId'] as int?,
          volunteerStudent: json['volunteerStudent'] == null
              ? null
              : VolunteerStudentDto.fromJson(
                  Map<String, dynamic>.from(json['volunteerStudent'] as Map)),
          volunteerProgramActivityId:
              json['volunteerProgramActivityId'] as int?,
          volunteerProgramActivity: json['volunteerProgramActivity'] == null
              ? null
              : VolunteerProgramActivityDto.fromJson(Map<String, dynamic>.from(
                  json['volunteerProgramActivity'] as Map)),
        );

Map<String, dynamic> _$VolunteerStudentActivityAttendanceDtoToJson(
        VolunteerStudentActivityAttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'isAttended': instance.isAttended,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerStudent': instance.volunteerStudent?.toJson(),
      'volunteerProgramActivityId': instance.volunteerProgramActivityId,
      'volunteerProgramActivity': instance.volunteerProgramActivity?.toJson(),
    };

VolunteerStudentDto _$VolunteerStudentDtoFromJson(Map json) =>
    VolunteerStudentDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      studentId: json['studentId'] as int?,
      student: json['student'] == null
          ? null
          : StudentDto.fromJson(
              Map<String, dynamic>.from(json['student'] as Map)),
      volunteerProgramId: json['volunteerProgramId'] as int?,
      volunteerProgram: json['volunteerProgram'] == null
          ? null
          : VolunteerProgramDto.fromJson(
              Map<String, dynamic>.from(json['volunteerProgram'] as Map)),
      orgAssessmentGrade: (json['orgAssessmentGrade'] as num?)?.toDouble(),
      orgAssessmentGradeNotes: json['orgAssessmentGradeNotes'] as String?,
      finalGrade: (json['finalGrade'] as num?)?.toDouble(),
      finalGradeNotes: json['finalGradeNotes'] as String?,
    );

Map<String, dynamic> _$VolunteerStudentDtoToJson(
        VolunteerStudentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'studentId': instance.studentId,
      'student': instance.student?.toJson(),
      'volunteerProgramId': instance.volunteerProgramId,
      'volunteerProgram': instance.volunteerProgram?.toJson(),
      'orgAssessmentGrade': instance.orgAssessmentGrade,
      'orgAssessmentGradeNotes': instance.orgAssessmentGradeNotes,
      'finalGrade': instance.finalGrade,
      'finalGradeNotes': instance.finalGradeNotes,
    };

VolunteerStudentTaskAccomplishDto _$VolunteerStudentTaskAccomplishDtoFromJson(
        Map json) =>
    VolunteerStudentTaskAccomplishDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      isAccomplished: json['isAccomplished'] as bool?,
      rate: (json['rate'] as num?)?.toDouble(),
      volunteerStudentId: json['volunteerStudentId'] as int?,
      volunteerStudent: json['volunteerStudent'] == null
          ? null
          : VolunteerStudentDto.fromJson(
              Map<String, dynamic>.from(json['volunteerStudent'] as Map)),
      volunteerProgramTaskId: json['volunteerProgramTaskId'] as int?,
      volunteerProgramTask: json['volunteerProgramTask'] == null
          ? null
          : VolunteerProgramTaskDto.fromJson(
              Map<String, dynamic>.from(json['volunteerProgramTask'] as Map)),
    );

Map<String, dynamic> _$VolunteerStudentTaskAccomplishDtoToJson(
        VolunteerStudentTaskAccomplishDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'isAccomplished': instance.isAccomplished,
      'rate': instance.rate,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerStudent': instance.volunteerStudent?.toJson(),
      'volunteerProgramTaskId': instance.volunteerProgramTaskId,
      'volunteerProgramTask': instance.volunteerProgramTask?.toJson(),
    };

VolunteerStudentWorkAttendanceDto _$VolunteerStudentWorkAttendanceDtoFromJson(
        Map json) =>
    VolunteerStudentWorkAttendanceDto(
      id: json['id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      isAttended: json['isAttended'] as bool?,
      volunteerStudentId: json['volunteerStudentId'] as int?,
      volunteerStudent: json['volunteerStudent'] == null
          ? null
          : VolunteerStudentDto.fromJson(
              Map<String, dynamic>.from(json['volunteerStudent'] as Map)),
      volunteerProgramWorkDayId: json['volunteerProgramWorkDayId'] as int?,
      volunteerProgramWorkDay: json['volunteerProgramWorkDay'] == null
          ? null
          : VolunteerProgramWorkDayDto.fromJson(Map<String, dynamic>.from(
              json['volunteerProgramWorkDay'] as Map)),
    );

Map<String, dynamic> _$VolunteerStudentWorkAttendanceDtoToJson(
        VolunteerStudentWorkAttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'isAttended': instance.isAttended,
      'volunteerStudentId': instance.volunteerStudentId,
      'volunteerStudent': instance.volunteerStudent?.toJson(),
      'volunteerProgramWorkDayId': instance.volunteerProgramWorkDayId,
      'volunteerProgramWorkDay': instance.volunteerProgramWorkDay?.toJson(),
    };
