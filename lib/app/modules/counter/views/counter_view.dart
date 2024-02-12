import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);

  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Count:  ${controller.count}',
            style: TextStyle(fontSize: controller.count.value.toDouble()),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if(controller.count < 100) {
              controller.increment();
            } else {
              Get.snackbar(
                "Maaf",
                'Nilai Maksimal 100',
                snackPosition: SnackPosition.TOP
              );
            }
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              if(controller.count > 1 ) {
              controller.decrement();
              } else {
                Get.snackbar(
                "Maaf",
                'Nilai Minimal  1',
                snackPosition: SnackPosition.TOP,
                colorText: Colors.red
              );
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
