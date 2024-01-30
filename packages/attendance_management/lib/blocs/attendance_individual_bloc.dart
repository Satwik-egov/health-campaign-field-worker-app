import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_individual_bloc.freezed.dart';

typedef AttendanceIndividualEmitter = Emitter<AttendanceIndividualState>;

class AttendanceIndividualBloc
    extends Bloc<AttendanceIndividualEvent, AttendanceIndividualState> {
  AttendanceIndividualBloc()
      : super(
          const AttendanceIndividualState.initial(),
        ) {
    on<AttendanceIndividualLogSearchEvent>(_onIndividualAttendanceLogSearch);
    on<AttendanceMarkEvent>(_onIndividualAttendanceMark);
    on<SaveAsDraftEvent>(_onSaveAsDraft);
    // on<UploadAttendanceEvent>(_onUploadAttendanceToServer);
    // on<SearchAttendeesEvent>(_onSearchAttendeeByName);
    // on<DisposeAttendanceIndividualEvent>(_onDispose);
  }

  // FutureOr<void> _onDispose(
  //   DisposeAttendanceIndividualEvent event,
  //   AttendanceIndividualEmitter emit,
  // ) async {
  //   emit(const AttendanceIndividualState.initial());
  // }

  FutureOr<void> _onIndividualAttendanceLogSearch(
    AttendanceIndividualLogSearchEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    emit(const AttendanceIndividualState.loading());

    try {
      // if (event. .isEmpty) {
      //   if (event.attendeeId.isEmpty) {
      //     throw "Atleast one attendee should be there";
      //   } else {
      //     AttendanceMarkIndividualModel a =
      //         await attendanceRegisterRepository.fetchAttendees(
      //       attendeeids: event.attendeeId,
      //       limit: 1000,
      //       offset: 0,
      //       tenantId: event.tenantId,
      //     );
      //
      //     List<AbsentAttendee> wq = a.attendanceRegister!.map(
      //       (e) {
      //         final absentAttendee = AbsentAttendee()
      //           ..name = e.name!.givenName ?? ""
      //           ..entryTime = event.entryTime
      //           ..exitTime = event.exitTime
      //           ..eventStartDate = event.eventStartDate
      //           ..eventEndDate = event.eventEndDate
      //           ..individualId = e.id!
      //           ..projectId = event.projectId
      //           ..status = -1
      //           ..currentDate = event.currentDate
      //           ..registerId = event.registerId
      //           ..tenantId = event.tenantId
      //           ..userName = e.userDetails!.username ?? ""
      //           ..uploadToServer = false;
      //
      //         return absentAttendee;
      //       },
      //     ).toList();
      //
      //     await attendanceRegisterRepository.storeAbsentAttendee(wq);
      //
      //     List<AttendeeCollectionModel> emitData = wq.map((e) {
      //       AttendeeCollectionModel s = AttendeeCollectionModel(
      //         entryTime: e.entryTime,
      //         name: e.name,
      //         individualId: e.individualId,
      //         exitTime: e.exitTime,
      //         eventStartDate: e.eventStartDate,
      //         eventEndDate: e.eventEndDate,
      //         status: e.status,
      //         id: e.id,
      //         registerId: event.registerId,
      //         userName: e.userName,
      //         uploadToServer: e.uploadToServer,
      //       );
      //
      //       return s;
      //     }).toList();
      //     emitData.sort((a, b) => a.name!.compareTo(b.name!));
      //     await Future.delayed(const Duration(milliseconds: 800));
      //     emit(
      //       _AttendanceRowModelLoaded(
      //         attendanceCollectionModel: emitData,
      //         attendanceSearchModelList: [],
      //         countData: emitData.length,
      //         limitData: event.limit,
      //         offsetData: event.offset,
      //         currentOffset: emitData.length,
      //       ),
      //     );
      //   }
      // } else {
      //   int counter = 0;
      //   List<AttendeeCollectionModel> emitData = filterData.map((e) {
      //     if (e.status == -1) {
      //       counter = counter + 1;
      //     }
      //     AttendeeCollectionModel s = AttendeeCollectionModel(
      //       id: e.id,
      //       entryTime: e.entryTime,
      //       name: e.name,
      //       individualId: e.individualId,
      //       exitTime: e.exitTime,
      //       eventStartDate: e.eventStartDate,
      //       eventEndDate: e.eventEndDate,
      //       status: e.status,
      //       registerId: event.registerId,
      //       userName: e.userName,
      //       uploadToServer: e.uploadToServer,
      //     );
      //
      //     return s;
      //   }).toList();
      //   emitData.sort((a, b) => a.name!.compareTo(b.name!));
      //   await Future.delayed(const Duration(milliseconds: 800));
      emit(AttendanceIndividualState.loaded(
        attendanceCollectionModel: event.attendees,
      ));
      // }
    } catch (ex) {
      String? error = ex as String;

      emit(AttendanceIndividualState.error(error));
    }
  }

  FutureOr<void> _onIndividualAttendanceMark(
    AttendanceMarkEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    await state.maybeMap(
      loaded: (value) async {
        List<AttendeeModel> searchList = [];
        int status = 0;
        value.attendanceCollectionModel;

        List<AttendeeModel> updatedList =
            value.attendanceCollectionModel!.map((e) {
          if (e.individualId == event.individualId) {
            if (e.status == -1) {
              status = 1;
            } else if (e.status == 1) {
              status = 0;
            } else {
              status = 1;
            }
          }
          return e.copyWith(status: status);
        }).toList();

        if (value.attendanceSearchModelList.isNotEmpty) {
          searchList = value.attendanceSearchModelList.map((e) {
            if (e.individualId == event.individualId) {
              if (e.status == -1) {
                status = 1;
              } else if (e.status == 1) {
                status = 0;
              } else {
                status = 1;
              }
            }
            return e.copyWith(status: status);
          }).toList();
        }

        emit(value.copyWith(
          attendanceSearchModelList: searchList,
          attendanceCollectionModel: updatedList,
          currentOffset: status,
        ));
      },
      orElse: () {},
    );
  }

  FutureOr<void> _onSaveAsDraft(
    SaveAsDraftEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    await state.maybeMap(
      loaded: (value) async {
        if (value.attendanceCollectionModel != null) {
          AttendanceSingleton().submitAttendanceDetails(SubmitAttendanceDetails(
              attendanceLogs: value.attendanceCollectionModel!,
              onMarked: (val) => false));
        }
        emit(value.copyWith(
          attendanceSearchModelList: value.attendanceSearchModelList,
          attendanceCollectionModel: value.attendanceCollectionModel,
        ));
      },
      orElse: () {},
    );
  }

  // FutureOr<void> _onUploadAttendanceToServer(
  //   UploadAttendanceEvent event,
  //   AttendanceIndividualEmitter emit,
  // ) async {
  //   List<Map<String, dynamic>> m = [];
  //   List<AbsentAttendee> filterData =
  //       await attendanceRegisterRepository.getAttendeeListFromLocalDB(
  //     tenantId: event.tenantId,
  //     entryTime: event.entryTime,
  //     exitTime: event.exitTime,
  //     registarId: event.registarId,
  //   );
  //   await state.maybeMap(
  //     orElse: () {},
  //     loaded: (value) async {
  //       try {
  //         emit(value.copyWith(
  //           flag: true,
  //         ));
  //         for (var element in filterData) {
  //           if (element.status == 1) {
  //             final entry = {
  //               "registerId": element.registerId,
  //               "individualId": element.individualId,
  //               "tenantId": element.tenantId,
  //               "time": element.entryTime,
  //               "type": "ENTRY",
  //               "status": "ACTIVE",
  //               "documentIds": [],
  //               "additionalDetails": {},
  //             };
  //
  //             final exit = {
  //               "registerId": element.registerId,
  //               "individualId": element.individualId,
  //               "tenantId": element.tenantId,
  //               "time": element.exitTime,
  //               "type": "EXIT",
  //               "status": "ACTIVE",
  //               "documentIds": [],
  //               "additionalDetails": {},
  //             };
  //             m.add(entry);
  //             m.add(exit);
  //           }
  //         }
  //
  //         final check = await attendanceRegisterRepository.createAttendanceLog(
  //           attedeesList: m,
  //           registartId: event.registarId,
  //         );
  //
  //         if (check) {
  //           emit(value.copyWith(
  //             flag: false,
  //           ));
  //         }
  //
  //         print(m);
  //       } catch (e) {
  //         // emit(value.copyWith(
  //         //   flag: false,
  //         // ));
  //         emit(AttendanceIndividualState.error(e.toString()));
  //       }
  //     },
  //     error: (value) {},
  //   );
  // }

  // FutureOr<void> _onSearchAttendeeByName(
  //   SearchAttendeesEvent event,
  //   AttendanceIndividualEmitter emit,
  // ) {
  //   state.maybeMap(
  //     orElse: () {},
  //     loaded: (value) {
  //       if (event.name.isNotEmpty) {
  //         final List<AttendeeCollectionModel> result = value
  //             .attendanceCollectionModel!
  //             .where((item) =>
  //                 item.name!.toLowerCase().contains(event.name.toLowerCase()))
  //             .toList();
  //
  //         emit(value.copyWith(attendanceSearchModelList: result));
  //       } else {
  //         emit(value.copyWith(attendanceSearchModelList: []));
  //       }
  //     },
  //   );
  // }
}

