import 'package:flutter/material.dart';

class HospitalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> hospitals = [
    {
      'name': 'مستشفى كليوباترا',
      'image': 'assets/images/hospital/hospital1.jpg',
      'details': 'هذا هو مستشفى كليوباترا يقدم أفضل خدمات الرعاية الصحية.',
    },
    {
      'name': 'مستشفى النيل',
      'image': 'assets/images/hospital/hospital2.jpg',
      'details': 'هذا هو مستشفى النيل مجهز بأحدث التقنيات الطبية.',
    },
    {
      'name': 'مستشفى 57357',
      'image': 'assets/images/hospital/hospital3.jpg',
      'details': 'هذا هو مستشفى 57357 متخصص في الجراحة والعلاج الطبيعي.',
    },
    {
      'name': 'مستشفى مجدي يعقوب',
      'image': 'assets/images/hospital/hospital4.jpg',
      'details': 'هذا هو مستشفى مجدي يعقوب يتميز بخدمات طوارئ متقدمة.',
    },
    {
      'name': 'مستشفى بهيه',
      'image': 'assets/images/hospital/hospital5.jpg',
      'details': 'هذا هو مستشفى بهيه يقدم خدمات طبية عالية الجودة.',
    },
    {
      'name': 'مستشفى كليوباترا',
      'image': 'assets/images/hospital/hospital1.jpg',
      'details': 'هذا هو مستشفي كليوباترا متخصص في طب الأطفال.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('مستشفيات',
        style: TextStyle(color: Colors.white , fontSize: 24),
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
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitalDetailsPage(
                      name: hospitals[index]['name'],
                      image: hospitals[index]['image'],
                      details: hospitals[index]['details'],
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
                          hospitals[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      hospitals[index]['name'],
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
class HospitalDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String details;

  const HospitalDetailsPage({
    required this.name,
    required this.image,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name,
        style: TextStyle(color: Colors.white),
        ),
         iconTheme: IconThemeData(
          color: Colors.white, // لون زر الرجوع
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                details,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
