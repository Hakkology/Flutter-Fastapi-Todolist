import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'List of users:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Obx(
            () => Expanded(
              child: controller.isReady.value && controller.users != null
                  ? ListView.builder(
                      itemCount: controller.users?.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(controller.users![index].email!),
                        leading: CircleAvatar(
                          child: Text(
                            "${controller.users![index].id!}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
