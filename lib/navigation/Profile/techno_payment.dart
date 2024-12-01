import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), 
        child: AppBar(
          title: const Text(
            'TOTAL EARNINGS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(57, 105, 144, 1),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 237, 198, 136),
                  Color.fromARGB(255, 246, 217, 173),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          backgroundColor: Colors.transparent, 
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: double.infinity,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: FittedBox(
                child: const Text(
                  '₱5000.00',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Linked Accounts'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Withdraw'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLinkedAccount('images/paypal.png', 'Paypal'),
                _buildLinkedAccount('images/gcash.png', 'Gcash'),
                _buildLinkedAccount('images/bpi.png', 'BPI'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5, 
                    shape: CircleBorder(),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 111, 168, 255),
                      child: const Icon(Icons.add, color: Colors.white),
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      mini: true, 
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text(
              'Payment History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentHistoryItem('Irene', ' sent you ₱3500'),
                _buildPaymentHistoryItem('Wendy', ' sent you ₱1000'),
                _buildPaymentHistoryItem('Yeri', ' sent you ₱500'),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildLinkedAccount(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  
  Widget _buildPaymentHistoryItem(String name, String amount) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 60,
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
        const SizedBox(height: 4),
        Text(amount),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PaymentScreen(),
  ));
}
