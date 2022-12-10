import 'package:ctp_bus_management/Repository/newRepository.dart';
import 'package:ctp_bus_management/Repository/repository.dart';
import 'package:flutter/cupertino.dart';

import '../Domain/vehicle.dart';
import '../Repository/databaseRepository.dart';
const ctp_purple = Color(0xFFC150B2);


class VehicleService extends ChangeNotifier{
  late VehicleRepository repository = DatabaseRepository();
  VehicleService(){
    //populateVehicles();
  }
  // VehicleService()
  // {
  //   repository = VehicleRepository();
  //   populateVehicles();
  // }

  // void populateVehicles() {
  //   repository.add(Vehicle(
  //       "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));
  //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
  //   repository.add(Vehicle(
  //       "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
  //   repository.add(Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"));
  //   repository.add(Vehicle(
  //       "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
  //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
  //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
  //   repository.add(Vehicle(
  //       "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));
  //
  //   notifyListeners();
  // }

  void populateVehicles()
  {
    List<Vehicle> initialVehicles = [
      Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
      Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
      Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
      Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
      Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
      Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
      Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
      Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
    ];

    for(int i = 0; i < initialVehicles.length; i++)
    {
      repository.add(initialVehicles[i]);
    }
    notifyListeners();
  }

  void add(String lineNumber, String startStation, String stopStation, String vehicleType)
  {
    repository.add(Vehicle(lineNumber, startStation, stopStation, vehicleType));
    notifyListeners();
  }

  void update(int id,String lineNumber, String startStation, String stopStation, String vehicleType)
  {
    repository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
    notifyListeners();
  }

  void remove(int id)
  {
    repository.remove(id);
    notifyListeners();
  }

  // List<Vehicle> getVehicles() => repository.vehicles;

  Future<List<Vehicle>> getVehicles() async => await repository.getAll();
}