import 'package:flutter/material.dart';

class Products {
  final String name, description, sellerName, imageUrl, category;
  final int price;
  Products(
      {required this.name,
      required this.description,
      required this.price,
      required this.sellerName,
      required this.imageUrl,
      required this.category});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'sellerName': sellerName,
      'category': category,
    };
  }
}

List<Products> products = [
  Products(
      name: 'Milk & Honey',
      description:
          '700 page novel written by Rupi Kaur that dives deep into the psychology of Humans',
      price: 350,
      sellerName: 'Nishant Jain',
      imageUrl:
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      category: 'Books'),
  Products(
      name: 'Laptop',
      description: '700 page novel',
      price: 350,
      sellerName: 'Nishant Jain',
      imageUrl:
          'https://media.istockphoto.com/photos/an-organised-workspace-leads-to-more-productivity-picture-id1305990690?b=1&k=20&m=1305990690&s=170667a&w=0&h=MxoLf1JAmPQOQ7YYDg_AVfA4eiK9n9OMB8o3mNNYJJM=',
      category: 'Stationary'),
  Products(
      name: 'Laptop',
      description: '700 page novel',
      price: 350,
      sellerName: 'Nishant Jain',
      imageUrl:
          'https://media.istockphoto.com/photos/an-organised-workspace-leads-to-more-productivity-picture-id1305990690?b=1&k=20&m=1305990690&s=170667a&w=0&h=MxoLf1JAmPQOQ7YYDg_AVfA4eiK9n9OMB8o3mNNYJJM=',
      category: 'Stationary'),
  Products(
      name: 'Laptop',
      description: '700 page novel',
      price: 350,
      sellerName: 'Nishant Jain',
      imageUrl:
          'https://media.istockphoto.com/photos/an-organised-workspace-leads-to-more-productivity-picture-id1305990690?b=1&k=20&m=1305990690&s=170667a&w=0&h=MxoLf1JAmPQOQ7YYDg_AVfA4eiK9n9OMB8o3mNNYJJM=',
      category: 'Stationary'),
  Products(
      name: 'Laptop',
      description: '700 page novel',
      price: 350,
      sellerName: 'Nishant Jain',
      imageUrl:
          'https://media.istockphoto.com/photos/an-organised-workspace-leads-to-more-productivity-picture-id1305990690?b=1&k=20&m=1305990690&s=170667a&w=0&h=MxoLf1JAmPQOQ7YYDg_AVfA4eiK9n9OMB8o3mNNYJJM=',
      category: 'Stationary'),
];
List<Map<String, dynamic>> cart = [];
