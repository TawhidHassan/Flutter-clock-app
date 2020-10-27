import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app/constants/theme_data.dart';
import 'package:flutter_clock_app/data.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Alarm",
          style: TextStyle(
            fontFamily: 'avenir',
            fontWeight: FontWeight.w700,
            color: CustomColors.primaryTextColor,
            fontSize: 24,
          ),
          ),
          Expanded(
            child: ListView(
              children:alarms.map<Widget>((alarm){
                var gradientColor = GradientTemplate
                    .gradientTemplate[alarm.gradientColorIndex].colors;
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColor.last.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                alarm.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                          Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'Mon-Fri',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "07:00 AM",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {

                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth:3 ,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.clockBG,
                    borderRadius:
                    BorderRadius.all(Radius.circular(24)),
                  ),

                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                    onPressed: (){},
                    child: Column(
                      children: [
                        Image.asset('assets/add_alarm.png',scale: 2.5,),
                        SizedBox(height: 8,),
                        Text("Add Alarm",
                         style: TextStyle(
                           color: Colors.white,
                           fontFamily: 'avenir',
                           fontSize: 8
                         ),
                        )
                      ],
                    ),
                  ),
              ),
                )]).toList(),

            ),
          )
        ],
      ),
    );
  }
}
