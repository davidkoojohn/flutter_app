
void main() {
  /*
  num i = 0;
  i = 0xff;
  print(i);

  String f = r'''ssss
  fff\nffffgg
  grrrr''';

  print(f);

  String c = 'aaa';
  print("object:$c");*/

  var list4 = <dynamic>['123', 123, <int>[12, 99]];
  print(list4);
  print(list4[0]);
  print(list4.length);

  Runes runes = new Runes('\u{1f605} \u6211');
  var str1 = String.fromCharCodes(runes);
  print(str1);
}
