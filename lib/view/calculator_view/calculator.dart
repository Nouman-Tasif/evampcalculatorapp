import 'package:daytask1_flutter/components/textfield.dart';
import 'package:daytask1_flutter/model/calculator_model/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Calculator",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          body: ChangeNotifierProvider(
            create: (_) => CalculatorModel(),
            child: Consumer<CalculatorModel>(
              builder: (context, viewModel, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.all(12.0),
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                viewModel.expression,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                viewModel.result,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )),
                    ),
                    3.height,
                    20.heightSizedBox,
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: width * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                        text: "AC",
                                        color: Colors.black,
                                        onTap: () {
                                          viewModel.clearExpressionMethod();
                                        }),
                                    IconButton(
                                        onPressed: () {
                                          viewModel.cancelButton();
                                        },
                                        icon: const Icon(
                                          Icons.cancel_presentation_sharp,
                                          color: Color(0xffe86100),
                                        )),
                                    TextView(
                                        text: "%",
                                        color: const Color(0xffe86100),
                                        onTap: () {
                                          viewModel.addToExpression('%');
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: IconButton(
                                          onPressed: () {
                                            viewModel.divideNumber();
                                            if (viewModel.result
                                                .contains('/')) {
                                              return;
                                            }
                                          },
                                          icon: const FaIcon(
                                            FontAwesomeIcons.divide,
                                            color: Color(0xffe86100),
                                          )),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextView(
                                        text: "7",
                                        color: Colors.black,
                                        onTap: () {
                                          viewModel.addToExpression("7");
                                        },
                                      ),
                                      TextView(
                                        text: "8",
                                        color: Colors.black,
                                        onTap: () {
                                          viewModel.addToExpression("8");
                                        },
                                      ),
                                      TextView(
                                        text: "9",
                                        color: Colors.black,
                                        onTap: () {
                                          viewModel.addToExpression("9");
                                        },
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18),
                                        child: IconButton(
                                            onPressed: () {
                                              viewModel.multiply();
                                              if (viewModel.result
                                                  .contains('*')) {
                                                return;
                                              }
                                            },
                                            icon: const FaIcon(
                                              FontAwesomeIcons.multiply,
                                              color: Color(0xffe86100),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: "4",
                                      color: Colors.black,
                                      onTap: () {
                                        viewModel.addToExpression("4");
                                      },
                                    ),
                                    TextView(
                                        onTap: () {
                                          viewModel.addToExpression("5");
                                        },
                                        text: "5",
                                        color: Colors.black),
                                    TextView(
                                      text: "6",
                                      color: Colors.black,
                                      onTap: () {
                                        viewModel.addToExpression("6");
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 19),
                                      child: IconButton(
                                          onPressed: () {
                                            viewModel.subtractNumber();
                                            if (viewModel.result
                                                .contains('-')) {
                                              return;
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.minimize_sharp,
                                            color: Color(0xffe86100),
                                            size: 30,
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                        onTap: () {
                                          viewModel.addToExpression("1");
                                        },
                                        text: "1",
                                        color: Colors.black),
                                    TextView(
                                        onTap: () {
                                          viewModel.addToExpression("2");
                                        },
                                        text: "2",
                                        color: Colors.black),
                                    TextView(
                                        onTap: () {
                                          viewModel.addToExpression("3");
                                        },
                                        text: "3",
                                        color: Colors.black),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 19),
                                      child: IconButton(
                                          onPressed: () {
                                            viewModel.addNumber();
                                            if (viewModel.result
                                                .contains('+')) {
                                              return;
                                            }
                                          },
                                          hoverColor: Colors.grey,
                                          icon: const Icon(
                                            Icons.add,
                                            color: Color(0xffe86100),
                                            size: 30,
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.crop_rotate,
                                          color: Color(0xffe86100),
                                        )),
                                    TextView(
                                        onTap: () {
                                          viewModel.addToExpression("0");
                                        },
                                        text: "0",
                                        color: Colors.black),
                                    TextView(
                                      text: ".",
                                      color: Colors.black,
                                      onTap: () {
                                        if (viewModel.result.contains('.')) {
                                          return;
                                        }
                                        viewModel.addToExpression(".");
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: InkWell(
                                        onTap: () {
                                          viewModel.evaluateExpression();
                                        },
                                        child: CircleAvatar(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0xffe86100),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.equals,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
          )),
    );
  }
}

extension Sizedbox on num {
  SizedBox get heightSizedBox => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension Divder on num {
  Divider get height => Divider(height: toDouble());
}
