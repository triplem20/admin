import 'package:admin/consts/consts.dart';

Widget ourButton({onPress, color, textColor, String? btitle}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: btitle!.text.white.fontFamily(bold).make(),
  );
}