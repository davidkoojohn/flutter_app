import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MomentType {
  int id;
  bool isFavour;
  int favourCount;

  MomentType(this.id, this.isFavour, this.favourCount);
}

class MomentItemWidget extends StatefulWidget {
  const MomentItemWidget({Key? key, required this.favourMethod, required this.momentData}) : super(key: key);
  final ValueChanged<MomentType> favourMethod;
  final MomentType momentData;

  @override
  _MomentItemWidgetState createState() => _MomentItemWidgetState();
}

class _MomentItemWidgetState extends State<MomentItemWidget> {
  bool _isFavour = false;
  int _favourCount = 0;

  @override
  void initState() {
    super.initState();
    _isFavour = widget.momentData.isFavour;
    _favourCount = widget.momentData.favourCount;
  }

  void _handleFavour() {
    print(widget.momentData);
    widget.favourMethod(widget.momentData);

    /*setState(() {
      if(_isFavour) {
        _isFavour = false;
        _favourCount -= 1;
      } else {
        _isFavour = true;
        _favourCount += 1;
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEFEFEF), width: 1.0, style: BorderStyle.solid),
        ),
      ),
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
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 6.0),
                                child: const Text(
                                  '人生自古谁无死',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/moments/state-thumbs-up.svg',
                                    color: _isFavour ? Colors.blue : const Color(0xFF80858C),
                                    width: 18,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text('$_favourCount', style: TextStyle(
                                        color: _isFavour ? Colors.blue : const Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                  ),
                                ],
                              ),
                              onTap: _handleFavour,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/moments/state-comment.svg',
                                    color: const Color(0xFF80858C),
                                    width: 18,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text('评论', style: TextStyle(
                                        color: Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/moments/state-delete.svg',
                                    color: const Color(0xFF80858C),
                                    width: 18,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text('删除', style: TextStyle(
                                        color: Color(0xFF80858C),
                                        fontSize: 12.0,
                                      ),)
                                  )
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '12小时前',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFACB1B7),
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
