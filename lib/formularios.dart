import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/validadores.dart';
class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController _controllerNome = TextEditingController(text: "Ruben");
  TextEditingController _controllerIdade = TextEditingController(text: "25");
  TextEditingController _controllerCPF = TextEditingController(text: "334.616.710-02");
  
  final _formKey = GlobalKey<FormState>();
  String _mensagen = "";

  var _nome;
  var _idade;
  var _CPF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulários e Validações"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            //Quando estamos utilizar Formulario, devemos utilizar uma
            //chave KEY, é com ela que será feita as validacoes
            key: _formKey,
            child: Column(
             children: [
               
              TextFormField(
                controller: _controllerNome,
                onSaved: (valor){
                   _nome = valor;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Digite seu nome"
                ),
                //captura o que usuario digitou
                validator: (value){

                  /*if( value!.isEmpty){
                      return "O campo é obrigatório";
                  }

                  if( value.length < 5){
                      return "Digite ao menos 5 caracters";
                  }
                  else{
                      return null;
                  }*/

                  return Validador()
                  //Se nao preeencher terá uma mensagem Campo obrigatorio!
                  // e se o CPF for inválido CPF Inválidao
                  .add(Validar.OBRIGATORIO , msg: "Campo obrigatorio!")
                  .minLength(5, msg: "Mínimo de 5 caracteres")
                  .maxLength(100, msg: "Máximo de 100 caracteres")
                  .valido(value); 

                },
              ),

              TextFormField(
                controller: _controllerIdade,
                onSaved: (valor){
                   _idade = valor;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Digite tua idade"
                ),
                //captura o que usuario digitou
                validator: (value){

                   return Validador()
                  //Se nao preeencher terá uma mensagem Campo obrigatorio!
                  // e se o CPF for inválido CPF Inválidao
                  .add(Validar.OBRIGATORIO , msg: "Campo obrigatorio!")
                  .valido(value);

                },
              ),

              TextFormField(
                controller: _controllerCPF,
                onSaved: (valor){
                   _CPF = valor;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                  ],
                decoration: InputDecoration(
                  hintText: "Digite seu CPF"
                ),
                //captura o que usuario digitou
                validator: (value){
                  /*
                  if( value!.isEmpty){
                      return "O campo é obrigatório";
                  }*/
                  return Validador()
                  //Se nao preeencher terá uma mensagem Campo obrigatorio!
                  // e se o CPF for inválido CPF Inválidao
                  .add(Validar.OBRIGATORIO , msg: "Campo obrigatorio!")
                  .add(Validar.CPF, msg:  "CPF Inválidao")
                  .valido(value); 
                },
              ),
              
              TextButton(
                onPressed: (){

                 if( _formKey.currentState!.validate() == true){
                      _formKey.currentState!.save();

                  setState(() {
                    /*
                    String _nome = _controllerNome.text;
                    String _idade = _controllerIdade.text;
                    String _CPF = _controllerCPF.text;
                    */
                    _mensagen = "Nome: $_nome, Idade: $_idade, CPF: $_CPF";
                  });

                 }

                }, 
                child: Text("Validar"),
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
                ),
                Text(
                   _mensagen
                )
              
             ],
          ),
         )
        )
      ),
    );
}
}