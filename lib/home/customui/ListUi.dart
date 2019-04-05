import 'package:bloc_demo/model/HomePageModel.dart';
import 'package:flutter/material.dart';

class ListUi extends StatelessWidget{
  AsyncSnapshot<List<UserListModel>> snapshot;

  ListUi(this.snapshot);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
      return listItem(index,snapshot.data[index]);
    }
    );
  }

  Widget listItem(int index,UserListModel userListModel) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getColor(index),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(22.0, 20.0, 0.0, 0.0),
        height: 150,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 == 0 ? Colors.white : Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.adjust,
                            color: Colors.blueAccent,
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("11:00",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.0,
                                )),
                          ),
                          Text(
                            userListModel.name,
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.adjust,
                            color: Colors.black26,
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("11:00",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.0,
                                )),
                          ),
                          Text(
                            userListModel.email,
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    userListModel.id.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            Divider(
              height: 3.0,
              color: Colors.black26,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "images/messenger.png",
                      color: Colors.black26,
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        "images/messenger.png",
                        color: Colors.black26,
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Gobriel,",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.0),
                            ),
                            Text(
                              " 39 y/o",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "48 - ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.0),
                            ),
                            Text(
                              "8 rating",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        width: 35.0,
                        height: 35.0,
                        margin: EdgeInsets.fromLTRB(10.0, 10, 20, 10),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png"))))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  Color getColor(int selector) {
    if (selector == 0)
      return Colors.transparent;
    else if (selector % 2 == 0) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }
}