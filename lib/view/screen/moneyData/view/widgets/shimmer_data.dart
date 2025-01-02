import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';

Widget buildSectionShimmer() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      border: Border.all(color: kGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[500]!,
          child: Container(
            height: 20,
            width: 150,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[500]!,
          child: Divider(color: kWhite, thickness: 0.3),
        ),
        SizedBox(height: 8),
        Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      height: 16,
                      width: 100,
                      color: Colors.grey,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      height: 16,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[500]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 16,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
