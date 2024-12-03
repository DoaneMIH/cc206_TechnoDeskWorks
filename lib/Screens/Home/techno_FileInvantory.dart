
import 'package:exercisce_unit4/Screens/Home/addPortfolio.dart';
import 'package:exercisce_unit4/Services/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'add_portfolio.dart'; // Adjust import path to your AddPortfolioPage
// import 'portfolio_provider.dart';

class FileInventory extends StatelessWidget {
  const FileInventory({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolios = context.watch<PortfolioProvider>().portfolios;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 214, 148),
                    Color.fromARGB(255, 255, 222, 192)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: const Text(
              'File Inventory',
              style: TextStyle(
                //color: Color.fromRGBO(57, 105, 144, 1), 
                //fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
        backgroundColor: const Color.fromRGBO(207, 229, 251, 1.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ...portfolios.map((portfolio) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Portfolio image
                      Container(
                        height: 380,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          image: DecorationImage(
                            image: portfolio.imageBytes != null
                                ? MemoryImage(portfolio.imageBytes!)
                                : const AssetImage("assets/placeholder.png") as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              portfolio.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              portfolio.subtitle,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              portfolio.description,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPortfolioPage(),
                    ),
                  );
                  if (result != null && result is Portfolio) {
                    context.read<PortfolioProvider>().addPortfolio(result);
                  }
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Add Portfolio",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
