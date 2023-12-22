import 'dart:async';

import '../../models/doctor_model.dart';
import '../../services/doctor_service.dart';
import 'package:firebase_database/firebase_database.dart';


abstract interface class IDoctorRepository {
  Stream<DoctorModel> getUllDoctors();

  DatabaseReference queryDoctors();

  Future<DoctorModel?> readDoctor(String uid);

  Future<void> updateDoctor(DoctorModel doctor,String uid);
}

class DoctorRepository implements IDoctorRepository {
  DoctorRepository() : _service = DoctorService();

  final DoctorService _service;

  @override
  Stream<DoctorModel> getUllDoctors() => _service.getAllUser().transform(
    StreamTransformer<DatabaseEvent, DoctorModel>.fromHandlers(
      handleData: (data, sink) {
        for (final json in (data.snapshot.value as Map).values) {
          final user = DoctorModel.fromJson(Map<String, Object?>.from(json));
          sink.add(user);
        }
      },
    ),
  );

  @override
  DatabaseReference queryDoctors() => _service.queryFromPath();

  @override
  Future<DoctorModel?> readDoctor(String uid) async =>
      await _service.readUser(uid);

  @override
  Future<void> updateDoctor(
      DoctorModel doctor, String uid) =>
      _service.updateUser(doctor,uid);
}
