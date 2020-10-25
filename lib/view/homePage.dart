import 'package:flutter/material.dart';
import '../data.dart';
import '../enums.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_clock_app/lib/view/clock_view.dart';
import 'package:flutter_clock_app/menu_info.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/theme_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now=DateTime.now();
    var formatetedTime=DateFormat('HH:mm').format(now);
    var formatetedDate=DateFormat('EEE,d MMM').format(now);

    var timeZoneString=now.timeZoneOffset.toString().split('.').first;

    
    var offsetSign='';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    print(timeZoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: menuItems
                    .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                    .toList(),
              ),
              
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType != MenuType.clock)
                  return Container();

                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Text("Clock", style: TextStyle(
                                color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formatetedTime, style: TextStyle(
                                    color: Colors.white, fontSize: 64),
                                ),Text(formatetedDate, style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),

                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.center,
                              child: ClockView(
                                size: MediaQuery.of(context).size.height / 4,
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Timezone',
                                  style: TextStyle(
                                      fontFamily: 'avenir',
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.primaryTextColor,
                                      fontSize: 24),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.language,
                                      color: CustomColors.primaryTextColor,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      'UTC' + offsetSign + timeZoneString,
                                      style: TextStyle(
                                          fontFamily: 'avenir',
                                          color: CustomColors.primaryTextColor,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]
                    )
                );
          },
            ),
          ),
        ],
      ),

    );
  }
  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                    fontFamily: 'avenir',
                    color: CustomColors.primaryTextColor,
                    fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }

}
