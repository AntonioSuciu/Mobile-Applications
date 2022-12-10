import 'package:ctp_bus_management/Domain/vehicle.dart';
import 'package:ctp_bus_management/Repository/newRepository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository implements VehicleRepository {
  late Database _database;

  static const String tableName = 'Vehicles';

  static const String idCol = 'id';
  static const String lineNumberCol = 'lineNumber';
  static const String startStationCol = 'startStation';
  static const String stopStationCol = 'stopStation';
  static const String vehicleTypeCol = 'vehicleTypeCol';

  Future<Database> get database async {
    _database = await init();
    return _database;
  }

  static Future<Database> init() async {
    var databasesPath = await getDatabasesPath();

    var path = join(databasesPath, 'vehicles.db');

    // open db
    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          /// now we have to create the table
          await db.execute(
              'CREATE TABLE $tableName ($idCol INTEGER PRIMARY KEY AUTOINCREMENT, $lineNumberCol TEXT, $startStationCol TEXT, $stopStationCol TEXT, $vehicleTypeCol TEXT)');
        });
    return database;
  }

  @override
  Future<void> add(Vehicle vehicle) async {
    Map<String, dynamic> row = {
      lineNumberCol: vehicle.lineNumber,
      startStationCol: vehicle.startStation,
      stopStationCol: vehicle.stopStation,
      vehicleTypeCol: vehicle.vehicleType
    };
    final db = await database;
    await db.insert(tableName, row);
  }

  @override
  Future<List<Vehicle>> getAll() async {
    final db = await database;
    var vehiclesAsMaps = await db.query(tableName);

    List<Vehicle> result = [];

    for (var vehicleMap in vehiclesAsMaps) {
      var vehicle = Vehicle(
          vehicleMap[lineNumberCol] as String,
          vehicleMap[startStationCol] as String,
          vehicleMap[stopStationCol] as String,
          vehicleMap[vehicleTypeCol] as String);

      vehicle.id = vehicleMap[idCol] as int;
      result.add(vehicle);
    }
    return result;
  }

  @override
  Future<void> remove(int id) async {
    final db = await database;
    await db.delete(tableName, where: "$idCol = ?", whereArgs: [id]);
  }

  @override
  Future<void> update(int id, Vehicle vehicle) async {
    final db = await database;
    Map<String, dynamic> row = {
      lineNumberCol: vehicle.lineNumber,
      startStationCol: vehicle.startStation,
      stopStationCol: vehicle.stopStation,
      vehicleTypeCol: vehicle.vehicleType
    };

    await db.update(tableName, row, where: "$idCol =?", whereArgs: [id]);
  }
}