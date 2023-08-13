// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'api.enums.swagger.dart' as enums;

part 'api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AnnouncementDto {
  AnnouncementDto({
    this.id,
    this.createdDate,
    this.title,
    this.description,
    this.image,
    this.isManagementAnnouncement,
    this.isOrganizationAnnouncement,
    this.organizationId,
    this.volunteerProgramId,
  });

  factory AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDtoFromJson(json);

  static const toJsonFactory = _$AnnouncementDtoToJson;
  Map<String, dynamic> toJson() => _$AnnouncementDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'image')
  final SavedFileDto? image;
  @JsonKey(name: 'isManagementAnnouncement')
  final bool? isManagementAnnouncement;
  @JsonKey(name: 'isOrganizationAnnouncement')
  final bool? isOrganizationAnnouncement;
  @JsonKey(name: 'organizationId')
  final int? organizationId;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  static const fromJsonFactory = _$AnnouncementDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AnnouncementDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(
                    other.isManagementAnnouncement, isManagementAnnouncement) ||
                const DeepCollectionEquality().equals(
                    other.isManagementAnnouncement,
                    isManagementAnnouncement)) &&
            (identical(other.isOrganizationAnnouncement,
                    isOrganizationAnnouncement) ||
                const DeepCollectionEquality().equals(
                    other.isOrganizationAnnouncement,
                    isOrganizationAnnouncement)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(isManagementAnnouncement) ^
      const DeepCollectionEquality().hash(isOrganizationAnnouncement) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $AnnouncementDtoExtension on AnnouncementDto {
  AnnouncementDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? title,
      String? description,
      SavedFileDto? image,
      bool? isManagementAnnouncement,
      bool? isOrganizationAnnouncement,
      int? organizationId,
      int? volunteerProgramId}) {
    return AnnouncementDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        isManagementAnnouncement:
            isManagementAnnouncement ?? this.isManagementAnnouncement,
        isOrganizationAnnouncement:
            isOrganizationAnnouncement ?? this.isOrganizationAnnouncement,
        organizationId: organizationId ?? this.organizationId,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  AnnouncementDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<SavedFileDto?>? image,
      Wrapped<bool?>? isManagementAnnouncement,
      Wrapped<bool?>? isOrganizationAnnouncement,
      Wrapped<int?>? organizationId,
      Wrapped<int?>? volunteerProgramId}) {
    return AnnouncementDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        image: (image != null ? image.value : this.image),
        isManagementAnnouncement: (isManagementAnnouncement != null
            ? isManagementAnnouncement.value
            : this.isManagementAnnouncement),
        isOrganizationAnnouncement: (isOrganizationAnnouncement != null
            ? isOrganizationAnnouncement.value
            : this.isOrganizationAnnouncement),
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiError {
  ApiError({
    this.errorTitle,
    this.errorMessage,
    this.errorDetails,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  static const toJsonFactory = _$ApiErrorToJson;
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @JsonKey(name: 'errorTitle')
  final String? errorTitle;
  @JsonKey(name: 'errorMessage')
  final String? errorMessage;
  @JsonKey(name: 'errorDetails')
  final String? errorDetails;
  static const fromJsonFactory = _$ApiErrorFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiError &&
            (identical(other.errorTitle, errorTitle) ||
                const DeepCollectionEquality()
                    .equals(other.errorTitle, errorTitle)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.errorDetails, errorDetails) ||
                const DeepCollectionEquality()
                    .equals(other.errorDetails, errorDetails)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(errorTitle) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(errorDetails) ^
      runtimeType.hashCode;
}

extension $ApiErrorExtension on ApiError {
  ApiError copyWith(
      {String? errorTitle, String? errorMessage, String? errorDetails}) {
    return ApiError(
        errorTitle: errorTitle ?? this.errorTitle,
        errorMessage: errorMessage ?? this.errorMessage,
        errorDetails: errorDetails ?? this.errorDetails);
  }

  ApiError copyWithWrapped(
      {Wrapped<String?>? errorTitle,
      Wrapped<String?>? errorMessage,
      Wrapped<String?>? errorDetails}) {
    return ApiError(
        errorTitle: (errorTitle != null ? errorTitle.value : this.errorTitle),
        errorMessage:
            (errorMessage != null ? errorMessage.value : this.errorMessage),
        errorDetails:
            (errorDetails != null ? errorDetails.value : this.errorDetails));
  }
}

@JsonSerializable(explicitToJson: true)
class ApplicationUser {
  ApplicationUser({
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.isDeleted,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.profilePicture,
    this.fcmToken,
  });

  factory ApplicationUser.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUserFromJson(json);

  static const toJsonFactory = _$ApplicationUserToJson;
  Map<String, dynamic> toJson() => _$ApplicationUserToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'normalizedUserName')
  final String? normalizedUserName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'normalizedEmail')
  final String? normalizedEmail;
  @JsonKey(name: 'emailConfirmed')
  final bool? emailConfirmed;
  @JsonKey(name: 'passwordHash')
  final String? passwordHash;
  @JsonKey(name: 'securityStamp')
  final String? securityStamp;
  @JsonKey(name: 'concurrencyStamp')
  final String? concurrencyStamp;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'phoneNumberConfirmed')
  final bool? phoneNumberConfirmed;
  @JsonKey(name: 'twoFactorEnabled')
  final bool? twoFactorEnabled;
  @JsonKey(name: 'lockoutEnd')
  final DateTime? lockoutEnd;
  @JsonKey(name: 'lockoutEnabled')
  final bool? lockoutEnabled;
  @JsonKey(name: 'accessFailedCount')
  final int? accessFailedCount;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'modifiedDate')
  final DateTime? modifiedDate;
  @JsonKey(name: 'createdBy')
  final int? createdBy;
  @JsonKey(name: 'modifiedBy')
  final int? modifiedBy;
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'profilePicture')
  final SavedFile? profilePicture;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$ApplicationUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplicationUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.normalizedUserName, normalizedUserName) ||
                const DeepCollectionEquality()
                    .equals(other.normalizedUserName, normalizedUserName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.normalizedEmail, normalizedEmail) ||
                const DeepCollectionEquality()
                    .equals(other.normalizedEmail, normalizedEmail)) &&
            (identical(other.emailConfirmed, emailConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.emailConfirmed, emailConfirmed)) &&
            (identical(other.passwordHash, passwordHash) ||
                const DeepCollectionEquality()
                    .equals(other.passwordHash, passwordHash)) &&
            (identical(other.securityStamp, securityStamp) ||
                const DeepCollectionEquality()
                    .equals(other.securityStamp, securityStamp)) &&
            (identical(other.concurrencyStamp, concurrencyStamp) ||
                const DeepCollectionEquality()
                    .equals(other.concurrencyStamp, concurrencyStamp)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.phoneNumberConfirmed, phoneNumberConfirmed) ||
                const DeepCollectionEquality().equals(
                    other.phoneNumberConfirmed, phoneNumberConfirmed)) &&
            (identical(other.twoFactorEnabled, twoFactorEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.twoFactorEnabled, twoFactorEnabled)) &&
            (identical(other.lockoutEnd, lockoutEnd) ||
                const DeepCollectionEquality()
                    .equals(other.lockoutEnd, lockoutEnd)) &&
            (identical(other.lockoutEnabled, lockoutEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.lockoutEnabled, lockoutEnabled)) &&
            (identical(other.accessFailedCount, accessFailedCount) ||
                const DeepCollectionEquality()
                    .equals(other.accessFailedCount, accessFailedCount)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.modifiedDate, modifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedDate, modifiedDate)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.modifiedBy, modifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedBy, modifiedBy)) &&
            (identical(other.isDeleted, isDeleted) ||
                const DeepCollectionEquality()
                    .equals(other.isDeleted, isDeleted)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality().equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) || const DeepCollectionEquality().equals(other.fullName, fullName)) &&
            (identical(other.profilePicture, profilePicture) || const DeepCollectionEquality().equals(other.profilePicture, profilePicture)) &&
            (identical(other.fcmToken, fcmToken) || const DeepCollectionEquality().equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(normalizedUserName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(normalizedEmail) ^
      const DeepCollectionEquality().hash(emailConfirmed) ^
      const DeepCollectionEquality().hash(passwordHash) ^
      const DeepCollectionEquality().hash(securityStamp) ^
      const DeepCollectionEquality().hash(concurrencyStamp) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(phoneNumberConfirmed) ^
      const DeepCollectionEquality().hash(twoFactorEnabled) ^
      const DeepCollectionEquality().hash(lockoutEnd) ^
      const DeepCollectionEquality().hash(lockoutEnabled) ^
      const DeepCollectionEquality().hash(accessFailedCount) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(modifiedDate) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(modifiedBy) ^
      const DeepCollectionEquality().hash(isDeleted) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $ApplicationUserExtension on ApplicationUser {
  ApplicationUser copyWith(
      {int? id,
      String? userName,
      String? normalizedUserName,
      String? email,
      String? normalizedEmail,
      bool? emailConfirmed,
      String? passwordHash,
      String? securityStamp,
      String? concurrencyStamp,
      String? phoneNumber,
      bool? phoneNumberConfirmed,
      bool? twoFactorEnabled,
      DateTime? lockoutEnd,
      bool? lockoutEnabled,
      int? accessFailedCount,
      DateTime? createdDate,
      DateTime? modifiedDate,
      int? createdBy,
      int? modifiedBy,
      bool? isDeleted,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      SavedFile? profilePicture,
      String? fcmToken}) {
    return ApplicationUser(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        normalizedUserName: normalizedUserName ?? this.normalizedUserName,
        email: email ?? this.email,
        normalizedEmail: normalizedEmail ?? this.normalizedEmail,
        emailConfirmed: emailConfirmed ?? this.emailConfirmed,
        passwordHash: passwordHash ?? this.passwordHash,
        securityStamp: securityStamp ?? this.securityStamp,
        concurrencyStamp: concurrencyStamp ?? this.concurrencyStamp,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneNumberConfirmed: phoneNumberConfirmed ?? this.phoneNumberConfirmed,
        twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
        lockoutEnd: lockoutEnd ?? this.lockoutEnd,
        lockoutEnabled: lockoutEnabled ?? this.lockoutEnabled,
        accessFailedCount: accessFailedCount ?? this.accessFailedCount,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        createdBy: createdBy ?? this.createdBy,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        isDeleted: isDeleted ?? this.isDeleted,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        profilePicture: profilePicture ?? this.profilePicture,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  ApplicationUser copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? userName,
      Wrapped<String?>? normalizedUserName,
      Wrapped<String?>? email,
      Wrapped<String?>? normalizedEmail,
      Wrapped<bool?>? emailConfirmed,
      Wrapped<String?>? passwordHash,
      Wrapped<String?>? securityStamp,
      Wrapped<String?>? concurrencyStamp,
      Wrapped<String?>? phoneNumber,
      Wrapped<bool?>? phoneNumberConfirmed,
      Wrapped<bool?>? twoFactorEnabled,
      Wrapped<DateTime?>? lockoutEnd,
      Wrapped<bool?>? lockoutEnabled,
      Wrapped<int?>? accessFailedCount,
      Wrapped<DateTime?>? createdDate,
      Wrapped<DateTime?>? modifiedDate,
      Wrapped<int?>? createdBy,
      Wrapped<int?>? modifiedBy,
      Wrapped<bool?>? isDeleted,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? fullName,
      Wrapped<SavedFile?>? profilePicture,
      Wrapped<String?>? fcmToken}) {
    return ApplicationUser(
        id: (id != null ? id.value : this.id),
        userName: (userName != null ? userName.value : this.userName),
        normalizedUserName: (normalizedUserName != null
            ? normalizedUserName.value
            : this.normalizedUserName),
        email: (email != null ? email.value : this.email),
        normalizedEmail: (normalizedEmail != null
            ? normalizedEmail.value
            : this.normalizedEmail),
        emailConfirmed: (emailConfirmed != null
            ? emailConfirmed.value
            : this.emailConfirmed),
        passwordHash:
            (passwordHash != null ? passwordHash.value : this.passwordHash),
        securityStamp:
            (securityStamp != null ? securityStamp.value : this.securityStamp),
        concurrencyStamp: (concurrencyStamp != null
            ? concurrencyStamp.value
            : this.concurrencyStamp),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        phoneNumberConfirmed: (phoneNumberConfirmed != null
            ? phoneNumberConfirmed.value
            : this.phoneNumberConfirmed),
        twoFactorEnabled: (twoFactorEnabled != null
            ? twoFactorEnabled.value
            : this.twoFactorEnabled),
        lockoutEnd: (lockoutEnd != null ? lockoutEnd.value : this.lockoutEnd),
        lockoutEnabled: (lockoutEnabled != null
            ? lockoutEnabled.value
            : this.lockoutEnabled),
        accessFailedCount: (accessFailedCount != null
            ? accessFailedCount.value
            : this.accessFailedCount),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        modifiedDate:
            (modifiedDate != null ? modifiedDate.value : this.modifiedDate),
        createdBy: (createdBy != null ? createdBy.value : this.createdBy),
        modifiedBy: (modifiedBy != null ? modifiedBy.value : this.modifiedBy),
        isDeleted: (isDeleted != null ? isDeleted.value : this.isDeleted),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        fullName: (fullName != null ? fullName.value : this.fullName),
        profilePicture: (profilePicture != null
            ? profilePicture.value
            : this.profilePicture),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class ApplicationUserDto {
  ApplicationUserDto({
    this.id,
    this.createdDate,
    this.userName,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.profilePicture,
    this.fcmToken,
  });

  factory ApplicationUserDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUserDtoFromJson(json);

  static const toJsonFactory = _$ApplicationUserDtoToJson;
  Map<String, dynamic> toJson() => _$ApplicationUserDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'profilePicture')
  final SavedFileDto? profilePicture;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$ApplicationUserDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplicationUserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $ApplicationUserDtoExtension on ApplicationUserDto {
  ApplicationUserDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      SavedFileDto? profilePicture,
      String? fcmToken}) {
    return ApplicationUserDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        profilePicture: profilePicture ?? this.profilePicture,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  ApplicationUserDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? fullName,
      Wrapped<SavedFileDto?>? profilePicture,
      Wrapped<String?>? fcmToken}) {
    return ApplicationUserDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        fullName: (fullName != null ? fullName.value : this.fullName),
        profilePicture: (profilePicture != null
            ? profilePicture.value
            : this.profilePicture),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthToken {
  AuthToken({
    this.token,
    this.expiration,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  static const toJsonFactory = _$AuthTokenToJson;
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'expiration')
  final DateTime? expiration;
  static const fromJsonFactory = _$AuthTokenFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthToken &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.expiration, expiration) ||
                const DeepCollectionEquality()
                    .equals(other.expiration, expiration)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(expiration) ^
      runtimeType.hashCode;
}

extension $AuthTokenExtension on AuthToken {
  AuthToken copyWith({String? token, DateTime? expiration}) {
    return AuthToken(
        token: token ?? this.token, expiration: expiration ?? this.expiration);
  }

  AuthToken copyWithWrapped(
      {Wrapped<String?>? token, Wrapped<DateTime?>? expiration}) {
    return AuthToken(
        token: (token != null ? token.value : this.token),
        expiration: (expiration != null ? expiration.value : this.expiration));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticateRequest {
  AuthenticateRequest({
    required this.userNameOrEmail,
    required this.password,
    this.fcmToken,
  });

  factory AuthenticateRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateRequestFromJson(json);

  static const toJsonFactory = _$AuthenticateRequestToJson;
  Map<String, dynamic> toJson() => _$AuthenticateRequestToJson(this);

  @JsonKey(name: 'userNameOrEmail')
  final String userNameOrEmail;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$AuthenticateRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticateRequest &&
            (identical(other.userNameOrEmail, userNameOrEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userNameOrEmail, userNameOrEmail)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userNameOrEmail) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $AuthenticateRequestExtension on AuthenticateRequest {
  AuthenticateRequest copyWith(
      {String? userNameOrEmail, String? password, String? fcmToken}) {
    return AuthenticateRequest(
        userNameOrEmail: userNameOrEmail ?? this.userNameOrEmail,
        password: password ?? this.password,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  AuthenticateRequest copyWithWrapped(
      {Wrapped<String>? userNameOrEmail,
      Wrapped<String>? password,
      Wrapped<String?>? fcmToken}) {
    return AuthenticateRequest(
        userNameOrEmail: (userNameOrEmail != null
            ? userNameOrEmail.value
            : this.userNameOrEmail),
        password: (password != null ? password.value : this.password),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  CategoryDto({
    this.id,
    this.createdDate,
    this.name,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CategoryDtoExtension on CategoryDto {
  CategoryDto copyWith({int? id, DateTime? createdDate, String? name}) {
    return CategoryDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name);
  }

  CategoryDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? name}) {
    return CategoryDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class ConversationDto {
  ConversationDto({
    this.id,
    this.createdDate,
    this.user1Id,
    this.user2Id,
    this.user1,
    this.user2,
  });

  factory ConversationDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationDtoFromJson(json);

  static const toJsonFactory = _$ConversationDtoToJson;
  Map<String, dynamic> toJson() => _$ConversationDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'user1Id')
  final int? user1Id;
  @JsonKey(name: 'user2Id')
  final int? user2Id;
  @JsonKey(name: 'user1')
  final ApplicationUserDto? user1;
  @JsonKey(name: 'user2')
  final ApplicationUserDto? user2;
  static const fromJsonFactory = _$ConversationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConversationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.user1Id, user1Id) ||
                const DeepCollectionEquality()
                    .equals(other.user1Id, user1Id)) &&
            (identical(other.user2Id, user2Id) ||
                const DeepCollectionEquality()
                    .equals(other.user2Id, user2Id)) &&
            (identical(other.user1, user1) ||
                const DeepCollectionEquality().equals(other.user1, user1)) &&
            (identical(other.user2, user2) ||
                const DeepCollectionEquality().equals(other.user2, user2)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(user1Id) ^
      const DeepCollectionEquality().hash(user2Id) ^
      const DeepCollectionEquality().hash(user1) ^
      const DeepCollectionEquality().hash(user2) ^
      runtimeType.hashCode;
}

extension $ConversationDtoExtension on ConversationDto {
  ConversationDto copyWith(
      {int? id,
      DateTime? createdDate,
      int? user1Id,
      int? user2Id,
      ApplicationUserDto? user1,
      ApplicationUserDto? user2}) {
    return ConversationDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        user1Id: user1Id ?? this.user1Id,
        user2Id: user2Id ?? this.user2Id,
        user1: user1 ?? this.user1,
        user2: user2 ?? this.user2);
  }

  ConversationDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<int?>? user1Id,
      Wrapped<int?>? user2Id,
      Wrapped<ApplicationUserDto?>? user1,
      Wrapped<ApplicationUserDto?>? user2}) {
    return ConversationDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        user1Id: (user1Id != null ? user1Id.value : this.user1Id),
        user2Id: (user2Id != null ? user2Id.value : this.user2Id),
        user1: (user1 != null ? user1.value : this.user1),
        user2: (user2 != null ? user2.value : this.user2));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateAnnouncementDto {
  CreateAnnouncementDto({
    required this.title,
    required this.description,
    this.saveTempFile,
    required this.isManagementAnnouncement,
    required this.isOrganizationAnnouncement,
    this.organizationId,
    this.volunteerProgramId,
  });

  factory CreateAnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAnnouncementDtoFromJson(json);

  static const toJsonFactory = _$CreateAnnouncementDtoToJson;
  Map<String, dynamic> toJson() => _$CreateAnnouncementDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'isManagementAnnouncement')
  final bool isManagementAnnouncement;
  @JsonKey(name: 'isOrganizationAnnouncement')
  final bool isOrganizationAnnouncement;
  @JsonKey(name: 'organizationId')
  final int? organizationId;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  static const fromJsonFactory = _$CreateAnnouncementDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateAnnouncementDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(
                    other.isManagementAnnouncement, isManagementAnnouncement) ||
                const DeepCollectionEquality().equals(
                    other.isManagementAnnouncement,
                    isManagementAnnouncement)) &&
            (identical(other.isOrganizationAnnouncement,
                    isOrganizationAnnouncement) ||
                const DeepCollectionEquality().equals(
                    other.isOrganizationAnnouncement,
                    isOrganizationAnnouncement)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(isManagementAnnouncement) ^
      const DeepCollectionEquality().hash(isOrganizationAnnouncement) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $CreateAnnouncementDtoExtension on CreateAnnouncementDto {
  CreateAnnouncementDto copyWith(
      {String? title,
      String? description,
      SaveTempFile? saveTempFile,
      bool? isManagementAnnouncement,
      bool? isOrganizationAnnouncement,
      int? organizationId,
      int? volunteerProgramId}) {
    return CreateAnnouncementDto(
        title: title ?? this.title,
        description: description ?? this.description,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        isManagementAnnouncement:
            isManagementAnnouncement ?? this.isManagementAnnouncement,
        isOrganizationAnnouncement:
            isOrganizationAnnouncement ?? this.isOrganizationAnnouncement,
        organizationId: organizationId ?? this.organizationId,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  CreateAnnouncementDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<bool>? isManagementAnnouncement,
      Wrapped<bool>? isOrganizationAnnouncement,
      Wrapped<int?>? organizationId,
      Wrapped<int?>? volunteerProgramId}) {
    return CreateAnnouncementDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        isManagementAnnouncement: (isManagementAnnouncement != null
            ? isManagementAnnouncement.value
            : this.isManagementAnnouncement),
        isOrganizationAnnouncement: (isOrganizationAnnouncement != null
            ? isOrganizationAnnouncement.value
            : this.isOrganizationAnnouncement),
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateCategoryDto {
  CreateCategoryDto({
    required this.name,
  });

  factory CreateCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDtoFromJson(json);

  static const toJsonFactory = _$CreateCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CreateCategoryDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$CreateCategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateCategoryDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CreateCategoryDtoExtension on CreateCategoryDto {
  CreateCategoryDto copyWith({String? name}) {
    return CreateCategoryDto(name: name ?? this.name);
  }

  CreateCategoryDto copyWithWrapped({Wrapped<String>? name}) {
    return CreateCategoryDto(name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateGalleryPhotoByStudentDto {
  CreateGalleryPhotoByStudentDto({
    required this.saveTempFile,
    required this.volunteerProgramId,
    required this.volunteerStudentUploaderId,
  });

  factory CreateGalleryPhotoByStudentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateGalleryPhotoByStudentDtoFromJson(json);

  static const toJsonFactory = _$CreateGalleryPhotoByStudentDtoToJson;
  Map<String, dynamic> toJson() => _$CreateGalleryPhotoByStudentDtoToJson(this);

  @JsonKey(name: 'saveTempFile')
  final SaveTempFile saveTempFile;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  @JsonKey(name: 'volunteerStudentUploaderId')
  final int volunteerStudentUploaderId;
  static const fromJsonFactory = _$CreateGalleryPhotoByStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateGalleryPhotoByStudentDto &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)) &&
            (identical(other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      const DeepCollectionEquality().hash(volunteerStudentUploaderId) ^
      runtimeType.hashCode;
}

extension $CreateGalleryPhotoByStudentDtoExtension
    on CreateGalleryPhotoByStudentDto {
  CreateGalleryPhotoByStudentDto copyWith(
      {SaveTempFile? saveTempFile,
      int? volunteerProgramId,
      int? volunteerStudentUploaderId}) {
    return CreateGalleryPhotoByStudentDto(
        saveTempFile: saveTempFile ?? this.saveTempFile,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId,
        volunteerStudentUploaderId:
            volunteerStudentUploaderId ?? this.volunteerStudentUploaderId);
  }

  CreateGalleryPhotoByStudentDto copyWithWrapped(
      {Wrapped<SaveTempFile>? saveTempFile,
      Wrapped<int>? volunteerProgramId,
      Wrapped<int>? volunteerStudentUploaderId}) {
    return CreateGalleryPhotoByStudentDto(
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId),
        volunteerStudentUploaderId: (volunteerStudentUploaderId != null
            ? volunteerStudentUploaderId.value
            : this.volunteerStudentUploaderId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateGalleryPhotoDto {
  CreateGalleryPhotoDto({
    required this.saveTempFile,
    required this.volunteerProgramId,
  });

  factory CreateGalleryPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$CreateGalleryPhotoDtoFromJson(json);

  static const toJsonFactory = _$CreateGalleryPhotoDtoToJson;
  Map<String, dynamic> toJson() => _$CreateGalleryPhotoDtoToJson(this);

  @JsonKey(name: 'saveTempFile')
  final SaveTempFile saveTempFile;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  static const fromJsonFactory = _$CreateGalleryPhotoDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateGalleryPhotoDto &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $CreateGalleryPhotoDtoExtension on CreateGalleryPhotoDto {
  CreateGalleryPhotoDto copyWith(
      {SaveTempFile? saveTempFile, int? volunteerProgramId}) {
    return CreateGalleryPhotoDto(
        saveTempFile: saveTempFile ?? this.saveTempFile,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  CreateGalleryPhotoDto copyWithWrapped(
      {Wrapped<SaveTempFile>? saveTempFile, Wrapped<int>? volunteerProgramId}) {
    return CreateGalleryPhotoDto(
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateInternalVolunteerProgramDto {
  CreateInternalVolunteerProgramDto({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.categoryId,
    this.category,
    this.saveTempFile,
  });

  factory CreateInternalVolunteerProgramDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInternalVolunteerProgramDtoFromJson(json);

  static const toJsonFactory = _$CreateInternalVolunteerProgramDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateInternalVolunteerProgramDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'startDate')
  final DateTime startDate;
  @JsonKey(name: 'endDate')
  final DateTime endDate;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$CreateInternalVolunteerProgramDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateInternalVolunteerProgramDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $CreateInternalVolunteerProgramDtoExtension
    on CreateInternalVolunteerProgramDto {
  CreateInternalVolunteerProgramDto copyWith(
      {String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile}) {
    return CreateInternalVolunteerProgramDto(
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  CreateInternalVolunteerProgramDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? startDate,
      Wrapped<DateTime>? endDate,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return CreateInternalVolunteerProgramDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateManagementEmployeeDto {
  CreateManagementEmployeeDto({
    required this.userName,
    this.email,
    this.phoneNumber,
    required this.password,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.saveTempFile,
    this.fcmToken,
  });

  factory CreateManagementEmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$CreateManagementEmployeeDtoFromJson(json);

  static const toJsonFactory = _$CreateManagementEmployeeDtoToJson;
  Map<String, dynamic> toJson() => _$CreateManagementEmployeeDtoToJson(this);

  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$CreateManagementEmployeeDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateManagementEmployeeDto &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $CreateManagementEmployeeDtoExtension on CreateManagementEmployeeDto {
  CreateManagementEmployeeDto copyWith(
      {String? userName,
      String? email,
      String? phoneNumber,
      String? password,
      String? firstName,
      String? middleName,
      String? lastName,
      SaveTempFile? saveTempFile,
      String? fcmToken}) {
    return CreateManagementEmployeeDto(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  CreateManagementEmployeeDto copyWithWrapped(
      {Wrapped<String>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String>? password,
      Wrapped<String>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String>? lastName,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<String?>? fcmToken}) {
    return CreateManagementEmployeeDto(
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        password: (password != null ? password.value : this.password),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateMessageDto {
  CreateMessageDto({
    required this.senderId,
    required this.receiverId,
    required this.content,
    this.conversationId,
  });

  factory CreateMessageDto.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageDtoFromJson(json);

  static const toJsonFactory = _$CreateMessageDtoToJson;
  Map<String, dynamic> toJson() => _$CreateMessageDtoToJson(this);

  @JsonKey(name: 'senderId')
  final int senderId;
  @JsonKey(name: 'receiverId')
  final int receiverId;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'conversationId')
  final int? conversationId;
  static const fromJsonFactory = _$CreateMessageDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateMessageDto &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.receiverId, receiverId) ||
                const DeepCollectionEquality()
                    .equals(other.receiverId, receiverId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.conversationId, conversationId) ||
                const DeepCollectionEquality()
                    .equals(other.conversationId, conversationId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(receiverId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(conversationId) ^
      runtimeType.hashCode;
}

extension $CreateMessageDtoExtension on CreateMessageDto {
  CreateMessageDto copyWith(
      {int? senderId, int? receiverId, String? content, int? conversationId}) {
    return CreateMessageDto(
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        content: content ?? this.content,
        conversationId: conversationId ?? this.conversationId);
  }

  CreateMessageDto copyWithWrapped(
      {Wrapped<int>? senderId,
      Wrapped<int>? receiverId,
      Wrapped<String>? content,
      Wrapped<int?>? conversationId}) {
    return CreateMessageDto(
        senderId: (senderId != null ? senderId.value : this.senderId),
        receiverId: (receiverId != null ? receiverId.value : this.receiverId),
        content: (content != null ? content.value : this.content),
        conversationId: (conversationId != null
            ? conversationId.value
            : this.conversationId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateOrganizationDto {
  CreateOrganizationDto({
    required this.userName,
    this.email,
    this.phoneNumber,
    required this.password,
    required this.orgNameLocal,
    this.orgNameForeign,
    required this.fieldOfWork,
    required this.about,
    this.vision,
    this.mission,
    this.address,
    this.saveTempFile,
    this.fcmToken,
  });

  factory CreateOrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrganizationDtoFromJson(json);

  static const toJsonFactory = _$CreateOrganizationDtoToJson;
  Map<String, dynamic> toJson() => _$CreateOrganizationDtoToJson(this);

  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'orgNameLocal')
  final String orgNameLocal;
  @JsonKey(name: 'orgNameForeign')
  final String? orgNameForeign;
  @JsonKey(name: 'fieldOfWork')
  final String fieldOfWork;
  @JsonKey(name: 'about')
  final String about;
  @JsonKey(name: 'vision')
  final String? vision;
  @JsonKey(name: 'mission')
  final String? mission;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$CreateOrganizationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateOrganizationDto &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.orgNameLocal, orgNameLocal) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameLocal, orgNameLocal)) &&
            (identical(other.orgNameForeign, orgNameForeign) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameForeign, orgNameForeign)) &&
            (identical(other.fieldOfWork, fieldOfWork) ||
                const DeepCollectionEquality()
                    .equals(other.fieldOfWork, fieldOfWork)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.vision, vision) ||
                const DeepCollectionEquality().equals(other.vision, vision)) &&
            (identical(other.mission, mission) ||
                const DeepCollectionEquality()
                    .equals(other.mission, mission)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(orgNameLocal) ^
      const DeepCollectionEquality().hash(orgNameForeign) ^
      const DeepCollectionEquality().hash(fieldOfWork) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(vision) ^
      const DeepCollectionEquality().hash(mission) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $CreateOrganizationDtoExtension on CreateOrganizationDto {
  CreateOrganizationDto copyWith(
      {String? userName,
      String? email,
      String? phoneNumber,
      String? password,
      String? orgNameLocal,
      String? orgNameForeign,
      String? fieldOfWork,
      String? about,
      String? vision,
      String? mission,
      String? address,
      SaveTempFile? saveTempFile,
      String? fcmToken}) {
    return CreateOrganizationDto(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        orgNameLocal: orgNameLocal ?? this.orgNameLocal,
        orgNameForeign: orgNameForeign ?? this.orgNameForeign,
        fieldOfWork: fieldOfWork ?? this.fieldOfWork,
        about: about ?? this.about,
        vision: vision ?? this.vision,
        mission: mission ?? this.mission,
        address: address ?? this.address,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  CreateOrganizationDto copyWithWrapped(
      {Wrapped<String>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String>? password,
      Wrapped<String>? orgNameLocal,
      Wrapped<String?>? orgNameForeign,
      Wrapped<String>? fieldOfWork,
      Wrapped<String>? about,
      Wrapped<String?>? vision,
      Wrapped<String?>? mission,
      Wrapped<String?>? address,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<String?>? fcmToken}) {
    return CreateOrganizationDto(
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        password: (password != null ? password.value : this.password),
        orgNameLocal:
            (orgNameLocal != null ? orgNameLocal.value : this.orgNameLocal),
        orgNameForeign: (orgNameForeign != null
            ? orgNameForeign.value
            : this.orgNameForeign),
        fieldOfWork:
            (fieldOfWork != null ? fieldOfWork.value : this.fieldOfWork),
        about: (about != null ? about.value : this.about),
        vision: (vision != null ? vision.value : this.vision),
        mission: (mission != null ? mission.value : this.mission),
        address: (address != null ? address.value : this.address),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateSkillDto {
  CreateSkillDto({
    required this.name,
    this.categoryId,
    this.category,
  });

  factory CreateSkillDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSkillDtoFromJson(json);

  static const toJsonFactory = _$CreateSkillDtoToJson;
  Map<String, dynamic> toJson() => _$CreateSkillDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  static const fromJsonFactory = _$CreateSkillDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateSkillDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      runtimeType.hashCode;
}

extension $CreateSkillDtoExtension on CreateSkillDto {
  CreateSkillDto copyWith(
      {String? name, int? categoryId, CreateCategoryDto? category}) {
    return CreateSkillDto(
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category);
  }

  CreateSkillDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category}) {
    return CreateSkillDto(
        name: (name != null ? name.value : this.name),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateStudentApplicationDto {
  CreateStudentApplicationDto({
    required this.studentId,
    required this.volunteerOpportunityId,
    this.textInformation,
    this.saveTempFile,
  });

  factory CreateStudentApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$CreateStudentApplicationDtoFromJson(json);

  static const toJsonFactory = _$CreateStudentApplicationDtoToJson;
  Map<String, dynamic> toJson() => _$CreateStudentApplicationDtoToJson(this);

  @JsonKey(name: 'studentId')
  final int studentId;
  @JsonKey(name: 'volunteerOpportunityId')
  final int volunteerOpportunityId;
  @JsonKey(name: 'textInformation')
  final String? textInformation;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$CreateStudentApplicationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateStudentApplicationDto &&
            (identical(other.studentId, studentId) ||
                const DeepCollectionEquality()
                    .equals(other.studentId, studentId)) &&
            (identical(other.volunteerOpportunityId, volunteerOpportunityId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerOpportunityId, volunteerOpportunityId)) &&
            (identical(other.textInformation, textInformation) ||
                const DeepCollectionEquality()
                    .equals(other.textInformation, textInformation)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studentId) ^
      const DeepCollectionEquality().hash(volunteerOpportunityId) ^
      const DeepCollectionEquality().hash(textInformation) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $CreateStudentApplicationDtoExtension on CreateStudentApplicationDto {
  CreateStudentApplicationDto copyWith(
      {int? studentId,
      int? volunteerOpportunityId,
      String? textInformation,
      SaveTempFile? saveTempFile}) {
    return CreateStudentApplicationDto(
        studentId: studentId ?? this.studentId,
        volunteerOpportunityId:
            volunteerOpportunityId ?? this.volunteerOpportunityId,
        textInformation: textInformation ?? this.textInformation,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  CreateStudentApplicationDto copyWithWrapped(
      {Wrapped<int>? studentId,
      Wrapped<int>? volunteerOpportunityId,
      Wrapped<String?>? textInformation,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return CreateStudentApplicationDto(
        studentId: (studentId != null ? studentId.value : this.studentId),
        volunteerOpportunityId: (volunteerOpportunityId != null
            ? volunteerOpportunityId.value
            : this.volunteerOpportunityId),
        textInformation: (textInformation != null
            ? textInformation.value
            : this.textInformation),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateStudentDto {
  CreateStudentDto({
    required this.universityIdNumber,
    required this.userName,
    this.email,
    this.phoneNumber,
    required this.password,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.specialization,
    this.address,
    this.dateOfBirth,
    this.biography,
    this.saveTempFile,
    this.fcmToken,
  });

  factory CreateStudentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateStudentDtoFromJson(json);

  static const toJsonFactory = _$CreateStudentDtoToJson;
  Map<String, dynamic> toJson() => _$CreateStudentDtoToJson(this);

  @JsonKey(name: 'universityIdNumber')
  final int universityIdNumber;
  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'specialization')
  final String? specialization;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$CreateStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateStudentDto &&
            (identical(other.universityIdNumber, universityIdNumber) ||
                const DeepCollectionEquality()
                    .equals(other.universityIdNumber, universityIdNumber)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.biography, biography) ||
                const DeepCollectionEquality()
                    .equals(other.biography, biography)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(universityIdNumber) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(biography) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $CreateStudentDtoExtension on CreateStudentDto {
  CreateStudentDto copyWith(
      {int? universityIdNumber,
      String? userName,
      String? email,
      String? phoneNumber,
      String? password,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specialization,
      String? address,
      DateTime? dateOfBirth,
      String? biography,
      SaveTempFile? saveTempFile,
      String? fcmToken}) {
    return CreateStudentDto(
        universityIdNumber: universityIdNumber ?? this.universityIdNumber,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        specialization: specialization ?? this.specialization,
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        biography: biography ?? this.biography,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  CreateStudentDto copyWithWrapped(
      {Wrapped<int>? universityIdNumber,
      Wrapped<String>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String>? password,
      Wrapped<String>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String>? lastName,
      Wrapped<String?>? specialization,
      Wrapped<String?>? address,
      Wrapped<DateTime?>? dateOfBirth,
      Wrapped<String?>? biography,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<String?>? fcmToken}) {
    return CreateStudentDto(
        universityIdNumber: (universityIdNumber != null
            ? universityIdNumber.value
            : this.universityIdNumber),
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        password: (password != null ? password.value : this.password),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        address: (address != null ? address.value : this.address),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth),
        biography: (biography != null ? biography.value : this.biography),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerOpportunityDto {
  CreateVolunteerOpportunityDto({
    required this.organizationId,
    required this.title,
    required this.description,
    required this.natureOfWorkOrActivities,
    this.categoryId,
    this.category,
    this.saveTempFile,
    required this.actualProgramStartDate,
    required this.actualProgramEndDate,
    this.announcementEndDate,
    required this.receiveApplicationsEndDate,
    required this.requiredVolunteerStudentsNumber,
    this.volunteerSkills,
    this.applicantQualifications,
    required this.isRequirementNeededAsText,
    required this.isRequirementNeededAsFile,
    this.requirementFileDescription,
    this.requirementFileMaxAllowedSize,
    this.requirementFileAllowedTypes,
  });

  factory CreateVolunteerOpportunityDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerOpportunityDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerOpportunityDtoToJson;
  Map<String, dynamic> toJson() => _$CreateVolunteerOpportunityDtoToJson(this);

  @JsonKey(name: 'organizationId')
  final int organizationId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'natureOfWorkOrActivities')
  final String natureOfWorkOrActivities;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'actualProgramStartDate')
  final DateTime actualProgramStartDate;
  @JsonKey(name: 'actualProgramEndDate')
  final DateTime actualProgramEndDate;
  @JsonKey(name: 'announcementEndDate')
  final DateTime? announcementEndDate;
  @JsonKey(name: 'receiveApplicationsEndDate')
  final DateTime receiveApplicationsEndDate;
  @JsonKey(name: 'requiredVolunteerStudentsNumber')
  final int requiredVolunteerStudentsNumber;
  @JsonKey(
      name: 'volunteerSkills', defaultValue: <ExistingOrCreateNewSkillDto>[])
  final List<ExistingOrCreateNewSkillDto>? volunteerSkills;
  @JsonKey(name: 'applicantQualifications')
  final String? applicantQualifications;
  @JsonKey(name: 'isRequirementNeededAsText')
  final bool isRequirementNeededAsText;
  @JsonKey(name: 'isRequirementNeededAsFile')
  final bool isRequirementNeededAsFile;
  @JsonKey(name: 'requirementFileDescription')
  final String? requirementFileDescription;
  @JsonKey(name: 'requirementFileMaxAllowedSize')
  final double? requirementFileMaxAllowedSize;
  @JsonKey(name: 'requirementFileAllowedTypes')
  final String? requirementFileAllowedTypes;
  static const fromJsonFactory = _$CreateVolunteerOpportunityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerOpportunityDto &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.natureOfWorkOrActivities, natureOfWorkOrActivities) ||
                const DeepCollectionEquality().equals(
                    other.natureOfWorkOrActivities,
                    natureOfWorkOrActivities)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.actualProgramStartDate, actualProgramStartDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramStartDate, actualProgramStartDate)) &&
            (identical(other.actualProgramEndDate, actualProgramEndDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramEndDate, actualProgramEndDate)) &&
            (identical(other.announcementEndDate, announcementEndDate) ||
                const DeepCollectionEquality()
                    .equals(other.announcementEndDate, announcementEndDate)) &&
            (identical(other.receiveApplicationsEndDate, receiveApplicationsEndDate) ||
                const DeepCollectionEquality().equals(
                    other.receiveApplicationsEndDate,
                    receiveApplicationsEndDate)) &&
            (identical(other.requiredVolunteerStudentsNumber, requiredVolunteerStudentsNumber) ||
                const DeepCollectionEquality().equals(
                    other.requiredVolunteerStudentsNumber,
                    requiredVolunteerStudentsNumber)) &&
            (identical(other.volunteerSkills, volunteerSkills) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerSkills, volunteerSkills)) &&
            (identical(other.applicantQualifications, applicantQualifications) ||
                const DeepCollectionEquality().equals(
                    other.applicantQualifications, applicantQualifications)) &&
            (identical(other.isRequirementNeededAsText, isRequirementNeededAsText) ||
                const DeepCollectionEquality().equals(other.isRequirementNeededAsText, isRequirementNeededAsText)) &&
            (identical(other.isRequirementNeededAsFile, isRequirementNeededAsFile) || const DeepCollectionEquality().equals(other.isRequirementNeededAsFile, isRequirementNeededAsFile)) &&
            (identical(other.requirementFileDescription, requirementFileDescription) || const DeepCollectionEquality().equals(other.requirementFileDescription, requirementFileDescription)) &&
            (identical(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize) || const DeepCollectionEquality().equals(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize)) &&
            (identical(other.requirementFileAllowedTypes, requirementFileAllowedTypes) || const DeepCollectionEquality().equals(other.requirementFileAllowedTypes, requirementFileAllowedTypes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(natureOfWorkOrActivities) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(actualProgramStartDate) ^
      const DeepCollectionEquality().hash(actualProgramEndDate) ^
      const DeepCollectionEquality().hash(announcementEndDate) ^
      const DeepCollectionEquality().hash(receiveApplicationsEndDate) ^
      const DeepCollectionEquality().hash(requiredVolunteerStudentsNumber) ^
      const DeepCollectionEquality().hash(volunteerSkills) ^
      const DeepCollectionEquality().hash(applicantQualifications) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsText) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsFile) ^
      const DeepCollectionEquality().hash(requirementFileDescription) ^
      const DeepCollectionEquality().hash(requirementFileMaxAllowedSize) ^
      const DeepCollectionEquality().hash(requirementFileAllowedTypes) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerOpportunityDtoExtension
    on CreateVolunteerOpportunityDto {
  CreateVolunteerOpportunityDto copyWith(
      {int? organizationId,
      String? title,
      String? description,
      String? natureOfWorkOrActivities,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile,
      DateTime? actualProgramStartDate,
      DateTime? actualProgramEndDate,
      DateTime? announcementEndDate,
      DateTime? receiveApplicationsEndDate,
      int? requiredVolunteerStudentsNumber,
      List<ExistingOrCreateNewSkillDto>? volunteerSkills,
      String? applicantQualifications,
      bool? isRequirementNeededAsText,
      bool? isRequirementNeededAsFile,
      String? requirementFileDescription,
      double? requirementFileMaxAllowedSize,
      String? requirementFileAllowedTypes}) {
    return CreateVolunteerOpportunityDto(
        organizationId: organizationId ?? this.organizationId,
        title: title ?? this.title,
        description: description ?? this.description,
        natureOfWorkOrActivities:
            natureOfWorkOrActivities ?? this.natureOfWorkOrActivities,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        actualProgramStartDate:
            actualProgramStartDate ?? this.actualProgramStartDate,
        actualProgramEndDate: actualProgramEndDate ?? this.actualProgramEndDate,
        announcementEndDate: announcementEndDate ?? this.announcementEndDate,
        receiveApplicationsEndDate:
            receiveApplicationsEndDate ?? this.receiveApplicationsEndDate,
        requiredVolunteerStudentsNumber: requiredVolunteerStudentsNumber ??
            this.requiredVolunteerStudentsNumber,
        volunteerSkills: volunteerSkills ?? this.volunteerSkills,
        applicantQualifications:
            applicantQualifications ?? this.applicantQualifications,
        isRequirementNeededAsText:
            isRequirementNeededAsText ?? this.isRequirementNeededAsText,
        isRequirementNeededAsFile:
            isRequirementNeededAsFile ?? this.isRequirementNeededAsFile,
        requirementFileDescription:
            requirementFileDescription ?? this.requirementFileDescription,
        requirementFileMaxAllowedSize:
            requirementFileMaxAllowedSize ?? this.requirementFileMaxAllowedSize,
        requirementFileAllowedTypes:
            requirementFileAllowedTypes ?? this.requirementFileAllowedTypes);
  }

  CreateVolunteerOpportunityDto copyWithWrapped(
      {Wrapped<int>? organizationId,
      Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<String>? natureOfWorkOrActivities,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<DateTime>? actualProgramStartDate,
      Wrapped<DateTime>? actualProgramEndDate,
      Wrapped<DateTime?>? announcementEndDate,
      Wrapped<DateTime>? receiveApplicationsEndDate,
      Wrapped<int>? requiredVolunteerStudentsNumber,
      Wrapped<List<ExistingOrCreateNewSkillDto>?>? volunteerSkills,
      Wrapped<String?>? applicantQualifications,
      Wrapped<bool>? isRequirementNeededAsText,
      Wrapped<bool>? isRequirementNeededAsFile,
      Wrapped<String?>? requirementFileDescription,
      Wrapped<double?>? requirementFileMaxAllowedSize,
      Wrapped<String?>? requirementFileAllowedTypes}) {
    return CreateVolunteerOpportunityDto(
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        natureOfWorkOrActivities: (natureOfWorkOrActivities != null
            ? natureOfWorkOrActivities.value
            : this.natureOfWorkOrActivities),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        actualProgramStartDate: (actualProgramStartDate != null
            ? actualProgramStartDate.value
            : this.actualProgramStartDate),
        actualProgramEndDate: (actualProgramEndDate != null
            ? actualProgramEndDate.value
            : this.actualProgramEndDate),
        announcementEndDate: (announcementEndDate != null
            ? announcementEndDate.value
            : this.announcementEndDate),
        receiveApplicationsEndDate: (receiveApplicationsEndDate != null
            ? receiveApplicationsEndDate.value
            : this.receiveApplicationsEndDate),
        requiredVolunteerStudentsNumber:
            (requiredVolunteerStudentsNumber != null
                ? requiredVolunteerStudentsNumber.value
                : this.requiredVolunteerStudentsNumber),
        volunteerSkills: (volunteerSkills != null
            ? volunteerSkills.value
            : this.volunteerSkills),
        applicantQualifications: (applicantQualifications != null
            ? applicantQualifications.value
            : this.applicantQualifications),
        isRequirementNeededAsText: (isRequirementNeededAsText != null
            ? isRequirementNeededAsText.value
            : this.isRequirementNeededAsText),
        isRequirementNeededAsFile: (isRequirementNeededAsFile != null
            ? isRequirementNeededAsFile.value
            : this.isRequirementNeededAsFile),
        requirementFileDescription: (requirementFileDescription != null
            ? requirementFileDescription.value
            : this.requirementFileDescription),
        requirementFileMaxAllowedSize: (requirementFileMaxAllowedSize != null
            ? requirementFileMaxAllowedSize.value
            : this.requirementFileMaxAllowedSize),
        requirementFileAllowedTypes: (requirementFileAllowedTypes != null
            ? requirementFileAllowedTypes.value
            : this.requirementFileAllowedTypes));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerProgramActivityDto {
  CreateVolunteerProgramActivityDto({
    required this.title,
    required this.description,
    required this.startDate,
    this.endDate,
    required this.volunteerProgramId,
    this.saveTempFiles,
  });

  factory CreateVolunteerProgramActivityDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVolunteerProgramActivityDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerProgramActivityDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateVolunteerProgramActivityDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'startDate')
  final DateTime startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  @JsonKey(name: 'saveTempFiles', defaultValue: <SaveTempFile>[])
  final List<SaveTempFile>? saveTempFiles;
  static const fromJsonFactory = _$CreateVolunteerProgramActivityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerProgramActivityDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)) &&
            (identical(other.saveTempFiles, saveTempFiles) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFiles, saveTempFiles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      const DeepCollectionEquality().hash(saveTempFiles) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerProgramActivityDtoExtension
    on CreateVolunteerProgramActivityDto {
  CreateVolunteerProgramActivityDto copyWith(
      {String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? volunteerProgramId,
      List<SaveTempFile>? saveTempFiles}) {
    return CreateVolunteerProgramActivityDto(
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId,
        saveTempFiles: saveTempFiles ?? this.saveTempFiles);
  }

  CreateVolunteerProgramActivityDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int>? volunteerProgramId,
      Wrapped<List<SaveTempFile>?>? saveTempFiles}) {
    return CreateVolunteerProgramActivityDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId),
        saveTempFiles:
            (saveTempFiles != null ? saveTempFiles.value : this.saveTempFiles));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerProgramDto {
  CreateVolunteerProgramDto({
    required this.organizationId,
    this.volunteerOpportunityId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.categoryId,
    this.category,
    this.saveTempFile,
  });

  factory CreateVolunteerProgramDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerProgramDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerProgramDtoToJson;
  Map<String, dynamic> toJson() => _$CreateVolunteerProgramDtoToJson(this);

  @JsonKey(name: 'organizationId')
  final int organizationId;
  @JsonKey(name: 'volunteerOpportunityId')
  final int? volunteerOpportunityId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'startDate')
  final DateTime startDate;
  @JsonKey(name: 'endDate')
  final DateTime endDate;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$CreateVolunteerProgramDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerProgramDto &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.volunteerOpportunityId, volunteerOpportunityId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerOpportunityId, volunteerOpportunityId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(volunteerOpportunityId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerProgramDtoExtension on CreateVolunteerProgramDto {
  CreateVolunteerProgramDto copyWith(
      {int? organizationId,
      int? volunteerOpportunityId,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile}) {
    return CreateVolunteerProgramDto(
        organizationId: organizationId ?? this.organizationId,
        volunteerOpportunityId:
            volunteerOpportunityId ?? this.volunteerOpportunityId,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  CreateVolunteerProgramDto copyWithWrapped(
      {Wrapped<int>? organizationId,
      Wrapped<int?>? volunteerOpportunityId,
      Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? startDate,
      Wrapped<DateTime>? endDate,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return CreateVolunteerProgramDto(
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        volunteerOpportunityId: (volunteerOpportunityId != null
            ? volunteerOpportunityId.value
            : this.volunteerOpportunityId),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerProgramTaskDto {
  CreateVolunteerProgramTaskDto({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.volunteerProgramId,
  });

  factory CreateVolunteerProgramTaskDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerProgramTaskDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerProgramTaskDtoToJson;
  Map<String, dynamic> toJson() => _$CreateVolunteerProgramTaskDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'startDate')
  final DateTime startDate;
  @JsonKey(name: 'endDate')
  final DateTime endDate;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  static const fromJsonFactory = _$CreateVolunteerProgramTaskDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerProgramTaskDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerProgramTaskDtoExtension
    on CreateVolunteerProgramTaskDto {
  CreateVolunteerProgramTaskDto copyWith(
      {String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? volunteerProgramId}) {
    return CreateVolunteerProgramTaskDto(
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  CreateVolunteerProgramTaskDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? startDate,
      Wrapped<DateTime>? endDate,
      Wrapped<int>? volunteerProgramId}) {
    return CreateVolunteerProgramTaskDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerProgramWorkDayDto {
  CreateVolunteerProgramWorkDayDto({
    required this.name,
    required this.date,
    required this.volunteerProgramId,
  });

  factory CreateVolunteerProgramWorkDayDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVolunteerProgramWorkDayDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerProgramWorkDayDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateVolunteerProgramWorkDayDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  static const fromJsonFactory = _$CreateVolunteerProgramWorkDayDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerProgramWorkDayDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerProgramWorkDayDtoExtension
    on CreateVolunteerProgramWorkDayDto {
  CreateVolunteerProgramWorkDayDto copyWith(
      {String? name, DateTime? date, int? volunteerProgramId}) {
    return CreateVolunteerProgramWorkDayDto(
        name: name ?? this.name,
        date: date ?? this.date,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  CreateVolunteerProgramWorkDayDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<DateTime>? date,
      Wrapped<int>? volunteerProgramId}) {
    return CreateVolunteerProgramWorkDayDto(
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerStudentActivityAttendanceDto {
  CreateVolunteerStudentActivityAttendanceDto({
    required this.isAttended,
    required this.volunteerStudentId,
    required this.volunteerProgramActivityId,
  });

  factory CreateVolunteerStudentActivityAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVolunteerStudentActivityAttendanceDtoFromJson(json);

  static const toJsonFactory =
      _$CreateVolunteerStudentActivityAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateVolunteerStudentActivityAttendanceDtoToJson(this);

  @JsonKey(name: 'isAttended')
  final bool isAttended;
  @JsonKey(name: 'volunteerStudentId')
  final int volunteerStudentId;
  @JsonKey(name: 'volunteerProgramActivityId')
  final int volunteerProgramActivityId;
  static const fromJsonFactory =
      _$CreateVolunteerStudentActivityAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerStudentActivityAttendanceDto &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerProgramActivityId,
                    volunteerProgramActivityId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramActivityId,
                    volunteerProgramActivityId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isAttended) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerProgramActivityId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerStudentActivityAttendanceDtoExtension
    on CreateVolunteerStudentActivityAttendanceDto {
  CreateVolunteerStudentActivityAttendanceDto copyWith(
      {bool? isAttended,
      int? volunteerStudentId,
      int? volunteerProgramActivityId}) {
    return CreateVolunteerStudentActivityAttendanceDto(
        isAttended: isAttended ?? this.isAttended,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerProgramActivityId:
            volunteerProgramActivityId ?? this.volunteerProgramActivityId);
  }

  CreateVolunteerStudentActivityAttendanceDto copyWithWrapped(
      {Wrapped<bool>? isAttended,
      Wrapped<int>? volunteerStudentId,
      Wrapped<int>? volunteerProgramActivityId}) {
    return CreateVolunteerStudentActivityAttendanceDto(
        isAttended: (isAttended != null ? isAttended.value : this.isAttended),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerProgramActivityId: (volunteerProgramActivityId != null
            ? volunteerProgramActivityId.value
            : this.volunteerProgramActivityId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerStudentDto {
  CreateVolunteerStudentDto({
    required this.studentId,
    required this.volunteerProgramId,
  });

  factory CreateVolunteerStudentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerStudentDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerStudentDtoToJson;
  Map<String, dynamic> toJson() => _$CreateVolunteerStudentDtoToJson(this);

  @JsonKey(name: 'studentId')
  final int studentId;
  @JsonKey(name: 'volunteerProgramId')
  final int volunteerProgramId;
  static const fromJsonFactory = _$CreateVolunteerStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerStudentDto &&
            (identical(other.studentId, studentId) ||
                const DeepCollectionEquality()
                    .equals(other.studentId, studentId)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studentId) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerStudentDtoExtension on CreateVolunteerStudentDto {
  CreateVolunteerStudentDto copyWith(
      {int? studentId, int? volunteerProgramId}) {
    return CreateVolunteerStudentDto(
        studentId: studentId ?? this.studentId,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  CreateVolunteerStudentDto copyWithWrapped(
      {Wrapped<int>? studentId, Wrapped<int>? volunteerProgramId}) {
    return CreateVolunteerStudentDto(
        studentId: (studentId != null ? studentId.value : this.studentId),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerStudentTaskAccomplishDto {
  CreateVolunteerStudentTaskAccomplishDto({
    required this.isAccomplished,
    required this.rate,
    required this.volunteerStudentId,
    required this.volunteerProgramTaskId,
  });

  factory CreateVolunteerStudentTaskAccomplishDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVolunteerStudentTaskAccomplishDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerStudentTaskAccomplishDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateVolunteerStudentTaskAccomplishDtoToJson(this);

  @JsonKey(name: 'isAccomplished')
  final bool isAccomplished;
  @JsonKey(name: 'rate')
  final double rate;
  @JsonKey(name: 'volunteerStudentId')
  final int volunteerStudentId;
  @JsonKey(name: 'volunteerProgramTaskId')
  final int volunteerProgramTaskId;
  static const fromJsonFactory =
      _$CreateVolunteerStudentTaskAccomplishDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerStudentTaskAccomplishDto &&
            (identical(other.isAccomplished, isAccomplished) ||
                const DeepCollectionEquality()
                    .equals(other.isAccomplished, isAccomplished)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerProgramTaskId, volunteerProgramTaskId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramTaskId, volunteerProgramTaskId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isAccomplished) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerProgramTaskId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerStudentTaskAccomplishDtoExtension
    on CreateVolunteerStudentTaskAccomplishDto {
  CreateVolunteerStudentTaskAccomplishDto copyWith(
      {bool? isAccomplished,
      double? rate,
      int? volunteerStudentId,
      int? volunteerProgramTaskId}) {
    return CreateVolunteerStudentTaskAccomplishDto(
        isAccomplished: isAccomplished ?? this.isAccomplished,
        rate: rate ?? this.rate,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerProgramTaskId:
            volunteerProgramTaskId ?? this.volunteerProgramTaskId);
  }

  CreateVolunteerStudentTaskAccomplishDto copyWithWrapped(
      {Wrapped<bool>? isAccomplished,
      Wrapped<double>? rate,
      Wrapped<int>? volunteerStudentId,
      Wrapped<int>? volunteerProgramTaskId}) {
    return CreateVolunteerStudentTaskAccomplishDto(
        isAccomplished: (isAccomplished != null
            ? isAccomplished.value
            : this.isAccomplished),
        rate: (rate != null ? rate.value : this.rate),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerProgramTaskId: (volunteerProgramTaskId != null
            ? volunteerProgramTaskId.value
            : this.volunteerProgramTaskId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVolunteerStudentWorkAttendanceDto {
  CreateVolunteerStudentWorkAttendanceDto({
    required this.isAttended,
    required this.volunteerStudentId,
    required this.volunteerProgramWorkDayId,
  });

  factory CreateVolunteerStudentWorkAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVolunteerStudentWorkAttendanceDtoFromJson(json);

  static const toJsonFactory = _$CreateVolunteerStudentWorkAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$CreateVolunteerStudentWorkAttendanceDtoToJson(this);

  @JsonKey(name: 'isAttended')
  final bool isAttended;
  @JsonKey(name: 'volunteerStudentId')
  final int volunteerStudentId;
  @JsonKey(name: 'volunteerProgramWorkDayId')
  final int volunteerProgramWorkDayId;
  static const fromJsonFactory =
      _$CreateVolunteerStudentWorkAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateVolunteerStudentWorkAttendanceDto &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerProgramWorkDayId,
                    volunteerProgramWorkDayId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramWorkDayId,
                    volunteerProgramWorkDayId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isAttended) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerProgramWorkDayId) ^
      runtimeType.hashCode;
}

extension $CreateVolunteerStudentWorkAttendanceDtoExtension
    on CreateVolunteerStudentWorkAttendanceDto {
  CreateVolunteerStudentWorkAttendanceDto copyWith(
      {bool? isAttended,
      int? volunteerStudentId,
      int? volunteerProgramWorkDayId}) {
    return CreateVolunteerStudentWorkAttendanceDto(
        isAttended: isAttended ?? this.isAttended,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerProgramWorkDayId:
            volunteerProgramWorkDayId ?? this.volunteerProgramWorkDayId);
  }

  CreateVolunteerStudentWorkAttendanceDto copyWithWrapped(
      {Wrapped<bool>? isAttended,
      Wrapped<int>? volunteerStudentId,
      Wrapped<int>? volunteerProgramWorkDayId}) {
    return CreateVolunteerStudentWorkAttendanceDto(
        isAttended: (isAttended != null ? isAttended.value : this.isAttended),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerProgramWorkDayId: (volunteerProgramWorkDayId != null
            ? volunteerProgramWorkDayId.value
            : this.volunteerProgramWorkDayId));
  }
}

@JsonSerializable(explicitToJson: true)
class ExistingOrCreateNewSkillDto {
  ExistingOrCreateNewSkillDto({
    this.id,
    this.name,
    this.categoryId,
    this.category,
  });

  factory ExistingOrCreateNewSkillDto.fromJson(Map<String, dynamic> json) =>
      _$ExistingOrCreateNewSkillDtoFromJson(json);

  static const toJsonFactory = _$ExistingOrCreateNewSkillDtoToJson;
  Map<String, dynamic> toJson() => _$ExistingOrCreateNewSkillDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  static const fromJsonFactory = _$ExistingOrCreateNewSkillDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExistingOrCreateNewSkillDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      runtimeType.hashCode;
}

extension $ExistingOrCreateNewSkillDtoExtension on ExistingOrCreateNewSkillDto {
  ExistingOrCreateNewSkillDto copyWith(
      {int? id, String? name, int? categoryId, CreateCategoryDto? category}) {
    return ExistingOrCreateNewSkillDto(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category);
  }

  ExistingOrCreateNewSkillDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category}) {
    return ExistingOrCreateNewSkillDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category));
  }
}

@JsonSerializable(explicitToJson: true)
class ManagementEmployeeAccount {
  ManagementEmployeeAccount({
    this.managementEmployeeDto,
    this.authToken,
  });

  factory ManagementEmployeeAccount.fromJson(Map<String, dynamic> json) =>
      _$ManagementEmployeeAccountFromJson(json);

  static const toJsonFactory = _$ManagementEmployeeAccountToJson;
  Map<String, dynamic> toJson() => _$ManagementEmployeeAccountToJson(this);

  @JsonKey(name: 'managementEmployeeDto')
  final ManagementEmployeeDto? managementEmployeeDto;
  @JsonKey(name: 'authToken')
  final AuthToken? authToken;
  static const fromJsonFactory = _$ManagementEmployeeAccountFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ManagementEmployeeAccount &&
            (identical(other.managementEmployeeDto, managementEmployeeDto) ||
                const DeepCollectionEquality().equals(
                    other.managementEmployeeDto, managementEmployeeDto)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(managementEmployeeDto) ^
      const DeepCollectionEquality().hash(authToken) ^
      runtimeType.hashCode;
}

extension $ManagementEmployeeAccountExtension on ManagementEmployeeAccount {
  ManagementEmployeeAccount copyWith(
      {ManagementEmployeeDto? managementEmployeeDto, AuthToken? authToken}) {
    return ManagementEmployeeAccount(
        managementEmployeeDto:
            managementEmployeeDto ?? this.managementEmployeeDto,
        authToken: authToken ?? this.authToken);
  }

  ManagementEmployeeAccount copyWithWrapped(
      {Wrapped<ManagementEmployeeDto?>? managementEmployeeDto,
      Wrapped<AuthToken?>? authToken}) {
    return ManagementEmployeeAccount(
        managementEmployeeDto: (managementEmployeeDto != null
            ? managementEmployeeDto.value
            : this.managementEmployeeDto),
        authToken: (authToken != null ? authToken.value : this.authToken));
  }
}

@JsonSerializable(explicitToJson: true)
class ManagementEmployeeDto {
  ManagementEmployeeDto({
    this.id,
    this.createdDate,
    this.userName,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.profilePicture,
    this.fcmToken,
  });

  factory ManagementEmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$ManagementEmployeeDtoFromJson(json);

  static const toJsonFactory = _$ManagementEmployeeDtoToJson;
  Map<String, dynamic> toJson() => _$ManagementEmployeeDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'profilePicture')
  final SavedFileDto? profilePicture;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  static const fromJsonFactory = _$ManagementEmployeeDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ManagementEmployeeDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      runtimeType.hashCode;
}

extension $ManagementEmployeeDtoExtension on ManagementEmployeeDto {
  ManagementEmployeeDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      SavedFileDto? profilePicture,
      String? fcmToken}) {
    return ManagementEmployeeDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        profilePicture: profilePicture ?? this.profilePicture,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  ManagementEmployeeDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? fullName,
      Wrapped<SavedFileDto?>? profilePicture,
      Wrapped<String?>? fcmToken}) {
    return ManagementEmployeeDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        fullName: (fullName != null ? fullName.value : this.fullName),
        profilePicture: (profilePicture != null
            ? profilePicture.value
            : this.profilePicture),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageDto {
  MessageDto({
    this.id,
    this.createdDate,
    this.content,
    this.senderId,
    this.receiverId,
    this.sender,
    this.receiver,
    this.conversationId,
    this.conversation,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  static const toJsonFactory = _$MessageDtoToJson;
  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'senderId')
  final int? senderId;
  @JsonKey(name: 'receiverId')
  final int? receiverId;
  @JsonKey(name: 'sender')
  final ApplicationUserDto? sender;
  @JsonKey(name: 'receiver')
  final ApplicationUserDto? receiver;
  @JsonKey(name: 'conversationId')
  final int? conversationId;
  @JsonKey(name: 'conversation')
  final ConversationDto? conversation;
  static const fromJsonFactory = _$MessageDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.receiverId, receiverId) ||
                const DeepCollectionEquality()
                    .equals(other.receiverId, receiverId)) &&
            (identical(other.sender, sender) ||
                const DeepCollectionEquality().equals(other.sender, sender)) &&
            (identical(other.receiver, receiver) ||
                const DeepCollectionEquality()
                    .equals(other.receiver, receiver)) &&
            (identical(other.conversationId, conversationId) ||
                const DeepCollectionEquality()
                    .equals(other.conversationId, conversationId)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(receiverId) ^
      const DeepCollectionEquality().hash(sender) ^
      const DeepCollectionEquality().hash(receiver) ^
      const DeepCollectionEquality().hash(conversationId) ^
      const DeepCollectionEquality().hash(conversation) ^
      runtimeType.hashCode;
}

extension $MessageDtoExtension on MessageDto {
  MessageDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? content,
      int? senderId,
      int? receiverId,
      ApplicationUserDto? sender,
      ApplicationUserDto? receiver,
      int? conversationId,
      ConversationDto? conversation}) {
    return MessageDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        content: content ?? this.content,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        sender: sender ?? this.sender,
        receiver: receiver ?? this.receiver,
        conversationId: conversationId ?? this.conversationId,
        conversation: conversation ?? this.conversation);
  }

  MessageDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? content,
      Wrapped<int?>? senderId,
      Wrapped<int?>? receiverId,
      Wrapped<ApplicationUserDto?>? sender,
      Wrapped<ApplicationUserDto?>? receiver,
      Wrapped<int?>? conversationId,
      Wrapped<ConversationDto?>? conversation}) {
    return MessageDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        content: (content != null ? content.value : this.content),
        senderId: (senderId != null ? senderId.value : this.senderId),
        receiverId: (receiverId != null ? receiverId.value : this.receiverId),
        sender: (sender != null ? sender.value : this.sender),
        receiver: (receiver != null ? receiver.value : this.receiver),
        conversationId: (conversationId != null
            ? conversationId.value
            : this.conversationId),
        conversation:
            (conversation != null ? conversation.value : this.conversation));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationDto {
  NotificationDto({
    this.id,
    this.createdDate,
    this.title,
    this.body,
    this.itemId,
    this.page,
    this.applicationUserId,
    this.isRead,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  static const toJsonFactory = _$NotificationDtoToJson;
  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'body')
  final String? body;
  @JsonKey(name: 'itemId')
  final int? itemId;
  @JsonKey(
    name: 'page',
    toJson: notificationPageToJson,
    fromJson: notificationPageFromJson,
  )
  final enums.NotificationPage? page;
  @JsonKey(name: 'applicationUserId')
  final int? applicationUserId;
  @JsonKey(name: 'isRead')
  final bool? isRead;
  static const fromJsonFactory = _$NotificationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.applicationUserId, applicationUserId) ||
                const DeepCollectionEquality()
                    .equals(other.applicationUserId, applicationUserId)) &&
            (identical(other.isRead, isRead) ||
                const DeepCollectionEquality().equals(other.isRead, isRead)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(itemId) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(applicationUserId) ^
      const DeepCollectionEquality().hash(isRead) ^
      runtimeType.hashCode;
}

extension $NotificationDtoExtension on NotificationDto {
  NotificationDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? title,
      String? body,
      int? itemId,
      enums.NotificationPage? page,
      int? applicationUserId,
      bool? isRead}) {
    return NotificationDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        title: title ?? this.title,
        body: body ?? this.body,
        itemId: itemId ?? this.itemId,
        page: page ?? this.page,
        applicationUserId: applicationUserId ?? this.applicationUserId,
        isRead: isRead ?? this.isRead);
  }

  NotificationDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? title,
      Wrapped<String?>? body,
      Wrapped<int?>? itemId,
      Wrapped<enums.NotificationPage?>? page,
      Wrapped<int?>? applicationUserId,
      Wrapped<bool?>? isRead}) {
    return NotificationDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        title: (title != null ? title.value : this.title),
        body: (body != null ? body.value : this.body),
        itemId: (itemId != null ? itemId.value : this.itemId),
        page: (page != null ? page.value : this.page),
        applicationUserId: (applicationUserId != null
            ? applicationUserId.value
            : this.applicationUserId),
        isRead: (isRead != null ? isRead.value : this.isRead));
  }
}

@JsonSerializable(explicitToJson: true)
class Nullable {
  Nullable();

  factory Nullable.fromJson(Map<String, dynamic> json) =>
      _$NullableFromJson(json);

  static const toJsonFactory = _$NullableToJson;
  Map<String, dynamic> toJson() => _$NullableToJson(this);

  static const fromJsonFactory = _$NullableFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class OrganizationAccount {
  OrganizationAccount({
    this.organizationDto,
    this.authToken,
  });

  factory OrganizationAccount.fromJson(Map<String, dynamic> json) =>
      _$OrganizationAccountFromJson(json);

  static const toJsonFactory = _$OrganizationAccountToJson;
  Map<String, dynamic> toJson() => _$OrganizationAccountToJson(this);

  @JsonKey(name: 'organizationDto')
  final OrganizationDto? organizationDto;
  @JsonKey(name: 'authToken')
  final AuthToken? authToken;
  static const fromJsonFactory = _$OrganizationAccountFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrganizationAccount &&
            (identical(other.organizationDto, organizationDto) ||
                const DeepCollectionEquality()
                    .equals(other.organizationDto, organizationDto)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(organizationDto) ^
      const DeepCollectionEquality().hash(authToken) ^
      runtimeType.hashCode;
}

extension $OrganizationAccountExtension on OrganizationAccount {
  OrganizationAccount copyWith(
      {OrganizationDto? organizationDto, AuthToken? authToken}) {
    return OrganizationAccount(
        organizationDto: organizationDto ?? this.organizationDto,
        authToken: authToken ?? this.authToken);
  }

  OrganizationAccount copyWithWrapped(
      {Wrapped<OrganizationDto?>? organizationDto,
      Wrapped<AuthToken?>? authToken}) {
    return OrganizationAccount(
        organizationDto: (organizationDto != null
            ? organizationDto.value
            : this.organizationDto),
        authToken: (authToken != null ? authToken.value : this.authToken));
  }
}

@JsonSerializable(explicitToJson: true)
class OrganizationDto {
  OrganizationDto({
    this.id,
    this.createdDate,
    this.userName,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.profilePicture,
    this.fcmToken,
    this.orgNameLocal,
    this.orgNameForeign,
    this.fieldOfWork,
    this.about,
    this.vision,
    this.mission,
    this.address,
  });

  factory OrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationDtoFromJson(json);

  static const toJsonFactory = _$OrganizationDtoToJson;
  Map<String, dynamic> toJson() => _$OrganizationDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'profilePicture')
  final SavedFileDto? profilePicture;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  @JsonKey(name: 'orgNameLocal')
  final String? orgNameLocal;
  @JsonKey(name: 'orgNameForeign')
  final String? orgNameForeign;
  @JsonKey(name: 'fieldOfWork')
  final String? fieldOfWork;
  @JsonKey(name: 'about')
  final String? about;
  @JsonKey(name: 'vision')
  final String? vision;
  @JsonKey(name: 'mission')
  final String? mission;
  @JsonKey(name: 'address')
  final String? address;
  static const fromJsonFactory = _$OrganizationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrganizationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)) &&
            (identical(other.orgNameLocal, orgNameLocal) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameLocal, orgNameLocal)) &&
            (identical(other.orgNameForeign, orgNameForeign) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameForeign, orgNameForeign)) &&
            (identical(other.fieldOfWork, fieldOfWork) ||
                const DeepCollectionEquality()
                    .equals(other.fieldOfWork, fieldOfWork)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.vision, vision) ||
                const DeepCollectionEquality().equals(other.vision, vision)) &&
            (identical(other.mission, mission) ||
                const DeepCollectionEquality()
                    .equals(other.mission, mission)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      const DeepCollectionEquality().hash(orgNameLocal) ^
      const DeepCollectionEquality().hash(orgNameForeign) ^
      const DeepCollectionEquality().hash(fieldOfWork) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(vision) ^
      const DeepCollectionEquality().hash(mission) ^
      const DeepCollectionEquality().hash(address) ^
      runtimeType.hashCode;
}

extension $OrganizationDtoExtension on OrganizationDto {
  OrganizationDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      SavedFileDto? profilePicture,
      String? fcmToken,
      String? orgNameLocal,
      String? orgNameForeign,
      String? fieldOfWork,
      String? about,
      String? vision,
      String? mission,
      String? address}) {
    return OrganizationDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        profilePicture: profilePicture ?? this.profilePicture,
        fcmToken: fcmToken ?? this.fcmToken,
        orgNameLocal: orgNameLocal ?? this.orgNameLocal,
        orgNameForeign: orgNameForeign ?? this.orgNameForeign,
        fieldOfWork: fieldOfWork ?? this.fieldOfWork,
        about: about ?? this.about,
        vision: vision ?? this.vision,
        mission: mission ?? this.mission,
        address: address ?? this.address);
  }

  OrganizationDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? fullName,
      Wrapped<SavedFileDto?>? profilePicture,
      Wrapped<String?>? fcmToken,
      Wrapped<String?>? orgNameLocal,
      Wrapped<String?>? orgNameForeign,
      Wrapped<String?>? fieldOfWork,
      Wrapped<String?>? about,
      Wrapped<String?>? vision,
      Wrapped<String?>? mission,
      Wrapped<String?>? address}) {
    return OrganizationDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        fullName: (fullName != null ? fullName.value : this.fullName),
        profilePicture: (profilePicture != null
            ? profilePicture.value
            : this.profilePicture),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken),
        orgNameLocal:
            (orgNameLocal != null ? orgNameLocal.value : this.orgNameLocal),
        orgNameForeign: (orgNameForeign != null
            ? orgNameForeign.value
            : this.orgNameForeign),
        fieldOfWork:
            (fieldOfWork != null ? fieldOfWork.value : this.fieldOfWork),
        about: (about != null ? about.value : this.about),
        vision: (vision != null ? vision.value : this.vision),
        mission: (mission != null ? mission.value : this.mission),
        address: (address != null ? address.value : this.address));
  }
}

@JsonSerializable(explicitToJson: true)
class RejectStudentApplication {
  RejectStudentApplication({
    required this.studentApplicationId,
    this.rejectionReason,
  });

  factory RejectStudentApplication.fromJson(Map<String, dynamic> json) =>
      _$RejectStudentApplicationFromJson(json);

  static const toJsonFactory = _$RejectStudentApplicationToJson;
  Map<String, dynamic> toJson() => _$RejectStudentApplicationToJson(this);

  @JsonKey(name: 'studentApplicationId')
  final int studentApplicationId;
  @JsonKey(name: 'rejectionReason')
  final String? rejectionReason;
  static const fromJsonFactory = _$RejectStudentApplicationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RejectStudentApplication &&
            (identical(other.studentApplicationId, studentApplicationId) ||
                const DeepCollectionEquality().equals(
                    other.studentApplicationId, studentApplicationId)) &&
            (identical(other.rejectionReason, rejectionReason) ||
                const DeepCollectionEquality()
                    .equals(other.rejectionReason, rejectionReason)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studentApplicationId) ^
      const DeepCollectionEquality().hash(rejectionReason) ^
      runtimeType.hashCode;
}

extension $RejectStudentApplicationExtension on RejectStudentApplication {
  RejectStudentApplication copyWith(
      {int? studentApplicationId, String? rejectionReason}) {
    return RejectStudentApplication(
        studentApplicationId: studentApplicationId ?? this.studentApplicationId,
        rejectionReason: rejectionReason ?? this.rejectionReason);
  }

  RejectStudentApplication copyWithWrapped(
      {Wrapped<int>? studentApplicationId, Wrapped<String?>? rejectionReason}) {
    return RejectStudentApplication(
        studentApplicationId: (studentApplicationId != null
            ? studentApplicationId.value
            : this.studentApplicationId),
        rejectionReason: (rejectionReason != null
            ? rejectionReason.value
            : this.rejectionReason));
  }
}

@JsonSerializable(explicitToJson: true)
class SaveTempFile {
  SaveTempFile({
    required this.tempFileId,
  });

  factory SaveTempFile.fromJson(Map<String, dynamic> json) =>
      _$SaveTempFileFromJson(json);

  static const toJsonFactory = _$SaveTempFileToJson;
  Map<String, dynamic> toJson() => _$SaveTempFileToJson(this);

  @JsonKey(name: 'tempFileId')
  final int tempFileId;
  static const fromJsonFactory = _$SaveTempFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveTempFile &&
            (identical(other.tempFileId, tempFileId) ||
                const DeepCollectionEquality()
                    .equals(other.tempFileId, tempFileId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(tempFileId) ^ runtimeType.hashCode;
}

extension $SaveTempFileExtension on SaveTempFile {
  SaveTempFile copyWith({int? tempFileId}) {
    return SaveTempFile(tempFileId: tempFileId ?? this.tempFileId);
  }

  SaveTempFile copyWithWrapped({Wrapped<int>? tempFileId}) {
    return SaveTempFile(
        tempFileId: (tempFileId != null ? tempFileId.value : this.tempFileId));
  }
}

@JsonSerializable(explicitToJson: true)
class SavedFile {
  SavedFile({
    this.id,
    this.createdDate,
    this.fileKey,
    this.originalFileName,
    this.fileSize,
    this.fileExtension,
  });

  factory SavedFile.fromJson(Map<String, dynamic> json) =>
      _$SavedFileFromJson(json);

  static const toJsonFactory = _$SavedFileToJson;
  Map<String, dynamic> toJson() => _$SavedFileToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'fileKey')
  final String? fileKey;
  @JsonKey(name: 'originalFileName')
  final String? originalFileName;
  @JsonKey(name: 'fileSize')
  final int? fileSize;
  @JsonKey(name: 'fileExtension')
  final String? fileExtension;
  static const fromJsonFactory = _$SavedFileFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SavedFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.fileKey, fileKey) ||
                const DeepCollectionEquality()
                    .equals(other.fileKey, fileKey)) &&
            (identical(other.originalFileName, originalFileName) ||
                const DeepCollectionEquality()
                    .equals(other.originalFileName, originalFileName)) &&
            (identical(other.fileSize, fileSize) ||
                const DeepCollectionEquality()
                    .equals(other.fileSize, fileSize)) &&
            (identical(other.fileExtension, fileExtension) ||
                const DeepCollectionEquality()
                    .equals(other.fileExtension, fileExtension)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(fileKey) ^
      const DeepCollectionEquality().hash(originalFileName) ^
      const DeepCollectionEquality().hash(fileSize) ^
      const DeepCollectionEquality().hash(fileExtension) ^
      runtimeType.hashCode;
}

extension $SavedFileExtension on SavedFile {
  SavedFile copyWith(
      {int? id,
      DateTime? createdDate,
      String? fileKey,
      String? originalFileName,
      int? fileSize,
      String? fileExtension}) {
    return SavedFile(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        fileKey: fileKey ?? this.fileKey,
        originalFileName: originalFileName ?? this.originalFileName,
        fileSize: fileSize ?? this.fileSize,
        fileExtension: fileExtension ?? this.fileExtension);
  }

  SavedFile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? fileKey,
      Wrapped<String?>? originalFileName,
      Wrapped<int?>? fileSize,
      Wrapped<String?>? fileExtension}) {
    return SavedFile(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        fileKey: (fileKey != null ? fileKey.value : this.fileKey),
        originalFileName: (originalFileName != null
            ? originalFileName.value
            : this.originalFileName),
        fileSize: (fileSize != null ? fileSize.value : this.fileSize),
        fileExtension:
            (fileExtension != null ? fileExtension.value : this.fileExtension));
  }
}

@JsonSerializable(explicitToJson: true)
class SavedFileDto {
  SavedFileDto({
    this.id,
    this.createdDate,
    this.fileKey,
    this.originalFileName,
    this.fileSize,
    this.fileExtension,
  });

  factory SavedFileDto.fromJson(Map<String, dynamic> json) =>
      _$SavedFileDtoFromJson(json);

  static const toJsonFactory = _$SavedFileDtoToJson;
  Map<String, dynamic> toJson() => _$SavedFileDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'fileKey')
  final String? fileKey;
  @JsonKey(name: 'originalFileName')
  final String? originalFileName;
  @JsonKey(name: 'fileSize')
  final int? fileSize;
  @JsonKey(name: 'fileExtension')
  final String? fileExtension;
  static const fromJsonFactory = _$SavedFileDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SavedFileDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.fileKey, fileKey) ||
                const DeepCollectionEquality()
                    .equals(other.fileKey, fileKey)) &&
            (identical(other.originalFileName, originalFileName) ||
                const DeepCollectionEquality()
                    .equals(other.originalFileName, originalFileName)) &&
            (identical(other.fileSize, fileSize) ||
                const DeepCollectionEquality()
                    .equals(other.fileSize, fileSize)) &&
            (identical(other.fileExtension, fileExtension) ||
                const DeepCollectionEquality()
                    .equals(other.fileExtension, fileExtension)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(fileKey) ^
      const DeepCollectionEquality().hash(originalFileName) ^
      const DeepCollectionEquality().hash(fileSize) ^
      const DeepCollectionEquality().hash(fileExtension) ^
      runtimeType.hashCode;
}

extension $SavedFileDtoExtension on SavedFileDto {
  SavedFileDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? fileKey,
      String? originalFileName,
      int? fileSize,
      String? fileExtension}) {
    return SavedFileDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        fileKey: fileKey ?? this.fileKey,
        originalFileName: originalFileName ?? this.originalFileName,
        fileSize: fileSize ?? this.fileSize,
        fileExtension: fileExtension ?? this.fileExtension);
  }

  SavedFileDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? fileKey,
      Wrapped<String?>? originalFileName,
      Wrapped<int?>? fileSize,
      Wrapped<String?>? fileExtension}) {
    return SavedFileDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        fileKey: (fileKey != null ? fileKey.value : this.fileKey),
        originalFileName: (originalFileName != null
            ? originalFileName.value
            : this.originalFileName),
        fileSize: (fileSize != null ? fileSize.value : this.fileSize),
        fileExtension:
            (fileExtension != null ? fileExtension.value : this.fileExtension));
  }
}

@JsonSerializable(explicitToJson: true)
class SkillDto {
  SkillDto({
    this.id,
    this.createdDate,
    this.name,
    this.category,
  });

  factory SkillDto.fromJson(Map<String, dynamic> json) =>
      _$SkillDtoFromJson(json);

  static const toJsonFactory = _$SkillDtoToJson;
  Map<String, dynamic> toJson() => _$SkillDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'category')
  final CategoryDto? category;
  static const fromJsonFactory = _$SkillDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SkillDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      runtimeType.hashCode;
}

extension $SkillDtoExtension on SkillDto {
  SkillDto copyWith(
      {int? id, DateTime? createdDate, String? name, CategoryDto? category}) {
    return SkillDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        category: category ?? this.category);
  }

  SkillDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? name,
      Wrapped<CategoryDto?>? category}) {
    return SkillDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        name: (name != null ? name.value : this.name),
        category: (category != null ? category.value : this.category));
  }
}

@JsonSerializable(explicitToJson: true)
class StudentAccount {
  StudentAccount({
    this.studentDto,
    this.authToken,
  });

  factory StudentAccount.fromJson(Map<String, dynamic> json) =>
      _$StudentAccountFromJson(json);

  static const toJsonFactory = _$StudentAccountToJson;
  Map<String, dynamic> toJson() => _$StudentAccountToJson(this);

  @JsonKey(name: 'studentDto')
  final StudentDto? studentDto;
  @JsonKey(name: 'authToken')
  final AuthToken? authToken;
  static const fromJsonFactory = _$StudentAccountFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudentAccount &&
            (identical(other.studentDto, studentDto) ||
                const DeepCollectionEquality()
                    .equals(other.studentDto, studentDto)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studentDto) ^
      const DeepCollectionEquality().hash(authToken) ^
      runtimeType.hashCode;
}

extension $StudentAccountExtension on StudentAccount {
  StudentAccount copyWith({StudentDto? studentDto, AuthToken? authToken}) {
    return StudentAccount(
        studentDto: studentDto ?? this.studentDto,
        authToken: authToken ?? this.authToken);
  }

  StudentAccount copyWithWrapped(
      {Wrapped<StudentDto?>? studentDto, Wrapped<AuthToken?>? authToken}) {
    return StudentAccount(
        studentDto: (studentDto != null ? studentDto.value : this.studentDto),
        authToken: (authToken != null ? authToken.value : this.authToken));
  }
}

@JsonSerializable(explicitToJson: true)
class StudentApplicationDto {
  StudentApplicationDto({
    this.id,
    this.createdDate,
    this.studentId,
    this.student,
    this.volunteerOpportunityId,
    this.volunteerOpportunity,
    this.statusForOrganization,
    this.statusForManagement,
    this.textInformation,
    this.submittedFile,
    this.organizationRejectionReason,
    this.managementRejectionReason,
  });

  factory StudentApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$StudentApplicationDtoFromJson(json);

  static const toJsonFactory = _$StudentApplicationDtoToJson;
  Map<String, dynamic> toJson() => _$StudentApplicationDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'studentId')
  final int? studentId;
  @JsonKey(name: 'student')
  final StudentDto? student;
  @JsonKey(name: 'volunteerOpportunityId')
  final int? volunteerOpportunityId;
  @JsonKey(name: 'volunteerOpportunity')
  final VolunteerOpportunityDto? volunteerOpportunity;
  @JsonKey(
    name: 'statusForOrganization',
    toJson: applicationStatusToJson,
    fromJson: applicationStatusFromJson,
  )
  final enums.ApplicationStatus? statusForOrganization;
  @JsonKey(
    name: 'statusForManagement',
    toJson: applicationStatusToJson,
    fromJson: applicationStatusFromJson,
  )
  final enums.ApplicationStatus? statusForManagement;
  @JsonKey(name: 'textInformation')
  final String? textInformation;
  @JsonKey(name: 'submittedFile')
  final SavedFileDto? submittedFile;
  @JsonKey(name: 'organizationRejectionReason')
  final String? organizationRejectionReason;
  @JsonKey(name: 'managementRejectionReason')
  final String? managementRejectionReason;
  static const fromJsonFactory = _$StudentApplicationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudentApplicationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.studentId, studentId) ||
                const DeepCollectionEquality()
                    .equals(other.studentId, studentId)) &&
            (identical(other.student, student) ||
                const DeepCollectionEquality()
                    .equals(other.student, student)) &&
            (identical(other.volunteerOpportunityId, volunteerOpportunityId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerOpportunityId, volunteerOpportunityId)) &&
            (identical(other.volunteerOpportunity, volunteerOpportunity) ||
                const DeepCollectionEquality().equals(
                    other.volunteerOpportunity, volunteerOpportunity)) &&
            (identical(other.statusForOrganization, statusForOrganization) ||
                const DeepCollectionEquality().equals(
                    other.statusForOrganization, statusForOrganization)) &&
            (identical(other.statusForManagement, statusForManagement) ||
                const DeepCollectionEquality()
                    .equals(other.statusForManagement, statusForManagement)) &&
            (identical(other.textInformation, textInformation) ||
                const DeepCollectionEquality()
                    .equals(other.textInformation, textInformation)) &&
            (identical(other.submittedFile, submittedFile) ||
                const DeepCollectionEquality()
                    .equals(other.submittedFile, submittedFile)) &&
            (identical(other.organizationRejectionReason,
                    organizationRejectionReason) ||
                const DeepCollectionEquality().equals(
                    other.organizationRejectionReason,
                    organizationRejectionReason)) &&
            (identical(other.managementRejectionReason,
                    managementRejectionReason) ||
                const DeepCollectionEquality().equals(
                    other.managementRejectionReason,
                    managementRejectionReason)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(studentId) ^
      const DeepCollectionEquality().hash(student) ^
      const DeepCollectionEquality().hash(volunteerOpportunityId) ^
      const DeepCollectionEquality().hash(volunteerOpportunity) ^
      const DeepCollectionEquality().hash(statusForOrganization) ^
      const DeepCollectionEquality().hash(statusForManagement) ^
      const DeepCollectionEquality().hash(textInformation) ^
      const DeepCollectionEquality().hash(submittedFile) ^
      const DeepCollectionEquality().hash(organizationRejectionReason) ^
      const DeepCollectionEquality().hash(managementRejectionReason) ^
      runtimeType.hashCode;
}

extension $StudentApplicationDtoExtension on StudentApplicationDto {
  StudentApplicationDto copyWith(
      {int? id,
      DateTime? createdDate,
      int? studentId,
      StudentDto? student,
      int? volunteerOpportunityId,
      VolunteerOpportunityDto? volunteerOpportunity,
      enums.ApplicationStatus? statusForOrganization,
      enums.ApplicationStatus? statusForManagement,
      String? textInformation,
      SavedFileDto? submittedFile,
      String? organizationRejectionReason,
      String? managementRejectionReason}) {
    return StudentApplicationDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        studentId: studentId ?? this.studentId,
        student: student ?? this.student,
        volunteerOpportunityId:
            volunteerOpportunityId ?? this.volunteerOpportunityId,
        volunteerOpportunity: volunteerOpportunity ?? this.volunteerOpportunity,
        statusForOrganization:
            statusForOrganization ?? this.statusForOrganization,
        statusForManagement: statusForManagement ?? this.statusForManagement,
        textInformation: textInformation ?? this.textInformation,
        submittedFile: submittedFile ?? this.submittedFile,
        organizationRejectionReason:
            organizationRejectionReason ?? this.organizationRejectionReason,
        managementRejectionReason:
            managementRejectionReason ?? this.managementRejectionReason);
  }

  StudentApplicationDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<int?>? studentId,
      Wrapped<StudentDto?>? student,
      Wrapped<int?>? volunteerOpportunityId,
      Wrapped<VolunteerOpportunityDto?>? volunteerOpportunity,
      Wrapped<enums.ApplicationStatus?>? statusForOrganization,
      Wrapped<enums.ApplicationStatus?>? statusForManagement,
      Wrapped<String?>? textInformation,
      Wrapped<SavedFileDto?>? submittedFile,
      Wrapped<String?>? organizationRejectionReason,
      Wrapped<String?>? managementRejectionReason}) {
    return StudentApplicationDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        studentId: (studentId != null ? studentId.value : this.studentId),
        student: (student != null ? student.value : this.student),
        volunteerOpportunityId: (volunteerOpportunityId != null
            ? volunteerOpportunityId.value
            : this.volunteerOpportunityId),
        volunteerOpportunity: (volunteerOpportunity != null
            ? volunteerOpportunity.value
            : this.volunteerOpportunity),
        statusForOrganization: (statusForOrganization != null
            ? statusForOrganization.value
            : this.statusForOrganization),
        statusForManagement: (statusForManagement != null
            ? statusForManagement.value
            : this.statusForManagement),
        textInformation: (textInformation != null
            ? textInformation.value
            : this.textInformation),
        submittedFile:
            (submittedFile != null ? submittedFile.value : this.submittedFile),
        organizationRejectionReason: (organizationRejectionReason != null
            ? organizationRejectionReason.value
            : this.organizationRejectionReason),
        managementRejectionReason: (managementRejectionReason != null
            ? managementRejectionReason.value
            : this.managementRejectionReason));
  }
}

@JsonSerializable(explicitToJson: true)
class StudentDto {
  StudentDto({
    this.id,
    this.createdDate,
    this.userName,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.profilePicture,
    this.fcmToken,
    this.universityIdNumber,
    this.specialization,
    this.address,
    this.dateOfBirth,
    this.biography,
    this.isEnrolledInProgram,
    this.skills,
  });

  factory StudentDto.fromJson(Map<String, dynamic> json) =>
      _$StudentDtoFromJson(json);

  static const toJsonFactory = _$StudentDtoToJson;
  Map<String, dynamic> toJson() => _$StudentDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'profilePicture')
  final SavedFileDto? profilePicture;
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;
  @JsonKey(name: 'universityIdNumber')
  final int? universityIdNumber;
  @JsonKey(name: 'specialization')
  final String? specialization;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'isEnrolledInProgram')
  final bool? isEnrolledInProgram;
  @JsonKey(name: 'skills', defaultValue: <SkillDto>[])
  final List<SkillDto>? skills;
  static const fromJsonFactory = _$StudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)) &&
            (identical(other.universityIdNumber, universityIdNumber) ||
                const DeepCollectionEquality()
                    .equals(other.universityIdNumber, universityIdNumber)) &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.biography, biography) ||
                const DeepCollectionEquality()
                    .equals(other.biography, biography)) &&
            (identical(other.isEnrolledInProgram, isEnrolledInProgram) ||
                const DeepCollectionEquality()
                    .equals(other.isEnrolledInProgram, isEnrolledInProgram)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      const DeepCollectionEquality().hash(universityIdNumber) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(biography) ^
      const DeepCollectionEquality().hash(isEnrolledInProgram) ^
      const DeepCollectionEquality().hash(skills) ^
      runtimeType.hashCode;
}

extension $StudentDtoExtension on StudentDto {
  StudentDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? userName,
      String? email,
      String? phoneNumber,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      SavedFileDto? profilePicture,
      String? fcmToken,
      int? universityIdNumber,
      String? specialization,
      String? address,
      DateTime? dateOfBirth,
      String? biography,
      bool? isEnrolledInProgram,
      List<SkillDto>? skills}) {
    return StudentDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        profilePicture: profilePicture ?? this.profilePicture,
        fcmToken: fcmToken ?? this.fcmToken,
        universityIdNumber: universityIdNumber ?? this.universityIdNumber,
        specialization: specialization ?? this.specialization,
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        biography: biography ?? this.biography,
        isEnrolledInProgram: isEnrolledInProgram ?? this.isEnrolledInProgram,
        skills: skills ?? this.skills);
  }

  StudentDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? userName,
      Wrapped<String?>? email,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? fullName,
      Wrapped<SavedFileDto?>? profilePicture,
      Wrapped<String?>? fcmToken,
      Wrapped<int?>? universityIdNumber,
      Wrapped<String?>? specialization,
      Wrapped<String?>? address,
      Wrapped<DateTime?>? dateOfBirth,
      Wrapped<String?>? biography,
      Wrapped<bool?>? isEnrolledInProgram,
      Wrapped<List<SkillDto>?>? skills}) {
    return StudentDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        userName: (userName != null ? userName.value : this.userName),
        email: (email != null ? email.value : this.email),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        fullName: (fullName != null ? fullName.value : this.fullName),
        profilePicture: (profilePicture != null
            ? profilePicture.value
            : this.profilePicture),
        fcmToken: (fcmToken != null ? fcmToken.value : this.fcmToken),
        universityIdNumber: (universityIdNumber != null
            ? universityIdNumber.value
            : this.universityIdNumber),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        address: (address != null ? address.value : this.address),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth),
        biography: (biography != null ? biography.value : this.biography),
        isEnrolledInProgram: (isEnrolledInProgram != null
            ? isEnrolledInProgram.value
            : this.isEnrolledInProgram),
        skills: (skills != null ? skills.value : this.skills));
  }
}

@JsonSerializable(explicitToJson: true)
class TempFileDto {
  TempFileDto({
    this.id,
    this.createdDate,
    this.fileKey,
    this.originalFileName,
  });

  factory TempFileDto.fromJson(Map<String, dynamic> json) =>
      _$TempFileDtoFromJson(json);

  static const toJsonFactory = _$TempFileDtoToJson;
  Map<String, dynamic> toJson() => _$TempFileDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'fileKey')
  final String? fileKey;
  @JsonKey(name: 'originalFileName')
  final String? originalFileName;
  static const fromJsonFactory = _$TempFileDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TempFileDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.fileKey, fileKey) ||
                const DeepCollectionEquality()
                    .equals(other.fileKey, fileKey)) &&
            (identical(other.originalFileName, originalFileName) ||
                const DeepCollectionEquality()
                    .equals(other.originalFileName, originalFileName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(fileKey) ^
      const DeepCollectionEquality().hash(originalFileName) ^
      runtimeType.hashCode;
}

extension $TempFileDtoExtension on TempFileDto {
  TempFileDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? fileKey,
      String? originalFileName}) {
    return TempFileDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        fileKey: fileKey ?? this.fileKey,
        originalFileName: originalFileName ?? this.originalFileName);
  }

  TempFileDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? fileKey,
      Wrapped<String?>? originalFileName}) {
    return TempFileDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        fileKey: (fileKey != null ? fileKey.value : this.fileKey),
        originalFileName: (originalFileName != null
            ? originalFileName.value
            : this.originalFileName));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateAnnouncementDto {
  UpdateAnnouncementDto({
    required this.id,
    this.title,
    this.description,
    this.saveTempFile,
  });

  factory UpdateAnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateAnnouncementDtoFromJson(json);

  static const toJsonFactory = _$UpdateAnnouncementDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateAnnouncementDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateAnnouncementDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateAnnouncementDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateAnnouncementDtoExtension on UpdateAnnouncementDto {
  UpdateAnnouncementDto copyWith(
      {int? id,
      String? title,
      String? description,
      SaveTempFile? saveTempFile}) {
    return UpdateAnnouncementDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateAnnouncementDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateAnnouncementDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateCategoryDto {
  UpdateCategoryDto({
    required this.id,
    this.name,
  });

  factory UpdateCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryDtoFromJson(json);

  static const toJsonFactory = _$UpdateCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateCategoryDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$UpdateCategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCategoryDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $UpdateCategoryDtoExtension on UpdateCategoryDto {
  UpdateCategoryDto copyWith({int? id, String? name}) {
    return UpdateCategoryDto(id: id ?? this.id, name: name ?? this.name);
  }

  UpdateCategoryDto copyWithWrapped(
      {Wrapped<int>? id, Wrapped<String?>? name}) {
    return UpdateCategoryDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateGalleryPhotoByStudentDto {
  UpdateGalleryPhotoByStudentDto({
    required this.id,
    this.saveTempFile,
    required this.volunteerStudentUploaderId,
  });

  factory UpdateGalleryPhotoByStudentDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateGalleryPhotoByStudentDtoFromJson(json);

  static const toJsonFactory = _$UpdateGalleryPhotoByStudentDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateGalleryPhotoByStudentDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'volunteerStudentUploaderId')
  final int volunteerStudentUploaderId;
  static const fromJsonFactory = _$UpdateGalleryPhotoByStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateGalleryPhotoByStudentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(volunteerStudentUploaderId) ^
      runtimeType.hashCode;
}

extension $UpdateGalleryPhotoByStudentDtoExtension
    on UpdateGalleryPhotoByStudentDto {
  UpdateGalleryPhotoByStudentDto copyWith(
      {int? id, SaveTempFile? saveTempFile, int? volunteerStudentUploaderId}) {
    return UpdateGalleryPhotoByStudentDto(
        id: id ?? this.id,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        volunteerStudentUploaderId:
            volunteerStudentUploaderId ?? this.volunteerStudentUploaderId);
  }

  UpdateGalleryPhotoByStudentDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<int>? volunteerStudentUploaderId}) {
    return UpdateGalleryPhotoByStudentDto(
        id: (id != null ? id.value : this.id),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        volunteerStudentUploaderId: (volunteerStudentUploaderId != null
            ? volunteerStudentUploaderId.value
            : this.volunteerStudentUploaderId));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateGalleryPhotoDto {
  UpdateGalleryPhotoDto({
    required this.id,
    this.saveTempFile,
    this.isApproved,
  });

  factory UpdateGalleryPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateGalleryPhotoDtoFromJson(json);

  static const toJsonFactory = _$UpdateGalleryPhotoDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateGalleryPhotoDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'isApproved')
  final bool? isApproved;
  static const fromJsonFactory = _$UpdateGalleryPhotoDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateGalleryPhotoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(isApproved) ^
      runtimeType.hashCode;
}

extension $UpdateGalleryPhotoDtoExtension on UpdateGalleryPhotoDto {
  UpdateGalleryPhotoDto copyWith(
      {int? id, SaveTempFile? saveTempFile, bool? isApproved}) {
    return UpdateGalleryPhotoDto(
        id: id ?? this.id,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        isApproved: isApproved ?? this.isApproved);
  }

  UpdateGalleryPhotoDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<bool?>? isApproved}) {
    return UpdateGalleryPhotoDto(
        id: (id != null ? id.value : this.id),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        isApproved: (isApproved != null ? isApproved.value : this.isApproved));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateInternalVolunteerProgramDto {
  UpdateInternalVolunteerProgramDto({
    required this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.categoryId,
    this.category,
    this.saveTempFile,
  });

  factory UpdateInternalVolunteerProgramDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateInternalVolunteerProgramDtoFromJson(json);

  static const toJsonFactory = _$UpdateInternalVolunteerProgramDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateInternalVolunteerProgramDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateInternalVolunteerProgramDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateInternalVolunteerProgramDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateInternalVolunteerProgramDtoExtension
    on UpdateInternalVolunteerProgramDto {
  UpdateInternalVolunteerProgramDto copyWith(
      {int? id,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile}) {
    return UpdateInternalVolunteerProgramDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateInternalVolunteerProgramDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateInternalVolunteerProgramDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateManagementEmployeeDto {
  UpdateManagementEmployeeDto({
    required this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.saveTempFile,
  });

  factory UpdateManagementEmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateManagementEmployeeDtoFromJson(json);

  static const toJsonFactory = _$UpdateManagementEmployeeDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateManagementEmployeeDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateManagementEmployeeDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateManagementEmployeeDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateManagementEmployeeDtoExtension on UpdateManagementEmployeeDto {
  UpdateManagementEmployeeDto copyWith(
      {int? id,
      String? firstName,
      String? middleName,
      String? lastName,
      SaveTempFile? saveTempFile}) {
    return UpdateManagementEmployeeDto(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateManagementEmployeeDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateManagementEmployeeDto(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateMessageDto {
  UpdateMessageDto({
    required this.id,
    this.content,
  });

  factory UpdateMessageDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageDtoFromJson(json);

  static const toJsonFactory = _$UpdateMessageDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateMessageDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'content')
  final String? content;
  static const fromJsonFactory = _$UpdateMessageDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateMessageDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $UpdateMessageDtoExtension on UpdateMessageDto {
  UpdateMessageDto copyWith({int? id, String? content}) {
    return UpdateMessageDto(
        id: id ?? this.id, content: content ?? this.content);
  }

  UpdateMessageDto copyWithWrapped(
      {Wrapped<int>? id, Wrapped<String?>? content}) {
    return UpdateMessageDto(
        id: (id != null ? id.value : this.id),
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateOrganizationDto {
  UpdateOrganizationDto({
    required this.id,
    this.orgNameLocal,
    this.orgNameForeign,
    this.fieldOfWork,
    this.about,
    this.vision,
    this.mission,
    this.address,
    this.saveTempFile,
  });

  factory UpdateOrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrganizationDtoFromJson(json);

  static const toJsonFactory = _$UpdateOrganizationDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateOrganizationDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'orgNameLocal')
  final String? orgNameLocal;
  @JsonKey(name: 'orgNameForeign')
  final String? orgNameForeign;
  @JsonKey(name: 'fieldOfWork')
  final String? fieldOfWork;
  @JsonKey(name: 'about')
  final String? about;
  @JsonKey(name: 'vision')
  final String? vision;
  @JsonKey(name: 'mission')
  final String? mission;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateOrganizationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateOrganizationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orgNameLocal, orgNameLocal) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameLocal, orgNameLocal)) &&
            (identical(other.orgNameForeign, orgNameForeign) ||
                const DeepCollectionEquality()
                    .equals(other.orgNameForeign, orgNameForeign)) &&
            (identical(other.fieldOfWork, fieldOfWork) ||
                const DeepCollectionEquality()
                    .equals(other.fieldOfWork, fieldOfWork)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.vision, vision) ||
                const DeepCollectionEquality().equals(other.vision, vision)) &&
            (identical(other.mission, mission) ||
                const DeepCollectionEquality()
                    .equals(other.mission, mission)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orgNameLocal) ^
      const DeepCollectionEquality().hash(orgNameForeign) ^
      const DeepCollectionEquality().hash(fieldOfWork) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(vision) ^
      const DeepCollectionEquality().hash(mission) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateOrganizationDtoExtension on UpdateOrganizationDto {
  UpdateOrganizationDto copyWith(
      {int? id,
      String? orgNameLocal,
      String? orgNameForeign,
      String? fieldOfWork,
      String? about,
      String? vision,
      String? mission,
      String? address,
      SaveTempFile? saveTempFile}) {
    return UpdateOrganizationDto(
        id: id ?? this.id,
        orgNameLocal: orgNameLocal ?? this.orgNameLocal,
        orgNameForeign: orgNameForeign ?? this.orgNameForeign,
        fieldOfWork: fieldOfWork ?? this.fieldOfWork,
        about: about ?? this.about,
        vision: vision ?? this.vision,
        mission: mission ?? this.mission,
        address: address ?? this.address,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateOrganizationDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? orgNameLocal,
      Wrapped<String?>? orgNameForeign,
      Wrapped<String?>? fieldOfWork,
      Wrapped<String?>? about,
      Wrapped<String?>? vision,
      Wrapped<String?>? mission,
      Wrapped<String?>? address,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateOrganizationDto(
        id: (id != null ? id.value : this.id),
        orgNameLocal:
            (orgNameLocal != null ? orgNameLocal.value : this.orgNameLocal),
        orgNameForeign: (orgNameForeign != null
            ? orgNameForeign.value
            : this.orgNameForeign),
        fieldOfWork:
            (fieldOfWork != null ? fieldOfWork.value : this.fieldOfWork),
        about: (about != null ? about.value : this.about),
        vision: (vision != null ? vision.value : this.vision),
        mission: (mission != null ? mission.value : this.mission),
        address: (address != null ? address.value : this.address),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateSkillDto {
  UpdateSkillDto({
    required this.id,
    this.name,
    this.categoryId,
    this.category,
  });

  factory UpdateSkillDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateSkillDtoFromJson(json);

  static const toJsonFactory = _$UpdateSkillDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateSkillDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  static const fromJsonFactory = _$UpdateSkillDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateSkillDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      runtimeType.hashCode;
}

extension $UpdateSkillDtoExtension on UpdateSkillDto {
  UpdateSkillDto copyWith(
      {int? id, String? name, int? categoryId, CreateCategoryDto? category}) {
    return UpdateSkillDto(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category);
  }

  UpdateSkillDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? name,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category}) {
    return UpdateSkillDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateStudentApplicationDto {
  UpdateStudentApplicationDto({
    required this.id,
    this.textInformation,
    this.saveTempFile,
  });

  factory UpdateStudentApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentApplicationDtoFromJson(json);

  static const toJsonFactory = _$UpdateStudentApplicationDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateStudentApplicationDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'textInformation')
  final String? textInformation;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateStudentApplicationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStudentApplicationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.textInformation, textInformation) ||
                const DeepCollectionEquality()
                    .equals(other.textInformation, textInformation)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(textInformation) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateStudentApplicationDtoExtension on UpdateStudentApplicationDto {
  UpdateStudentApplicationDto copyWith(
      {int? id, String? textInformation, SaveTempFile? saveTempFile}) {
    return UpdateStudentApplicationDto(
        id: id ?? this.id,
        textInformation: textInformation ?? this.textInformation,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateStudentApplicationDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? textInformation,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateStudentApplicationDto(
        id: (id != null ? id.value : this.id),
        textInformation: (textInformation != null
            ? textInformation.value
            : this.textInformation),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateStudentByManagementDto {
  UpdateStudentByManagementDto({
    required this.id,
    required this.universityIdNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.specialization,
    this.address,
    this.dateOfBirth,
  });

  factory UpdateStudentByManagementDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentByManagementDtoFromJson(json);

  static const toJsonFactory = _$UpdateStudentByManagementDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateStudentByManagementDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'universityIdNumber')
  final int universityIdNumber;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'specialization')
  final String? specialization;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  static const fromJsonFactory = _$UpdateStudentByManagementDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStudentByManagementDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.universityIdNumber, universityIdNumber) ||
                const DeepCollectionEquality()
                    .equals(other.universityIdNumber, universityIdNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(universityIdNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      runtimeType.hashCode;
}

extension $UpdateStudentByManagementDtoExtension
    on UpdateStudentByManagementDto {
  UpdateStudentByManagementDto copyWith(
      {int? id,
      int? universityIdNumber,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specialization,
      String? address,
      DateTime? dateOfBirth}) {
    return UpdateStudentByManagementDto(
        id: id ?? this.id,
        universityIdNumber: universityIdNumber ?? this.universityIdNumber,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        specialization: specialization ?? this.specialization,
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth);
  }

  UpdateStudentByManagementDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<int>? universityIdNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? specialization,
      Wrapped<String?>? address,
      Wrapped<DateTime?>? dateOfBirth}) {
    return UpdateStudentByManagementDto(
        id: (id != null ? id.value : this.id),
        universityIdNumber: (universityIdNumber != null
            ? universityIdNumber.value
            : this.universityIdNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        address: (address != null ? address.value : this.address),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateStudentDto {
  UpdateStudentDto({
    required this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.specialization,
    this.address,
    this.dateOfBirth,
    this.biography,
    this.saveTempFile,
  });

  factory UpdateStudentDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentDtoFromJson(json);

  static const toJsonFactory = _$UpdateStudentDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateStudentDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'specialization')
  final String? specialization;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStudentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.specialization, specialization) ||
                const DeepCollectionEquality()
                    .equals(other.specialization, specialization)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.biography, biography) ||
                const DeepCollectionEquality()
                    .equals(other.biography, biography)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(specialization) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(biography) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateStudentDtoExtension on UpdateStudentDto {
  UpdateStudentDto copyWith(
      {int? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? specialization,
      String? address,
      DateTime? dateOfBirth,
      String? biography,
      SaveTempFile? saveTempFile}) {
    return UpdateStudentDto(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        specialization: specialization ?? this.specialization,
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        biography: biography ?? this.biography,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateStudentDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? middleName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? specialization,
      Wrapped<String?>? address,
      Wrapped<DateTime?>? dateOfBirth,
      Wrapped<String?>? biography,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateStudentDto(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        middleName: (middleName != null ? middleName.value : this.middleName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        specialization: (specialization != null
            ? specialization.value
            : this.specialization),
        address: (address != null ? address.value : this.address),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth),
        biography: (biography != null ? biography.value : this.biography),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateStudentSkills {
  UpdateStudentSkills({
    required this.studentId,
    this.skills,
  });

  factory UpdateStudentSkills.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentSkillsFromJson(json);

  static const toJsonFactory = _$UpdateStudentSkillsToJson;
  Map<String, dynamic> toJson() => _$UpdateStudentSkillsToJson(this);

  @JsonKey(name: 'studentId')
  final int studentId;
  @JsonKey(name: 'skills', defaultValue: <ExistingOrCreateNewSkillDto>[])
  final List<ExistingOrCreateNewSkillDto>? skills;
  static const fromJsonFactory = _$UpdateStudentSkillsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStudentSkills &&
            (identical(other.studentId, studentId) ||
                const DeepCollectionEquality()
                    .equals(other.studentId, studentId)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studentId) ^
      const DeepCollectionEquality().hash(skills) ^
      runtimeType.hashCode;
}

extension $UpdateStudentSkillsExtension on UpdateStudentSkills {
  UpdateStudentSkills copyWith(
      {int? studentId, List<ExistingOrCreateNewSkillDto>? skills}) {
    return UpdateStudentSkills(
        studentId: studentId ?? this.studentId, skills: skills ?? this.skills);
  }

  UpdateStudentSkills copyWithWrapped(
      {Wrapped<int>? studentId,
      Wrapped<List<ExistingOrCreateNewSkillDto>?>? skills}) {
    return UpdateStudentSkills(
        studentId: (studentId != null ? studentId.value : this.studentId),
        skills: (skills != null ? skills.value : this.skills));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerOpportunityDto {
  UpdateVolunteerOpportunityDto({
    required this.id,
    this.title,
    this.description,
    this.natureOfWorkOrActivities,
    this.categoryId,
    this.category,
    this.saveTempFile,
    this.actualProgramStartDate,
    this.actualProgramEndDate,
    this.announcementEndDate,
    this.receiveApplicationsEndDate,
    this.requiredVolunteerStudentsNumber,
    this.volunteerSkills,
    this.applicantQualifications,
    this.isRequirementNeededAsText,
    this.isRequirementNeededAsFile,
    this.requirementFileDescription,
    this.requirementFileMaxAllowedSize,
    this.requirementFileAllowedTypes,
  });

  factory UpdateVolunteerOpportunityDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateVolunteerOpportunityDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerOpportunityDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateVolunteerOpportunityDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'natureOfWorkOrActivities')
  final String? natureOfWorkOrActivities;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  @JsonKey(name: 'actualProgramStartDate')
  final DateTime? actualProgramStartDate;
  @JsonKey(name: 'actualProgramEndDate')
  final DateTime? actualProgramEndDate;
  @JsonKey(name: 'announcementEndDate')
  final DateTime? announcementEndDate;
  @JsonKey(name: 'receiveApplicationsEndDate')
  final DateTime? receiveApplicationsEndDate;
  @JsonKey(name: 'requiredVolunteerStudentsNumber')
  final int? requiredVolunteerStudentsNumber;
  @JsonKey(
      name: 'volunteerSkills', defaultValue: <ExistingOrCreateNewSkillDto>[])
  final List<ExistingOrCreateNewSkillDto>? volunteerSkills;
  @JsonKey(name: 'applicantQualifications')
  final String? applicantQualifications;
  @JsonKey(name: 'isRequirementNeededAsText')
  final bool? isRequirementNeededAsText;
  @JsonKey(name: 'isRequirementNeededAsFile')
  final bool? isRequirementNeededAsFile;
  @JsonKey(name: 'requirementFileDescription')
  final String? requirementFileDescription;
  @JsonKey(name: 'requirementFileMaxAllowedSize')
  final double? requirementFileMaxAllowedSize;
  @JsonKey(name: 'requirementFileAllowedTypes')
  final String? requirementFileAllowedTypes;
  static const fromJsonFactory = _$UpdateVolunteerOpportunityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerOpportunityDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.natureOfWorkOrActivities, natureOfWorkOrActivities) ||
                const DeepCollectionEquality().equals(
                    other.natureOfWorkOrActivities,
                    natureOfWorkOrActivities)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)) &&
            (identical(other.actualProgramStartDate, actualProgramStartDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramStartDate, actualProgramStartDate)) &&
            (identical(other.actualProgramEndDate, actualProgramEndDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramEndDate, actualProgramEndDate)) &&
            (identical(other.announcementEndDate, announcementEndDate) ||
                const DeepCollectionEquality()
                    .equals(other.announcementEndDate, announcementEndDate)) &&
            (identical(other.receiveApplicationsEndDate, receiveApplicationsEndDate) ||
                const DeepCollectionEquality().equals(
                    other.receiveApplicationsEndDate,
                    receiveApplicationsEndDate)) &&
            (identical(other.requiredVolunteerStudentsNumber, requiredVolunteerStudentsNumber) ||
                const DeepCollectionEquality().equals(
                    other.requiredVolunteerStudentsNumber,
                    requiredVolunteerStudentsNumber)) &&
            (identical(other.volunteerSkills, volunteerSkills) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerSkills, volunteerSkills)) &&
            (identical(other.applicantQualifications, applicantQualifications) ||
                const DeepCollectionEquality().equals(
                    other.applicantQualifications, applicantQualifications)) &&
            (identical(other.isRequirementNeededAsText, isRequirementNeededAsText) ||
                const DeepCollectionEquality().equals(other.isRequirementNeededAsText, isRequirementNeededAsText)) &&
            (identical(other.isRequirementNeededAsFile, isRequirementNeededAsFile) || const DeepCollectionEquality().equals(other.isRequirementNeededAsFile, isRequirementNeededAsFile)) &&
            (identical(other.requirementFileDescription, requirementFileDescription) || const DeepCollectionEquality().equals(other.requirementFileDescription, requirementFileDescription)) &&
            (identical(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize) || const DeepCollectionEquality().equals(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize)) &&
            (identical(other.requirementFileAllowedTypes, requirementFileAllowedTypes) || const DeepCollectionEquality().equals(other.requirementFileAllowedTypes, requirementFileAllowedTypes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(natureOfWorkOrActivities) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      const DeepCollectionEquality().hash(actualProgramStartDate) ^
      const DeepCollectionEquality().hash(actualProgramEndDate) ^
      const DeepCollectionEquality().hash(announcementEndDate) ^
      const DeepCollectionEquality().hash(receiveApplicationsEndDate) ^
      const DeepCollectionEquality().hash(requiredVolunteerStudentsNumber) ^
      const DeepCollectionEquality().hash(volunteerSkills) ^
      const DeepCollectionEquality().hash(applicantQualifications) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsText) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsFile) ^
      const DeepCollectionEquality().hash(requirementFileDescription) ^
      const DeepCollectionEquality().hash(requirementFileMaxAllowedSize) ^
      const DeepCollectionEquality().hash(requirementFileAllowedTypes) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerOpportunityDtoExtension
    on UpdateVolunteerOpportunityDto {
  UpdateVolunteerOpportunityDto copyWith(
      {int? id,
      String? title,
      String? description,
      String? natureOfWorkOrActivities,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile,
      DateTime? actualProgramStartDate,
      DateTime? actualProgramEndDate,
      DateTime? announcementEndDate,
      DateTime? receiveApplicationsEndDate,
      int? requiredVolunteerStudentsNumber,
      List<ExistingOrCreateNewSkillDto>? volunteerSkills,
      String? applicantQualifications,
      bool? isRequirementNeededAsText,
      bool? isRequirementNeededAsFile,
      String? requirementFileDescription,
      double? requirementFileMaxAllowedSize,
      String? requirementFileAllowedTypes}) {
    return UpdateVolunteerOpportunityDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        natureOfWorkOrActivities:
            natureOfWorkOrActivities ?? this.natureOfWorkOrActivities,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile,
        actualProgramStartDate:
            actualProgramStartDate ?? this.actualProgramStartDate,
        actualProgramEndDate: actualProgramEndDate ?? this.actualProgramEndDate,
        announcementEndDate: announcementEndDate ?? this.announcementEndDate,
        receiveApplicationsEndDate:
            receiveApplicationsEndDate ?? this.receiveApplicationsEndDate,
        requiredVolunteerStudentsNumber: requiredVolunteerStudentsNumber ??
            this.requiredVolunteerStudentsNumber,
        volunteerSkills: volunteerSkills ?? this.volunteerSkills,
        applicantQualifications:
            applicantQualifications ?? this.applicantQualifications,
        isRequirementNeededAsText:
            isRequirementNeededAsText ?? this.isRequirementNeededAsText,
        isRequirementNeededAsFile:
            isRequirementNeededAsFile ?? this.isRequirementNeededAsFile,
        requirementFileDescription:
            requirementFileDescription ?? this.requirementFileDescription,
        requirementFileMaxAllowedSize:
            requirementFileMaxAllowedSize ?? this.requirementFileMaxAllowedSize,
        requirementFileAllowedTypes:
            requirementFileAllowedTypes ?? this.requirementFileAllowedTypes);
  }

  UpdateVolunteerOpportunityDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? natureOfWorkOrActivities,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile,
      Wrapped<DateTime?>? actualProgramStartDate,
      Wrapped<DateTime?>? actualProgramEndDate,
      Wrapped<DateTime?>? announcementEndDate,
      Wrapped<DateTime?>? receiveApplicationsEndDate,
      Wrapped<int?>? requiredVolunteerStudentsNumber,
      Wrapped<List<ExistingOrCreateNewSkillDto>?>? volunteerSkills,
      Wrapped<String?>? applicantQualifications,
      Wrapped<bool?>? isRequirementNeededAsText,
      Wrapped<bool?>? isRequirementNeededAsFile,
      Wrapped<String?>? requirementFileDescription,
      Wrapped<double?>? requirementFileMaxAllowedSize,
      Wrapped<String?>? requirementFileAllowedTypes}) {
    return UpdateVolunteerOpportunityDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        natureOfWorkOrActivities: (natureOfWorkOrActivities != null
            ? natureOfWorkOrActivities.value
            : this.natureOfWorkOrActivities),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile),
        actualProgramStartDate: (actualProgramStartDate != null
            ? actualProgramStartDate.value
            : this.actualProgramStartDate),
        actualProgramEndDate: (actualProgramEndDate != null
            ? actualProgramEndDate.value
            : this.actualProgramEndDate),
        announcementEndDate: (announcementEndDate != null
            ? announcementEndDate.value
            : this.announcementEndDate),
        receiveApplicationsEndDate: (receiveApplicationsEndDate != null
            ? receiveApplicationsEndDate.value
            : this.receiveApplicationsEndDate),
        requiredVolunteerStudentsNumber:
            (requiredVolunteerStudentsNumber != null
                ? requiredVolunteerStudentsNumber.value
                : this.requiredVolunteerStudentsNumber),
        volunteerSkills: (volunteerSkills != null
            ? volunteerSkills.value
            : this.volunteerSkills),
        applicantQualifications: (applicantQualifications != null
            ? applicantQualifications.value
            : this.applicantQualifications),
        isRequirementNeededAsText: (isRequirementNeededAsText != null
            ? isRequirementNeededAsText.value
            : this.isRequirementNeededAsText),
        isRequirementNeededAsFile: (isRequirementNeededAsFile != null
            ? isRequirementNeededAsFile.value
            : this.isRequirementNeededAsFile),
        requirementFileDescription: (requirementFileDescription != null
            ? requirementFileDescription.value
            : this.requirementFileDescription),
        requirementFileMaxAllowedSize: (requirementFileMaxAllowedSize != null
            ? requirementFileMaxAllowedSize.value
            : this.requirementFileMaxAllowedSize),
        requirementFileAllowedTypes: (requirementFileAllowedTypes != null
            ? requirementFileAllowedTypes.value
            : this.requirementFileAllowedTypes));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerProgramActivityDto {
  UpdateVolunteerProgramActivityDto({
    required this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.saveTempFiles,
  });

  factory UpdateVolunteerProgramActivityDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerProgramActivityDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerProgramActivityDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerProgramActivityDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'saveTempFiles', defaultValue: <SaveTempFile>[])
  final List<SaveTempFile>? saveTempFiles;
  static const fromJsonFactory = _$UpdateVolunteerProgramActivityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerProgramActivityDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.saveTempFiles, saveTempFiles) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFiles, saveTempFiles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(saveTempFiles) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerProgramActivityDtoExtension
    on UpdateVolunteerProgramActivityDto {
  UpdateVolunteerProgramActivityDto copyWith(
      {int? id,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      List<SaveTempFile>? saveTempFiles}) {
    return UpdateVolunteerProgramActivityDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        saveTempFiles: saveTempFiles ?? this.saveTempFiles);
  }

  UpdateVolunteerProgramActivityDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<List<SaveTempFile>?>? saveTempFiles}) {
    return UpdateVolunteerProgramActivityDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        saveTempFiles:
            (saveTempFiles != null ? saveTempFiles.value : this.saveTempFiles));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerProgramDto {
  UpdateVolunteerProgramDto({
    required this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.categoryId,
    this.category,
    this.saveTempFile,
  });

  factory UpdateVolunteerProgramDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateVolunteerProgramDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerProgramDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateVolunteerProgramDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CreateCategoryDto? category;
  @JsonKey(name: 'saveTempFile')
  final SaveTempFile? saveTempFile;
  static const fromJsonFactory = _$UpdateVolunteerProgramDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerProgramDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.saveTempFile, saveTempFile) ||
                const DeepCollectionEquality()
                    .equals(other.saveTempFile, saveTempFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(saveTempFile) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerProgramDtoExtension on UpdateVolunteerProgramDto {
  UpdateVolunteerProgramDto copyWith(
      {int? id,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? categoryId,
      CreateCategoryDto? category,
      SaveTempFile? saveTempFile}) {
    return UpdateVolunteerProgramDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        saveTempFile: saveTempFile ?? this.saveTempFile);
  }

  UpdateVolunteerProgramDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? categoryId,
      Wrapped<CreateCategoryDto?>? category,
      Wrapped<SaveTempFile?>? saveTempFile}) {
    return UpdateVolunteerProgramDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        saveTempFile:
            (saveTempFile != null ? saveTempFile.value : this.saveTempFile));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerProgramTaskDto {
  UpdateVolunteerProgramTaskDto({
    required this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
  });

  factory UpdateVolunteerProgramTaskDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateVolunteerProgramTaskDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerProgramTaskDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateVolunteerProgramTaskDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  static const fromJsonFactory = _$UpdateVolunteerProgramTaskDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerProgramTaskDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerProgramTaskDtoExtension
    on UpdateVolunteerProgramTaskDto {
  UpdateVolunteerProgramTaskDto copyWith(
      {int? id,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate}) {
    return UpdateVolunteerProgramTaskDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }

  UpdateVolunteerProgramTaskDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate}) {
    return UpdateVolunteerProgramTaskDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerProgramWorkDayDto {
  UpdateVolunteerProgramWorkDayDto({
    required this.id,
    this.name,
    this.date,
  });

  factory UpdateVolunteerProgramWorkDayDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerProgramWorkDayDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerProgramWorkDayDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerProgramWorkDayDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'date')
  final DateTime? date;
  static const fromJsonFactory = _$UpdateVolunteerProgramWorkDayDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerProgramWorkDayDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerProgramWorkDayDtoExtension
    on UpdateVolunteerProgramWorkDayDto {
  UpdateVolunteerProgramWorkDayDto copyWith(
      {int? id, String? name, DateTime? date}) {
    return UpdateVolunteerProgramWorkDayDto(
        id: id ?? this.id, name: name ?? this.name, date: date ?? this.date);
  }

  UpdateVolunteerProgramWorkDayDto copyWithWrapped(
      {Wrapped<int>? id, Wrapped<String?>? name, Wrapped<DateTime?>? date}) {
    return UpdateVolunteerProgramWorkDayDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerStudentActivityAttendanceDto {
  UpdateVolunteerStudentActivityAttendanceDto({
    required this.id,
    this.isAttended,
  });

  factory UpdateVolunteerStudentActivityAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerStudentActivityAttendanceDtoFromJson(json);

  static const toJsonFactory =
      _$UpdateVolunteerStudentActivityAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerStudentActivityAttendanceDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'isAttended')
  final bool? isAttended;
  static const fromJsonFactory =
      _$UpdateVolunteerStudentActivityAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerStudentActivityAttendanceDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isAttended) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerStudentActivityAttendanceDtoExtension
    on UpdateVolunteerStudentActivityAttendanceDto {
  UpdateVolunteerStudentActivityAttendanceDto copyWith(
      {int? id, bool? isAttended}) {
    return UpdateVolunteerStudentActivityAttendanceDto(
        id: id ?? this.id, isAttended: isAttended ?? this.isAttended);
  }

  UpdateVolunteerStudentActivityAttendanceDto copyWithWrapped(
      {Wrapped<int>? id, Wrapped<bool?>? isAttended}) {
    return UpdateVolunteerStudentActivityAttendanceDto(
        id: (id != null ? id.value : this.id),
        isAttended: (isAttended != null ? isAttended.value : this.isAttended));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerStudentFinalEvaluationDto {
  UpdateVolunteerStudentFinalEvaluationDto({
    required this.id,
    this.finalGrade,
    this.finalGradeNotes,
  });

  factory UpdateVolunteerStudentFinalEvaluationDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerStudentFinalEvaluationDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerStudentFinalEvaluationDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerStudentFinalEvaluationDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'finalGrade')
  final double? finalGrade;
  @JsonKey(name: 'finalGradeNotes')
  final String? finalGradeNotes;
  static const fromJsonFactory =
      _$UpdateVolunteerStudentFinalEvaluationDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerStudentFinalEvaluationDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.finalGrade, finalGrade) ||
                const DeepCollectionEquality()
                    .equals(other.finalGrade, finalGrade)) &&
            (identical(other.finalGradeNotes, finalGradeNotes) ||
                const DeepCollectionEquality()
                    .equals(other.finalGradeNotes, finalGradeNotes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(finalGrade) ^
      const DeepCollectionEquality().hash(finalGradeNotes) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerStudentFinalEvaluationDtoExtension
    on UpdateVolunteerStudentFinalEvaluationDto {
  UpdateVolunteerStudentFinalEvaluationDto copyWith(
      {int? id, double? finalGrade, String? finalGradeNotes}) {
    return UpdateVolunteerStudentFinalEvaluationDto(
        id: id ?? this.id,
        finalGrade: finalGrade ?? this.finalGrade,
        finalGradeNotes: finalGradeNotes ?? this.finalGradeNotes);
  }

  UpdateVolunteerStudentFinalEvaluationDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<double?>? finalGrade,
      Wrapped<String?>? finalGradeNotes}) {
    return UpdateVolunteerStudentFinalEvaluationDto(
        id: (id != null ? id.value : this.id),
        finalGrade: (finalGrade != null ? finalGrade.value : this.finalGrade),
        finalGradeNotes: (finalGradeNotes != null
            ? finalGradeNotes.value
            : this.finalGradeNotes));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerStudentOrgAssessmentDto {
  UpdateVolunteerStudentOrgAssessmentDto({
    required this.id,
    this.orgAssessmentGrade,
    this.orgAssessmentGradeNotes,
  });

  factory UpdateVolunteerStudentOrgAssessmentDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerStudentOrgAssessmentDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerStudentOrgAssessmentDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerStudentOrgAssessmentDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'orgAssessmentGrade')
  final double? orgAssessmentGrade;
  @JsonKey(name: 'orgAssessmentGradeNotes')
  final String? orgAssessmentGradeNotes;
  static const fromJsonFactory =
      _$UpdateVolunteerStudentOrgAssessmentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerStudentOrgAssessmentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orgAssessmentGrade, orgAssessmentGrade) ||
                const DeepCollectionEquality()
                    .equals(other.orgAssessmentGrade, orgAssessmentGrade)) &&
            (identical(
                    other.orgAssessmentGradeNotes, orgAssessmentGradeNotes) ||
                const DeepCollectionEquality().equals(
                    other.orgAssessmentGradeNotes, orgAssessmentGradeNotes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orgAssessmentGrade) ^
      const DeepCollectionEquality().hash(orgAssessmentGradeNotes) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerStudentOrgAssessmentDtoExtension
    on UpdateVolunteerStudentOrgAssessmentDto {
  UpdateVolunteerStudentOrgAssessmentDto copyWith(
      {int? id, double? orgAssessmentGrade, String? orgAssessmentGradeNotes}) {
    return UpdateVolunteerStudentOrgAssessmentDto(
        id: id ?? this.id,
        orgAssessmentGrade: orgAssessmentGrade ?? this.orgAssessmentGrade,
        orgAssessmentGradeNotes:
            orgAssessmentGradeNotes ?? this.orgAssessmentGradeNotes);
  }

  UpdateVolunteerStudentOrgAssessmentDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<double?>? orgAssessmentGrade,
      Wrapped<String?>? orgAssessmentGradeNotes}) {
    return UpdateVolunteerStudentOrgAssessmentDto(
        id: (id != null ? id.value : this.id),
        orgAssessmentGrade: (orgAssessmentGrade != null
            ? orgAssessmentGrade.value
            : this.orgAssessmentGrade),
        orgAssessmentGradeNotes: (orgAssessmentGradeNotes != null
            ? orgAssessmentGradeNotes.value
            : this.orgAssessmentGradeNotes));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerStudentTaskAccomplishDto {
  UpdateVolunteerStudentTaskAccomplishDto({
    required this.id,
    this.isAccomplished,
    this.rate,
  });

  factory UpdateVolunteerStudentTaskAccomplishDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerStudentTaskAccomplishDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerStudentTaskAccomplishDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerStudentTaskAccomplishDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'isAccomplished')
  final bool? isAccomplished;
  @JsonKey(name: 'rate')
  final double? rate;
  static const fromJsonFactory =
      _$UpdateVolunteerStudentTaskAccomplishDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerStudentTaskAccomplishDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isAccomplished, isAccomplished) ||
                const DeepCollectionEquality()
                    .equals(other.isAccomplished, isAccomplished)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isAccomplished) ^
      const DeepCollectionEquality().hash(rate) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerStudentTaskAccomplishDtoExtension
    on UpdateVolunteerStudentTaskAccomplishDto {
  UpdateVolunteerStudentTaskAccomplishDto copyWith(
      {int? id, bool? isAccomplished, double? rate}) {
    return UpdateVolunteerStudentTaskAccomplishDto(
        id: id ?? this.id,
        isAccomplished: isAccomplished ?? this.isAccomplished,
        rate: rate ?? this.rate);
  }

  UpdateVolunteerStudentTaskAccomplishDto copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<bool?>? isAccomplished,
      Wrapped<double?>? rate}) {
    return UpdateVolunteerStudentTaskAccomplishDto(
        id: (id != null ? id.value : this.id),
        isAccomplished: (isAccomplished != null
            ? isAccomplished.value
            : this.isAccomplished),
        rate: (rate != null ? rate.value : this.rate));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVolunteerStudentWorkAttendanceDto {
  UpdateVolunteerStudentWorkAttendanceDto({
    required this.id,
    this.isAttended,
  });

  factory UpdateVolunteerStudentWorkAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVolunteerStudentWorkAttendanceDtoFromJson(json);

  static const toJsonFactory = _$UpdateVolunteerStudentWorkAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$UpdateVolunteerStudentWorkAttendanceDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'isAttended')
  final bool? isAttended;
  static const fromJsonFactory =
      _$UpdateVolunteerStudentWorkAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateVolunteerStudentWorkAttendanceDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isAttended) ^
      runtimeType.hashCode;
}

extension $UpdateVolunteerStudentWorkAttendanceDtoExtension
    on UpdateVolunteerStudentWorkAttendanceDto {
  UpdateVolunteerStudentWorkAttendanceDto copyWith(
      {int? id, bool? isAttended}) {
    return UpdateVolunteerStudentWorkAttendanceDto(
        id: id ?? this.id, isAttended: isAttended ?? this.isAttended);
  }

  UpdateVolunteerStudentWorkAttendanceDto copyWithWrapped(
      {Wrapped<int>? id, Wrapped<bool?>? isAttended}) {
    return UpdateVolunteerStudentWorkAttendanceDto(
        id: (id != null ? id.value : this.id),
        isAttended: (isAttended != null ? isAttended.value : this.isAttended));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerOpportunityDto {
  VolunteerOpportunityDto({
    this.id,
    this.createdDate,
    this.organizationId,
    this.organization,
    this.title,
    this.description,
    this.natureOfWorkOrActivities,
    this.categoryId,
    this.category,
    this.logo,
    this.actualProgramStartDate,
    this.actualProgramEndDate,
    this.announcementEndDate,
    this.receiveApplicationsEndDate,
    this.requiredVolunteerStudentsNumber,
    this.volunteerSkills,
    this.applicantQualifications,
    this.isRequirementNeededAsText,
    this.isRequirementNeededAsFile,
    this.requirementFileDescription,
    this.requirementFileMaxAllowedSize,
    this.requirementFileAllowedTypes,
  });

  factory VolunteerOpportunityDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerOpportunityDtoFromJson(json);

  static const toJsonFactory = _$VolunteerOpportunityDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerOpportunityDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'organizationId')
  final int? organizationId;
  @JsonKey(name: 'organization')
  final OrganizationDto? organization;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'natureOfWorkOrActivities')
  final String? natureOfWorkOrActivities;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CategoryDto? category;
  @JsonKey(name: 'logo')
  final SavedFileDto? logo;
  @JsonKey(name: 'actualProgramStartDate')
  final DateTime? actualProgramStartDate;
  @JsonKey(name: 'actualProgramEndDate')
  final DateTime? actualProgramEndDate;
  @JsonKey(name: 'announcementEndDate')
  final DateTime? announcementEndDate;
  @JsonKey(name: 'receiveApplicationsEndDate')
  final DateTime? receiveApplicationsEndDate;
  @JsonKey(name: 'requiredVolunteerStudentsNumber')
  final int? requiredVolunteerStudentsNumber;
  @JsonKey(name: 'volunteerSkills', defaultValue: <SkillDto>[])
  final List<SkillDto>? volunteerSkills;
  @JsonKey(name: 'applicantQualifications')
  final String? applicantQualifications;
  @JsonKey(name: 'isRequirementNeededAsText')
  final bool? isRequirementNeededAsText;
  @JsonKey(name: 'isRequirementNeededAsFile')
  final bool? isRequirementNeededAsFile;
  @JsonKey(name: 'requirementFileDescription')
  final String? requirementFileDescription;
  @JsonKey(name: 'requirementFileMaxAllowedSize')
  final double? requirementFileMaxAllowedSize;
  @JsonKey(name: 'requirementFileAllowedTypes')
  final String? requirementFileAllowedTypes;
  static const fromJsonFactory = _$VolunteerOpportunityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerOpportunityDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.organization, organization) ||
                const DeepCollectionEquality()
                    .equals(other.organization, organization)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.natureOfWorkOrActivities, natureOfWorkOrActivities) ||
                const DeepCollectionEquality().equals(
                    other.natureOfWorkOrActivities,
                    natureOfWorkOrActivities)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.actualProgramStartDate, actualProgramStartDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramStartDate, actualProgramStartDate)) &&
            (identical(other.actualProgramEndDate, actualProgramEndDate) ||
                const DeepCollectionEquality().equals(
                    other.actualProgramEndDate, actualProgramEndDate)) &&
            (identical(other.announcementEndDate, announcementEndDate) ||
                const DeepCollectionEquality()
                    .equals(other.announcementEndDate, announcementEndDate)) &&
            (identical(other.receiveApplicationsEndDate, receiveApplicationsEndDate) ||
                const DeepCollectionEquality().equals(
                    other.receiveApplicationsEndDate,
                    receiveApplicationsEndDate)) &&
            (identical(other.requiredVolunteerStudentsNumber, requiredVolunteerStudentsNumber) ||
                const DeepCollectionEquality().equals(
                    other.requiredVolunteerStudentsNumber,
                    requiredVolunteerStudentsNumber)) &&
            (identical(other.volunteerSkills, volunteerSkills) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerSkills, volunteerSkills)) &&
            (identical(other.applicantQualifications, applicantQualifications) ||
                const DeepCollectionEquality().equals(other.applicantQualifications, applicantQualifications)) &&
            (identical(other.isRequirementNeededAsText, isRequirementNeededAsText) || const DeepCollectionEquality().equals(other.isRequirementNeededAsText, isRequirementNeededAsText)) &&
            (identical(other.isRequirementNeededAsFile, isRequirementNeededAsFile) || const DeepCollectionEquality().equals(other.isRequirementNeededAsFile, isRequirementNeededAsFile)) &&
            (identical(other.requirementFileDescription, requirementFileDescription) || const DeepCollectionEquality().equals(other.requirementFileDescription, requirementFileDescription)) &&
            (identical(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize) || const DeepCollectionEquality().equals(other.requirementFileMaxAllowedSize, requirementFileMaxAllowedSize)) &&
            (identical(other.requirementFileAllowedTypes, requirementFileAllowedTypes) || const DeepCollectionEquality().equals(other.requirementFileAllowedTypes, requirementFileAllowedTypes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(organization) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(natureOfWorkOrActivities) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(actualProgramStartDate) ^
      const DeepCollectionEquality().hash(actualProgramEndDate) ^
      const DeepCollectionEquality().hash(announcementEndDate) ^
      const DeepCollectionEquality().hash(receiveApplicationsEndDate) ^
      const DeepCollectionEquality().hash(requiredVolunteerStudentsNumber) ^
      const DeepCollectionEquality().hash(volunteerSkills) ^
      const DeepCollectionEquality().hash(applicantQualifications) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsText) ^
      const DeepCollectionEquality().hash(isRequirementNeededAsFile) ^
      const DeepCollectionEquality().hash(requirementFileDescription) ^
      const DeepCollectionEquality().hash(requirementFileMaxAllowedSize) ^
      const DeepCollectionEquality().hash(requirementFileAllowedTypes) ^
      runtimeType.hashCode;
}

extension $VolunteerOpportunityDtoExtension on VolunteerOpportunityDto {
  VolunteerOpportunityDto copyWith(
      {int? id,
      DateTime? createdDate,
      int? organizationId,
      OrganizationDto? organization,
      String? title,
      String? description,
      String? natureOfWorkOrActivities,
      int? categoryId,
      CategoryDto? category,
      SavedFileDto? logo,
      DateTime? actualProgramStartDate,
      DateTime? actualProgramEndDate,
      DateTime? announcementEndDate,
      DateTime? receiveApplicationsEndDate,
      int? requiredVolunteerStudentsNumber,
      List<SkillDto>? volunteerSkills,
      String? applicantQualifications,
      bool? isRequirementNeededAsText,
      bool? isRequirementNeededAsFile,
      String? requirementFileDescription,
      double? requirementFileMaxAllowedSize,
      String? requirementFileAllowedTypes}) {
    return VolunteerOpportunityDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        organizationId: organizationId ?? this.organizationId,
        organization: organization ?? this.organization,
        title: title ?? this.title,
        description: description ?? this.description,
        natureOfWorkOrActivities:
            natureOfWorkOrActivities ?? this.natureOfWorkOrActivities,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        logo: logo ?? this.logo,
        actualProgramStartDate:
            actualProgramStartDate ?? this.actualProgramStartDate,
        actualProgramEndDate: actualProgramEndDate ?? this.actualProgramEndDate,
        announcementEndDate: announcementEndDate ?? this.announcementEndDate,
        receiveApplicationsEndDate:
            receiveApplicationsEndDate ?? this.receiveApplicationsEndDate,
        requiredVolunteerStudentsNumber: requiredVolunteerStudentsNumber ??
            this.requiredVolunteerStudentsNumber,
        volunteerSkills: volunteerSkills ?? this.volunteerSkills,
        applicantQualifications:
            applicantQualifications ?? this.applicantQualifications,
        isRequirementNeededAsText:
            isRequirementNeededAsText ?? this.isRequirementNeededAsText,
        isRequirementNeededAsFile:
            isRequirementNeededAsFile ?? this.isRequirementNeededAsFile,
        requirementFileDescription:
            requirementFileDescription ?? this.requirementFileDescription,
        requirementFileMaxAllowedSize:
            requirementFileMaxAllowedSize ?? this.requirementFileMaxAllowedSize,
        requirementFileAllowedTypes:
            requirementFileAllowedTypes ?? this.requirementFileAllowedTypes);
  }

  VolunteerOpportunityDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<int?>? organizationId,
      Wrapped<OrganizationDto?>? organization,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? natureOfWorkOrActivities,
      Wrapped<int?>? categoryId,
      Wrapped<CategoryDto?>? category,
      Wrapped<SavedFileDto?>? logo,
      Wrapped<DateTime?>? actualProgramStartDate,
      Wrapped<DateTime?>? actualProgramEndDate,
      Wrapped<DateTime?>? announcementEndDate,
      Wrapped<DateTime?>? receiveApplicationsEndDate,
      Wrapped<int?>? requiredVolunteerStudentsNumber,
      Wrapped<List<SkillDto>?>? volunteerSkills,
      Wrapped<String?>? applicantQualifications,
      Wrapped<bool?>? isRequirementNeededAsText,
      Wrapped<bool?>? isRequirementNeededAsFile,
      Wrapped<String?>? requirementFileDescription,
      Wrapped<double?>? requirementFileMaxAllowedSize,
      Wrapped<String?>? requirementFileAllowedTypes}) {
    return VolunteerOpportunityDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        organization:
            (organization != null ? organization.value : this.organization),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        natureOfWorkOrActivities: (natureOfWorkOrActivities != null
            ? natureOfWorkOrActivities.value
            : this.natureOfWorkOrActivities),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        logo: (logo != null ? logo.value : this.logo),
        actualProgramStartDate: (actualProgramStartDate != null
            ? actualProgramStartDate.value
            : this.actualProgramStartDate),
        actualProgramEndDate: (actualProgramEndDate != null
            ? actualProgramEndDate.value
            : this.actualProgramEndDate),
        announcementEndDate: (announcementEndDate != null
            ? announcementEndDate.value
            : this.announcementEndDate),
        receiveApplicationsEndDate: (receiveApplicationsEndDate != null
            ? receiveApplicationsEndDate.value
            : this.receiveApplicationsEndDate),
        requiredVolunteerStudentsNumber:
            (requiredVolunteerStudentsNumber != null
                ? requiredVolunteerStudentsNumber.value
                : this.requiredVolunteerStudentsNumber),
        volunteerSkills: (volunteerSkills != null
            ? volunteerSkills.value
            : this.volunteerSkills),
        applicantQualifications: (applicantQualifications != null
            ? applicantQualifications.value
            : this.applicantQualifications),
        isRequirementNeededAsText: (isRequirementNeededAsText != null
            ? isRequirementNeededAsText.value
            : this.isRequirementNeededAsText),
        isRequirementNeededAsFile: (isRequirementNeededAsFile != null
            ? isRequirementNeededAsFile.value
            : this.isRequirementNeededAsFile),
        requirementFileDescription: (requirementFileDescription != null
            ? requirementFileDescription.value
            : this.requirementFileDescription),
        requirementFileMaxAllowedSize: (requirementFileMaxAllowedSize != null
            ? requirementFileMaxAllowedSize.value
            : this.requirementFileMaxAllowedSize),
        requirementFileAllowedTypes: (requirementFileAllowedTypes != null
            ? requirementFileAllowedTypes.value
            : this.requirementFileAllowedTypes));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerProgramActivityDto {
  VolunteerProgramActivityDto({
    this.id,
    this.createdDate,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.volunteerProgramId,
    this.photos,
  });

  factory VolunteerProgramActivityDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProgramActivityDtoFromJson(json);

  static const toJsonFactory = _$VolunteerProgramActivityDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerProgramActivityDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  @JsonKey(name: 'photos', defaultValue: <SavedFileDto>[])
  final List<SavedFileDto>? photos;
  static const fromJsonFactory = _$VolunteerProgramActivityDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerProgramActivityDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      const DeepCollectionEquality().hash(photos) ^
      runtimeType.hashCode;
}

extension $VolunteerProgramActivityDtoExtension on VolunteerProgramActivityDto {
  VolunteerProgramActivityDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? volunteerProgramId,
      List<SavedFileDto>? photos}) {
    return VolunteerProgramActivityDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId,
        photos: photos ?? this.photos);
  }

  VolunteerProgramActivityDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? volunteerProgramId,
      Wrapped<List<SavedFileDto>?>? photos}) {
    return VolunteerProgramActivityDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId),
        photos: (photos != null ? photos.value : this.photos));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerProgramDto {
  VolunteerProgramDto({
    this.id,
    this.createdDate,
    this.isInternalProgram,
    this.organizationId,
    this.organization,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.categoryId,
    this.category,
    this.logo,
  });

  factory VolunteerProgramDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProgramDtoFromJson(json);

  static const toJsonFactory = _$VolunteerProgramDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerProgramDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'isInternalProgram')
  final bool? isInternalProgram;
  @JsonKey(name: 'organizationId')
  final int? organizationId;
  @JsonKey(name: 'organization')
  final OrganizationDto? organization;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'category')
  final CategoryDto? category;
  @JsonKey(name: 'logo')
  final SavedFileDto? logo;
  static const fromJsonFactory = _$VolunteerProgramDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerProgramDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.isInternalProgram, isInternalProgram) ||
                const DeepCollectionEquality()
                    .equals(other.isInternalProgram, isInternalProgram)) &&
            (identical(other.organizationId, organizationId) ||
                const DeepCollectionEquality()
                    .equals(other.organizationId, organizationId)) &&
            (identical(other.organization, organization) ||
                const DeepCollectionEquality()
                    .equals(other.organization, organization)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(isInternalProgram) ^
      const DeepCollectionEquality().hash(organizationId) ^
      const DeepCollectionEquality().hash(organization) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(logo) ^
      runtimeType.hashCode;
}

extension $VolunteerProgramDtoExtension on VolunteerProgramDto {
  VolunteerProgramDto copyWith(
      {int? id,
      DateTime? createdDate,
      bool? isInternalProgram,
      int? organizationId,
      OrganizationDto? organization,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? categoryId,
      CategoryDto? category,
      SavedFileDto? logo}) {
    return VolunteerProgramDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        isInternalProgram: isInternalProgram ?? this.isInternalProgram,
        organizationId: organizationId ?? this.organizationId,
        organization: organization ?? this.organization,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        logo: logo ?? this.logo);
  }

  VolunteerProgramDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<bool?>? isInternalProgram,
      Wrapped<int?>? organizationId,
      Wrapped<OrganizationDto?>? organization,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? categoryId,
      Wrapped<CategoryDto?>? category,
      Wrapped<SavedFileDto?>? logo}) {
    return VolunteerProgramDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        isInternalProgram: (isInternalProgram != null
            ? isInternalProgram.value
            : this.isInternalProgram),
        organizationId: (organizationId != null
            ? organizationId.value
            : this.organizationId),
        organization:
            (organization != null ? organization.value : this.organization),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        category: (category != null ? category.value : this.category),
        logo: (logo != null ? logo.value : this.logo));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerProgramGalleryPhotoDto {
  VolunteerProgramGalleryPhotoDto({
    this.id,
    this.createdDate,
    this.isApproved,
    this.photo,
    this.volunteerProgramId,
    this.volunteerStudentUploaderId,
  });

  factory VolunteerProgramGalleryPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProgramGalleryPhotoDtoFromJson(json);

  static const toJsonFactory = _$VolunteerProgramGalleryPhotoDtoToJson;
  Map<String, dynamic> toJson() =>
      _$VolunteerProgramGalleryPhotoDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'isApproved')
  final bool? isApproved;
  @JsonKey(name: 'photo')
  final SavedFileDto? photo;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  @JsonKey(name: 'volunteerStudentUploaderId')
  final int? volunteerStudentUploaderId;
  static const fromJsonFactory = _$VolunteerProgramGalleryPhotoDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerProgramGalleryPhotoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.isApproved, isApproved) ||
                const DeepCollectionEquality()
                    .equals(other.isApproved, isApproved)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)) &&
            (identical(other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerStudentUploaderId,
                    volunteerStudentUploaderId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(isApproved) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      const DeepCollectionEquality().hash(volunteerStudentUploaderId) ^
      runtimeType.hashCode;
}

extension $VolunteerProgramGalleryPhotoDtoExtension
    on VolunteerProgramGalleryPhotoDto {
  VolunteerProgramGalleryPhotoDto copyWith(
      {int? id,
      DateTime? createdDate,
      bool? isApproved,
      SavedFileDto? photo,
      int? volunteerProgramId,
      int? volunteerStudentUploaderId}) {
    return VolunteerProgramGalleryPhotoDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        isApproved: isApproved ?? this.isApproved,
        photo: photo ?? this.photo,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId,
        volunteerStudentUploaderId:
            volunteerStudentUploaderId ?? this.volunteerStudentUploaderId);
  }

  VolunteerProgramGalleryPhotoDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<bool?>? isApproved,
      Wrapped<SavedFileDto?>? photo,
      Wrapped<int?>? volunteerProgramId,
      Wrapped<int?>? volunteerStudentUploaderId}) {
    return VolunteerProgramGalleryPhotoDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        isApproved: (isApproved != null ? isApproved.value : this.isApproved),
        photo: (photo != null ? photo.value : this.photo),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId),
        volunteerStudentUploaderId: (volunteerStudentUploaderId != null
            ? volunteerStudentUploaderId.value
            : this.volunteerStudentUploaderId));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerProgramTaskDto {
  VolunteerProgramTaskDto({
    this.id,
    this.createdDate,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.volunteerProgramId,
  });

  factory VolunteerProgramTaskDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProgramTaskDtoFromJson(json);

  static const toJsonFactory = _$VolunteerProgramTaskDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerProgramTaskDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  static const fromJsonFactory = _$VolunteerProgramTaskDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerProgramTaskDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $VolunteerProgramTaskDtoExtension on VolunteerProgramTaskDto {
  VolunteerProgramTaskDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? title,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      int? volunteerProgramId}) {
    return VolunteerProgramTaskDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  VolunteerProgramTaskDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? startDate,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? volunteerProgramId}) {
    return VolunteerProgramTaskDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        startDate: (startDate != null ? startDate.value : this.startDate),
        endDate: (endDate != null ? endDate.value : this.endDate),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerProgramWorkDayDto {
  VolunteerProgramWorkDayDto({
    this.id,
    this.createdDate,
    this.name,
    this.date,
    this.volunteerProgramId,
  });

  factory VolunteerProgramWorkDayDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProgramWorkDayDtoFromJson(json);

  static const toJsonFactory = _$VolunteerProgramWorkDayDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerProgramWorkDayDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  static const fromJsonFactory = _$VolunteerProgramWorkDayDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerProgramWorkDayDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      runtimeType.hashCode;
}

extension $VolunteerProgramWorkDayDtoExtension on VolunteerProgramWorkDayDto {
  VolunteerProgramWorkDayDto copyWith(
      {int? id,
      DateTime? createdDate,
      String? name,
      DateTime? date,
      int? volunteerProgramId}) {
    return VolunteerProgramWorkDayDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        date: date ?? this.date,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId);
  }

  VolunteerProgramWorkDayDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<String?>? name,
      Wrapped<DateTime?>? date,
      Wrapped<int?>? volunteerProgramId}) {
    return VolunteerProgramWorkDayDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerStudentActivityAttendanceDto {
  VolunteerStudentActivityAttendanceDto({
    this.id,
    this.createdDate,
    this.isAttended,
    this.volunteerStudentId,
    this.volunteerStudent,
    this.volunteerProgramActivityId,
    this.volunteerProgramActivity,
  });

  factory VolunteerStudentActivityAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$VolunteerStudentActivityAttendanceDtoFromJson(json);

  static const toJsonFactory = _$VolunteerStudentActivityAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$VolunteerStudentActivityAttendanceDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'isAttended')
  final bool? isAttended;
  @JsonKey(name: 'volunteerStudentId')
  final int? volunteerStudentId;
  @JsonKey(name: 'volunteerStudent')
  final VolunteerStudentDto? volunteerStudent;
  @JsonKey(name: 'volunteerProgramActivityId')
  final int? volunteerProgramActivityId;
  @JsonKey(name: 'volunteerProgramActivity')
  final VolunteerProgramActivityDto? volunteerProgramActivity;
  static const fromJsonFactory =
      _$VolunteerStudentActivityAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerStudentActivityAttendanceDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerStudent, volunteerStudent) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudent, volunteerStudent)) &&
            (identical(other.volunteerProgramActivityId,
                    volunteerProgramActivityId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramActivityId,
                    volunteerProgramActivityId)) &&
            (identical(
                    other.volunteerProgramActivity, volunteerProgramActivity) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramActivity, volunteerProgramActivity)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(isAttended) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerStudent) ^
      const DeepCollectionEquality().hash(volunteerProgramActivityId) ^
      const DeepCollectionEquality().hash(volunteerProgramActivity) ^
      runtimeType.hashCode;
}

