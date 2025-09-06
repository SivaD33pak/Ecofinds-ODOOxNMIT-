// A foundational Flutter app for the "EcoFinds" hackathon project.
// This single-file prototype demonstrates the core UI and navigation
// for the user authentication, product listings, and browsing features.
// It is designed to be a quick start for a hackathon team.

import 'package:flutter/material.dart';

void main() {
  runApp(const EcoFindsApp());
}

// ----------------------
// MODELS & DATA
// ----------------------

/// A simple data model for a user.
class User {
  final String username;
  final String email;
  final String password;
  // Placeholder fields, could be expanded.
  final String imagePlaceholder;

  User({
    required this.username,
    required this.email,
    required this.password,
    this.imagePlaceholder = 'https://placehold.co/100x100/A05126/FFFFFF?text=User',
  });
}

/// A simple data model for a product listing.
class Product {
  final String id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String imagePlaceholder;
  final String sellerId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imagePlaceholder,
    required this.sellerId,
  });
}

// Placeholder data for the prototype
final List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'Vintage Leather Jacket',
    description: 'A classic leather jacket in great condition. Perfect for a cool, casual look.',
    category: 'Apparel',
    price: 75.00,
    imagePlaceholder: 'https://placehold.co/600x400/383129/FFFFFF?text=Jacket',
    sellerId: 'user1',
  ),
  Product(
    id: '2',
    title: 'Antique Wooden Chair',
    description: 'Hand-carved chair, a beautiful piece for any living room.',
    category: 'Furniture',
    price: 120.50,
    imagePlaceholder: 'https://placehold.co/600x400/383129/FFFFFF?text=Chair',
    sellerId: 'user1',
  ),
  Product(
    id: '3',
    title: 'Retro Video Game Console',
    description: 'Works perfectly, comes with two controllers and five classic games.',
    category: 'Electronics',
    price: 55.00,
    imagePlaceholder: 'https://placehold.co/600x400/383129/FFFFFF?text=Console',
    sellerId: 'user2',
  ),
  Product(
    id: '4',
    title: 'Brand New Sneakers',
    description: 'Unworn, size 10 sneakers. Selling because they don\'t fit.',
    category: 'Apparel',
    price: 40.00,
    imagePlaceholder: 'https://placehold.co/600x400/383129/FFFFFF?text=Sneakers',
    sellerId: 'user2',
  ),
  Product(
    id: '5',
    title: 'Decorative Wall Art',
    description: 'Large framed abstract painting. Great addition to any home.',
    category: 'Home Goods',
    price: 95.00,
    imagePlaceholder: 'https://placehold.co/600x400/383129/FFFFFF?text=Art',
    sellerId: 'user1',
  ),
];

final List<String> dummyCategories = ['All', 'Apparel', 'Furniture', 'Electronics', 'Home Goods', 'Books'];

// ----------------------
// MAIN APPLICATION
// ----------------------

class EcoFindsApp extends StatelessWidget {
  const EcoFindsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoFinds',
      theme: _buildDarkTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }

  // Defines a sleek, dark theme for the application.
  ThemeData _buildDarkTheme() {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: const Color(0xFF1B1B1B), // Dark background
      primaryColor: const Color(0xFF8B4513), // SaddleBrown for a warm, earthy feel
      canvasColor: const Color(0xFF1B1B1B),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF2C2C2C), // Slightly lighter than background
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF8B4513),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF8B4513),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: const Color(0xFFD2B48C), width: 2), // Tan for focus
        ),
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2C),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF2C2C2C),
        selectedItemColor: Color(0xFF8B4513),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 28.0),
      ),
    );
  }
}

// ----------------------
// WIDGETS & SCREENS
// ----------------------

