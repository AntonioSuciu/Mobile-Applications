import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

import '../Domain/vehicle.dart';
import 'newRepository.dart';

class ServerRepository implements VehicleRepository {
  // static const String baseUrl = 'http://localhost:3000/';
  static const String baseUrl = 'http://10.0.2.2:3000/';

  @override
  Future<void> add(Vehicle vehicle) async {
    final response = await http.post(Uri.parse(baseUrl + 'vehicles'), body: json.encode(vehicle.toJson()));
    if (response.statusCode != 200) {
      throw Exception('Failed to add vehicle');
    }
  }

  @override
  Future<List<Vehicle>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl + 'vehicles'));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<Vehicle> vehicles = (json.decode(response.body) as List)
          .map((data) => new Vehicle.fromJson(data))
          .toList();
      return vehicles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load vehicles');
    }
  }

  @override
  Future<void> remove(int id) async {
    final response = await http.delete(Uri.parse(baseUrl + 'vehicles/' + id.toString()));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete vehicle');
    }
  }
  @override
  Future<void> update(int id, Vehicle vehicle) async {
    final response = await http.put(Uri.parse('${baseUrl}vehicles/$id'), body: json.encode(vehicle.toJson()));
    if (response.statusCode != 200) {
      throw Exception('Failed to update vehicle');
    }
  }
}
