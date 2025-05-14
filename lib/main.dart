import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: Text("Home page", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              // Acción del botón
            },
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Tarjeta estilo Mastercard negra como en la imagen
              Container(
                height: 140,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo Mastercard corregido
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              left: 12,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "1000 US",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "CardName",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "1 2 3 4   1 2 3 4   1 2 4 4   1 2 3 4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Last Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(height: 15),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 1000, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary', price: 1000, type: '+', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Receive', price: 200, type: '+', currency: 'US'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Modelo para las transacciones
class TransactionModel {
  final String name;
  final double price;
  final String type;
  final String currency;

  TransactionModel({
    required this.name,
    required this.price,
    required this.type,
    required this.currency,
  });
}

// Vista para mostrar cada transacción
class TransactionView extends StatelessWidget {
  final TransactionModel transaction;

  TransactionView({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            transaction.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${transaction.type}${transaction.price} ${transaction.currency}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: transaction.type == '+' ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}
