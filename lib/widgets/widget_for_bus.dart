import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumoh_road/providers/bus_station_info.dart';

// 버스정류장에 대한 정보 출력하는 위젯 - 상태가 아닌데 상태로 사용하는 게 문제발생가능있음. 나중에 분리하던가 할 것
class BusStopBox extends StatelessWidget {
  final String mainText;
  final String subText;
  final String code;
  final int id;

  BusStopBox({this.mainText="", this.subText="", this.code="", this.id=0, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.location_on, color: Colors.blue, size: 25),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    mainText,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 14),
                  Text(
                    subText,
                    style: TextStyle(
                        fontSize: 12, color: CupertinoColors.inactiveGray),
                  ),
                  Text(
                    '$id',
                    style: TextStyle(
                        fontSize: 12, color: CupertinoColors.inactiveGray),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

// 버스정류장의 각 도착할 버스에 대한 정보 출력하는 위젯 - 도착 시간에 따라 색을 바꿔야 할 거 같아.
class BusScheduleBoxUnit extends StatelessWidget {
  final String mainText;
  final String subText;
  final String arriveText;
  final String num;

  const BusScheduleBoxUnit({this.mainText="", this.subText="", this.num="", this.arriveText="", super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            Icon(Icons.directions_bus, color: Colors.blue, size: 25),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 2),
                  Text(
                    '$num | $mainText',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$subText',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  // 남은 시간에 따라 색 바꾸는 것도 좋을듯?
                  Text(
                    '$arriveText',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

// 버스정류장의 버스 도착정보를 통틀어 출력하는 위젯 - BusScheduleBox 사용함
class BusScheduleBox extends StatefulWidget {
  final BusApiRes busList;

  const BusScheduleBox({required this.busList, super.key});

  @override
  State<BusScheduleBox> createState() => _BusScheduleBoxState();
}

class _BusScheduleBoxState extends State<BusScheduleBox> {

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      SizedBox(height: 10), Divider(),
      SizedBox(height: 1),
    ];

    if (widget.busList.buses.length != 0){
      children.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20),
          Text( '전체 노선 ${widget.busList.buses.length}대', style: TextStyle(fontSize: 13, color: CupertinoColors.inactiveGray),),
        ],
      ));
      children.add(SizedBox(height: 1));
    } else { children.add(Center(child: Text("버스가 없습니다!")));}


    for (int i=0; i < widget.busList.buses.length; i++){
      children.add(BusScheduleBoxUnit(mainText: '예시 (${widget.busList.buses[i].nodenm} -> 도착 정류장)',
        subText: '정류장 몇 남았는지',
        num: widget.busList.buses[i].routeno,
        arriveText: '${(widget.busList.buses[i].arrtime/60).toInt()}분 ${widget.busList.buses[i].arrtime%60}초 후 도착',));
    }

    if (widget.busList.buses.length != 0) {children.add(Divider(),);}

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(children: children,),
      ),
    );
  }
}