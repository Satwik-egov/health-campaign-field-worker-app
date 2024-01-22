import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/utils/app_logger.dart';

import '../data/data_repository.dart';
import '../models/entities/hcm_attendance_model.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final LocalRepository<HCMAttendanceRegisterModel, HCMAttendanceSearchModel>?
      attendanceLocalRepository;
  final String? userId;
  HCMAttendanceBloc({
    this.attendanceLocalRepository,
    this.userId,
  });

  late Function(List<AttendancePackageRegisterModel> registers) _registersLoaded;
  late List _localeCodes;

  @override
  void getAttendanceRegisters(
    Function(List<AttendancePackageRegisterModel> registers)
        attendanceRegisters,
  ) {
    _registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded() async {
    final registers = await attendanceLocalRepository?.search(
      HCMAttendanceSearchModel(),
    );
    final attendanceRegisters =
        registers?.map((e) => e.attendanceRegister).toList();
    _registersLoaded(
      attendanceRegisters!,
    );
  }

  @override
  void loadLocalization(List codes) {
    _localeCodes = codes;
    AppLogger.instance.info('HCM Attendance Locale codes: $codes');
  }
}
