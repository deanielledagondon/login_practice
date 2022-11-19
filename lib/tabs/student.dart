import 'package:flutter/material.dart';
import 'package:login/form.dart';
import 'package:login/model/person.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {

  List data = [];
  List student = [];

  List<Person> liststudents = [
    Person(
      leading: 'assets/images/gigachad.png',
      name: '',
      age: '',
      gender: '',
      section: '',
      course: '',
      subject: '',
      teacher: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: student.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text(student[index]['name']),
                subtitle: Row(
                  children: [
                    Text(student[index]['course']),
                    const Text(' - '),
                    Text(student[index]['section']),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(data: student[index])));
                },
              ),
              onDismissed: (direction) =>
                  setState(() {
                    student.removeAt(index);
                    data.removeAt(index);
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            data.add(await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormScreen())));

            setState(() {
              //.map loop passing receiver list value to student list
              student = data
                  .map((item) =>
              {
                'name': item[0]['name'],
                'age': item[0]['age'],
                'gender': item[0]['gender'],
                'course': item[0]['course'],
                'section': item[0]['section'],
                'subject': item[0]['subject'],
                'teacher': item[0]['teacher'],
              }).toList();
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map data;

  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListView(

            children: [

              Text('Name: ${data['name']}'),


              Text('Age: ${data['age']}'),

              Text('Gender: ${data['gender']}'),

              Text('Course: ${data['course']}'),

              Text('Section: ${data['section']}'),

              Text('Subject: ${data['subject']}'),

              Text('Teacher: ${data['teacher']}'),


            ],
          ),
        ));
  }
}