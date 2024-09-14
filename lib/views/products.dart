import 'package:api_app/VM/product_vm.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  ProductVm productVm = ProductVm();
  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: productVm.getProducts(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(snapshot.data![index].image!),
                            ListTile(
                              title: Text("${snapshot.data![index].title}"),
                              leading: CircleAvatar(
                                child: FittedBox(
                                  child: Text("${snapshot.data![index].price}"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }
}
