import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/manager/product_cubit.dart';
import 'package:i_tech/manager/product_state.dart';

class ProductsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProudctsFromApi(),
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetProudctsLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.purple),
              );
            } else if (state is GetProudctsError) {
              return Text(
                "Something Went Wrong",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              );
            } else if (state is GetProudctsSuccess) {
              return ListView.separated(
                itemCount: state.products.length,
                separatorBuilder: (context, index) => const Divider(height: 30),
                itemBuilder: (context, index) {
                  var product = state.products.elementAt(index);
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(
                      product.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
