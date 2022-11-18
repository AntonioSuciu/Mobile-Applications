import 'package:ctp_bus_management/Service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
const ctp_purple = Color(0xFFC150B2);


class VehicleEditWidget extends StatefulWidget {
  final int index;

  const VehicleEditWidget(this.index, {Key? key}) : super(key: key);

  @override
  State<VehicleEditWidget> createState() => VehicleEditWidgetState();
}

class VehicleEditWidgetState extends State<VehicleEditWidget> {
  VehicleEditWidgetState();

  void showAlertDialog(String message) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("EROARE"),
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

  bool areYouSureDialog() {
    bool cancel = false;

    // set up the button
    Widget yesBttn = TextButton(
      child: const Text("DA"),
      onPressed: () {
        var vehicle = Provider.of<VehicleService>(context, listen: false)
            .getVehicles()[widget.index];

        Provider.of<VehicleService>(context, listen: false).remove(vehicle.id);
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (context) {
                  return const HomePageWidget();
                }
            )
        );
      },
    );

    Widget cancelBttn = TextButton(
      child: const Text("ANULEAZĂ"),
      onPressed: () {
        cancel = true;
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Atenție!"),
      content: const Text('Ștergi acest vehicul?'),
      actions: [
        cancelBttn,
        yesBttn,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    return cancel;
  }

  @override
  Widget build(BuildContext context) {
    var vehicle = Provider.of<VehicleService>(context, listen: true)
        .getVehicles()[widget.index];

    var lineNumberController = TextEditingController(text: vehicle.lineNumber);
    var startStationController = TextEditingController(text: vehicle.startStation);
    var stopStationController = TextEditingController(text: vehicle.stopStation);
    var vehicleTypeController = TextEditingController(text: vehicle.vehicleType);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // title: Image.asset('images/ctp.png', fit: BoxFit.cover),
          title:ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
              child: Image.asset('images/ctp.png')),

          backgroundColor:ctp_purple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                  leading: const Icon(Icons.person),
                  title: TextField(
                      controller: lineNumberController,
                      decoration: const InputDecoration(
                        labelText: "Linie",
                      )
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.pin_drop_outlined),
                  title: TextField(
                    controller: startStationController,
                    decoration: const InputDecoration(
                        labelText:"Stație pornire"
                    ),
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.pin),
                  title:TextField(
                    controller: stopStationController,
                    decoration: const InputDecoration(
                        labelText: "Stație oprire"
                    ),
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.gas_meter),
                  title: TextField(
                    controller: vehicleTypeController,
                    decoration: const InputDecoration(
                      labelText: "Tip Vehicul",
                    ),
                  )
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ctp_purple
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Salvează"),
                      ],
                    ),
                  ),
                  onPressed: () {

                    Provider.of<VehicleService>(context, listen: false)
                        .update(
                        vehicle.id,
                        lineNumberController.text,
                        startStationController.text,
                        stopStationController.text,
                        vehicleTypeController.text
                    );

                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ctp_purple
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Șterge vehiculul"),
                      ],
                    ),
                  ),
                  onPressed: () {
                    var wasCancelled = areYouSureDialog();
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}