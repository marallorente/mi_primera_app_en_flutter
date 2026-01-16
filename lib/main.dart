import 'package:flutter/material.dart';

void main() => runApp(const InstagramClone());

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// PANTALLA 1: LOGIN
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Social Grid',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const TextField(decoration: InputDecoration(hintText: 'Nombre de usuario', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Contraseña', border: OutlineInputBorder())),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PhotoGridPage()));
                },
                child: const Text('Iniciar Sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PANTALLA 2: GRID DE FOTOS
class PhotoGridPage extends StatelessWidget {
  const PhotoGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columnas como Instagram
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 21,
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/500/500?random=$index',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}