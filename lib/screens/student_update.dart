import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';

class StudentUpdate extends StatefulWidget{
  
  List<Student> students;
  StudentUpdate(this.students);


  @override
  State<StatefulWidget> createState() {

    return _StudentUpdateState();
  }

}

class _StudentUpdateState extends State<StudentUpdate> {

  var formKey = GlobalKey<FormState>();
  var student = Student("","",0);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle")
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
              child: Column(
              children: <Widget>[
                buildUpdateFirstNameField(),
                buildUpdateLastNameField(),
                buildUpdateGradeField(),
                buildSubmitButton()
            ],),
          ),
        ),
      ),
    );
  }

Widget buildUpdateFirstNameField() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Güncellenecek Ad",),
    onSaved: (String value){
      student.firstName = value;
    },
  );
}
Widget buildUpdateLastNameField() {
    return TextFormField(
    decoration: InputDecoration(labelText: "Güncellenecek Soyad",),
    onSaved: (String value){
      student.lastName = value;
    },
    
  );
}
Widget buildUpdateGradeField() {
    return TextFormField(
    decoration: InputDecoration(labelText: "Güncellenecek Not",),
    onSaved: (String value){
      student.grade = int.parse(value);
    },
    
  );
}
Widget buildSubmitButton() {
  return RaisedButton(
    child: Text("Kaydet"),
    onPressed: (){
      formKey.currentState.save();
      widget.students.add(student);
      Navigator.pop(context);
    }
  );
}




}