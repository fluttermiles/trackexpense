import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';

void showSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: kWhite,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: kBlack,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
