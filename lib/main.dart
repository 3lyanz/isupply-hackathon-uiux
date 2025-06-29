import 'package:flutter/material.dart';
import 'package:flutter_ui_isupply/screens/best_invoice_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Add this import
import 'package:flutter_ui_isupply/screens/cart_screen.dart';
import 'home_screen.dart';
import 'theme/app_colors.dart';
import 'view_manage_statements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),  // Set your design size here
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'iSUPPLY',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.lightBlue,
            scaffoldBackgroundColor: Colors.grey[100],
            fontFamily: 'Cairo',
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.lightBlue,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                foregroundColor: Colors.white,
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF03A9F4),
            ),
          ),
          home: const HomeScreen(),
          routes: {
            '/best_price': (context) => const PlaceholderPage(title: 'Best Price'),
            '/cosmetics': (context) => const PlaceholderPage(title: 'Cosmetics'),
            '/stores': (context) => const PlaceholderPage(title: 'Stores'),
            '/shortage_items': (context) => const PlaceholderPage(title: 'Shortage Items'),
            '/trending_items': (context) => const PlaceholderPage(title: 'Top-Trending Items'),
            '/promotions': (context) => const PlaceholderPage(title: 'Promotions'),
            '/best_invoice': (context) => BestInvoiceScreen(),
            '/credit_management': (context) => const PlaceholderPage(title: 'Credit Management'),
            '/order_history': (context) => const PlaceholderPage(title: 'Order History'),
            '/invoices': (context) => const PlaceholderPage(title: 'Invoices'),
            '/profile': (context) => const PlaceholderPage(title: 'Profile'),
            '/cart': (context) => CartScreen(),
            '/notifications': (context) => const PlaceholderPage(title: 'Notifications'),
            '/contact_us': (context) => const PlaceholderPage(title: 'Contact Us'),
            '/view_manage_statements': (context) => const ViewManageStatements(),
          },
        );
      },
    );
  }
}

// Placeholder page for navigation destinations
class PlaceholderPage extends StatelessWidget {
  final String title;
  
  const PlaceholderPage({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Page', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
