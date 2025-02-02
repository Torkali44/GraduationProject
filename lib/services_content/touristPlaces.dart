import 'package:flutter/material.dart';
import '../../touristPlaces/islamic.dart';
import '../../touristPlaces/beaches.dart';
import '../../touristPlaces/coptic.dart';
import '../../touristPlaces/historical.dart';
import '../../touristPlaces/museums.dart';


class TouristPlaces extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'الأماكن الأثرية',
      'image': 'assets/images/historical_places.jpg',
      'route': HistoricalPlacesPage(),
    },
    {
      'name': 'المتاحف',
      'image': 'assets/images/museums.jpg',
      'route': MuseumsPage(),
    },
    {
      'name': 'البحر والشمس',
      'image': 'assets/images/beaches.jpg',
      'route': BeachesPage(),
    },
    {
      'name': 'الآثار الإسلامية',
      'image': 'assets/images/islamic_monuments.jpg',
      'route': IslamicMonumentsPage(),
    },
    {
      'name': 'الآثار القبطية',
      'image': 'assets/images/coptic_monuments.jpg',
      'route': CopticMonumentsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: const Text('أماكن سياحية',  style: TextStyle(color: Colors.white , fontSize: 24),),
        iconTheme: IconThemeData(
    color: Colors.white,
  ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categories[index]['route'],
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          categories[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      categories[index]['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



