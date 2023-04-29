import 'package:atividade03/tinto.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  final List<String> items = [
    'Vinho Tinto',
    'Vinho Branco',
    'Vinho Rose',
    'Espumante',
    'Vinho Licoroso'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MyApp(),
        '/tinto': (context) => Tinto(),
      },
      
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'Carta de Vinhos',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Carta de Vinhos',
                style: TextStyle(
                  fontSize: 35.0,
                ),

              ),
              
            ),
            
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Menu', style: TextStyle(fontSize: 25.0),)),
                Tab(
                  child: Text(
                    'Sobres Vinhos',style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: const Color.fromARGB(255, 225, 133, 133),
                      child: ListTile(
                        title: Text(
                          items[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onTap: () {
                          print('Você clicou no item ${items[index]}');
                        },
                      ),
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),

              Container(
    decoration: BoxDecoration(
            image: DecorationImage(
        image: AssetImage('assets/vinho.jpg'),
        fit: BoxFit.cover,
      ),
    ),
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    children: [
                      TextSpan(
                        text:
                            'O sabor de um vinho é construído através do contato da bebida com vários dos nossos sentidos: o paladar, que é ativado no contato da bebida com as papilas gustativas, o olfato, que aguça o sabor da bebida com os aromas que percebemos em cada tipo de vinho, e a visão, que nos permite criar uma expectativa daquele copo que estamos prestes a saborear.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
