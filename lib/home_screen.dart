import 'package:flutter/material.dart';
import 'widgets/credit_widget.dart';
import 'widgets/credit_request_widget.dart';
import 'widgets/feature_card.dart';
import 'widgets/best_invoice_widget.dart';
import 'theme/app_colors.dart'; // Add this import
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Then use AppColors.primaryBlue instead of Color(0xFF1F4698) in the icon color properties
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showCreditWidget = true;
  bool _showSearchBar = false; // Add this line to track search bar visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF83D0F5),
        elevation: 0,
        scrolledUnderElevation: 0,
       /* title: _showSearchBar
            ? TextField(
                autofocus: true,
                style: TextStyle(fontSize: 13.sp),
                decoration: InputDecoration(
                  hintText: 'Search Products, APIs, Stores...',
                  hintStyle: TextStyle(fontSize: 13.sp, color: Colors.white70),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _showSearchBar = false;
                      });
                    },
                  ),
                ),
                onSubmitted: (value) {
                  // Handle search
                  Navigator.pushNamed(context, '/search', arguments: value);
                },
              )*/
            title : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Image.asset(
                    'assets/images/isupply_logo.png',
                    height: 30,
                    errorBuilder: (context, error, stackTrace) => const Text(
                      'iSUPPLY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
        actions: [
          /*if (!_showSearchBar) ...[  // Only show these icons when search bar is hidden
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xFF1F4698),
              ),
              onPressed: () {
                setState(() {
                  _showSearchBar = true;
                });
              },
            ),*/
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Color(0xFF1F4698),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xFF1F4698),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
      ),
      body: Container(
        // Add this Container with decoration for background image
        //decoration: const BoxDecoration(
          //image: DecorationImage(
           // image: AssetImage('lib/assets/images/isupply_background.png'),
            //fit: BoxFit.cover,
         // ),
        //),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Remove the existing search bar widget
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  style: const TextStyle(fontSize: 13.0),
                  decoration: InputDecoration(
                    hintText: 'Search Products, APIs, Stores...',  // Updated hint text
                    hintStyle: const TextStyle(
                      fontSize: 13.0, // Reduced hint text font size
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.document_scanner), // Document scanner icon
                      onPressed: () {
                        // Handle document scanning
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              
              // Rest of the content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Credit Widget or Credit Request Widget
                    _showCreditWidget
                        ? CreditWidget(
                            creditLimit: 100000.00,
                            usedCredit: 403.08,
                            daysRemaining: 20,
                            lastUpdate: DateTime.now(),
                          )
                        : CreditRequestWidget(
                            onStayInCreditMode: () {
                              setState(() {
                                _showCreditWidget = true;
                              });
                            },
                          ),
                    
                    // Toggle button for demo purposes
                    TextButton(
                    
                      onPressed: () {
                        setState(() {
                          _showCreditWidget = !_showCreditWidget;
                        });
                      },
                      child: Text(_showCreditWidget ? 'Request New Credit':'Show Credit Summary',style: TextStyle(color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      ),),
                    ),
                    

                    
                    // Best Invoice Banner
                    const BestInvoiceWidget(),
                    
                    const SizedBox(height: 24),
                    
                    // Feature Cards Grid
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        FeatureCard(
                          title: 'Best Prices',
                          subtitle: 'List of over 10,000 best prices',
                          icon: Icons.attach_money,
                          iconColor: Color(0xFF4CAF50),
                          routeName: '/best_price',
                        ),
                        FeatureCard(
                          title: 'Cosmetics',
                          subtitle: 'List of over 10,000 cosmetics',
                          icon: Icons.spa,
                          iconColor: Color(0xFFE91E63),
                          routeName: '/cosmetics',
                        ),
                        FeatureCard(
                          title: 'Sellers',
                          subtitle: 'Browse Cosmo & Pharma sellers',
                          icon: Icons.store_mall_directory,
                          iconColor: Color(0xFF2196F3),
                          routeName: '/sellers',
                        ),
                        FeatureCard(
                          title: 'Shortage Items',
                          subtitle: 'List of out of stock items & their sellers',
                          icon: Icons.inventory,
                          iconColor: Color(0xFFFF9800),
                          routeName: '/shortage_items',
                        ),
                        FeatureCard(
                          title: 'Manufacturers',
                          subtitle: 'Filter by a specific manufacturer',
                          icon: Icons.factory,
                          iconColor: Color(0xFF607D8B),
                          routeName: '/manufacturers',
                        ),
                        FeatureCard(
                          title: 'Promotions',
                          subtitle: 'Special offers & discounts',
                          icon: Icons.local_offer,
                          iconColor: Color(0xFFF44336),
                          routeName: '/promotions',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Call Customer Support'),
                      onTap: () {
                        Navigator.pop(context);
                        // Add phone call functionality here
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Chat with Chatbot'),
                      onTap: () {
                        Navigator.pop(context);
                        // Add chatbot functionality here
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.lightBlue,
        shape: CircleBorder(),
        child: Icon(Icons.support_agent, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          
          // Navigate to different screens based on index
          if (index != 0) {
            String route = '';
            switch (index) {
              case 1:
                route = '/order_history';
                break;
              case 2:
                route = '/scan';  // Updated to match the 'Scan Here' label
                break;
              case 3:
                route = '/cart';  // Updated to match the cart icon and label
                break;
              case 4:
                route = '/profile';  // Kept as is for the account section
                break;
            }
            Navigator.pushNamed(context, route);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0D47A1),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_file,  // Paperclip icon
              color: _selectedIndex == 2 ? const Color(0xFF0D47A1) : AppColors.lightBlue,  // Match AppBar color when not selected
            ),
            label: 'Scan Here',  // Changed label from 'Invoices' to 'Scan Here'
            backgroundColor: AppColors.lightBlue,  // Match AppBar color
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Changed from search to shopping cart
            label: 'Cart', // Changed from 'Search' to 'Cart'
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}