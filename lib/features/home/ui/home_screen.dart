import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Box Relax",
      "subtitle": "Un regalo per chi ha bisogno di staccare",
      "images": [
        "https://placehold.co/1080x1350",
        "https://placehold.co/1080x1350?text=Relax2",
      ],
      "price": "€ 59,90"
    },
    {
      "title": "Gusto Italiano",
      "subtitle": "Sapori autentici in un’unica confezione",
      "images": [
        "https://placehold.co/1080x1350?text=Pasta",
        "https://placehold.co/1080x1350?text=Olio",
      ],
      "price": "€ 42,00"
    },
    {
      "title": "Momento Dolce",
      "subtitle": "Per gli amanti del cioccolato e non solo",
      "images": [
        "https://placehold.co/1080x1350?text=Cake",
        "https://placehold.co/1080x1350?text=Cookies",
      ],
      "price": "€ 28,50"
    },
  ];

  final Map<int, int> _current = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            // TESTATA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https://placehold.co/100x50?text=Logo",
                  height: 50,
                ),
                Row(
                  children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "SEGUICI",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // FEED
            ...products.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> product = entry.value;
              return Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['title'],
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text(product['subtitle'],
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 12),

                      // GALLERIA CAROUSEL CON INDICATORI
                      Column(
                        children: [
                          CarouselSlider(
                            items: product['images'].map<Widget>((img) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  img,
                                  width: double.infinity,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 300,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: false,
                              autoPlay: false,
                              onPageChanged: (page, reason) {
                                setState(() {
                                  _current[index] = page;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(product['images'].length, (dotIndex) {
                              return Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (_current[index] ?? 0) == dotIndex
                                      ? Colors.deepPurple
                                      : Colors.grey.shade300,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Text(product['price'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          context.push('/product', extra: {
                            "title": product['title'],
                            "subtitle": product['subtitle'],
                            "price": product['price'],
                            "image": product['images'][0],
                            "description":
                                "Questa è una descrizione dettagliata per il prodotto \"${product['title']}\". Include informazioni, benefici e suggerimenti d’uso.",
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                        ),
                        child: const Text(
                          "SCOPRI DI PIÙ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
