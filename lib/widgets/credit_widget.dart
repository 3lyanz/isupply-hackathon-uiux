import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditWidget extends StatelessWidget {
  final double creditLimit;
  final double usedCredit;
  final int daysRemaining;
  final DateTime lastUpdate;

  const CreditWidget({
    super.key,
    required this.creditLimit,
    required this.usedCredit,
    required this.daysRemaining,
    required this.lastUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final remainingCredit = creditLimit - usedCredit;
    final formattedLastUpdate = '${lastUpdate.hour}:${lastUpdate.minute.toString().padLeft(2, '0')} PM';

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/credit_management');
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF03A9F4),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '30',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Credit Limit: ${creditLimit.toStringAsFixed(2)} | 30 days',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.credit_card,
                  color: const Color(0xFF03A9F4),
                  size: 20.r,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Remaining ${remainingCredit.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Spent ${usedCredit.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Remaining days',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '$daysRemaining days',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Update: $formattedLastUpdate',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10.sp,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/view_manage_statements');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF03A9F4),
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    minimumSize: Size(70.w, 32.h),
                  ),
                  child: Text(
                    'Manage',
                    style: TextStyle(fontSize: 12),  // Added fontSize
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}