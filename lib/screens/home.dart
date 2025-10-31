import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizState>();
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    // Daftar kategori beserta path gambarnya
    final categories = [
      {'title': 'Matematika', 'image': 'assets/images/math.png'},
      {'title': 'IPA', 'image': 'assets/images/science.png'},
      {'title': 'Bahasa Inggris', 'image': 'assets/images/english.png'},
      {'title': 'Geografi', 'image': 'assets/images/geography.png'},
      {'title': 'Sejarah', 'image': 'assets/images/history.png'},
      {'title': 'Budaya & Seni', 'image': 'assets/images/art.png'},
      {'title': 'Kuliner Dunia', 'image': 'assets/images/food.png'},
      {'title': 'Olahraga', 'image': 'assets/images/sport.png'},
    ];

    final crossAxisCount = w > 700 ? 3 : 2;
    final cardHeight = h * 0.22;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF004643), // gradasi atas
              Color(0xFF00ACA5), // gradasi bawah
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),
                Text(
                  'Selamat Datang, ${state.username}',
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: w * 0.06,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: h * 0.015),
                Text(
                  'Pilih kategori Anda:',
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: w * 0.045,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: h * 0.02),

                // GRID KATEGORI
                Expanded(
                  child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: h * 0.02,
                      crossAxisSpacing: w * 0.04,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return _CategoryCard(
                        title: cat['title']!,
                        imagePath: cat['image']!,
                        height: cardHeight,
                        onTap: () {
                          context.read<QuizState>().setCategory(cat['title']!);
                          Navigator.pushNamed(context, '/quiz');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double height;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.imagePath,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(w * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported, size: 56, color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Text(
                '5 pertanyaan',
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: w * 0.035,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Mulai →',
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: w * 0.04,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}