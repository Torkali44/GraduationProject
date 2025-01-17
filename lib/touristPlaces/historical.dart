import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoricalPlacesPage extends StatelessWidget {
  final List<Map<String, dynamic>> places = [
    {
      'name': 'الأهرامات',
      'image': 'assets/images/pyramids.jpg',
      'description': 'الأهرامات مكان عريق',
      'location': LatLng(29.9792, 31.1342), 
    },
    {
      'name': 'سقارة',
      'image': 'assets/images/saqqara.jpg',
      'description': 'سقارة مكان عريق',
      'location': LatLng(29.8717, 31.2163), 
    },
    {
      'name': 'معبد أبو سمبل',
      'image': 'assets/images/abu_simbel.jpg',
      'description': 'معبد أبو سمبل مكان عريق',
      'location': LatLng(22.3372, 31.6258), 
    },
    {
      'name': 'طريق الكباش',
      'image': 'assets/images/طريق_الكباش.jpg',
      'description': 'طريق الكباش مكان عريق',
      'location': LatLng(25.6967, 32.6396), 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _buildCategoryPage(context, 'الأماكن الأثرية', places);
  }
}

Widget _buildCategoryPage(
    BuildContext context, String title, List<Map<String, dynamic>> items) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailsPage(
                    name: items[index]['name'],
                    image: items[index]['image'],
                    description: items[index]['description'],
                    location: items[index]['location'],
                  ),
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
                        items[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    items[index]['name'],
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

class PlaceDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final LatLng location;

  PlaceDetailsPage({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عرض الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                "الموقع على الخريطة:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: location,
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('place_location'),
                        position: location,
                        infoWindow: InfoWindow(title: name),
                      ),
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "تقييم المكان:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < 4
                        ? Colors.amber
                        : Colors.grey, 
                    size: 30,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
