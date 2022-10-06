import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/util_constant.dart';
import '../home_bloc.dart';
import '../home_event.dart';
import '../home_state.dart';

class SelectRoutePage extends StatefulWidget {
  const SelectRoutePage({Key? key}) : super(key: key);

  @override
  _SelectRoutePageState createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
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
          if(state.routeDropValue!=null){
            print("Select route page: " + state.routeDropValue!);
          }
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
                UtilConstant.selectRouteText,
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
                              builder: (content) => SelectRoutePage(),
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
