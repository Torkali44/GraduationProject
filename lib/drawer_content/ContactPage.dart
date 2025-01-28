import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Us',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  final List<Map<String, dynamic>> frontTeam =[
    {'name': ' ترك علي', 'image': 'assets/images/team/torkImage.jpg', 'details': 'طالب الفرقه الرابعه حاسبات ومعلومات قسم علوم الحاسب (تيم  الفرونت)',  'links': {
        'linkedin': 'https://www.linkedin.com/in/tork-ali-6a609b239',
        'github': 'https://github.com/Torkali44',
        'gmail': 'https://torkali@gmail.com',
      }},
    {'name': 'احمد الشافعي', 'image': 'assets/images/team/alshafeiImage.jpg', 'details': 'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات  (تيم  الباك)',  'links': {
        'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'اندرو مجدي', 'image': 'assets/images/team/andrewImage.jpg', 'details': 'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات  (تيم  الفرونت)',  'links': {
        'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد هلال ', 'image': 'assets/images/team/helalImage.jpg', 'details':  'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات (تيم  الباك)',  'links': {
      'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
  ];

  final List<Map<String, dynamic>> backTeam = [
    {'name': 'بيشوي بقطر', 'image': 'assets/images/team/beshoyImage.jpg', 'details': 'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات  (تيم  الفرونت)',  'links': {
     'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد سليم', 'image': 'assets/images/team/selimImage.jpg', 'details':  'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات  (تيم  الباك)',  'links': {
        'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'كيرلس نشات', 'image': 'assets/images/team/keroImage.png', 'details':  'طالب الفرقه الرابعه حاسبات ومعلومات قسم علوم الحاسب (تيم  الفرونت)',  'links': {
       'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد محمد', 'image': 'assets/images/Picsart_24-06-16_09-50-05-308.jpg', 'details':  'طالب الفرقه الرابعه حاسبات ومعلومات قسم نظم المعلومات  (تيم  الباك)',  'links': {
       'linkedin': 'https://linkedin.com/in/tarek',
        'github': 'https://wa.me/123456789',
        'gmail': 'https://instagram.com/tarek',
      }},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'تواصل معنا',
    style: TextStyle(color: Colors.white, fontSize: 24),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, 
  ),
  backgroundColor: Colors.teal,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
),
  body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: frontTeam.length + backTeam.length,
          itemBuilder: (context, index) {
            final teamMember = index < frontTeam.length
                ? frontTeam[index]
                : backTeam[index - frontTeam.length];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      name: teamMember['name'],
                      image: teamMember['image'],
                      details: teamMember['details'],
                       links: teamMember['links'],
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
                          teamMember['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      teamMember['name'],
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

class DetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String details;
  final Map<String, String> links;

  const DetailsPage({
    required this.name,
    required this.image,
    required this.details,
    required this.links,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, height: 200, width: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: links.entries.map((entry) {
                return IconButton(
                  icon: Icon(
                    _getIconForLink(entry.key),
                    
                  ),
                  onPressed: () => _launchURL(entry.value),
                );
              }).toList(),
            ),],
        ),
      ),
    );
  }
IconData _getIconForLink(String key) {
  switch (key) {
    case 'linkedin':
      return FontAwesomeIcons.linkedin; // IconData from FontAwesome
    case 'github':
      return FontAwesomeIcons.github; // IconData from FontAwesome
    case 'gmail':
      return FontAwesomeIcons.envelope; // IconData from FontAwesome
    default:
      return Icons.link; // Default IconData
  }
}



  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}