extension $VolunteerStudentActivityAttendanceDtoExtension
    on VolunteerStudentActivityAttendanceDto {
  VolunteerStudentActivityAttendanceDto copyWith(
      {int? id,
      DateTime? createdDate,
      bool? isAttended,
      int? volunteerStudentId,
      VolunteerStudentDto? volunteerStudent,
      int? volunteerProgramActivityId,
      VolunteerProgramActivityDto? volunteerProgramActivity}) {
    return VolunteerStudentActivityAttendanceDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        isAttended: isAttended ?? this.isAttended,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerStudent: volunteerStudent ?? this.volunteerStudent,
        volunteerProgramActivityId:
            volunteerProgramActivityId ?? this.volunteerProgramActivityId,
        volunteerProgramActivity:
            volunteerProgramActivity ?? this.volunteerProgramActivity);
  }

  VolunteerStudentActivityAttendanceDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<bool?>? isAttended,
      Wrapped<int?>? volunteerStudentId,
      Wrapped<VolunteerStudentDto?>? volunteerStudent,
      Wrapped<int?>? volunteerProgramActivityId,
      Wrapped<VolunteerProgramActivityDto?>? volunteerProgramActivity}) {
    return VolunteerStudentActivityAttendanceDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        isAttended: (isAttended != null ? isAttended.value : this.isAttended),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerStudent: (volunteerStudent != null
            ? volunteerStudent.value
            : this.volunteerStudent),
        volunteerProgramActivityId: (volunteerProgramActivityId != null
            ? volunteerProgramActivityId.value
            : this.volunteerProgramActivityId),
        volunteerProgramActivity: (volunteerProgramActivity != null
            ? volunteerProgramActivity.value
            : this.volunteerProgramActivity));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerStudentDto {
  VolunteerStudentDto({
    this.id,
    this.createdDate,
    this.studentId,
    this.student,
    this.volunteerProgramId,
    this.volunteerProgram,
    this.orgAssessmentGrade,
    this.orgAssessmentGradeNotes,
    this.finalGrade,
    this.finalGradeNotes,
  });

  factory VolunteerStudentDto.fromJson(Map<String, dynamic> json) =>
      _$VolunteerStudentDtoFromJson(json);

  static const toJsonFactory = _$VolunteerStudentDtoToJson;
  Map<String, dynamic> toJson() => _$VolunteerStudentDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'studentId')
  final int? studentId;
  @JsonKey(name: 'student')
  final StudentDto? student;
  @JsonKey(name: 'volunteerProgramId')
  final int? volunteerProgramId;
  @JsonKey(name: 'volunteerProgram')
  final VolunteerProgramDto? volunteerProgram;
  @JsonKey(name: 'orgAssessmentGrade')
  final double? orgAssessmentGrade;
  @JsonKey(name: 'orgAssessmentGradeNotes')
  final String? orgAssessmentGradeNotes;
  @JsonKey(name: 'finalGrade')
  final double? finalGrade;
  @JsonKey(name: 'finalGradeNotes')
  final String? finalGradeNotes;
  static const fromJsonFactory = _$VolunteerStudentDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerStudentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.studentId, studentId) ||
                const DeepCollectionEquality()
                    .equals(other.studentId, studentId)) &&
            (identical(other.student, student) ||
                const DeepCollectionEquality()
                    .equals(other.student, student)) &&
            (identical(other.volunteerProgramId, volunteerProgramId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramId, volunteerProgramId)) &&
            (identical(other.volunteerProgram, volunteerProgram) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgram, volunteerProgram)) &&
            (identical(other.orgAssessmentGrade, orgAssessmentGrade) ||
                const DeepCollectionEquality()
                    .equals(other.orgAssessmentGrade, orgAssessmentGrade)) &&
            (identical(
                    other.orgAssessmentGradeNotes, orgAssessmentGradeNotes) ||
                const DeepCollectionEquality().equals(
                    other.orgAssessmentGradeNotes, orgAssessmentGradeNotes)) &&
            (identical(other.finalGrade, finalGrade) ||
                const DeepCollectionEquality()
                    .equals(other.finalGrade, finalGrade)) &&
            (identical(other.finalGradeNotes, finalGradeNotes) ||
                const DeepCollectionEquality()
                    .equals(other.finalGradeNotes, finalGradeNotes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(studentId) ^
      const DeepCollectionEquality().hash(student) ^
      const DeepCollectionEquality().hash(volunteerProgramId) ^
      const DeepCollectionEquality().hash(volunteerProgram) ^
      const DeepCollectionEquality().hash(orgAssessmentGrade) ^
      const DeepCollectionEquality().hash(orgAssessmentGradeNotes) ^
      const DeepCollectionEquality().hash(finalGrade) ^
      const DeepCollectionEquality().hash(finalGradeNotes) ^
      runtimeType.hashCode;
}

extension $VolunteerStudentDtoExtension on VolunteerStudentDto {
  VolunteerStudentDto copyWith(
      {int? id,
      DateTime? createdDate,
      int? studentId,
      StudentDto? student,
      int? volunteerProgramId,
      VolunteerProgramDto? volunteerProgram,
      double? orgAssessmentGrade,
      String? orgAssessmentGradeNotes,
      double? finalGrade,
      String? finalGradeNotes}) {
    return VolunteerStudentDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        studentId: studentId ?? this.studentId,
        student: student ?? this.student,
        volunteerProgramId: volunteerProgramId ?? this.volunteerProgramId,
        volunteerProgram: volunteerProgram ?? this.volunteerProgram,
        orgAssessmentGrade: orgAssessmentGrade ?? this.orgAssessmentGrade,
        orgAssessmentGradeNotes:
            orgAssessmentGradeNotes ?? this.orgAssessmentGradeNotes,
        finalGrade: finalGrade ?? this.finalGrade,
        finalGradeNotes: finalGradeNotes ?? this.finalGradeNotes);
  }

  VolunteerStudentDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<int?>? studentId,
      Wrapped<StudentDto?>? student,
      Wrapped<int?>? volunteerProgramId,
      Wrapped<VolunteerProgramDto?>? volunteerProgram,
      Wrapped<double?>? orgAssessmentGrade,
      Wrapped<String?>? orgAssessmentGradeNotes,
      Wrapped<double?>? finalGrade,
      Wrapped<String?>? finalGradeNotes}) {
    return VolunteerStudentDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        studentId: (studentId != null ? studentId.value : this.studentId),
        student: (student != null ? student.value : this.student),
        volunteerProgramId: (volunteerProgramId != null
            ? volunteerProgramId.value
            : this.volunteerProgramId),
        volunteerProgram: (volunteerProgram != null
            ? volunteerProgram.value
            : this.volunteerProgram),
        orgAssessmentGrade: (orgAssessmentGrade != null
            ? orgAssessmentGrade.value
            : this.orgAssessmentGrade),
        orgAssessmentGradeNotes: (orgAssessmentGradeNotes != null
            ? orgAssessmentGradeNotes.value
            : this.orgAssessmentGradeNotes),
        finalGrade: (finalGrade != null ? finalGrade.value : this.finalGrade),
        finalGradeNotes: (finalGradeNotes != null
            ? finalGradeNotes.value
            : this.finalGradeNotes));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerStudentTaskAccomplishDto {
  VolunteerStudentTaskAccomplishDto({
    this.id,
    this.createdDate,
    this.isAccomplished,
    this.rate,
    this.volunteerStudentId,
    this.volunteerStudent,
    this.volunteerProgramTaskId,
    this.volunteerProgramTask,
  });

  factory VolunteerStudentTaskAccomplishDto.fromJson(
          Map<String, dynamic> json) =>
      _$VolunteerStudentTaskAccomplishDtoFromJson(json);

  static const toJsonFactory = _$VolunteerStudentTaskAccomplishDtoToJson;
  Map<String, dynamic> toJson() =>
      _$VolunteerStudentTaskAccomplishDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'isAccomplished')
  final bool? isAccomplished;
  @JsonKey(name: 'rate')
  final double? rate;
  @JsonKey(name: 'volunteerStudentId')
  final int? volunteerStudentId;
  @JsonKey(name: 'volunteerStudent')
  final VolunteerStudentDto? volunteerStudent;
  @JsonKey(name: 'volunteerProgramTaskId')
  final int? volunteerProgramTaskId;
  @JsonKey(name: 'volunteerProgramTask')
  final VolunteerProgramTaskDto? volunteerProgramTask;
  static const fromJsonFactory = _$VolunteerStudentTaskAccomplishDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerStudentTaskAccomplishDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.isAccomplished, isAccomplished) ||
                const DeepCollectionEquality()
                    .equals(other.isAccomplished, isAccomplished)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerStudent, volunteerStudent) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudent, volunteerStudent)) &&
            (identical(other.volunteerProgramTaskId, volunteerProgramTaskId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramTaskId, volunteerProgramTaskId)) &&
            (identical(other.volunteerProgramTask, volunteerProgramTask) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerProgramTask, volunteerProgramTask)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(isAccomplished) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerStudent) ^
      const DeepCollectionEquality().hash(volunteerProgramTaskId) ^
      const DeepCollectionEquality().hash(volunteerProgramTask) ^
      runtimeType.hashCode;
}

