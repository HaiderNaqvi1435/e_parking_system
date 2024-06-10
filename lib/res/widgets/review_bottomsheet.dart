import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/views/select_slot_view.dart';
import 'package:flutter/material.dart';

class ReviewBottomSheet extends StatefulWidget {
  @override
  _ReviewBottomSheetState createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  void _submitReview() {
    // Implement your review submission logic here
    print('Review: ${_reviewController.text}, Rating: $_rating');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Leave a Review',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Rating'),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1.0;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _reviewController,
            maxLines: 4,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your Review',
            ),
          ),
          const SizedBox(height: 16),
          SmallButton(
            color: AppColors.yellowColor,
            title: "Submit",
            onTap: () => _submitReview(),
          )
          // ElevatedButton(
          //   onPressed: _submitReview,
          //   child: const Text('Submit'),
          // ),
        ],
      ),
    );
  }
}

void showReviewBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ReviewBottomSheet(),
      ),
    ),
  );
}
