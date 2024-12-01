import 'dart:typed_data';

import 'package:flutter/material.dart';
//STORE AND PORTFOLIO KAG E DISPLAY AS ARRAY SA _portfolios
class Portfolio {
  final String title;
  final String subtitle;
  final String description;
  final Uint8List? imageBytes;

  Portfolio({
    required this.title,
    required this.subtitle,
    required this.description,
    this.imageBytes,
  });
}

class PortfolioProvider extends ChangeNotifier {
  final List<Portfolio> _portfolios = [];

  List<Portfolio> get portfolios => _portfolios;

  void addPortfolio(Portfolio portfolio) {
    _portfolios.add(portfolio);
    notifyListeners();
  }
}