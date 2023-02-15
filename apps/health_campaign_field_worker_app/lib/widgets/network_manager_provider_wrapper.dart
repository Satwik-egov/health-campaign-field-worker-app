import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/data_repository.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/network_manager.dart';
import '../data/repositories/local/household.dart';
import '../data/repositories/local/houshold_member.dart';
import '../data/repositories/local/individual.dart';
import '../data/repositories/local/project_beneficiary.dart';
import '../data/repositories/local/task.dart';
import '../data/repositories/oplog/oplog.dart';
import '../data/repositories/remote/facility.dart';
import '../data/repositories/remote/household.dart';
import '../data/repositories/remote/household_member.dart';
import '../data/repositories/remote/individual.dart';
import '../data/repositories/remote/product.dart';
import '../data/repositories/remote/product_variant.dart';
import '../data/repositories/remote/project.dart';
import '../data/repositories/remote/project_beneficiary.dart';
import '../data/repositories/remote/project_facility.dart';
import '../data/repositories/remote/project_product_variant.dart';
import '../data/repositories/remote/project_resource.dart';
import '../data/repositories/remote/project_staff.dart';
import '../data/repositories/remote/project_type.dart';
import '../data/repositories/remote/task.dart';
import '../models/data_model.dart';

class NetworkManagerProviderWrapper extends StatelessWidget {
  final LocalSqlDataStore sql;
  final Dio dio;
  final Widget child;
  final Isar isar;

  final NetworkManagerConfiguration configuration;

  const NetworkManagerProviderWrapper({
    super.key,
    required this.configuration,
    required this.isar,
    required this.dio,
    required this.sql,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, state) {
        final actionMap = state.entityActionMapping;
        if (actionMap.isEmpty) {
          return const Offstage();
        }

        final remote = _getRemoteRepositories(dio, actionMap);
        final local = _getLocalRepositories(sql, isar);

        return MultiRepositoryProvider(
          providers: [...local, ...remote],
          child: Provider(
            create: (ctx) => NetworkManager(configuration: configuration),
            child: child,
          ),
        );
      },
    );
  }

  List<RepositoryProvider> _getLocalRepositories(
    LocalSqlDataStore sql,
    Isar isar,
  ) {
    return [
      RepositoryProvider<
          LocalRepository<IndividualModel, IndividualSearchModel>>(
        create: (_) => IndividualLocalRepository(
          sql,
          IndividualOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(
        create: (_) => HouseholdMemberLocalRepository(
          sql,
          HouseholdMemberOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<HouseholdModel, HouseholdSearchModel>>(
        create: (_) => HouseholdLocalRepository(
          sql,
          HouseholdOpLogManager(isar),
        ),
      ),
      RepositoryProvider<
          LocalRepository<ProjectBeneficiaryModel,
              ProjectBeneficiarySearchModel>>(
        create: (_) => ProjectBeneficiaryLocalRepository(
          sql,
          ProjectBeneficiaryOpLogManager(isar),
        ),
      ),
      RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
        create: (_) => TaskLocalRepository(
          sql,
          TaskOpLogManager(isar),
        ),
      ),
    ];
  }

  List<RepositoryProvider> _getRemoteRepositories(
    Dio dio,
    Map<DataModelType, Map<ApiOperation, String>> actionMap,
  ) {
    final remoteRepositories = <RepositoryProvider>[];
    for (final value in DataModelType.values) {
      if (!actionMap.containsKey(value)) {
        continue;
      }

      final actions = actionMap[value]!;

      remoteRepositories.addAll([
        if (value == DataModelType.facility)
          RepositoryProvider<
              RemoteRepository<FacilityModel, FacilitySearchModel>>(
            create: (_) => FacilityRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.household)
          RepositoryProvider<
              RemoteRepository<HouseholdModel, HouseholdSearchModel>>(
            create: (_) => HouseholdRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.householdMember)
          RepositoryProvider<
              RemoteRepository<HouseholdMemberModel,
                  HouseholdMemberSearchModel>>(
            create: (_) =>
                HouseholdMemberRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.individual)
          RepositoryProvider<
              RemoteRepository<IndividualModel, IndividualSearchModel>>(
            create: (_) => IndividualRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.product)
          RepositoryProvider<
              RemoteRepository<ProductModel, ProductSearchModel>>(
            create: (_) => ProductRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.productVariant)
          RepositoryProvider<
              RemoteRepository<ProductVariantModel, ProductVariantSearchModel>>(
            create: (_) =>
                ProductVariantRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.project)
          RepositoryProvider<
              RemoteRepository<ProjectModel, ProjectSearchModel>>(
            create: (_) => ProjectRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.projectBeneficiary)
          RepositoryProvider<
              RemoteRepository<ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>>(
            create: (_) =>
                ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectFacility)
          RepositoryProvider<
              RemoteRepository<ProjectFacilityModel,
                  ProjectFacilitySearchModel>>(
            create: (_) =>
                ProjectFacilityRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectProductVariant)
          RepositoryProvider<
              RemoteRepository<ProjectProductVariantModel,
                  ProjectProductVariantSearchModel>>(
            create: (_) =>
                ProjectProductVariantRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectStaff)
          RepositoryProvider<
              RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>>(
            create: (_) =>
                ProjectStaffRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectResource)
          RepositoryProvider<
              RemoteRepository<ProjectResourceModel,
                  ProjectResourceSearchModel>>(
            create: (_) =>
                ProjectResourceRemoteRepository(dio, actionMap: actions),
          ),
        if (value == DataModelType.projectType)
          RepositoryProvider<
              RemoteRepository<ProjectTypeModel, ProjectTypeSearchModel>>(
            create: (_) => ProjectTypeRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
        if (value == DataModelType.task)
          RepositoryProvider<RemoteRepository<TaskModel, TaskSearchModel>>(
            create: (_) => TaskRemoteRepository(
              dio,
              actionMap: actions,
            ),
          ),
      ]);
    }

    return remoteRepositories;
  }
}

class ActionPathModel {
  final DataModelType type;
  final String path;
  final ApiOperation operation;

  const ActionPathModel({
    required this.operation,
    required this.type,
    required this.path,
  });
}
