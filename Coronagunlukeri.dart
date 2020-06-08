import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:coronagunlukleri/CoronaDetay.dart';
import 'models/Corona.dart';

class Coronagunlukleri extends StatefulWidget {
  @override
  _CoronagunlukleriState createState() => _CoronagunlukleriState();
}

class _CoronagunlukleriState extends State<Coronagunlukleri> {
  String url = "https://api.collectapi.com/corona/countriesData";
  Countries countries;
  Future<Countries> nesnem;
  Future<Countries> verileriGetir() async {
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'authorization': 'apikey 7gHB6dUK0n2TTlOsaGLDQM:1tRZIaH92z41vO9ePSEeUF'
      },
    );
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      countries = Countries.fromJson(decodedJson);
      return countries;
    } else {
      debugPrint("Veri çekilemedi");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nesnem=verileriGetir();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "CoronaGünlükleri",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: VeriGetir(),
    );
  }

  FutureBuilder<Countries> VeriGetir() {
    return FutureBuilder(
      future: nesnem,
      builder: (context, AsyncSnapshot<Countries> nesne) {
        if (nesne.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else
          return ListView.builder(itemBuilder: (context, index) {
            nesne.data.result.sort((a,b)=>a.country[index].compareTo(b.country[index]));
            return Column(
                children: nesne.data != null
                    ?

                nesne.data.result.map((veri) {
                        return  new InkWell(
                          child:new Card(
                            color: Colors.transparent,
                            child: ListTile(
                              trailing: Icon(Icons.arrow_right),
                              leading: CircleAvatar(
                                maxRadius: 20,
                                minRadius: 5,
                                child: Text(veri.country[0]),
                                foregroundColor: Colors.blueGrey,
                              ),
                              title: Text(
                                veri.country.toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  letterSpacing: 3,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return coronaDetay(result: veri);
                            }));
                          },
                        );
                      }).toList()
                    :  Text('VERİ'));
          });
      },
    );
  }
}
//listem.sort((a, b) => a.ad[0].compareTo(b.ad[0]));