// The main authentication screen (Login/Sign Up).
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isLogin = true;

  void _submitAuthForm() {
    // Basic validation. In a real app, this would call a Firebase/backend service.
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // Simulate successful login/signup and navigate to the home screen.
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'EcoFinds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD2B48C),
                ),
              ),
              const SizedBox(height: 48),
              if (!_isLogin) ...[
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitAuthForm,
                child: Text(_isLogin ? 'Login' : 'Sign Up'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(_isLogin
                    ? 'Don\'t have an account? Sign Up'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The main home screen with product feed, search, and navigation.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    _ProductFeedScreen(),
    _MyListingsScreen(),
    _CartScreen(),
    _PreviousPurchasesScreen(),
    _UserDashboardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoFinds'),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddNewProductScreen()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_outlined),
            label: 'My Listings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Purchases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// The screen that displays the feed of products.
class _ProductFeedScreen extends StatefulWidget {
  @override
  _ProductFeedScreenState createState() => _ProductFeedScreenState();
}

class _ProductFeedScreenState extends State<_ProductFeedScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filterProducts();
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = dummyProducts.where((product) {
        final matchesCategory = _selectedCategory == 'All' || product.category == _selectedCategory;
        final matchesSearch = _searchQuery.isEmpty ||
            product.title.toLowerCase().contains(_searchQuery.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (value) {
              _searchQuery = value;
              _filterProducts();
            },
            decoration: const InputDecoration(
              labelText: 'Search for products...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyCategories.length,
            itemBuilder: (context, index) {
              final category = dummyCategories[index];
              final isSelected = category == _selectedCategory;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = category;
                      _filterProducts();
                    });
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: _filteredProducts.length,
            itemBuilder: (context, index) {
              final product = _filteredProducts[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}

// A widget to display a product as a card in the feed.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.network(
                  product.imagePlaceholder,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The screen for viewing detailed product information.
class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.imagePlaceholder,
              fit: BoxFit.cover,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(product.category),
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for 'Add to Cart' functionality
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The screen for adding a new product listing.
class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  _AddNewProductScreenState createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = dummyCategories.first;
  String _imagePlaceholder = 'https://placehold.co/600x400/383129/FFFFFF?text=Add+Image';

  void _submitListing() {
    // Placeholder for submitting the product to a backend.
    Navigator.of(context).pop(); // Go back to the previous screen.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // In a real app, this would open an image picker.
                  // For the prototype, we can show a simple dialog.
                },
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: NetworkImage(_imagePlaceholder),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Product Title',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(labelText: 'Category'),
              items: dummyCategories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Price',
                prefixText: '\$ ',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitListing,
              child: const Text('Submit Listing'),
            ),
          ],
        ),
      ),
    );
  }
}

// The screen that displays the user's own product listings.
class _MyListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // For the prototype, we'll display all products, but in a real app,
    // we would filter by the current user's ID.
    final myProducts = dummyProducts;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        final product = myProducts[index];
        return MyProductCard(product: product);
      },
    );
  }
}

// A widget for displaying a user's product with edit/delete buttons.
class MyProductCard extends StatelessWidget {
  final Product product;
  const MyProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imagePlaceholder,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                // Placeholder for editing the product
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Placeholder for deleting the product
              },
            ),
          ],
        ),
      ),
    );
  }
}

// The screen for a basic user dashboard.
class _UserDashboardScreen extends StatelessWidget {
  final User dummyUser = User(
    username: 'John Doe',
    email: 'john.doe@example.com',
    password: 'password123',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(dummyUser.imagePlaceholder),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(
            context,
            'Username',
            dummyUser.username,
            Icons.person,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            context,
            'Email',
            dummyUser.email,
            Icons.email,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Placeholder for editing profile
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// The screen to display items in the shopping cart.
class _CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for cart items.
    final List<Product> cartItems = [dummyProducts[0], dummyProducts[2]];

    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];
        return CartItemCard(product: product);
      },
    );
  }
}

// A widget to display an item in the cart.
class CartItemCard extends StatelessWidget {
  final Product product;
  const CartItemCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imagePlaceholder,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () {
                // Placeholder for removing item from cart
              },
            ),
          ],
        ),
      ),
    );
  }
}

// The screen to display previous purchases.
class _PreviousPurchasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for previous purchases.
    final List<Product> previousPurchases = [dummyProducts[1], dummyProducts[3]];

    if (previousPurchases.isEmpty) {
      return const Center(
        child: Text(
          'You have not made any purchases yet.',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: previousPurchases.length,
      itemBuilder: (context, index) {
        final product = previousPurchases[index];
        return PreviousPurchaseCard(product: product);
      },
    );
  }
}

// A widget to display a previous purchase item.
class PreviousPurchaseCard extends StatelessWidget {
  final Product product;
  const PreviousPurchaseCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imagePlaceholder,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
