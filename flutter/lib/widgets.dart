import 'package:flutter/material.dart';

class NormalLayout extends StatelessWidget {
  const NormalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Normal Layout', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button clicked!')),
              );
            },
            child: const Text('Click Me'),
          ),
        ],
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Wide Layout', style: TextStyle(fontSize: 24)),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Button clicked!')),
            );
          },
          child: const Text('Click Me'),
        ),
      ],
    );
  }
}
