class Vehicle
{
  static int idGenerator = 0;

  late int id;
  String lineNumber;
  String startStation;
  String stopStation;
  String vehicleType;

  Vehicle(this.lineNumber, this.startStation, this.stopStation, this.vehicleType)
  {
    id = -1;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'lineNumber': lineNumber,
    'startStation': startStation,
    'stopStation': stopStation,
    'vehicleType': vehicleType,
  };

  factory Vehicle.fromJson(Map<String, dynamic> json) => new Vehicle(
    json['lineNumber'] as String,
    json['startStation'] as String,
    json['stopStation'] as String,
    json['vehicleType'] as String,
  )..id = json['id'] as int;


}