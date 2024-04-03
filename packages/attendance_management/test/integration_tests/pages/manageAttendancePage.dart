import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_register.dart';
import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:attendance_management/blocs/attendance_bloc.dart';
import 'package:mocktail/mocktail.dart';

// Mocking the AttendanceBloc for testing
class MockAttendanceBloc extends MockBloc<AttendanceEvents, AttendanceStates>
    implements AttendanceBloc {}

class MockAttendanceListeners extends Mock implements AttendanceListeners {}

void main() {
  group('ManageAttendancePage Integration Test', () {
    late MockAttendanceBloc attendanceBloc;

    setUp(() {
      attendanceBloc = MockAttendanceBloc();
    });

    testWidgets('Widget renders correctly when registers are loaded',
        (WidgetTester tester) async {
      // Define the registers that will be loaded
      final List<AttendanceRegisterModel> registers = [
        AttendanceRegisterModel(
          id: '1',
          additionalDetails: {
            'campaignName': 'Campaign 1',
            'eventType': 'Event'
          },
          attendees: [],
          startDate: DateTime.now().millisecondsSinceEpoch,
          endDate: DateTime.now().add(Duration(days: 7)).millisecondsSinceEpoch,
          attendanceLog: [],
          tenantId: 'Tenant 1',
        ),
      ];

      // Stub the bloc responses
      when(attendanceBloc.stream as Function())
          .thenAnswer((_) => Stream.fromIterable([
                RegisterLoaded(registers: registers),
              ]));

      // Build the widget under test
      await tester.pumpWidget(MaterialApp(
        home: ManageAttendancePage(
          attendanceListeners: MockAttendanceListeners(),
          projectId: 'project_id',
          userId: 'user_id',
          appVersion: '1.0.0',
        ),
      ));

      // Wait for widgets to settle
      await tester.pumpAndSettle();

      // Verify that the registers are displayed correctly
      expect(find.text('Campaign 1'), findsOneWidget);
      expect(find.text('Event'), findsOneWidget);
      expect(find.text('0/0'), findsOneWidget); // No attendees enrolled
    });

    testWidgets('Widget renders correctly when no registers are loaded',
        (WidgetTester tester) async {
      // Stub the bloc responses
      when(attendanceBloc.stream as Function())
          .thenAnswer((_) => Stream.fromIterable([
                RegisterLoaded(registers: []),
              ]));

      // Build the widget under test
      await tester.pumpWidget(MaterialApp(
        home: ManageAttendancePage(
          attendanceListeners: MockAttendanceListeners(),
          projectId: 'project_id',
          userId: 'user_id',
          appVersion: '1.0.0',
        ),
      ));

      // Wait for widgets to settle
      await tester.pumpAndSettle();

      // Verify that no registers are displayed
      expect(find.byType(RegisterCard), findsNothing);
      expect(find.text('No results found'), findsOneWidget);
    });

    // Add more test cases as needed
  });
}
