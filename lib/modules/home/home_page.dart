import 'package:flutter/material.dart';
import 'package:imperios/core/theme/app_theme.dart';
import 'models/product_model.dart';
import 'widgets/banner_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<ProductModel> get products => [
        ProductModel(
          id: 1,
          name: 'Hambúrguer Artesanal',
          description: '180g de carne, queijo e molho especial',
          price: 29.90,
          image: 'https://i.imgur.com/6RLcK8F.png',
        ),
        ProductModel(
          id: 2,
          name: 'Combo Burger',
          description: 'Burger + fritas + refri',
          price: 39.90,
          image: 'https://i.imgur.com/YZ6Yq2M.png',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(),
          const SliverToBoxAdapter(child: BannerWidget()),
          const SliverToBoxAdapter(child: CategoryWidget()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductCard(product: products[index]);
              },
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
  title: Row(
    children: [
      Image.asset(
        'assets/images/logo.png',
        height: 28,
      ),
      const SizedBox(width: 8),
      const Text('Imperios Burger'),
    ],
  ),
  background: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppTheme.primary,
          AppTheme.secondary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
),

      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