extension $VolunteerStudentTaskAccomplishDtoExtension
    on VolunteerStudentTaskAccomplishDto {
  VolunteerStudentTaskAccomplishDto copyWith(
      {int? id,
      DateTime? createdDate,
      bool? isAccomplished,
      double? rate,
      int? volunteerStudentId,
      VolunteerStudentDto? volunteerStudent,
      int? volunteerProgramTaskId,
      VolunteerProgramTaskDto? volunteerProgramTask}) {
    return VolunteerStudentTaskAccomplishDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        isAccomplished: isAccomplished ?? this.isAccomplished,
        rate: rate ?? this.rate,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerStudent: volunteerStudent ?? this.volunteerStudent,
        volunteerProgramTaskId:
            volunteerProgramTaskId ?? this.volunteerProgramTaskId,
        volunteerProgramTask:
            volunteerProgramTask ?? this.volunteerProgramTask);
  }

  VolunteerStudentTaskAccomplishDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<bool?>? isAccomplished,
      Wrapped<double?>? rate,
      Wrapped<int?>? volunteerStudentId,
      Wrapped<VolunteerStudentDto?>? volunteerStudent,
      Wrapped<int?>? volunteerProgramTaskId,
      Wrapped<VolunteerProgramTaskDto?>? volunteerProgramTask}) {
    return VolunteerStudentTaskAccomplishDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        isAccomplished: (isAccomplished != null
            ? isAccomplished.value
            : this.isAccomplished),
        rate: (rate != null ? rate.value : this.rate),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerStudent: (volunteerStudent != null
            ? volunteerStudent.value
            : this.volunteerStudent),
        volunteerProgramTaskId: (volunteerProgramTaskId != null
            ? volunteerProgramTaskId.value
            : this.volunteerProgramTaskId),
        volunteerProgramTask: (volunteerProgramTask != null
            ? volunteerProgramTask.value
            : this.volunteerProgramTask));
  }
}

