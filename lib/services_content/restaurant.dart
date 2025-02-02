import 'package:flutter/material.dart';

class RestaurantsPage extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': ' قصر الكبابجي',
      'image': 'assets/images/resturant/restaurant5.jpg',
      'details':
          ' يعد مطعم قصر الكبابجي أحد أشهر وأفضل مطاعم القاهرة، حيث تعد حسابات قصر الكبابجي على وسائل التواصل الاجتماعي من أكثر الحسابات مشاهدة ومتابعة بسبب تفاعلهم الكبير واستضافتهم لشخصيات مؤثرة على مواقع التواصل الاجتماعي.يقدم مطعم قصر الكبابجي وجبات رئيسية مثل المشويات والمندي والمقبلات بالإضافة إلى قائمة كبيرة من العصائر والمشروبات كما يقدم عدد من المأكولات المصرية مثل الملوخية والممبار والمحشي وورق العنب.  ',
    },
    {
      'name': 'مطعم حضرموت عنتر',
      'image': 'assets/images/resturant/restaurant6.jpg',
      'details':
          ' عند الحديث عن أفضل مطاعم القاهرة لا يسعنا الا أن نذكر مطعم حضرموت عنتر الذي أثبت أنه منافس قوي في ساحة المطاعم المصرية، حيث إنه يقدم أشهى الأطباق الحضرمية والمصرية بجودة عالية وبأسعار مناسبة للجميع.    ',
    },
    {
      'name': 'مطعم حواوشي الرفاعي',
      'image': 'assets/images/resturant/restaurant1.jpg',
      'details': 'هذا هو مطعم حواوشي الرفاعي يقدم أشهى انواع الحواوشي .',
    },
    {
      'name': 'مطعم بازوكا',
      'image': 'assets/images/resturant/restaurant4.jpg',
      'details': 'هذا هو مطعم بازوكا يقدم أفضل المأكولات البحرية.',
    },
    {
      'name': 'مطعم الأغا',
      'image': 'assets/images/resturant/restaurant3.jpg',
      'details': 'هذا هو مطعم الاغا يتميز بجو عائلي رائع.',
    },
    {
      'name': 'مطعم ذا فيو',
      'image': 'assets/images/resturant/restaurant4.jpg',
      'details': 'هذا هو مطعم ذا فيو يتميز بأطباقه العالمية.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'مطاعم',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // لون زر الرجوع
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
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailsPage(
                      name: restaurants[index]['name'],
                      image: restaurants[index]['image'],
                      details: restaurants[index]['details'],
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
                          restaurants[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      restaurants[index]['name'],
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

class RestaurantDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String details;

  const RestaurantDetailsPage({
    required this.name,
    required this.image,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
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
            // صورة المطعم
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
            // نص التفاصيل
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
