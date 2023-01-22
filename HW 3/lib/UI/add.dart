
import 'package:ctp_bus_management/Service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Domain/vehicle.dart';

const ctp_purple = Color(0xFFC150B2);


class VehicleAddPage extends StatelessWidget{

  const VehicleAddPage({Key? key}) : super(key: key);

  void showAlertDialog(BuildContext context, String message) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // launch the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var lineController = TextEditingController();
    var startStationController = TextEditingController();
    var stopStationController = TextEditingController();
    var vehicleTypeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // title: Image.asset('images/ctp.png', fit: BoxFit.cover),
        title:ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
            child: Image.asset('images/ctp.png')),

        backgroundColor: ctp_purple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.airport_shuttle),
              title: TextField(
                controller: lineController,
                decoration: const InputDecoration(
                  labelText: "Line",
                ),
              )
            ),
            ListTile(
                leading: const Icon(Icons.pin_drop_outlined),
                title: TextField(
                  controller: startStationController,
                  decoration: const InputDecoration(
                    labelText: "Start Station",
                  ),
                )
            ),
            ListTile(
                leading: const Icon(Icons.pin),
                title: TextField(
                  controller: stopStationController,
                  decoration: const InputDecoration(
                    labelText: "Stop Station",
                  ),
                )
            ),
            ListTile(
                leading: const Icon(Icons.gas_meter),
                title: TextField(
                  controller: vehicleTypeController,
                  decoration: const InputDecoration(
                    labelText: "Type",
                  ),
                )
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ctp_purple
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Adaugă")
                    ],
                  ),
                ),

                // onPressed: (){
                //   if(lineController.text == '')
                //     {
                //       showAlertDialog(context, 'Introdu linia!');
                //       return;
                //     }
                //   if(startStationController.text == '')
                //   {
                //     showAlertDialog(context, 'Introdu stația de pornire!');
                //     return;
                //   }
                //   if(stopStationController.text == '')
                //   {
                //     showAlertDialog(context, 'Introdu stația de oprire!');
                //     return;
                //   }
                //   if(vehicleTypeController.text == '')
                //   {
                //     showAlertDialog(context, 'Introdu tipul vehiculului!');
                //     return;
                //   }
                //   Provider.of<VehicleService>(context, listen: false)
                //       .add(
                //     lineController.text,
                //     startStationController.text,
                //     stopStationController.text,
                //     vehicleTypeController.text,
                //   );
                //   Navigator.pop(context);
                // },
                  onPressed: () async {
                    if(lineController.text == '')
                    {
                      showAlertDialog(context, 'Introdu linia!');
                      return;
                    }
                    if(startStationController.text == '')
                    {
                      showAlertDialog(context, 'Introdu stația de pornire!');
                      return;
                    }
                    if(stopStationController.text == '')
                    {
                      showAlertDialog(context, 'Introdu stația de oprire!');
                      return;
                    }
                    if(vehicleTypeController.text == '')
                    {
                      showAlertDialog(context, 'Introdu tipul vehiculului!');
                      return;
                    }
                    bool isConnected = await Provider.of<VehicleService>(context, listen: false).isOnline();
                    if (isConnected) {
                      // online
                      Provider.of<VehicleService>(context, listen: false)
                          .serverRepository
                          .add(Vehicle(lineController.text, startStationController.text, stopStationController.text, vehicleTypeController.text));
                    } else {
                      // offline
                      Provider.of<VehicleService>(context, listen: false)
                          .dbRepository
                          .add(Vehicle(lineController.text, startStationController.text, stopStationController.text, vehicleTypeController.text));
                    }
                    Navigator.pop(context);
                  }
              ),
            )


          ],
        )
      ),
    );
  }



}