@JsonSerializable(explicitToJson: true)
class VolunteerStudentWorkAttendanceDto {
  VolunteerStudentWorkAttendanceDto({
    this.id,
    this.createdDate,
    this.isAttended,
    this.volunteerStudentId,
    this.volunteerStudent,
    this.volunteerProgramWorkDayId,
    this.volunteerProgramWorkDay,
  });

  factory VolunteerStudentWorkAttendanceDto.fromJson(
          Map<String, dynamic> json) =>
      _$VolunteerStudentWorkAttendanceDtoFromJson(json);

  static const toJsonFactory = _$VolunteerStudentWorkAttendanceDtoToJson;
  Map<String, dynamic> toJson() =>
      _$VolunteerStudentWorkAttendanceDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'isAttended')
  final bool? isAttended;
  @JsonKey(name: 'volunteerStudentId')
  final int? volunteerStudentId;
  @JsonKey(name: 'volunteerStudent')
  final VolunteerStudentDto? volunteerStudent;
  @JsonKey(name: 'volunteerProgramWorkDayId')
  final int? volunteerProgramWorkDayId;
  @JsonKey(name: 'volunteerProgramWorkDay')
  final VolunteerProgramWorkDayDto? volunteerProgramWorkDay;
  static const fromJsonFactory = _$VolunteerStudentWorkAttendanceDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VolunteerStudentWorkAttendanceDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.isAttended, isAttended) ||
                const DeepCollectionEquality()
                    .equals(other.isAttended, isAttended)) &&
            (identical(other.volunteerStudentId, volunteerStudentId) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudentId, volunteerStudentId)) &&
            (identical(other.volunteerStudent, volunteerStudent) ||
                const DeepCollectionEquality()
                    .equals(other.volunteerStudent, volunteerStudent)) &&
            (identical(other.volunteerProgramWorkDayId,
                    volunteerProgramWorkDayId) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramWorkDayId,
                    volunteerProgramWorkDayId)) &&
            (identical(
                    other.volunteerProgramWorkDay, volunteerProgramWorkDay) ||
                const DeepCollectionEquality().equals(
                    other.volunteerProgramWorkDay, volunteerProgramWorkDay)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(isAttended) ^
      const DeepCollectionEquality().hash(volunteerStudentId) ^
      const DeepCollectionEquality().hash(volunteerStudent) ^
      const DeepCollectionEquality().hash(volunteerProgramWorkDayId) ^
      const DeepCollectionEquality().hash(volunteerProgramWorkDay) ^
      runtimeType.hashCode;
}

