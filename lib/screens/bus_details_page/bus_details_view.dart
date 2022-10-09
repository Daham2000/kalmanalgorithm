import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/constants/util_constant.dart';
import 'package:kalmanalgorithm/screens/bus_details_page/widgets/bus_card.dart';
import 'package:kalmanalgorithm/screens/home_state.dart';

import '../home_bloc.dart';

class BusDetailsView extends StatefulWidget {
  const BusDetailsView({Key? key}) : super(key: key);

  @override
  _BusDetailsViewState createState() => _BusDetailsViewState();
}

class _BusDetailsViewState extends State<BusDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (pre, current) => pre.error != current.error,
        builder: (ctx, state) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              title: const Text(
                UtilConstant.busDetailsText,
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                BusDetailsCard(
                  busNumber: "KMD1212",
                  availableSeats: 12,
                  onBoardPassengers: 20,
                  fuelLevel: 3,
                  estimatedRunDistance: 20,
                  ticketPrice: 1000,
                ),
                BusDetailsCard(
                  busNumber: "KMD1212",
                  availableSeats: 12,
                  onBoardPassengers: 20,
                  fuelLevel: 3,
                  estimatedRunDistance: 20,
                  ticketPrice: 1000,
                ),
                BusDetailsCard(
                  busNumber: "KMD1212",
                  availableSeats: 12,
                  onBoardPassengers: 20,
                  fuelLevel: 3,
                  estimatedRunDistance: 20,
                  ticketPrice: 1000,
                ),
              ],
            ),
          );
        });
  }
}
