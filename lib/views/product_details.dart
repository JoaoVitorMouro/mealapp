import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/models/product_model.dart';
import 'package:unimar_app_pos/providers/favorite_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Estância do provider criado => FavoriteProvider
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    bool isFavorite = favoriteProvider.isFavorite(product);
    return Scaffold(
      backgroundColor: const Color(0xFF2A2B32), // Fundo cinza escuro
      appBar: AppBar(
        title: const Text(
          "Detalhes do produto",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color(0xFF2A2B32), // Cor do AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  height: 300,
                  width: double.infinity,
                  product.image,
                ),
                Positioned(
                  top: 10,
                  right: 10, // Posição mais para a direita
                  child: IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        favoriteProvider.removeFavoriteProduct(product);
                      } else {
                        favoriteProvider.addFavoriteProduct(product);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: const Color(0xFF2A2B32),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.instructions,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Ingredientes:",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: product.ingredients.map((ingredient) {
                  return Text(
                    "- $ingredient",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'RobotoMono',
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
