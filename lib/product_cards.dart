import 'package:ecommerceapp/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);

    return Container(
      padding: EdgeInsets.all(4),
      height: 270,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              ref.read(productNotifierProvider.notifier).toggleExpand(index);
            },
            child: AnimatedContainer(
              // Use AnimatedContainer to smoothly expand and collapse
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 8),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ],
              ),
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      color: Colors.lightBlue.shade50,
                      child: Image.asset(product.imgurl),
                    ),
                  ),
                  const Gap(4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.Shortdescription,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.price,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_box, size: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (product.isselected) // Display long description if expanded
                    Text(product.longdescription),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

