import 'package:admin/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.blueGrey).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextField(

        decoration:  InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText:hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
        ),
      ),
      5.heightBox
    ],
  );
}