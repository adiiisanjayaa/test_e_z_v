import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_e_z_v/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  itemCount: controller.products?.products?.length,
                  itemBuilder: (context, index) {
                    var data = controller.products?.products?[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_PRODUCT, arguments: data);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: data?.thumbnail != null
                                  ? Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          child: Image.network(
                                            data!.thumbnail ?? "",
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        FutureBuilder<bool>(
                                            future: controller.isFav(data),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller.save(data);
                                                  },
                                                  child: Icon(
                                                    snapshot.data! ? Icons.favorite : Icons.favorite_border,
                                                    color: snapshot.data! ? Colors.red : Colors.white,
                                                  ).marginAll(10),
                                                );
                                              }
                                              return const SizedBox.shrink();
                                            }),
                                      ],
                                    )
                                  : null,
                            ).marginOnly(right: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?.category ?? "",
                                    style: const TextStyle(fontSize: 15),
                                  ).marginOnly(bottom: 10),
                                  Text(
                                    data?.title ?? "-",
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ).marginOnly(bottom: 10),
                                  Text(
                                    "\$${data?.price?.toString() ?? "-"}",
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}


// Container(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.grey.withOpacity(0.3),
//                   ).marginOnly(right: 20),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 20,
//                           color: Colors.grey.withOpacity(0.3),
//                         ).marginOnly(bottom: 10),
//                         Container(
//                           width: double.infinity,
//                           height: 30,
//                           color: Colors.grey.withOpacity(0.3),
//                         ).marginOnly(bottom: 10),
//                         Container(
//                           width: double.infinity,
//                           height: 20,
//                           color: Colors.grey.withOpacity(0.3),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )