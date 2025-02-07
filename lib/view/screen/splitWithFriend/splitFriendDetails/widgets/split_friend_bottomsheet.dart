import 'package:intl/intl.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:flutter/material.dart';

void showSplitFriendBottomSheet(BuildContext context, SplitFriendDetailModel splitFriendDetailModel) {
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
                    splitFriendDetailModel.title ?? '',
                    style: TextStyle(color: kWhite, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: splitFriendDetailModel.description == '' || splitFriendDetailModel.description == null ? 0 : 8),
            splitFriendDetailModel.description == '' || splitFriendDetailModel.description == null ? SizedBox()
            : Text(
              'Description:',
              style: TextStyle(color: kGrey, fontSize: 16),
            ),
            splitFriendDetailModel.description == '' || splitFriendDetailModel.description == null ? SizedBox()
            : Flexible(
              child: Text(
                splitFriendDetailModel.description ?? '',
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
                  '₹ ${splitFriendDetailModel.amount?.toStringAsFixed(2)}',
                  style: TextStyle(color: kWhite, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${splitFriendDetailModel.userContribution?[index].name}:',
                      style: TextStyle(color: kGrey, fontSize: 16),
                    ),
                    Text(
                      '₹ ${splitFriendDetailModel.userContribution?[index].amount?.toStringAsFixed(2)}',
                      style: TextStyle(color: kWhite, fontSize: 16),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return gapH4;
              },
              itemCount: splitFriendDetailModel.userContribution?.length ?? 0,
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
                  DateFormat('dd MMM yyy').format(DateTime(splitFriendDetailModel.year ?? 2025,  splitFriendDetailModel.month ?? 1, splitFriendDetailModel.day ?? 1)),
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
                    'Close',
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