extension $VolunteerStudentWorkAttendanceDtoExtension
    on VolunteerStudentWorkAttendanceDto {
  VolunteerStudentWorkAttendanceDto copyWith(
      {int? id,
      DateTime? createdDate,
      bool? isAttended,
      int? volunteerStudentId,
      VolunteerStudentDto? volunteerStudent,
      int? volunteerProgramWorkDayId,
      VolunteerProgramWorkDayDto? volunteerProgramWorkDay}) {
    return VolunteerStudentWorkAttendanceDto(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        isAttended: isAttended ?? this.isAttended,
        volunteerStudentId: volunteerStudentId ?? this.volunteerStudentId,
        volunteerStudent: volunteerStudent ?? this.volunteerStudent,
        volunteerProgramWorkDayId:
            volunteerProgramWorkDayId ?? this.volunteerProgramWorkDayId,
        volunteerProgramWorkDay:
            volunteerProgramWorkDay ?? this.volunteerProgramWorkDay);
  }

  VolunteerStudentWorkAttendanceDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<DateTime?>? createdDate,
      Wrapped<bool?>? isAttended,
      Wrapped<int?>? volunteerStudentId,
      Wrapped<VolunteerStudentDto?>? volunteerStudent,
      Wrapped<int?>? volunteerProgramWorkDayId,
      Wrapped<VolunteerProgramWorkDayDto?>? volunteerProgramWorkDay}) {
    return VolunteerStudentWorkAttendanceDto(
        id: (id != null ? id.value : this.id),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        isAttended: (isAttended != null ? isAttended.value : this.isAttended),
        volunteerStudentId: (volunteerStudentId != null
            ? volunteerStudentId.value
            : this.volunteerStudentId),
        volunteerStudent: (volunteerStudent != null
            ? volunteerStudent.value
            : this.volunteerStudent),
        volunteerProgramWorkDayId: (volunteerProgramWorkDayId != null
            ? volunteerProgramWorkDayId.value
            : this.volunteerProgramWorkDayId),
        volunteerProgramWorkDay: (volunteerProgramWorkDay != null
            ? volunteerProgramWorkDay.value
            : this.volunteerProgramWorkDay));
  }
}

