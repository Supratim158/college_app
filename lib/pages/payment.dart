import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Payment'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(4, (yearIndex) {
              return ExpansionTile(
                title: Text('Year ${yearIndex + 1}'),
                children: List.generate(2, (semesterIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text('Semester ${semesterIndex + 1}'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Payment logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Proceeding to pay for Year ${yearIndex + 1}, Semester ${semesterIndex + 1}.'),
                              ),
                            );
                          },
                          child: const Text('Pay Now'),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
