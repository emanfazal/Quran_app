import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Ayah.dart';
import 'model.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  final String title = 'القرآن الكريم';

    Future<QuranModel> fetchData() async {
      final response = await http.get(Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani'));
      var body = jsonDecode(response.body.toString());
      QuranModel quranModel = QuranModel.fromJson(body);
      return quranModel;
// var data = response.body;
    // var name = jsonDecode(data)['data']['surahs'][0]['ayahs'][5]['text'];
    // print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'qalam', fontWeight: FontWeight.normal, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuranModel>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 15,
                  color: Colors.green,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Please, Check your Internet ...${snapshot.error}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          }
          else {
            return ListView.builder(
                itemCount: snapshot.data?.data.surahs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    child: Expanded(
                      child: ListTile(
                          title: Row(children: [
                            Text(
                              snapshot.data!.data.surahs[index].number
                                  .toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.data.surahs[index].englishName,
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 14),
                                    ),
                                    Text(
                                      snapshot.data!.data.surahs[index]
                                          .englishNameTranslation,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),

                                    Text(
                                      snapshot.data!.data.surahs[index].revelationType.name,
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              snapshot.data!.data.surahs[index].name,
                              style:
                              TextStyle(fontFamily: 'mushaf', fontSize: 25),
                            ),
                          ]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AyaatPage(
                                      surahName: snapshot
                                          .data!.data.surahs[index].name,
                                      ayat: snapshot
                                          .data!.data.surahs[index].ayahs,
                                      index: index,
                                      type: snapshot.data!.data
                                          .surahs[index].revelationType,
                                    )));
                          }),
                    ),
                  );
                });
          }
        },
      ),

    );
  }
}
