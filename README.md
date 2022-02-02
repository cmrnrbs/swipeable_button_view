# swipeable_button_view

[![Pub Version](https://img.shields.io/pub/v/swipeable_button_view.svg?style=flat-square)](https://pub.dartlang.org/packages/swipeable_button_view)
[![Flutter CI](https://github.com/dooboolab/swipeable_button_view/actions/workflows/ci.yml/badge.svg)](https://github.com/dooboolab/swipeable_button_view/actions/workflows/ci.yml)

You can create ripple animated pages with swipeable_button_view.

## Install

Add `swipeable_button_view` as a dependency in pubspec.yaml
For help on adding as a dependency, view the [documentation](https://flutter.io/using-packages/).

## Usage

```dart
import 'package:swipeable_button_view/swipeable_button_view.dart';

SwipeableButtonView(
    buttonText: 'SLIDE TO PAYMENT',
    buttonWidget: Container(
        child: Icon(Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
                ),),
    activeColor: Color(0xFF009C41),
    isFinished: isFinished,
    onWaitingProcess: () {
    Future.delayed(Duration(seconds: 2), () {
            setState(() {
                isFinished = true;
                      });
                    });
                  },
    onFinish: () async {
        await Navigator.push(context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: DashboardScreen()));

                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
)
```

## Screen Recording

![image](https://raw.githubusercontent.com/cmrnrbs/swipeable_button_view/master/docs/record.gif)

## Props

|      props       |        types        |                         defaultValues                         | isRequired |
| :--------------: | :-----------------: | :-----------------------------------------------------------: | :--------: |
|     onFinish     |   `VoidCallback`    |                                                               |   `true`   |
| onWaitingProcess |   `VoidCallback`    |                                                               |   `true`   |
|   activeColor    |       `Color`       |                                                               |   `true`   |
|   buttonWidget   |      `Widget`       |                                                               |   `true`   |
|    buttonText    |      `String`       |                                                               |   `true`   |
|    isFinished    |       `bool`        |                            `false`                            |            |
|     isActive     |       `bool`        |                            `true`                             |            |
|   disableColor   |       `Color`       |                         `Colors.grey`                         |            |
|   buttonColor    |       `Color`       |                        `Colors.white`                         |            |
| buttontextstyle  |     `TextStyle`     | `TextStyle(color: Colors.white, fontWeight: FontWeight.bold)` |            |
|  indicatorColor  | `Animation<Color?>` |        `AlwaysStoppedAnimation<Color>(Colors.white)})`        |            |
