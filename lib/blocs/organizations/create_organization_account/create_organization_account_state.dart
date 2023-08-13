part of 'create_organization_account_cubit.dart';

@immutable
abstract class CreateOrganizationAccountState {}

class CreateOrganizationAccountInitial extends CreateOrganizationAccountState {}

class CreateOrganizationAccountLoading extends CreateOrganizationAccountState {}

class CreateOrganizationAccountSuccess extends CreateOrganizationAccountState {
  final OrganizationAccount data;

  CreateOrganizationAccountSuccess(this.data);
}

class CreateOrganizationAccountError extends CreateOrganizationAccountState {
  final dynamic error;

  CreateOrganizationAccountError(this.error);
}
