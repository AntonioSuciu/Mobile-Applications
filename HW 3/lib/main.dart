import 'package:ctp_bus_management/Service/service.dart';
import 'package:ctp_bus_management/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const ctp_purple = Color(0xFFC150B2);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var service = await VehicleService.init();

  service.populateVehicles();

  runApp(
    ChangeNotifierProvider(
      create: (_) => service,
      child: MaterialApp(
        title: 'CTP Vehicle Management Application',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: ctp_purple,
            // title: const Text('CTP Vehicule'),
            title: Image.asset('images/ctp.png', fit: BoxFit.cover)
          ),
          body: const HomePageWidget(),
        ),
      ),
    )
  );


}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => VehicleService(),
//       child: MaterialApp(
//         title: 'CTP Vehicle Management Application',
//         home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: ctp_purple,
//             // title: const Text('CTP Vehicule'),
//             title: Image.asset('images/ctp.png', fit: BoxFit.cover)
//           ),
//           body: const HomePageWidget(),
//         ),
//       ),
//     )
//   );
// }