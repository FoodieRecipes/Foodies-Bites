// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

class FoodOrderPage extends StatefulWidget { 
  const FoodOrderPage({super.key});

  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  final List<FoodItem> foodItems = [
    FoodItem('Atama Soup', 'assets/images/atama.jpg', 3000.00),
    FoodItem('Beans', 'assets/images/beans.jpg', 1500.49),
    FoodItem('Chinese Rice', 'assets/images/chinese rice.jpg', 4500.00),
    FoodItem('Editan Soup', 'assets/images/editan.jpg', 2500.50),
    FoodItem('Fried Rice', 'assets/images/fried rice.jpg', 3700.00),
    FoodItem('Jollof rice', 'assets/images/jollof rice.jpg', 3500.00),
    FoodItem('Melon', 'assets/images/melon.jpg', 3000.99),
    FoodItem('Okro Soup', 'assets/images/okro.jpg', 2750.99),
    FoodItem('Vegetable Soup', 'assets/images/vegetable.jpg', 4000.00),
  ];

  // Order data to store selected items and quantities
  Map<FoodItem, int> orderData = {};

  // Method to add item to the order
  void addToOrder(FoodItem item, int quantity) {
    setState(() {
      orderData[item] = (orderData[item] ?? 0) + quantity;
    });
  }

  // Method to clear the order after purchase
  void clearOrder() {
    setState(() {
      orderData.clear();
    });
  }

  // Method to calculate the total price of the order
  double calculateTotalPrice() {
    return orderData.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0, (a, b) => a + b);
  }

  // Method to display invoice after purchase
  void showInvoice(BuildContext context) {
    double total = calculateTotalPrice();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Invoice'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...orderData.entries.map((entry) => ListTile(
                    title: Text('${entry.key.name} x ${entry.value}'),
                    trailing: Text('\₦${(entry.key.price * entry.value).toStringAsFixed(2)}'),
                  )),
              const Divider(),
              ListTile(
                title: const Text('Total'),
                trailing: Text('\₦${total.toStringAsFixed(2)}'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                clearOrder();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place an Order'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return FoodItemCard(
            foodItem: item,
            onAddToOrder: addToOrder,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: orderData.isEmpty ? null : () => showInvoice(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: Text('Purchase (\₦${calculateTotalPrice().toStringAsFixed(2)})'),
        ),
      ),
    );
  }
}

// Food item model
class FoodItem {
  final String name;
  final String imagepath;
  final double price;

  FoodItem(this.name, this.imagepath, this.price);
}

// Card widget to display each food item
class FoodItemCard extends StatefulWidget {
  final FoodItem foodItem;
  final void Function(FoodItem, int) onAddToOrder;

  const FoodItemCard({super.key, required this.foodItem, required this.onAddToOrder});

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.foodItem.imagepath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.foodItem.name,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('Price: \₦${widget.foodItem.price.toStringAsFixed(2)}'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity selector
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity > 1
                          ? () => setState(() => quantity--)
                          : null,
                    ),
                    Text(quantity.toString(),
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => widget.onAddToOrder(widget.foodItem, quantity),
                  child: const Text('Add to Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
