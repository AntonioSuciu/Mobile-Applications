// import 'package:ctp_bus_management/Repository/newRepository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:connectivity/connectivity.dart';
//
//
// import '../Domain/vehicle.dart';
// import '../Repository/databaseRepository.dart';
// import '../Repository/serverRepository.dart';
// const ctp_purple = Color(0xFFC150B2);
//
// class VehicleService extends ChangeNotifier {
//   late VehicleRepository dbRepository = DatabaseRepository();
//   late VehicleRepository serverRepository = ServerRepository();
//
//   VehicleService() {
//     // populateVehicles();
//   }
//
//   // VehicleService()
//   // {
//   //   repository = VehicleRepository();
//   //   populateVehicles();
//   // }
//
//   // void populateVehicles() {
//   //   repository.add(Vehicle(
//   //       "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));
//   //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
//   //   repository.add(Vehicle(
//   //       "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
//   //   repository.add(Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"));
//   //   repository.add(Vehicle(
//   //       "32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"));
//   //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
//   //   repository.add(Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"));
//   //   repository.add(Vehicle(
//   //       "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"));
//   //
//   //   notifyListeners();
//   // }
//
//   // Future<bool> isOnline() async {
//   //   var connectivityResult = await Connectivity().checkConnectivity();
//   //   return connectivityResult != ConnectivityResult.none;
//   // }
//
//   Future<bool> isOnline() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if(connectivityResult == ConnectivityResult.none)
//     {
//       return false;
//     }
//     return true;
//   }
//
//
//   //
//   // void populateVehicles()
//   // {
//   //   List<Vehicle> initialVehicles = [
//   //     Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
//   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//   //     Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
//   //     Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
//   //     Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
//   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//   //     Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
//   //   ];
//   //
//   //   for(int i = 0; i < initialVehicles.length; i++)
//   //   {
//   //     repository.add(initialVehicles[i]);
//   //   }
//   //   notifyListeners();
//   // }
//
//   void populateVehicles2() async {
//     bool isConnected = await isOnline();
//     var repository;
//     if (isConnected) {
//       repository = serverRepository;
//     } else {
//       repository = dbRepository;
//     }
//
//     List<Vehicle> initialVehicles = [  Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),  Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),  Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),];
//
//     for(int i = 0; i < initialVehicles.length; i++)
//     {
//       repository.add(initialVehicles[i]);
//     }
//     notifyListeners();
//   }
//
//   void populateVehicles() async {
//     var isConnected = await isOnline();
//     if (isConnected) {
//       List<Vehicle> serverVehicles = await serverRepository.getAll();
//       for (int i = 0; i < serverVehicles.length; i++) {
//         dbRepository.add(serverVehicles[i]);
//       }
//     } else {
//       List<Vehicle> initialVehicles = [
//         Vehicle(
//             "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
//         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//         Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
//             "Autobuz Diesel"),
//         Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
//         Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
//             "Autobuz Diesel"),
//         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
//         Vehicle(
//             "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
//       ];
//       for (int i = 0; i < initialVehicles.length; i++) {
//         dbRepository.add(initialVehicles[i]);
//       }
//     }
//     notifyListeners();
//
//     // void add(String lineNumber, String startStation, String stopStation, String vehicleType)
//     // {
//     //   repository.add(Vehicle(lineNumber, startStation, stopStation, vehicleType));
//     //   notifyListeners();
//     // }
//
//     void add(String lineNumber, String startStation, String stopStation,
//         String vehicleType) async {
//       bool isConnected = await isOnline();
//       if (isConnected) {
//         serverRepository.add(
//             Vehicle(lineNumber, startStation, stopStation, vehicleType));
//         dbRepository.add(
//             Vehicle(lineNumber, startStation, stopStation, vehicleType));
//       }
//       else {
//         dbRepository.add(
//             Vehicle(lineNumber, startStation, stopStation, vehicleType));
//       }
//       notifyListeners();
//     }
//
//     // void update(int id,String lineNumber, String startStation, String stopStation, String vehicleType)
//     // {
//     //   repository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
//     //   notifyListeners();
//     // }
//
//     // void update(int id, String lineNumber, String startStation,
//     //     String stopStation, String vehicleType) async {
//     //   bool isConnected = await isOnline();
//     //   if (isConnected) {
//     //     serverRepository.update(
//     //         id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
//     //   }
//     //   dbRepository.update(
//     //       id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
//     //   notifyListeners();
//     // }
//
//     Future<void> update(int id, String lineNumber, String startStation, String stopStation, String vehicleType) async {
//       // update the vehicle in the local database
//       dbRepository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
//       notifyListeners();
//       // check if online
//       bool online = await isOnline();
//       if (online) {
//         // update the vehicle on the server
//         serverRepository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
//       }
//     }
//
//     // void remove(int id)
//     // {
//     //   repository.remove(id);
//     //   notifyListeners();
//     // }
//
//     Future<void> remove(int id) async {
//       // remove from the local database
//       dbRepository.remove(id);
//       notifyListeners();
//       // check if online
//       bool online = await isOnline();
//       if (online) {
//         // remove from the server
//         serverRepository.remove(id);
//       }
//     }
//     // List<Vehicle> getVehicles() => repository.vehicles;
//
//     // Future<List<Vehicle>> getVehicles() async => await repository.getAll();
//     Future<List<Vehicle>> getVehicles() async {
//       if (await isOnline()) {
//         return await serverRepository.getAll();
//       } else {
//         return await dbRepository.getAll();
//       }
//     }
//   }
//
// }  //
// //
// //   //
// //   // void populateVehicles()
// //   // {
// //   //   List<Vehicle> initialVehicles = [
// //   //     Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
// //   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //   //     Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
// //   //     Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
// //   //     Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),
// //   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //   //     Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //   //     Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
// //   //   ];
// //   //
// //   //   for(int i = 0; i < initialVehicles.length; i++)
// //   //   {
// //   //     repository.add(initialVehicles[i]);
// //   //   }
// //   //   notifyListeners();
// //   // }
// //
// //   void populateVehicles2() async {
// //     bool isConnected = await isOnline();
// //     var repository;
// //     if (isConnected) {
// //       repository = serverRepository;
// //     } else {
// //       repository = dbRepository;
// //     }
// //
// //     List<Vehicle> initialVehicles = [  Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),  Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),  Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu", "Autobuz Diesel"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),  Vehicle("47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),];
// //
// //     for(int i = 0; i < initialVehicles.length; i++)
// //     {
// //       repository.add(initialVehicles[i]);
// //     }
// //     notifyListeners();
// //   }
// //
// //   void populateVehicles() async {
// //     var isConnected = await isOnline();
// //     if (isConnected) {
// //       List<Vehicle> serverVehicles = await serverRepository.getAll();
// //       for (int i = 0; i < serverVehicles.length; i++) {
// //         dbRepository.add(serverVehicles[i]);
// //       }
// //     } else {
// //       List<Vehicle> initialVehicles = [
// //         Vehicle(
// //             "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
// //         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //         Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
// //             "Autobuz Diesel"),
// //         Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
// //         Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
// //             "Autobuz Diesel"),
// //         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //         Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
// //         Vehicle(
// //             "47", "Str. Harghitei", "Piața Mihai Viteazu", "Autobuz Electric"),
// //       ];
// //       for (int i = 0; i < initialVehicles.length; i++) {
// //         dbRepository.add(initialVehicles[i]);
// //       }
// //     }
// //     notifyListeners();
// //
// //     // void add(String lineNumber, String startStation, String stopStation, String vehicleType)
// //     // {
// //     //   repository.add(Vehicle(lineNumber, startStation, stopStation, vehicleType));
// //     //   notifyListeners();
// //     // }
// //
// //     void add(String lineNumber, String startStation, String stopStation,
// //         String vehicleType) async {
// //       bool isConnected = await isOnline();
// //       if (isConnected) {
// //         serverRepository.add(
// //             Vehicle(lineNumber, startStation, stopStation, vehicleType));
// //         dbRepository.add(
// //             Vehicle(lineNumber, startStation, stopStation, vehicleType));
// //       }
// //       else {
// //         dbRepository.add(
// //             Vehicle(lineNumber, startStation, stopStation, vehicleType));
// //       }
// //       notifyListeners();
// //     }
// //

