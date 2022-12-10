import 'package:ctp_bus_management/Domain/vehicle.dart';

abstract class VehicleRepository{
  Future<void> add(Vehicle vehicle);

  Future<void> remove(int id);

  Future<void> update(int id, Vehicle vehicle);

  Future<List<Vehicle>> getAll();
}