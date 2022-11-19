import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormScreenState();
  }
}


class _FormScreenState extends State<FormScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final age = TextEditingController();
  final genderController = TextEditingController();
  final sectionController = TextEditingController();
  final courseController = TextEditingController();
  final subjectController = TextEditingController();



  String dropdownvalue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Jane Doe',
                  labelText: 'Name',
                  ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please enter your name';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: age,
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  hintText: '21',
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty)  {
                    return 'Age is required';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: genderController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.female),
                  hintText: 'F',
                  labelText: 'Gender',
                     ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Birthdate is required';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.category_sharp),
                  hintText: 'BSIT',
                  labelText: 'Section',
                  ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Course is required';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: sectionController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.class_),
                  hintText: 'IT3R1',
                  labelText: 'Section',
                 ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Section is required';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.subject),
                  hintText: 'Mobile Programming',
                  labelText: 'Subject',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Subject is required';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'Gisan Dan Raniego',
                    child: Text('Gisan Dan Raniego'),
                  ),
                  DropdownMenuItem(
                    value: 'Jay Noel Rojo',
                    child: Text('Jay Noel Rojo'),
                  ),
                  DropdownMenuItem(
                    value: 'Dulcy Amor Jumawan',
                    child: Text('Dulcy Amor Jumawan'),
                  ),
                ],
                onChanged: (value) {
                  dropdownvalue = value.toString();
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    List displayDetails = <Map<String, dynamic>>[
                      {
                        'name': nameController.text,
                        'age': age.text,
                        'gender': genderController.text,
                        'section': sectionController.text,
                        'course':  courseController.text,
                        'subject': subjectController.text,
                        'teacher': dropdownvalue,


                      }
                    ];
                    Navigator.pop(context, displayDetails);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}