import 'package:flutter/material.dart';
import 'package:flutter4/ui_view/detail_view.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CustomGridView extends StatefulWidget{
  CustomGridView({Key key}) : super(key: key);

  _CustomGridViewState createState() => _CustomGridViewState();
}

const List<Key> key =[
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];

class _CustomGridViewState extends State<CustomGridView>{

  List<Container> daftarGunung = new List();
  var itemsDaftarGunung =[
    {"nama" : "Gunung 1" , "gambar" : "g1_merapi.jpg", "Keterangan" : "Gugnung Merapi"},
    {"nama" : "Gunung 2" , "gambar" : "g2_salak.jpg", "Keterangan" : "Gugnung Salak"},
    {"nama" : "Gunung 3" , "gambar" : "g3_semeru.jpg", "Keterangan" : "Gugnung Semeru"},
    {"nama" : "Gunung 4" , "gambar" : "g4_slamet.jpg", "Keterangan" : "Gugnung Slamet"}
  ];

  //Metodh
  _buatDataList()async{
    for(var i=0; i<itemsDaftarGunung.length;i++){
      final dataGunung = itemsDaftarGunung[i];

      final String gambarGunung  = dataGunung["gambar"];

      daftarGunung.add(new Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: new InkWell(
            onTap: (){

              showDialog(context: context, builder: (_) => AssetGiffyDialog(
                  key: key[5],
                  image: Image.asset('gambar/$gambarGunung', fit: BoxFit.cover,),
                  title: Text(
                    dataGunung["nama"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,),
                  ),
                description: Text(
                  dataGunung["keterangan"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                onOkButtonPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailView(
                      dnama: dataGunung['nama'], dgambar: dataGunung['gambar'], dketerangan: dataGunung['keterangan']
                    )));
                },
              ));
            },
            child: new Column(
              children:<Widget>[
                new Hero(tag: dataGunung,
                    child: new Image.asset('gambar/$gambarGunung', height: 85.0, width: 85.0, fit: BoxFit.contain),),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(dataGunung['nama'], style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ));
    }
  }

 @override
 void initState(){
    super.initState();
    _buatDataList();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom GridView'),
        backgroundColor: Colors.amber,
      ),
      body: new GridView.count(crossAxisCount: 2,
      children:daftarGunung,),
    );
    throw UnimplementedError();
  }

}