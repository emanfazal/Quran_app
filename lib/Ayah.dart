import 'package:flutter/material.dart';

class AyaatPage extends StatelessWidget {
  final surahName;
  final ayat;

  final index;
  final type;

  const AyaatPage(
      {Key? key,
      required this.surahName,
      required this.ayat,
      required this.index,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          title: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  surahName.toString(),
                  style: TextStyle(fontFamily: 'kalam', fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: ayat.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              child: ListTile(
                title: Container(
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ayat[index].sajda == false ? '' : 'سجدة',
                                  style: TextStyle(
                                      fontFamily: 'qalam',
                                      color: Colors.green,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: Colors.black26)),
                                  child: Center(
                                    child: Text(
                                      ayat[index].numberInSurah.toString(),
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          ayat[index].text.toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontFamily: 'qalam',
                                              fontSize: 20),
                                        ),
                                      ]),
                                ),
                              ]),
                        ]),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
