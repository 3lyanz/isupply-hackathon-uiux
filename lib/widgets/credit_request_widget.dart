import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditRequestWidget extends StatefulWidget {
  final VoidCallback? onStayInCreditMode;
  const CreditRequestWidget({super.key, this.onStayInCreditMode});

  @override
  State<CreditRequestWidget> createState() => _CreditRequestWidgetState();
}

class _CreditRequestWidgetState extends State<CreditRequestWidget> {
  double selectedCreditLimit = 5000;
  int selectedDuration = 14;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: const Color(0xFF009FE3),
                size: 24.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'Credit Application',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Select Desired Credit Limit',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          Slider(
            value: selectedCreditLimit,
            min: 1000,
            max: 10000,
            divisions: 9,
            label: '${selectedCreditLimit.toStringAsFixed(0)}',
            onChanged: (value) {
              setState(() {
                selectedCreditLimit = value;
              });
            },
            activeColor: const Color(0xFF009FE3),
          ),
          SizedBox(height: 16.h),
          Text(
            'Choose Plan Duration',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: Text('14-day cycle'),
                  selected: selectedDuration == 14,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedDuration = 14;
                    });
                  },
                  selectedColor: const Color(0xFF009FE3),
                  labelStyle: TextStyle(
                    color: selectedDuration == 14 ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ChoiceChip(
                  label: Text('30-day cycle'),
                  selected: selectedDuration == 30,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedDuration = 30;
                    });
                  },
                  selectedColor: const Color(0xFF009FE3),
                  labelStyle: TextStyle(
                    color: selectedDuration == 30 ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/credit_management');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009FE3),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Apply for Credit',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}