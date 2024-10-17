import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/providers/product_provider.dart';
import 'package:unimar_app_pos/views/product_details.dart';
import 'package:unimar_app_pos/views/widgets/category_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    if (productProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (productProvider.hasError) {
      return const Center(
          child: Text("Erro ao carregar produtos.",
              style: TextStyle(color: Colors.white)));
    }

    if (productProvider.allProducts.isEmpty) {
      return const Center(
          child: Text("Nenhum produto disponível.",
              style: TextStyle(color: Colors.white)));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2A2B32), // Fundo cinza escuro
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2B32), // Cor do AppBar
        shadowColor: const Color.fromARGB(255, 73, 9, 49),
        title: const Text('Categorias', style: TextStyle(color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF2A2B32), // Gradiente para manter o estilo cinza
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search,
                      color: Colors.white), // Ícone branco
                ),
                border: const OutlineInputBorder(),
                hintText: "Pesquisa",
                hintStyle: const TextStyle(
                    color: Colors.white), // Texto da dica branco
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // Borda branca ao focar
                ),
              ),
              style: const TextStyle(
                  color: Colors.white), // Texto branco no campo de pesquisa
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: productProvider.allProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          product: productProvider.allProducts[index],
                        ),
                      ),
                    );
                  },
                  child: CategoryWidget(
                    product: productProvider.allProducts[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
