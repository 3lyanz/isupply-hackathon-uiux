import 'package:flutter/material.dart';

class OptimizedProduct {
  final String name;
  final String seller;
  final double price;
  final int quantity;
  final double discount;

  OptimizedProduct({
    required this.name,
    required this.seller,
    required this.price,
    required this.quantity,
    required this.discount,
  });
}

class BestInvoiceScreen extends StatelessWidget {
  final List<OptimizedProduct> mockOptimizedProducts = [
    OptimizedProduct(
      name: 'Paracetamol 500mg',
      seller: 'PharmaCare Wholesale',
      price: 45.99,
      quantity: 100,
      discount: 15.0,
    ),
    OptimizedProduct(
      name: 'Amoxicillin 250mg',
      seller: 'MediSupply Corp',
      price: 89.99,
      quantity: 50,
      discount: 10.0,
    ),
  ];

  BestInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalSavings = mockOptimizedProducts.fold(
      0,
      (sum, product) => sum + (product.price * product.quantity * product.discount / 100),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Invoice Generator'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Potential Savings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${totalSavings.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Optimized Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: mockOptimizedProducts.length,
                itemBuilder: (context, index) {
                  final product = mockOptimizedProducts[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.seller),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${product.discount}% off',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement order processing
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}