String? applicationStatusToJson(enums.ApplicationStatus? applicationStatus) {
  return applicationStatus?.value;
}

enums.ApplicationStatus applicationStatusFromJson(
  Object? applicationStatus, [
  enums.ApplicationStatus? defaultValue,
]) {
  return enums.ApplicationStatus.values
          .firstWhereOrNull((e) => e.value == applicationStatus) ??
      defaultValue ??
      enums.ApplicationStatus.swaggerGeneratedUnknown;
}

List<String> applicationStatusListToJson(
    List<enums.ApplicationStatus>? applicationStatus) {
  if (applicationStatus == null) {
    return [];
  }

  return applicationStatus.map((e) => e.value!).toList();
}

List<enums.ApplicationStatus> applicationStatusListFromJson(
  List? applicationStatus, [
  List<enums.ApplicationStatus>? defaultValue,
]) {
  if (applicationStatus == null) {
    return defaultValue ?? [];
  }

  return applicationStatus
      .map((e) => applicationStatusFromJson(e.toString()))
      .toList();
}

List<enums.ApplicationStatus>? applicationStatusNullableListFromJson(
  List? applicationStatus, [
  List<enums.ApplicationStatus>? defaultValue,
]) {
  if (applicationStatus == null) {
    return defaultValue;
  }

  return applicationStatus
      .map((e) => applicationStatusFromJson(e.toString()))
      .toList();
}

String? notificationPageToJson(enums.NotificationPage? notificationPage) {
  return notificationPage?.value;
}

enums.NotificationPage notificationPageFromJson(
  Object? notificationPage, [
  enums.NotificationPage? defaultValue,
]) {
  return enums.NotificationPage.values
          .firstWhereOrNull((e) => e.value == notificationPage) ??
      defaultValue ??
      enums.NotificationPage.swaggerGeneratedUnknown;
}

List<String> notificationPageListToJson(
    List<enums.NotificationPage>? notificationPage) {
  if (notificationPage == null) {
    return [];
  }

  return notificationPage.map((e) => e.value!).toList();
}

List<enums.NotificationPage> notificationPageListFromJson(
  List? notificationPage, [
  List<enums.NotificationPage>? defaultValue,
]) {
  if (notificationPage == null) {
    return defaultValue ?? [];
  }

  return notificationPage
      .map((e) => notificationPageFromJson(e.toString()))
      .toList();
}

List<enums.NotificationPage>? notificationPageNullableListFromJson(
  List? notificationPage, [
  List<enums.NotificationPage>? defaultValue,
]) {
  if (notificationPage == null) {
    return defaultValue;
  }

  return notificationPage
      .map((e) => notificationPageFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
