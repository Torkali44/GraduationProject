import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class HistoricalPlacesPage extends StatelessWidget {
 final List<Map<String, dynamic>> places = [
  {
    'name': 'الأهرامات',
    'image': 'assets/images/HistoricalPlaces/pyramids.jpg',
    'description': 'أهرامات الجيزة هي واحدة من عجائب الدنيا السبع القديمة، وتشمل هرم خوفو (الأكبر)، وهرم خفرع، وهرم منقرع. تم بناء هذه الأهرامات كمقابر للفراعنة، وتعتبر من أعظم الإنجازات الهندسية في التاريخ. يقع بجوارها تمثال أبو الهول الشهير',
    'url': 'https://www.google.com/maps/@29.9765982,31.1338732,17z?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
    {
    'name': 'معبد وادي الملوك',
    'image': 'assets/images/HistoricalPlaces/وادي_الملوك.jpg',
    'description': 'وادي الملوك هو منطقة دفن فرعونية تحتوي على مقابر ملكية منحوتة في الصخر، مثل مقبرة رمسيس السادس وسيتي الأول. تعتبر من أهم مواقع التراث العالمي، وتحتوي على نقوش وزخارف رائعة تصور الحياة الآخرة',
    'url': 'https://www.google.com/maps/place/%D9%88%D8%A7%D8%AF%D9%8A+%D8%A7%D9%84%D9%85%D9%84%D9%88%D9%83+%D8%A7%D9%84%D8%A3%D9%82%D8%B5%D8%B1%E2%80%AD/@25.7405718,32.6027985,18z/data=!4m10!1m2!2m1!1z2YXYudio2K8g2YjYp9iv2Yog2KfZhNmF2YTZiNmDJw!3m6!1s0x14493dd96ce51c51:0x20ebc4074e4a9d28!8m2!3d25.7405206!4d32.6016303!15sCh_Zhdi52KjYryDZiNin2K_ZiiDYp9mE2YXZhNmI2YMnWiAiHtmF2LnYqNivINmI2KfYr9mKINin2YTZhdmE2YjZg5IBE2hpc3RvcmljYWxfbGFuZG1hcmuaASNDaFpEU1VoTk1HOW5TMFZKUTBGblNVUkdjVnBQV1daUkVBReABAPoBBAgAEDA!16s%2Fg%2F11pyy8v4xm?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': 'سقارة',
    'image': 'assets/images/HistoricalPlaces/saqqara.jpg',
    'description': 'سقارة هي مقبرة كبيرة لعاصمة مصر القديمة، ممفيس، وتحتوي على هرم زوسر المدرج، الذي يعتبر أقدم هرم في العالم. صممه المهندس إيمحوتب، ويعد تحفة معمارية فريدة. تحتوي سقارة أيضًا على العديد من المقابر والمصاطب الفرعونية',
    'url': 'https://www.google.com/maps/search/%D8%B3%D9%82%D8%A7%D8%B1%D8%A9%E2%80%AD/@29.8517867,31.2311226,14.73z?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  
  {
    'name': 'معبد الأقصر',
    'image': 'assets/images/HistoricalPlaces/معبد_الأقصر.jpg',
    'description': 'معبد الأقصر هو معبد فرعوني بناه أمنحتب الثالث ورمسيس الثاني، ويقع في قلب مدينة الأقصر. يتميز بتماثيل ضخمة لرمسيس الثاني ومسلة واحدة (المسلة الثانية موجودة في باريس). كان المعبد مخصصًا لعبادة آمون رع',
    'url': 'https://www.google.com/maps/place/%D9%85%D8%B9%D8%A8%D8%AF+%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1%E2%80%AD/@25.699502,32.6412396,17z/data=!3m1!4b1!4m6!3m5!1s0x144915c41edadf61:0x7693895c346c7d81!8m2!3d25.699502!4d32.6390509!16zL20vMDNwcDd2?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': 'معبد حتشبسوت',
    'image': 'assets/images/HistoricalPlaces/معبد_حتشبسوت.jpg',
    'description': 'معبد حتشبسوت هو معبد جنائزي فريد من نوعه، بني للملكة حتشبسوت في شكل مدرجات. يتميز بتصميمه المعماري المختلف وزخارفه التي تحكي قصة حياتها وإنجازاتها. يقع المعبد في الدير البحري، ويطل على وادي النيل',
    'url': 'https://www.google.com/maps/place/%D9%85%D8%B9%D8%A8%D8%AF+%D8%AD%D8%AA%D8%B4%D8%A8%D8%B3%D9%88%D8%AA%E2%80%AD/@25.7374976,32.6083766,17.16z/data=!4m6!3m5!1s0x14491618c7bfa7dd:0x31fe17a1563b5d3!8m2!3d25.7382773!4d32.6064906!16s%2Fm%2F02z0krq?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': 'مقبرة توت عنخ آمون',
    'image': 'assets/images/HistoricalPlaces/مقبره__توت_عنخ_امون.jpg',
    'description':'مقبرة توت عنخ آمون هي أشهر مقبرة في وادي الملوك، اكتشفت عام 1922 على يد هوارد كارتر. كانت المقبرة مليئة بالكنوز الذهبية والأثرية، بما في ذلك قناع توت عنخ آمون الذهبي الشهير. توت عنخ آمون هو أحد الفراعنة الصغار الذين حكموا مصر',
    'url': 'https://www.google.com/maps/place/KV62/@25.7403756,32.6039826,17z/data=!3m1!4b1!4m6!3m5!1s0x14491623dbe8fb8b:0xc6e45df259daa1d5!8m2!3d25.7403708!4d32.6014077!16zL20vMDFxZzZt?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': 'معبد أبو سمبل',
    'image': 'assets/images/HistoricalPlaces/abu_simbel.jpg',
    'description': 'معبد أبو سمبل هو أحد أعظم إنجازات الملك رمسيس الثاني، ويتكون من معبدين: المعبد الكبير المخصص لرمسيس الثاني، والمعبد الصغير المخصص لزوجته الملكة نفرتاري. يتميز المعبد الكبير بأربعة تماثيل ضخمة لرمسيس الثاني يصل ارتفاعها إلى 20 مترًا. تم نقل المعبد في الستينيات لإنقاذه من الغرق بسبب بناء السد العالي',
    'url': 'https://www.google.com/maps/place/%D9%85%D8%B9%D8%A7%D8%A8%D8%AF+%D8%A3%D8%A8%D9%88+%D8%B3%D9%85%D8%A8%D9%84%E2%80%AD/@22.3372368,31.6283739,17z/data=!3m1!4b1!4m6!3m5!1s0x143aa988b126055b:0xa7d3cc6618f898d2!8m2!3d22.3372319!4d31.625799!16zL20vMDF4am5r?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': 'طريق الكباش',
    'image': 'assets/images/HistoricalPlaces/طريق_الكباش.jpg',
    'description': 'طريق الكباش هو طريق مهيب يربط بين معبدي الأقصر والكرنك، ويبلغ طوله حوالي 2.7 كيلومتر. كان يستخدم في الاحتفالات الدينية، ويحاط بتماثيل لأبي الهول برؤوس كباش. تم ترميم الطريق مؤخرًا ليعود إلى رونقه القديم',
    'url': 'https://www.google.com/maps/place/%D8%B7%D8%B1%D9%8A%D9%82+%D8%A7%D9%84%D9%83%D8%A8%D8%A7%D8%B4%E2%80%AD/@25.7117385,32.6575921,15.87z/data=!4m10!1m2!2m1!1z2KfZhNmD2KjYp9i0!3m6!1s0x1449154972497d1d:0xf23026285e9d9dd2!8m2!3d25.7109375!4d32.6508125!15sCgzYp9mE2YPYqNin2LSSARNoaXN0b3JpY2FsX2xhbmRtYXJr4AEA!16s%2Fg%2F11q3m0tnr7?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
  },
  {
    'name': ' مجمع معابد الكرنك',
    'image': 'assets/images/HistoricalPlaces/مجمع_معابد_الكرنك.jpg',
    'description': 'مجمع معابد الكرنك هو أكبر مجمع ديني في العالم، ويضم مجموعة من المعابد الضخمة مثل معبد آمون رع. يتميز بأعمدته العملاقة التي يصل ارتفاعها إلى 24 مترًا، بالإضافة إلى المسلات والنقوش الفرعونية التي تحكي تاريخ مصر القديمة',
    'url': 'https://www.google.com/maps/place/%D9%88%D8%A7%D8%AF%D9%8A+%D8%A7%D9%84%D9%85%D9%84%D9%88%D9%83+%D8%A7%D9%84%D8%A3%D9%82%D8%B5%D8%B1%E2%80%AD/@25.7405718,32.6027985,18z/data=!4m10!1m2!2m1!1z2YXYudio2K8g2YjYp9iv2Yog2KfZhNmF2YTZiNmDJw!3m6!1s0x14493dd96ce51c51:0x20ebc4074e4a9d28!8m2!3d25.7405206!4d32.6016303!15sCh_Zhdi52KjYryDZiNin2K_ZiiDYp9mE2YXZhNmI2YMnWiAiHtmF2LnYqNivINmI2KfYr9mKINin2YTZhdmE2YjZg5IBE2hpc3RvcmljYWxfbGFuZG1hcmuaASNDaFpEU1VoTk1HOW5TMFZKUTBGblNVUkdjVnBQV1daUkVBReABAPoBBAgAEDA!16s%2Fg%2F11pyy8v4xm?entry=ttu&g_ep=EgoyMDI1MDEyNi4wIKXMDSoASAFQAw%3D%3D', 
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
      url: items[index]['url'], 
    ),
  ),
); },
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
  final String url;

  PlaceDetailsPage({
    required this.name,
    required this.image,
    required this.description,
    required this.url,
  });

  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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

              Center(
                child: ElevatedButton(
                  onPressed: _launchURL,
                  child: Text(
                    'زيارة الموقع الرسمي',
                    style: TextStyle(fontSize: 18, color:Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    color: index < 4 ? Colors.amber : Colors.grey,
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