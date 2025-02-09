import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatefulWidget {
  final String value;
  final String selectedGender;
  final ValueChanged<String>? onChanged;  // Add callback

  const CustomRadioButton({
    super.key,
    required this.value,
    this.selectedGender = "Male",
    this.onChanged,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: widget.value,
          groupValue: widget.selectedGender,
          onChanged: (newValue) {
            if (newValue != null) {
              widget.onChanged?.call(newValue.toString());  // Call the callback
            }
          },
        ),
        Text(widget.value, style: TextStyle(fontSize: 14.sp)),
        SizedBox(width: 10.w),
      ],
    );
  }
}