class Product {
  final String id;
  final String title;
  final String instructions;
  final String image;
  final List<String> ingredients; // Nova lista de ingredientes

  Product({
    required this.id,
    required this.title,
    required this.instructions,
    required this.image,
    required this.ingredients, // Ingredientes obrigatórios
  });

  // Converter o JSON para uma instância do Produto que vem da API
  factory Product.fromJson(Map<String, dynamic> json) {
    // Extraindo ingredientes
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] ?? '';
      if (ingredient.isNotEmpty || ingredient != "") {
        ingredients.add(ingredient);
      }
    }

    return Product(
      id: json['idMeal'],
      title: json['strMeal'],
      instructions: json['strInstructions'] ?? '',
      image: json['strMealThumb'],
      ingredients: ingredients, // Atribuindo a lista de ingredientes
    );
  }
}
