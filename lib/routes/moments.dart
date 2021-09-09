import 'package:flutter/material.dart';

class MomentsPage extends StatefulWidget {
  static const routeName = '/moments';
  const MomentsPage({Key? key}) : super(key: key);

  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {

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
                child: Expanded(
                  child: Image.asset('assets/moments/friendcircle-banner.png', fit: BoxFit.cover,),
                ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/wbb.jpeg'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    // color: Colors.red[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            '张三',
                            style: TextStyle(
                                color: Color(0xFF41454D),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                          child: const Text(
                            '生死有命富贵在天',
                            style: TextStyle(
                              color: Color(0xFF41454D),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          color: const Color(0xFFEFEFEF),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/images/lyf.webp', width: 40.0, height: 40.0, fit: BoxFit.cover,),
                                Container(
                                  margin: const EdgeInsets.only(left: 6.0),
                                  child: const Text('人生自古谁无死'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 20.0),
                                child: GestureDetector(
                                  child: Row(
                                    children: const <Widget>[
                                      Icon(Icons.star, color: Color(0xFF80858C), size: 20,),
                                      Text('99', style: TextStyle(
                                        color: Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20.0),
                                child: GestureDetector(
                                  child: Row(
                                    children: const <Widget>[
                                      Icon(Icons.comment, color: Color(0xFF80858C), size: 20,),
                                      Text('评论', style: TextStyle(
                                        color: Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20.0),
                                child: GestureDetector(
                                  child: Row(
                                    children: const <Widget>[
                                      // Image.file('assets/moments/state-delete.svg'),
                                      Icon(Icons.delete, color: Color(0xFF80858C), size: 20,),
                                      Text('删除', style: TextStyle(
                                        color: Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
