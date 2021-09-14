import 'package:flutter/material.dart';
import 'package:flutter4/ui_view/custom_grid_view.dart';
import 'package:flutter4/ui_view/list_horizontal.dart';
import 'package:flutter4/ui_view/page_basic_list.dart';
import 'package:flutter4/ui_view/simple_grid_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
     home: MainPage(), debugShowCheckedModeBanner: false,
    );
  }
}
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom GridView with CardView'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueAccent,
      body: ListView(
        children:<Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Icon(Icons.account_balance,size: 150.0,)
          ),
          Container(
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PageBasicList()));
              },
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text('Simple List'),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListHorizontal()));
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Horizontal List'),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageSimpleGrid()));
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Simple Grid'),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomGridView()));
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Custom Grid View'),
            ),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }

}

