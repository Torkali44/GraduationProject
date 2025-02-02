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
   final List<Map<String, dynamic>> team =[
    {'name': ' ترك علي', 'role': 'Flutter Developer',
    'image': 'assets/images/team/torkImage.jpg',   'links': {
        'Linkedin': 'https://www.linkedin.com/in/tork-ali-6a609b239',
        'Github': 'https://github.com/Torkali44',
        'Gmail': 'https://torkali@gmail.com',
      }},
    {'name': 'احمد الشافعي', 'role': 'BackEnd Developer','image': 'assets/images/team/alshafeiImage.jpg',   'links': {
        'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'اندرو مجدي','role': 'Flutter Developer ', 'image': 'assets/images/team/andrewImage.jpg', 'links': {
        'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد هلال ', 'role': 'BackEnd Developer','image': 'assets/images/team/helalImage.jpg',   'links': {
      'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},

    {'name': 'بيشوي بقطر', 'role': 'Flutter Developer ','image': 'assets/images/team/beshoyImage.jpg',   'links': {
     'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد سليم', 'role': 'BackEnd Developer','image': 'assets/images/team/selimImage.jpg', 'links': {
        'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'كيرلس نشات', 'role': 'Flutter Developer ','image': 'assets/images/team/keroImage.png', 'links': {
       'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
    {'name': 'احمد محمد', 'role': 'BackEnd Developer','image': 'assets/images/Picsart_24-06-16_09-50-05-308.jpg',  'links': {
       'Linkedin': 'https://linkedin.com/in/tarek',
        'Github': 'https://wa.me/123456789',
        'Gmail': 'https://instagram.com/tarek',
      }},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: const Text(
          'تواصل معنا',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white), 
    onPressed: () => Navigator.pop(context),
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
          itemCount: team.length,
          itemBuilder: (context, index) {
            final member = team[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      name: member['name'],
                      image: member['image'],
                      role: member['role'],
                      links: member['links'],
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
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(member['image']),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      member['name'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
  final String role;
  final Map<String, String> links;

  const DetailsPage({
    required this.name,
    required this.image,
    required this.role,
    required this.links,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
  backgroundColor: Colors.white, 
  centerTitle: true, 
  title: Text(
    name,
    style: const TextStyle(color: Colors.teal, fontSize: 24, fontWeight: FontWeight.bold),
  ),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.teal), 
    onPressed: () => Navigator.pop(context),
  ),
),
 body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(image),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                role,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            
              const SizedBox(height: 20),
              Column(
                children: links.entries.map((entry) {
                  return ContactButton(
                    icon: _getIconForLink(entry.key),
                    label: entry.key,
                    url: entry.value,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const ContactButton({
    required this.icon,
    required this.label,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تعذر فتح الرابط: $url')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(icon, color: Colors.teal),
            title: Text(label),
          ),
        ),
      ),
    );
  }
}

IconData _getIconForLink(String key) {
  switch (key) {
    case 'Linkedin':
      return FontAwesomeIcons.linkedin;
    case 'Github':
      return FontAwesomeIcons.github;
    case 'Gmail':
      return FontAwesomeIcons.envelope;
    default:
      return Icons.link;
  }
}
