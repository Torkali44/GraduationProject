import 'dart:async';
import 'package:flutter/material.dart';
/* import pages*/
import 'services.dart';
import 'hotel.dart';
import 'transport.dart';
import 'activities.dart';
/* import drawer  */
import 'drawer_content/SearchPage.dart';
import 'drawer_content/ProfilePage.dart';
import 'drawer_content/AboutPage.dart';
import 'drawer_content/ContactPage.dart';

/* import models */
import 'models/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/search': (context) => const SearchPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => ContactPage(),
        '/Services': (context) => ServicesPage(),
        '/Hotel': (context) => const HotelPage(),
        '/Transport': (context) => const TransportPage(),
        '/activities': (context) => const ActivitiesPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static User? registeredUser;

  void login(BuildContext context) {
    if (registeredUser != null &&
        emailController.text == registeredUser!.email &&
        passwordController.text == registeredUser!.password) {
      Navigator.pushNamed(context, '/home', arguments: registeredUser);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Failed"),
          content: const Text("Invalid username or password."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Login Page",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Pasword',
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.teal),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.teal, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  SignUpPage({super.key});

  String? validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) return "Invalid email format";
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 6) return "Password must be at least 6 characters";
    if (!password.contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.teal,
        ),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.teal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstnameController,
                decoration: const InputDecoration(
                  hintText: 'FirstName',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: lastnameController,
                decoration: const InputDecoration(
                  hintText: 'LastName',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: 'Age',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                controller: genderController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  border: UnderlineInputBorder(),
                ),
                onTap: () async {
                  String? selectedGender = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Select Gender'),
                        children: [
                          ...['Male', 'Female']
                              .map((gender) => SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pop(context, gender);
                                    },
                                    child: Text(gender),
                                  ))
                              .toList(),
                        ],
                      );
                    },
                  );

                  if (selectedGender != null) {
                    genderController.text = selectedGender;
                  }
                },
              ),

              const SizedBox(height: 13),
              // TextField(
              //   controller: nationalityController,
              //   readOnly:true,
              //   decoration: const InputDecoration(
              //     hintText: 'Nationality',
              //     border: UnderlineInputBorder(),
              //   ),
              // ),
              // DropdownButton<String>(
              //   value: nationalityController.text.isEmpty
              //       ? null
              //       : nationalityController.text,
              //   hint: Text('Select Nationality'),
              //   items: ['egypt', 'moroco' , 'tunis' , 'france', 'german']
              //       .map((nationality) => DropdownMenuItem<String>(
              //             value: nationality,
              //             child: Text(nationality),
              //           ))
              //       .toList(),
              //   onChanged: (newValue) {
              //     nationalityController.text = newValue!;
              //   },
              // ),
              // const SizedBox(height: 20),
              TextField(
                controller: nationalityController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Nationality',
                  border: UnderlineInputBorder(),
                ),
                onTap: () async {
                  String? selectedNationality = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Select Nationality'),
                        children: [
                          ...[
                            'Egypt',
                            'Morocco',
                            'Tunisia',
                            'France',
                            'Germany'
                          ]
                              .map((nationality) => SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pop(context, nationality);
                                    },
                                    child: Text(nationality),
                                  ))
                              .toList(),
                        ],
                      );
                    },
                  );

                  if (selectedNationality != null) {
                    nationalityController.text = selectedNationality;
                  }
                },
              ),

              const SizedBox(height: 13),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 60),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  final emailError = validateEmail(emailController.text);
                  final passwordError =
                      validatePassword(passwordController.text);

                  if (firstnameController.text.isEmpty ||
                      lastnameController.text.isEmpty ||
                      genderController.text.isEmpty ||
                      nationalityController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      ageController.text.isEmpty ||
                      emailError != null ||
                      passwordError != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Error"),
                        content: Text(emailError ??
                            passwordError ??
                            "Please fill all fields"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  _LoginPageState.registeredUser = User(
                    FirstName: firstnameController.text,
                    LastName: lastnameController.text,
                    password: passwordController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    age: ageController.text,
                    Gender: genderController.text,
                    Nationality: nationalityController.text,
                  );

                  Navigator.pop(context);
                },
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 8) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.teal),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'EGYPT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.teal,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.teal),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      drawer: AppDrawer(user: user),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.cyan],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/images/homeImages/${index + 1}.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: const [
                      Text(
                        'Tourism Application',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'تطبيق شامل للسفر وخدمات السياحة في مصر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Positioned(
              top: 40,
              child: Text(
                'Customize Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  BottomSection(
                    title: 'Services',
                    icon: Icons.design_services,
                    route: '/Services',
                  ),
                  BottomSection(
                    title: 'Hotel',
                    icon: Icons.home,
                    route: '/Hotel',
                  ),
                  BottomSection(
                    title: 'Transport',
                    icon: Icons.directions_car,
                    route: '/Transport',
                  ),
                  BottomSection(
                    title: 'Activities',
                    icon: Icons.local_activity,
                    route: '/activities',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const DashboardButton({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const BottomSection({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final User user;

  const AppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            accountName: Text(
              '${user.FirstName} ${user.LastName}', // Concatenate first and last name
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              user.email,
              style: const TextStyle(fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user.FirstName[0].toUpperCase(),
                style: const TextStyle(fontSize: 30, color: Colors.teal),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                CustomCard(
                  title: 'Home',
                  icon: Icons.home,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/home',
                    arguments: user,
                  ),
                ),
                CustomCard(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () =>
                      Navigator.pushNamed(context, '/profile', arguments: user),
                ),
                CustomCard(
                  title: 'About',
                  icon: Icons.info,
                  onTap: () => Navigator.pushNamed(context, '/about'),
                ),
                CustomCard(
                  title: 'Contact',
                  icon: Icons.phone,
                  onTap: () => Navigator.pushNamed(context, '/contact'),
                ),
                CustomCard(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
