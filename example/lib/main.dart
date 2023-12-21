import 'package:flutter/material.dart';
import 'package:promotion_overlay_platform_interface/promotion_overlay_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter promotion_overlay_foundation example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(255, 27, 61, 1)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
          title: 'Flutter promotion_overlay_foundation example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PromotionOverlayPlatform _overlay = PromotionOverlayPlatform.instance;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _overlay.show('1498057243', null, null, true, 0),
              child: const Text('Open overlay'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _overlay.dismiss(),
              child: const Text('Dismiss overlay'),
            ),
          ],
        ),
      ),
    );
  }
}
