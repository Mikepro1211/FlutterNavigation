import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio 2',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Desafio 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key ,required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

    @override
    void initState(){
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
    }

    @override
    void dispose(){
      _tabController.dispose();
      super.dispose();
    }
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
        ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to my app!',
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold
               )),
             
              
              const SizedBox(height: 32),
              Image.network('https://1000marcas.net/wp-content/uploads/2020/02/logo-Google.png',
                height: 200, width: 100,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text('Click me!'),
              ),

            ],
          ),
          const SettingsScreen(),
          const AboutMeScreen(),
        ],
      ),
      );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Image.network(
            'https://1000marcas.net/wp-content/uploads/2020/02/logo-Google.png',
            height: 200,
            width: 100,
          ),
          const SizedBox(height: 16),
          const Text(
            'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware. It was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University in California. The company is headquartered in Mountain View, California, and has more than 135,000 employees worldwide.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
        
        ],
      ),
    );
  }
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: const Text('Dark mode'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Add your language selection logic here
            },
          ),
        ],
      ),
    );
  }
}

class AboutMeScreen extends StatelessWidget{
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('About me'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: 16),
           Text(
            'Hi, I\'m Miguel Perez',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 16),
           Text(
            'I\'m a software developer with 2 years of experience in building mobile and web applications. I specialize in Kotlin and React-navite, and I\'m always looking for new challenges and opportunities to learn and grow.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
           SizedBox(height: 16),
           Text(
            'In my free time, I enjoy playing soccer and  video games (Fornite, Fifa & Call of Duty). I also love to travel and explore new places.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
           SizedBox(height: 16),
           Text(
            'If you\'d like to get in touch, feel free to send me an email at mikepro.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}



