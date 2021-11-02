import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store/models/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SiguUpScreenState createState() => _SiguUpScreenState();
}

class _SiguUpScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(114, 95, 105, 100),
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Consumer<UserModel>(
        builder: (context, user, model) {
          if (user.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Nome Completo",
                  ),
                  validator: (text){
                    if (text!.isEmpty) return "Nome inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),            
                TextFormField(
                  controller: _emailController,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  obscureText: true,
                  validator: (text){
                    if (text!.isEmpty || text.length < 6) return "Senha inválida!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: "Endereço",
                  ),
                  validator: (text){
                    if (text!.isEmpty) return "Endereço inválido!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),                        
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {

                          Map<String,dynamic> userData = {
                            "name": _nameController.text.trim(),
                            "email": _emailController.text.trim(),
                            "address": _addressController.text.trim(),
                          };

                          user.signUp(
                            userData: userData, 
                            password: _passwordController.text, 
                            onSuccess: _onSuccess, 
                            onFailure: _onFailure
                          );
                        }
                      },
                      child: Text(
                        "Criar Conta",
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
          );
        }
      ),
    );
  }

  void _onSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
    //_scaffoldKey.currentState?.showSnackBar(
      SnackBar(
          content: Text(
              "Usuário criado com sucesso!"
          ),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(
        Duration(
          seconds: 2
      )
    ).then((value) => Navigator.of(context).pop());
  }

  void _onFailure() {
    ScaffoldMessenger.of(context).showSnackBar(
    //_scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
            "Falha ao criar usuário!"
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
  
}