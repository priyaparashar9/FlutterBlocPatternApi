import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_demo/filter/BeerListBloc.dart';
import 'package:bloc_demo/model/BeerModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

String selectedCharVal;

class BeerListPage extends StatefulWidget {
  double selectedVal;

  BeerListPage(this.selectedVal){
    if(selectedVal!=null) {
      int val = selectedVal.toInt();
      selectedCharVal = String.fromCharCode(val + 64);
    }
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserStateList();
  }
}

class UserStateList extends State<BeerListPage> {
  final bgcolor = const Color(0xfff2eff0);
  bool isItemSelected=false;

  @override
  void initState() {
    super.initState();
    beerBloc.getBeerLists();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[_myAppBar()];
        },
        body: Container(
          decoration: BoxDecoration(color: bgcolor),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0))),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: StreamBuilder(
                    stream: beerBloc.getBeerList,
                    builder: (
                      context,
                      AsyncSnapshot<List<BeerListmodel>> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          padding: EdgeInsets.all(0.0),
                          itemBuilder: (BuildContext context, int index) {
                            return selectedCharVal==null || selectedCharVal==""?
                            listItem(snapshot.data[index]):
                            snapshot.data[index].name.startsWith(selectedCharVal)?
                            listItem(snapshot.data[index]):Container();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return Center(child: CircularProgressIndicator());
                    }),
              ),

//            FilterPage(),
            ],
          ),
        ),
      ),
    );
  }


  Widget openAlert()
  {
    return AlertDialog(
      title: Text("Filteration"),
      content: Text("No Data Found"),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],

    );
  }

  Widget _myAppBar() {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 5,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          /*   Icon(
              Icons.chevron_left,
              color: Colors.white,
            )
            Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),*/
        ],
      ),
      backgroundColor: Colors.blueAccent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 20.0),
                    child: Text(
                      "Filtered Result",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TyperAnimatedTextKit(
                    text: ["Filetered by User Alphabet"],
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(BeerListmodel beerModel) {
    return Container(
      height: 140,
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 4.0,
            margin: EdgeInsets.only(bottom: 20.0, left: 10.0, top: 10.0),
            child: Container(
              height: 130.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 4.0),
                    child: Text(
                      beerModel.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 50.0),
                    child: SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: 4,
                      size: 15.0,
                      color: Colors.yellow,
                      borderColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 15.0, left: 15.0, right: 15.0),
                    child: Text(
                      beerModel.des,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: 12.0, letterSpacing: 1.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Card(
              elevation: 4.0,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            beerModel.imgUrl))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