@freezed
class AttendanceIndividualEvent with _$AttendanceIndividualEvent {
  const factory AttendanceIndividualEvent.individualAttendanceLogSearch({
    required String registerId,
    required String tenantId,
    required int entryTime,
    required int exitTime,
    required int currentDate,
    required List<AttendeeModel> attendees,
    required int offset,
    required int limit,
  }) = AttendanceIndividualLogSearchEvent;
  const factory AttendanceIndividualEvent.individualAttendanceMark({
    @Default(0) int entryTime,
    @Default(0) int exitTime,
    @Default(-1) status,
    required String individualId,
    required String registerId,
    // required int eventStartDate,
    // required int eventEndDate,
  }) = AttendanceMarkEvent;
  const factory AttendanceIndividualEvent.saveAsDraft({
    required List<AttendeeModel> attendanceLogs,
  }) = SaveAsDraftEvent;
  //
  // const factory AttendanceIndividualEvent.uploadAttendance({
  //   required int entryTime,
  //   required int exitTime,
  //   required int status,
  //   required String tenantId,
  //   required String registarId,
  //   required String projectId,
  // }) = UploadAttendanceEvent;
  //
  // const factory AttendanceIndividualEvent.searchAttendees({
  //   required int entryTime,
  //   required int exitTime,
  //   required String name,
  //   required String tenantId,
  //   required String registarId,
  //   required String projectId,
  // }) = SearchAttendeesEvent;
  //
  // const factory AttendanceIndividualEvent.dispose() =
  //     DisposeAttendanceIndividualEvent;
}

@freezed
class AttendanceIndividualState with _$AttendanceIndividualState {
  const AttendanceIndividualState._();

  const factory AttendanceIndividualState.initial() = _Initial;
  const factory AttendanceIndividualState.loading() = _Loading;
  factory AttendanceIndividualState.loaded({
    @Default([]) List<AttendeeModel> attendanceSearchModelList,
    List<AttendeeModel>? attendanceCollectionModel,
    @Default(0) int offsetData,
    @Default(0) int currentOffset,
    @Default(0) int countData,
    @Default(10) int limitData,
    @Default(false) bool flag,
  }) = _AttendanceRowModelLoaded;
  const factory AttendanceIndividualState.error(String? error) = _Error;
}
