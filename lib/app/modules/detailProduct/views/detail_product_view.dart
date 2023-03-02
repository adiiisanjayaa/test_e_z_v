import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<DetailProductController>(builder: (controller) {
          var data = controller.product;
          return data == null
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: data.thumbnail != null
                          ? Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  child: Image.network(
                                    data.thumbnail ?? "",
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ).marginAll(10),
                              ],
                            )
                          : null,
                    ).marginOnly(bottom: 20),
                    Center(
                      child: Text(
                        data.title ?? "",
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ).marginOnly(bottom: 5),
                    ),
                    Text(
                      "Category : ${data.category?.toString() ?? ""}",
                      style: const TextStyle(fontSize: 15),
                    ).marginOnly(bottom: 10),
                    Text(
                      "Rating : ${data.rating?.toString() ?? ""}",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 10),
                    Text(
                      "Brand : ${data.brand?.toString() ?? ""}",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 10),
                    Text(
                      "Price : \$${data.price?.toString() ?? ""}",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 10),
                    Text(
                      "Discount : ${data.discountPercentage?.toString() ?? ""}%",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 10),
                    Text(
                      "Rating : ${data.rating?.toString() ?? ""}",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 10),
                    Text(
                      data.description ?? "",
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    ).marginOnly(bottom: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: data.images?.length,
                      itemBuilder: (context, index) {
                        var image = data.images?[index];
                        return ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            image ?? "",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  ],
                );
        }),
      ),
    );
  }
}
