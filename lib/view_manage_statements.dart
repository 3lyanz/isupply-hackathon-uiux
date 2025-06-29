import 'package:flutter/material.dart';

class ViewManageStatements extends StatelessWidget {
  const ViewManageStatements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Statements'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Statement',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildStatementCard(
              totalCredit: 5000.0,
              daysLimit: 30,
              remainingCredit: 3500.0,
              spentCredit: 1500.0,
              remainingDays: 25,
              lastUpdate: DateTime.now(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Past Statements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildStatementCard(
              totalCredit: 5000.0,
              daysLimit: 30,
              remainingCredit: 0.0,
              spentCredit: 5000.0,
              remainingDays: 0,
              lastUpdate: DateTime(2024, 1, 15),
              isPast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatementCard({
    required double totalCredit,
    required int daysLimit,
    required double remainingCredit,
    required double spentCredit,
    required int remainingDays,
    required DateTime lastUpdate,
    bool isPast = false,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Credit Limit: ${totalCredit.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Days Limit: $daysLimit',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Remaining: ${remainingCredit.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Spent: ${spentCredit.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // Changed from end to start
              children: [
                Text(
                  'Remaining Days: $remainingDays',
                  style: TextStyle(
                    color: isPast ? Colors.grey : Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Last Update: ${lastUpdate.day}/${lastUpdate.month}/${lastUpdate.year}',
                  style: TextStyle(
                    color: isPast ? Colors.grey : Colors.black,
                    fontSize: 14,
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