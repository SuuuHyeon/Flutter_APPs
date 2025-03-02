import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImg(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay = date;
                  });
                },
              ),
            ),
          );
        });
  }
}

class _DDay extends StatelessWidget {
  final DateTime firstDay;
  final GestureTapCallback onHeartPressed;

  const _DDay({
    super.key,
    required this.firstDay,
    required this.onHeartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'U & I',
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 16),
        Text(
          '우리가 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        IconButton(
          iconSize: 60,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'D + ${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImg extends StatelessWidget {
  const _CoupleImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'assets/img/couple1.jpeg',
        height: MediaQuery.of(context).size.height / 2,
        fit: BoxFit.cover,
        // fit: BoxFit.cover,
      ),
    );
  }
}
