import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(114, 95, 105, 100),
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if (text!.isEmpty || !text.contains("@")) return "E-mail inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              obscureText: true,
              validator: (text){
                if (text!.isEmpty || text.length < 6) return "Senha inválida!";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(114, 95, 105, 100),
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}