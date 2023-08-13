import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_organizations_for_home_state.dart';

class GetOrganizationsForHomeCubit extends Cubit<GetOrganizationsForHomeState> {
  final ApiClient apiClient;

  GetOrganizationsForHomeCubit(this.apiClient)
      : super(GetOrganizationsForHomeInitial());

  getOrganizationsForHome() async {
    emit(GetOrganizationsForHomeLoading());

    try {
      final data = apiClient.handleResponse<List<OrganizationDto>>(
        await apiClient.api.apiOrganizationsGetListGet(
          maxResultCount: 5,
        ),
      );

      if (data.isEmpty) {
        emit(GetOrganizationsForHomeEmpty());
      } else {
        emit(GetOrganizationsForHomeSuccess(data));
      }
    } catch (error) {
      emit(GetOrganizationsForHomeError(error));
    }
  }
}
