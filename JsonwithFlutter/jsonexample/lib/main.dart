import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch:Colors.cyan,
  ),
  home: new HomePage(),
));

 class HomePage extends StatefulWidget{
   @override
   HomePageState createState() => new HomePageState();
    }
   
   class HomePageState extends State<HomePage> {
     List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Json Example'),
     ),
     body: new Container(
       child: new Center(
         child: new FutureBuilder(
           future: DefaultAssetBundle // Local Json için
           .of(context)
           .loadString('jsonfile/urun.json'),
           builder: (context,snapshot) {
             var mydata = json.decode(snapshot.data.toString());
             return new ListView.builder( //veriyi listview de görüntüler
                
                itemBuilder: (BuildContext context,int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, //Horizontal
                      children: <Widget>[                       
                        new Text("Isim :" +mydata[index]['isim']),
                        new Text("Yil :" +mydata[index]['yil']),
                        new Text("Renk :" +mydata[index]['renk']),
                        new Text("Fiyat :" +mydata[index]['fiyat']),
                        
                      ], 
                    ),
                  );
                },
                  itemCount: mydata == null ? 0: mydata.length,
             );
           },
           
         ),  
       ),
     ),
    );
  }
}
