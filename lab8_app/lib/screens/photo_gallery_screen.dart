import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/cat_image.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<CatImage>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = _apiService.fetchCatImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐱 Милые котики'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<CatImage>>(
        future: _futureImages,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final image = snapshot.data![index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image.url,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 50),
                      );
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}