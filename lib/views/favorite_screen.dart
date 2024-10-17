import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/providers/favorite_provider.dart';
import 'package:unimar_app_pos/views/product_details.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumir a lista de favoritos
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2A2B32), // Fundo cinza escuro
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF2A2B32), // Fundo cinza escuro no AppBar
        title: const Text("Favoritos", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: favoriteProvider.favoriteProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final product = favoriteProvider.favoriteProducts[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: product,
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(product.image),
              title: Text(
                product.title,
                style: const TextStyle(color: Colors.white), // Texto branco
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white, // Ícone branco
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.white, // Linha branca entre os itens
            thickness: 1, // Espessura da linha
          );
        },
      ),
    );
  }
}
