import 'package:ctp_bus_management/Domain/vehicle.dart';

import 'newRepository.dart';

class VehicleInMemoryRepository implements VehicleRepository
{
  final List<Vehicle> vehicles = [];

  @override
  Future<void> add(Vehicle vehicle) async{
      vehicles.add(vehicle);
  }

  @override
  Future<List<Vehicle>> getAll() async {
    return vehicles;
  }

  @override
  Future<void> remove(int id) async {
    Vehicle vehicle = vehicles.where((element) => element.id == id).first;
    vehicles.remove(vehicle);
  }

  @override
  Future<void> update(int id, Vehicle vehicle) async {
    vehicle.id = id;
    vehicles[vehicles.indexWhere((element) => element.id == id)] = vehicle;
  }

}