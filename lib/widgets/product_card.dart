import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final double discount;
  final String seller;
  final double consumerPrice;
  final double pharmacyPrice;
  final bool isCosmetic;
  final bool isTrustedSeller;
  final bool hasPromotion;
  final String imageUrl;
  final bool isManufacturer;

  const ProductCard({
    super.key,
    required this.title,
    required this.discount,
    required this.seller,
    required this.consumerPrice,
    required this.pharmacyPrice,
    required this.isCosmetic,
    required this.isTrustedSeller,
    required this.hasPromotion,
    required this.imageUrl,
    required this.isManufacturer,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.w),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Title and Discount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF004A99),
                      ),
                    ),
                    if (widget.isManufacturer) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.factory,
                        size: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ],
                  ],
                ),
                if (widget.discount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      '-${widget.discount.toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            if (widget.isCosmetic)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          child: Image.asset(widget.imageUrl, fit: BoxFit.contain),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'View photo',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.skyBlue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
            SizedBox(height: 8.h),

            // Middle Row: Image + Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                

                // Text info and quantity
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'From: ${widget.seller}',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          if (widget.isTrustedSeller) ...[
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.handshake,
                              size: 14.sp,
                              color: const Color(0xFF009FE3),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text('Consumer: ${widget.consumerPrice.toStringAsFixed(2)} EGP',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Pharmacy: ',
                              style: TextStyle(fontSize: 16.sp, color: Colors.black, fontFamily: 'Cairo'),
                              children: [
                                TextSpan(
                                  text: '${widget.pharmacyPrice.toStringAsFixed(2)} EGP',
                                  style: TextStyle(color: const Color(0xFF004A99), fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (quantity > 0) setState(() => quantity--);
                                  },
                                  iconSize: 16.r,
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(quantity.toString(), style: TextStyle(fontSize: 14.sp)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF009FE3),
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  onPressed: () => setState(() => quantity++),
                                  iconSize: 16.r,
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(minWidth: 20.w, minHeight: 20.h),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Promotion buttons (Bundle Quota & View Offer)
            if (widget.hasPromotion)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.skyBlue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    child: Text(
                      'Bundle Quota',
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF004A99)),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                    ),
                    child: Text(
                      'View offer',
                      style: TextStyle(color: const Color(0xFF004A99), fontSize: 12.sp, fontWeight: FontWeight.bold),
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
