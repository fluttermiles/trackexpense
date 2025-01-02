import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context, RupeeMateModel rupeeMateModel) {
  showModalBottomSheet(
    backgroundColor: Colors.black,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title:',
                  style: TextStyle(color: kGrey, fontSize: 16),
                ),
                Flexible(
                  child: Text(
                    rupeeMateModel.title ?? '',
                    style: TextStyle(color: kWhite, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            rupeeMateModel.description == '' || rupeeMateModel.description == null ? SizedBox()
            : Text(
              'Description:',
              style: TextStyle(color: kGrey, fontSize: 16),
            ),
            rupeeMateModel.description == '' || rupeeMateModel.description == null ? SizedBox()
            : Flexible(
              child: Text(
                rupeeMateModel.description ?? '',
                style: TextStyle(color: kWhite, fontSize: 16),
                textAlign: TextAlign.left,
              
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price:',
                  style: TextStyle(color: kGrey, fontSize: 16),
                ),
                Text(
                  '\$${rupeeMateModel.amount?.toStringAsFixed(2)}',
                  style: TextStyle(color: kWhite, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date:',
                  style: TextStyle(color: kGrey, fontSize: 16),
                ),
                Text(
                  '${rupeeMateModel.day}-${rupeeMateModel.month}-${rupeeMateModel.year}',
                  style: TextStyle(color: kWhite, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kWhite),
                  color: kBlack,
                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
