import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'dasboard_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Payment App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Screen'),
        backgroundColor: Color(0xFF009C41),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text('EUR',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade500)),
                          ),
                          Text(
                            '20.00',
                            style: TextStyle(
                                fontSize: 80, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                child: Center(
                                  child: Image.asset(
                                    'assets/store.png',
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFF009C41),
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('First Order'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Order Detail')
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SwipeableButtonView(
                  buttonText: 'SLIDE TO PAYMENT',
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
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
                    await Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: DashboardScreen()));

                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
