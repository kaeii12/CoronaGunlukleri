import 'package:coronagunlukleri/models/Corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Coronagunlukeri.dart';
import 'package:intl/intl.dart';

class coronaDetay extends StatelessWidget {
  Result result;
  coronaDetay({this.result});
DateTime veri;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(result.country),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(

          children: <Widget>[
            Card(
              color:Colors.teal[400] ,
                child:ListTile(
                  leading: Icon(Icons.fiber_new),
                  trailing: Icon(Icons.fiber_manual_record),
                  subtitle: Text("YENİVAKA",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),

                    title: Text(result.newCases,style: TextStyle(fontSize: 26),))
            ),
            Card(
                color:Colors.teal[400] ,
                child:ListTile(
                  leading: Icon(Icons.fiber_new),
                  trailing: Icon(Icons.fiber_manual_record),
                  subtitle: Text("TOPLAM VAKA",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),

                  title: result.totalcases!=null ?
                  Text(result.totalcases,style: TextStyle(fontSize: 26),):Text("BELİRSİZ"),

                )
            ),
            Card(
                color:Colors.teal[400] ,
                child:ListTile(
                    leading: Icon(Icons.fiber_new),
                    trailing: Icon(Icons.fiber_manual_record),
                    subtitle: Text("YENİÖLÜM",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),

                    title: Text(result.newDeaths,style: TextStyle(fontSize: 26),))
            ),

            Card(
                color:Colors.teal[400] ,
                child:ListTile(
                    leading: Icon(Icons.fiber_new),
                    trailing: Icon(Icons.fiber_manual_record),
                    subtitle: Text("AKTIFVAKA",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),
                    title: Text(result.activeCases,style: TextStyle(fontSize: 26),))
            ),
            Card(
                color:Colors.teal[400] ,
                child:ListTile(
                    leading: Icon(Icons.fiber_new),
                    trailing: Icon(Icons.fiber_manual_record),
                    subtitle: Text("TOPLAM ÖLÜM",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),

                    title: result.totaldeaths!=null ?
                      Text(result.totaldeaths,style: TextStyle(fontSize: 26),):Text("BELİRSİZ"),

                )
            ),
            Card(
                color:Colors.teal[400] ,
                child:ListTile(
                  leading: Icon(Icons.fiber_new),
                  trailing: Icon(Icons.fiber_manual_record),
                  subtitle: Text("TOPLAM İYİLEŞEN",style:TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 5),),

                  title: result.totalRecovered!=null ?
                  Text(result.totalRecovered,style: TextStyle(fontSize: 26),):Text("BELİRSİZ"),

                )
            ),

          ],
        ),



      ),

    );
  }
}
