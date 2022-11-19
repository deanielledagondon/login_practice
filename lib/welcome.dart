import 'package:flutter/material.dart';
import 'package:login/homepage.dart';
import 'package:login/model/user.dart';
import 'package:login/tabs/student.dart';
import 'package:login/tabs/subject.dart';
import 'package:login/tabs/teacher.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.username}) : super(key: key);

  var username = '';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.username}'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Students')),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Teachers')),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Subjects')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Student(),
          Subject(),
          Teacher(),

        ],
      ),
    );
  }
}
