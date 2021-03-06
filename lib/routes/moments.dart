import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/moment_item_widget.dart';

class MomentsPage extends StatefulWidget {
  static const routeName = '/moments';
  const MomentsPage({Key? key}) : super(key: key);

  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {

  void _favourMethod(MomentType arg) {
    print(arg);
  }

  var momentsDataList = <MomentType>[
    MomentType(1, false, 99),
    MomentType(2, false, 79),
    MomentType(3, true, 88),
    MomentType(4, false, 19),
    MomentType(5, true, 39),
    MomentType(6, false, 9),
    MomentType(7, true, 91),
    MomentType(8, false, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('车友圈'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_rounded),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              SizedBox(
                height: 210,
                width: 375.0,
                child: Image.asset('assets/moments/friendcircle-banner.png', fit: BoxFit.cover,),
              ),
              Positioned(
                right: 16.0,
                bottom: 16.0,
                child: Row(
                  children: [
                    const Text(
                      '樱木花道',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Color.fromRGBO(0, 0, 0, .7),
                            offset: Offset(1.0, 1.0)
                          )
                        ]
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.white, width: 1.0, style: BorderStyle.solid),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/wbb.jpeg',
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          for(var item in momentsDataList) MomentItemWidget(momentData: item, favourMethod: _favourMethod),
          // const MomentItemWidget(),
          // const MomentItemWidget(),
          // const MomentItemWidget(),
          // const MomentItemWidget(),
          Container(
            margin: const EdgeInsets.only(top: 12.0, bottom: 16.0),
            child: const Align(
              child: Text(
                '我是有底线的',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFFACB1B7),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
