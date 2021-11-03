import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/DesignThinking/widgets.dart';

class OverallLeaderBoard extends StatefulWidget {
  const OverallLeaderBoard({Key key}) : super(key: key);

  @override
  _OverallLeaderBoardState createState() => _OverallLeaderBoardState();
}

class _OverallLeaderBoardState extends State<OverallLeaderBoard> {
  Future<QuerySnapshot<Map<String, dynamic>>> leaderboard;

  void initState() {
    leaderboard = FirebaseFirestore.instance
        .collection("users")
        .orderBy("trophies", descending: true)
        .orderBy("rewards", descending: true)
        .limit(6)
        .get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StdBackButton(),
                    TrophyAndRewards(
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: height * 0.03,
                  ),
                  child: Text(
                    "Leader Board",
                    style: GoogleFonts.quicksand(
                      color: Color(0xffffa62b),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: height * 0.05,
                    ),
                  ),
                ),
                WhiteScreen(
                  height: height * 0.68,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.1,
                      child: Stack(children: [
                        Positioned(
                            right: width * 0.15,
                            child: RewardLogo(
                              isTrophy: true,
                            )),
                        Positioned(
                          right: 0,
                          child: RewardLogo(
                            isTrophy: false,
                          ),
                        ),
                      ]),
                    ),
                    FutureBuilder(
                        future: leaderboard,
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot<Map<String, dynamic>>
                                userData = snapshot.data.docs[index];
                                return Padding(
                                  padding:
                                  EdgeInsets.only(bottom: height * 0.03),
                                  child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: height * 0.045,
                                              width: width * 0.12,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xffcb7703),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                                color: Color(0xffffa62b),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  (index + 1).toString(),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: height * 0.025,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            width: width * 0.4,
                                            child: Text(
                                              userData.data()["name"],
                                              style: GoogleFonts.quicksand(
                                                color: Color(0xff489fb5),
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: height * 0.03,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  userData
                                                      .data()["trophies"]
                                                      .toString(),
                                                  style: GoogleFonts.quicksand(
                                                    color: Color(0xff489fb5),
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: height * 0.03,
                                                  ),
                                                ),
                                                Text(
                                                  userData
                                                      .data()["rewards"]
                                                      .toString(),
                                                  style: GoogleFonts.quicksand(
                                                    color: Color(0xff489fb5),
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: height * 0.03,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                );
                              },
                              shrinkWrap: true,
                            );
                          } else
                            return Center(child: CircularProgressIndicator());
                        }),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
