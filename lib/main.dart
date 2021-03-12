import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';
import 'package:ogrenci_takip_sistemi/screens/student_update.dart';

import 'models/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student>  students= [
    Student("İsim","Soyisim",100)
  ];

  var selectedStudent = Student("","",0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
          actions: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: const Icon(Icons.add),
            tooltip: 'add new student',
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
            },
          ),
        ],

        ),
        body: buildBody()
       );
        
        
    
  }

Widget buildBody() {
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(students[index].firstName +" "+ students[index].lastName),
              subtitle: Text("Sınavdan aldığı not : "+  students[index].grade.toString()+"["+ students[index].getStatus+"]"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"),
              ),
              trailing: buildIconStatus(students[index].grade),
              onTap: (){
                setState(() {
                  this.selectedStudent = students[index];
                });
                
              },
            );
          }
        ),
      ),
      Text("Seçili Öğrenci "+ selectedStudent.firstName+ " "+ selectedStudent.lastName),
      Row(
        children: <Widget>[
          buildAddNewStudentButton(),
          buildUpdateStudentButton(),   
          buildDeleteStudentButton()   
        ],
      ),
    ],
  );


}
Widget buildAddNewStudentButton(){
  return  Flexible(
    fit: FlexFit.tight,
    flex: 2,
    child: RaisedButton(
      color: Colors.greenAccent,
      child: Row(
        children: <Widget>[
           Icon(Icons.add),
           SizedBox(width: 5.0),
           Text("Yeni Öğrenci")
        ], 
      ),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
    }
    ),
  );
}
Widget buildUpdateStudentButton(){
  return Flexible(
    fit: FlexFit.tight,
    flex: 2,
    child: RaisedButton(
      color: Colors.blueAccent,
      child: Row(
        children: <Widget>[
          Icon(Icons.refresh),
          SizedBox(width: 5.0),
          Text("Güncelle")
        ], 
      ),
    onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentUpdate(students)));
      }
    ),
  );
}
Widget buildDeleteStudentButton(){
  return Flexible(
    fit: FlexFit.tight,
    flex: 1,
    child: RaisedButton(
      color: Colors.amberAccent,
      child: Row(
          children: <Widget>[
            Icon(Icons.delete),
            SizedBox(width: 5.0),
            Text("Sil")
          ], 
      ),
     onPressed: (){
        print("Sil");
       },
    ),
  );
}

Widget buildIconStatus(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }else if(grade>=40){
      return Icon(Icons.album);
    }else{
      return Icon(Icons.clear);
    }
    
  }
}