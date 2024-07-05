import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/F_text.dart';

class NumberSelectorInput {
  List<int> numbers;
  ScrollController controller;

  NumberSelectorInput({required this.controller, required this.numbers});
}

class NumberList extends StatefulWidget {
  const NumberList(this.details, {super.key});

  final NumberSelectorInput details;

  @override
  _NumberListState createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  List<int> numbers = [];

  final ScrollController _scrollController = ScrollController();
  int _currentNumber = 17;

  int index = 0;

  @override
  void initState() {
    super.initState();
    numbers = widget.details.numbers;
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    double itemHeight = Get.height * 0.56 * 0.1;
    index = (offset / itemHeight).round();

    if (index >= 0 && index < numbers.length) {
      setState(() {
        _currentNumber = numbers[index] + 1;
        index = index;
      });
    }
    if (index > numbers.length - 5) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.56,
          width: Get.width * 0.25,
          child: LayoutBuilder(
            builder: (context, size) {
              // test() {
              //   forTestAndDelete =
              //       'index : $index\nmyScroll : ${_scrollController.position.pixels.toInt()}\nmax: ${_scrollController.position.maxScrollExtent.toInt()}\n${_scrollController.position.pixels > _scrollController.position.maxScrollExtent * 0.89}';
              // }

              getHeight() {
                ScrollState state = ScrollState.normal;
                bool isScrollNearlyStart = (_scrollController.position.pixels <
                    _scrollController.position.maxScrollExtent / 5);
                bool isScrollNearlyEnd = (_scrollController.position.pixels >
                    (_scrollController.position.maxScrollExtent * 0.1));

                if (isScrollNearlyStart) {
                  state = ScrollState.nearlyStart;
                } else if (isScrollNearlyEnd) {
                  state = ScrollState.nearlyDone;
                }

                switch (state) {
                  case ScrollState.nearlyStart:
                    return size.maxHeight * 0.55 + ((index) * size.maxHeight * 0.105);
                  case ScrollState.nearlyDone:
                    return size.maxHeight * 0.55 +
                        ((numbers.length - 2.5 - index) * size.maxHeight * 0.105);
                  case ScrollState.normal:
                    return size.maxHeight;
                }
              }

              return Stack(
                children: [
                  if (_scrollController.hasClients)
                    Align(
                      alignment: Alignment.lerp(
                        Alignment.bottomCenter,
                        Alignment.topCenter,
                        _scrollController.position.pixels /
                            _scrollController.position.maxScrollExtent,
                      )!,
                      child: AnimatedContainer(
                        height: getHeight(),
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              MyColor.white.withOpacity(0.2),
                              MyColor.white.withOpacity(0.55),
                              MyColor.white.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: size.maxHeight * 0.05),
                    child: Center(
                      child: Container(
                        width: size.maxWidth,
                        height: size.maxHeight * 0.1,
                        color: MyColor.shadow,
                      ),
                    ),
                  ),
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      if (index == 0 || index == numbers.length - 1) {
                        return SizedBox(
                          height: size.maxHeight * 0.45,
                        );
                      }

                      double myOpacity = 1 - (_currentNumber - numbers[index]).abs() * 0.14;
                      if (myOpacity < 0) {
                        myOpacity = 0;
                      }
                      return SizedBox(
                        height: size.maxHeight * 0.1,
                        child: Center(
                          child: Opacity(
                            opacity: myOpacity,
                            child: FText(
                              numbers[index].toString(),
                              fontSize: 30 * (myOpacity * 1.15),
                              color: MyColor.textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
        Text(
          'Current Number: $_currentNumber ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

enum ScrollState { nearlyStart, nearlyDone, normal }

// - make a real video,
// - fix animation thing from bottom
// - turn the widget into something like package ( make every thing as a parameter to send )
// - organize the code
// - fix the controller pug
