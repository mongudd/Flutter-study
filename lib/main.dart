import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                              color: Color(0xFFfafafa),
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFFfafafa).withAlpha(170),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: const Color(0xFFfafafa).withAlpha(170),
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "\$5 194 482",
                  style: TextStyle(
                    color: Color(0xFFfafafa),
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF2B33A),
                      txtColor: Color(0xFF181818),
                    ),
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFF1F2123),
                      txtColor: Color(0xFFfafafa),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Color(0xFFfafafa),
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: const Color(0xFFfafafa).withAlpha(170),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6 428",
                  icon: Icons.euro_symbol_outlined,
                  isInverted: false,
                  index: 0,
                ),
                const CurrencyCard(
                  name: "Dollar",
                  code: "USD",
                  amount: "55 622",
                  icon: Icons.monetization_on_outlined,
                  isInverted: true,
                  index: 1,
                ),
                const CurrencyCard(
                  name: "Rupee",
                  code: "INR",
                  amount: "28 981",
                  icon: Icons.currency_rupee,
                  isInverted: false,
                  index: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
