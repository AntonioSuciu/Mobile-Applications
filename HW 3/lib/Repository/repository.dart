// import 'package:ctp_bus_management/Domain/vehicle.dart';
//
// class VehicleRepository{
//   final List<Vehicle> vehicles = [];
//
//   void add(Vehicle vehicle)
//   {
//     vehicles.add(vehicle);
//     // print(vehicle.id);
//     // print(vehicle.lineNumber);
//   }
//
//   void update(int id, Vehicle vehicle)
//   {
//     vehicle.id = id;
//     vehicles[vehicles.indexWhere((vehicle) => vehicle.id == id)] = vehicle;
//   }
//
//   void remove(int id)
//   {
//     Vehicle v = vehicles.where((vehicle) => vehicle.id == id).first;
//     vehicles.remove(v);
//     // print(v.id);
//     // print(v.lineNumber);
//   }
// }