import 'package:flutter/material.dart';

import 'pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Builder Design Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Builder Design Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _pizzaName = '';

  /// Create the director
  PizzaDirector director = PizzaDirector();

  /// creates the concrete builders
  PizzaBuilder hawaiianPizzabuilder = HawaiianPizzaBuilder();
  PizzaBuilder newYorkPizzaBuilder = NewYorkPizzaBuilder();

  void _buildPizza() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        // build hawaiian pizza
        director.setPizzaBuilder(hawaiianPizzabuilder);
        director.makePizza();
        Pizza myPizza = director.getPizza();
        debugPrint(myPizza.toString());
        _pizzaName = myPizza.toString();
      } else {
        // build new york pizza
        director.setPizzaBuilder(newYorkPizzaBuilder);
        director.makePizza();
        Pizza myPizza = director.getPizza();
        debugPrint(myPizza.toString());
        _pizzaName = myPizza.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have just created another pizza: ',
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                _pizzaName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buildPizza,
        tooltip: 'Build Pizza',
        child: const Icon(Icons.add),
      ),
    );
  }
}
