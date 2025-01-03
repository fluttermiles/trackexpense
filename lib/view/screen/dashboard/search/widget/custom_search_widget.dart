import 'package:flutter/material.dart';
import 'package:trackexpense/utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: kWhite,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search ...',
                  hintStyle: TextStyle(
                    color: kGrey,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: kWhite, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.search,
              color: kWhite,
            ),
          ],
        ),
      ),
    );
  }
}
