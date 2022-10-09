import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/constants/util_constant.dart';
import 'package:kalmanalgorithm/screens/select_route_page/select_route_page.dart';
import 'package:kalmanalgorithm/screens/select_route_page/select_route_provider.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (pre, current) =>
            pre.error != current.error ||
            pre.routeDropValue != current.routeDropValue,
        builder: (ctx, state) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              title: const Text(
                UtilConstant.selectRoute,
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UtilConstant.hPadding,
                vertical: UtilConstant.vPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    color: Color(0xFF00186C),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18.0,
                        ),
                        const Text(
                          "Select the desired route for you",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        DropdownButton<String>(
                          hint: const Text(
                            "Select your route here",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          value: state.routeDropValue,
                          dropdownColor: Colors.black,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: Colors.white,
                          focusColor: Colors.white,
                          items: UtilConstant.routeList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (v) {
                            homeBloc.add(ChangeRoute(v ?? ""));
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.yellow, // foreground
                    ),
                    onPressed: () {
                      if (state.routeDropValue != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectRouteProvider(
                                mainRoute: state.routeDropValue ?? "",
                              ),
                            ));
                      }
                    },
                    child: const Text('Next'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
