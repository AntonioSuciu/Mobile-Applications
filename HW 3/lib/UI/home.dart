import 'package:ctp_bus_management/Service/service.dart';
import 'package:ctp_bus_management/UI/add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit.dart';
const ctp_purple = Color(0xFFC150B2);


class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context)
                  {
                    return const VehicleAddPage();
                  }
            )
          );
        },
        backgroundColor: Colors.grey[300],
        child: const Icon(Icons.add),
      ),
    body: ListView.builder(
      itemCount: Provider.of<VehicleService>(context, listen: true).getVehicles().length,
      itemBuilder: (context, index)
        {
          var vehicle = Provider.of<VehicleService>(context, listen: true).getVehicles()[index];
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.purple.shade300,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListTile(
              title: Row(
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        vehicle.lineNumber,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        vehicle.vehicleType,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(
                        vehicle.startStation,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,

                        ),
                      ),
                      Text(
                        vehicle.stopStation,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            onTap: () =>{
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)
                  {
                    return VehicleEditWidget(index);
                  }
                  )
                )
            },
            ),
          );
        }
      ),
    );
  }

}