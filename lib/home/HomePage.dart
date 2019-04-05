import 'package:bloc_demo/home/FilterPage.dart';
import 'package:bloc_demo/home/bloc/UserBloc.dart';
import 'package:bloc_demo/home/customui/ListUi.dart';
import 'package:bloc_demo/model/HomePageModel.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomepageState();
  }
}

class HomepageState extends State<Home> with SingleTickerProviderStateMixin {
  double scalVal=0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc.getUsers();
  }

  @override
  void dispose() {
    userBloc.dispose();
super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[_myAppBar()];
        },
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.0, 0.0, 0.0],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.blueAccent[200],
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child:
             StreamBuilder(
                 stream: userBloc.getUserList,
                 builder: (context,AsyncSnapshot<List<UserListModel>> snapshot,)
             {
               if(snapshot.hasData)
                 return ListUi(snapshot);
               else if (snapshot.hasError) {
                 return Text(snapshot.error.toString());
               }
               return Center(child: CircularProgressIndicator());

             })

            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.5, 0.7, 0.9, 1.0, 1.3
                          ],
                          colors: [
                            Colors.white,
                            Colors.white70,
                            Colors.white30,
                            Colors.white10,
                            Colors.transparent,
                          ])),
                  child: InkWell(
                    onTap:()
                    {
                      _fabClicked(context);
                    },
                    child: Center(
                      child:Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(bottom: 15.0),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "images/filter.png",
                              height: 16.0,
                              width: 16.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Filter",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
//            FilterPage(),
          ],
        ),
      ),
    );
  }



  _myAppBar() {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TyperAnimatedTextKit(
                      text: ["London"],
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.white30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Birmingham",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "26 February",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Average Distance",
                          style:
                          TextStyle(fontSize: 12.0, color: Colors.white70),
                        ),
                        Text(
                          " 2h 24m",
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _fabClicked( conext) {
    showModalBottomSheet(context: conext, builder: (BuildContext)
    {return FilterPage();
    });



  }

}
