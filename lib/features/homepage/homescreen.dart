import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isTablet = screenSize.width >= 600;

    return Scaffold(
      appBar: AppBar(title: Text('HomePage', style: Theme.of(context).textTheme.headlineMedium), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 30 : 20, vertical: isTablet ? 30 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Agrictools',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: isTablet ? 20 : 10),
            Text(
              'A smart agricultural tool platform designed to assist farmers with modern solutions.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
            ),
            SizedBox(height: isTablet ? 30 : 20),
            Container(
              width: isTablet ? 350 : 250,
              height: isTablet ? 300 : 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade400, Colors.green.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.agriculture, size: isTablet ? 120 : 80, color: Colors.white),
            ),
            SizedBox(height: isTablet ? 40 : 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemCount: featureItems.length,
                itemBuilder: (context, index) {
                  return FeatureCard(feature: featureItems[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/get-started'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 40 : 30, vertical: isTablet ? 15 : 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'Get Started',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FeatureItem {
  final IconData icon;
  final String title;
  final String description;

  FeatureItem({required this.icon, required this.title, required this.description});
}

List<FeatureItem> featureItems = [
  FeatureItem(icon: Icons.eco, title: 'Eco-Friendly', description: 'Sustainable farming techniques.'),
  FeatureItem(icon: Icons.water, title: 'Irrigation', description: 'Smart water management.'),
  FeatureItem(icon: Icons.agriculture, title: 'Smart Tools', description: 'AI-powered farming tools.'),
  FeatureItem(icon: Icons.cloud, title: 'Weather Updates', description: 'Real-time weather insights.'),
  FeatureItem(icon: Icons.show_chart, title: 'Analytics', description: 'Data-driven farming analytics.'),
  FeatureItem(icon: Icons.shopping_cart, title: 'Marketplace', description: 'Buy & sell farm products.'),
];

class FeatureCard extends StatelessWidget {
  final FeatureItem feature;
  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(feature.icon, size: 40, color: Colors.green),
          SizedBox(height: 10),
          Text(
            feature.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            feature.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
