import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/api_generated_code/api.models.swagger.dart';
import 'types.dart';

class AppStorage {
  static final AppStorage _singleton = AppStorage._();

  late SharedPreferences _prefs;

  static Future<AppStorage> getInstance() async {
    await _singleton._initSharedPreferences();
    return _singleton;
  }

  AppStorage._();

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setAccessToken(String accessToken) {
    return _prefs.setString('AccessToken', accessToken);
  }

  String getAccessToken({String defaultValue = ''}) {
    return _prefs.getString('AccessToken') ?? defaultValue;
  }

  Future<bool> setCurrentAccountId(int id) {
    return _prefs.setInt('CurrentAccountId', id);
  }

  int getCurrentAccountId({int defaultValue = 0}) {
    return _prefs.getInt('CurrentAccountId') ?? defaultValue;
  }

  Future<bool> logout() {
    return _prefs.clear();
  }

  Future<bool> setAccountType(AccountType accountType) {
    return _prefs.setString('AccountType', accountType.name);
  }

  AccountType? getAccountType() {
    final stored = _prefs.getString('AccountType');

    if (stored == AccountType.management.name) {
      return AccountType.management;
    } else if (stored == AccountType.organization.name) {
      return AccountType.organization;
    } else if (stored == AccountType.student.name) {
      return AccountType.student;
    } else {
      return null;
    }
  }

  Future<bool> setManagementAccount(ManagementEmployeeDto account) {
    return _prefs.setString('ManagementAccount', jsonEncode(account.toJson()));
  }

  ManagementEmployeeDto? getManagementAccount() {
    final stored = _prefs.getString('ManagementAccount');
    if (stored != null) {
      return ManagementEmployeeDto.fromJson(jsonDecode(stored));
    } else {
      return null;
    }
  }

  Future<bool> setOrganizationAccount(OrganizationDto account) {
    return _prefs.setString(
        'OrganizationAccount', jsonEncode(account.toJson()));
  }

  OrganizationDto? getOrganizationAccount() {
    final stored = _prefs.getString('OrganizationAccount');
    if (stored != null) {
      return OrganizationDto.fromJson(jsonDecode(stored));
    } else {
      return null;
    }
  }

  Future<bool> setStudentAccount(StudentDto account) {
    return _prefs.setString('StudentAccount', jsonEncode(account.toJson()));
  }

  StudentDto? getStudentAccount() {
    final stored = _prefs.getString('StudentAccount');
    if (stored != null) {
      return StudentDto.fromJson(jsonDecode(stored));
    } else {
      return null;
    }
  }
}
