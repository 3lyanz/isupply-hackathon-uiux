import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/product_card.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: const [
          ProductCard(
            title: 'TUSSKAN SYRUP 100 ML',
            discount: 17.0,
            seller: 'دلا فارما',
            consumerPrice: 24.00,
            pharmacyPrice: 19.92,
            isCosmetic: false,
            isTrustedSeller: true,
            hasPromotion: true,
            imageUrl: 'assets/images/medicine1.png',
            isManufacturer: false,
          ),
          SizedBox(height: 12),
          ProductCard(
            title: 'PANADOL EXTRA 24 TABS',
            discount: 15.0,
            seller: 'GSK Egypt',
            consumerPrice: 45.00,
            pharmacyPrice: 38.25,
            isCosmetic: false,
            isTrustedSeller: true,
            hasPromotion: false,
            imageUrl: 'assets/images/medicine2.png',
            isManufacturer: true,
          ),
          SizedBox(height: 12),
          ProductCard(
            title: 'NIVEA CREAM 150ML',
            discount: 20.0,
            seller: 'Beauty Store',
            consumerPrice: 85.00,
            pharmacyPrice: 68.00,
            isCosmetic: true,
            isTrustedSeller: true,
            hasPromotion: true,
            imageUrl: 'assets/images/cosmetic1.png',
            isManufacturer: false,
          ),
          SizedBox(height: 12),
          ProductCard(
            title: 'L\'OREAL REVITALIFT SERUM',
            discount: 25.0,
            seller: 'L\'Oreal Egypt',
            consumerPrice: 299.00,
            pharmacyPrice: 224.25,
            isCosmetic: true,
            isTrustedSeller: true,
            hasPromotion: false,
            imageUrl: 'assets/images/cosmetic2.png',
            isManufacturer: true,
          ),
        ],
      ),
    );
  }
}