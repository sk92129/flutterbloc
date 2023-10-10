import 'package:blocweb/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>( // Dependency Injection here.
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
    
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [    
          const SizedBox(height: 8.0),  
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), 
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ), 
        ],)
    );
  }
}