import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';

import '../Repository/databaseRepository.dart';
import '../Repository/newRepository.dart';
import '../Repository/serverRepository.dart';
import '../Domain/vehicle.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class VehicleService extends ChangeNotifier {
  final VehicleRepository dbRepository = DatabaseRepository();
  final VehicleRepository serverRepository = ServerRepository();

  Future<bool> isOnline() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    // print(connectivityResult);
    return connectivityResult != ConnectivityResult.none;
  }


  void populateVehicles() async {
    var isConnected = await isOnline();
    if (isConnected) {
      try {
        List<Vehicle> serverVehicles = await serverRepository.getAll();
        for (int i = 0; i < serverVehicles.length; i++) {
          dbRepository.add(serverVehicles[i]);
        }
      } catch (error) {
        print("Error getting vehicles from server: $error");
        // Add initial vehicles to server
        List<Vehicle> initialVehicles = [
          Vehicle(
              "47", "Str. Harghitei", "Piața Mihai Viteazu",
              "Autobuz Electric"),
          Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
          Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
              "Autobuz Diesel"),
          Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
          Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
              "Autobuz Diesel"),
          Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
          Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
          Vehicle(
              "47", "Str. Harghitei", "Piața Mihai Viteazu",
              "Autobuz Electric"),
        ];
        for (int i = 0; i < initialVehicles.length; i++) {
          serverRepository.add(initialVehicles[i]);
        }
      }
    } else {
      // Add initial vehicles to local database
      List<Vehicle> initialVehicles = [
        Vehicle(
            "47", "Str. Harghitei", "Piața Mihai Viteazu",
            "Autobuz Electric"),
        Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
        Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
            "Autobuz Diesel"),
        Vehicle("101", "Str. Bucium", "Piața Gării", "Tramvai"),
        Vehicle("32B", "Str. C-tin Brâncuși", "Piața Mihai Viteazu",
            "Autobuz Diesel"),
        Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
        Vehicle("5", "Aeroport", "Piața Gării", "Troleibuz"),
        Vehicle(
            "47", "Str. Harghitei", "Piața Mihai Viteazu",
            "Autobuz Electric"),
      ];
      for (int i = 0; i < initialVehicles.length; i++) {
        dbRepository.add(initialVehicles[i]);
      }
    }
    notifyListeners();
  }

  void add(String lineNumber, String startStation, String stopStation,
      String vehicleType) async
  {
    bool isConnected = await isOnline();
    if (isConnected) {
      serverRepository.add(
          Vehicle(lineNumber, startStation, stopStation, vehicleType));
      dbRepository.add(
          Vehicle(lineNumber, startStation, stopStation, vehicleType));
    }
    else {
      dbRepository.add(
          Vehicle(lineNumber, startStation, stopStation, vehicleType));
    }
    notifyListeners();
  }


  void update(int id, String lineNumber, String startStation, String stopStation, String vehicleType) async {
    // update the vehicle in the local database
    dbRepository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
    notifyListeners();
    // check if online
    bool online = await isOnline();
    if (online) {
      // update the vehicle on the server
      serverRepository.update(id, Vehicle(lineNumber, startStation, stopStation, vehicleType));
    }
  }

  void remove(int id) async {
    // remove from the local database
    dbRepository.remove(id);
    notifyListeners();
    // check if online
    bool online = await isOnline();
    if (online) {
      // remove from the server
      serverRepository.remove(id);
    }
  }

    // Future<List<Vehicle>> getVehicles() async => await repository.getAll();
    // Future<List<Vehicle>> getVehicles() async {
    //   if (await isOnline()) {
    //     return await serverRepository.getAll();
    //   } else {
    //     return await dbRepository.getAll();
    //   }
    // }
  Future<List<Vehicle>> getVehicles() async {
    if (await isOnline()) {
      try {
        return await serverRepository.getAll();
      } catch (error) {
        print('Server error: $error');
      }
    }
    return await dbRepository.getAll();
  }


}
