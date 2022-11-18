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
    id = idGenerator ++;
  }

}