//import 'dart:math' as math;

import 'package:challenge3/component/circlebutton.dart';
import 'package:challenge3/component/clip.dart';
import 'package:challenge3/component/semirectanglebutton.dart';
import 'package:challenge3/component/zero.dart';
import 'package:challenge3/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //const  Color ColorOne = Colors.white;
    //const Color ColorTwo = Color.fromARGB(255, 169, 219, 245)
    //const String piString = '${math.pi}';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color.fromARGB(255, 155, 217, 247)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Stack(
              children: [
                ClipPath(
                    clipper: SemiCircleClipper(),
                    child: Container(
                        height: screenHeight / 3,
                        width: screenWidth,
                        color: const Color.fromARGB(255, 0, 140, 255))),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeSuccessState) {
                    return Center(
                      child: Padding(
                         padding: EdgeInsets.only(top:screenHeight / 8, ),
                        child: Text(
                          state.equation,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (state is HomeErrorState) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top:screenHeight / 8, ),
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child:Padding(
                         padding: EdgeInsets.only(top:screenHeight / 8, ),
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
            Row(children: [
              const Spacer(),
              SemiRectangleButton(operation: const Text('e'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: 'e'));
                  }),
              const Spacer(),
              SemiRectangleButton(operation: const Text('\u03C0'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: 'PI'));
                  }),
              const Spacer(),
              SemiRectangleButton(
                operation: const Text('sin'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: 'sin'));
                  }
              ),
              const Spacer(),
              SemiRectangleButton(operation: const Text('deg'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: 'deg'));
                  }),
              const Spacer(),
            ]),
            const Spacer(),
            Row(children: [
              const Spacer(),
              CircleButton(
                operation: const Text('C'),
                buttonColor: Colors.red,
                secondButtonColor: Colors.white,
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(ClearEvent());
                },
              ),
              const Spacer(),
              CircleButton(
                operation: const Text('('), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: '('));
                  }
              ),
              const Spacer(),
              CircleButton(operation: const Text(')'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: ')'));
                  }),
              const Spacer(),
              CircleButton(
                  operation: const Text('/'),
                  buttonColor: Colors.yellow,
                  secondButtonColor: Colors.white,
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: '/'));
                  }),
              const Spacer(),
            ]),
            const Spacer(),
            Row(children: [
              const Spacer(),
              CircleButton(operation: const Text('7'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '7'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('8'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '8'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('9'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '9'));
                  }),
              const Spacer(),
              const CircleButton(
                  operation: Text('x'),
                  buttonColor: Colors.yellow,
                  secondButtonColor: Colors.white),
              const Spacer(),
            ]),
            const Spacer(),
            Row(children: [
              const Spacer(),
              CircleButton(operation: const Text('4'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '4'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('5'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '5'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('6'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '6'));
                  }),
              const Spacer(),
              CircleButton(
                  operation: const Text('-'),
                  buttonColor: Colors.yellow,
                  secondButtonColor: Colors.white,
                   onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: '-'));
                  }),
              const Spacer(),
            ]),
            const Spacer(),
            Row(children: [
              const Spacer(),
              CircleButton(operation: const Text('1'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '1'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('2'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '2'));
                  }),
              const Spacer(),
              CircleButton(operation: const Text('3'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(NumberEvent(number: '3'));
                  }),
              const Spacer(),
              CircleButton(
                  operation: const Text('+'),
                  buttonColor: Colors.yellow,
                  secondButtonColor: Colors.white, onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: '+'));
                  }),
              const Spacer(),
            ]),
            const Spacer(),
            Row(children: [
              const Spacer(),
              Zero(operation: const Text('0'),onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(NumberEvent(number: '0'));
                }),
              const Spacer(),
              CircleButton(operation: const Text('.'), onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(OperationEvent(operation: '.'));
                  }),
              const Spacer(),
              CircleButton(
                  operation: const Text('='),
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(CalculatedEvent());
                  }),
              const Spacer(),
            ]),
            const Spacer()
          ]),
        ));
  }
}
