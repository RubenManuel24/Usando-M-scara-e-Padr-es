
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerCNPJ = TextEditingController();
  TextEditingController _controllerCEP = TextEditingController();
  TextEditingController  _controllerTel = TextEditingController();
  TextEditingController  _controllerData = TextEditingController();
  TextEditingController  _controllerHora = TextEditingController();
  TextEditingController  _controllerMoeda = TextEditingController();
  

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Mascaras e Validações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16 ),
        child: SingleChildScrollView(
          child: Column(
          children: [
            //CPF
            TextField(
              controller: _controllerCPF,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 CpfInputFormatter(),
                 
              ],
              decoration: InputDecoration(
                hintText: "Digte CPF", 
              ),
            ),

            //CNPJ
            TextField(
              controller: _controllerCNPJ,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 CnpjInputFormatter() ,
                 
              ],
              decoration: InputDecoration(
                hintText: "Digte CNPJ", 
              ),
            ),

            //CEP
            TextField(
              controller: _controllerCEP,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 CepInputFormatter(),
                 
              ],
              decoration: InputDecoration(
                hintText: "Digte CEP", 
              ),
            ),

            //TELEFONE
            TextField(
              controller: _controllerTel,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 TelefoneInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: "Digte Tel", 
              ),
            ),

            //DATA
            TextField(
              controller: _controllerData,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 DataInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: "Digte DATA", 
              ),
            ),

            //HORA
            TextField(
              controller: _controllerHora,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 HoraInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: "Digte HORA", 
              ),
            ),

            //MOEDA
            TextField(
              controller: _controllerMoeda,
              keyboardType: TextInputType.number,
              //Formatacao para as mascaras
              inputFormatters: [
                 FilteringTextInputFormatter.digitsOnly,
                 RealInputFormatter(moeda: true)
              ],
              decoration: InputDecoration(
                hintText: "Digte Moeda", 
              ),
            ),
            
            TextButton(
              onPressed: (){
                setState(() {
                  //_valorRecuperado = _controllerCPF.text;
                  //_valorRecuperado = _controllerCNPJ.text;
                  //_valorRecuperado = _controllerCEP.text;
                  //_valorRecuperado = _controllerTel.text;
                  //_valorRecuperado = _controllerData.text;
                  //_valorRecuperado = _controllerHora.text;
                  //_valorRecuperado = _controllerMoeda.text;
               
                  //Para salar no BD
                  /*
                  String moedaBD = _controllerMoeda.text.toString();
                  moedaBD = moedaBD.replaceAll(".", "");
                  moedaBD = moedaBD.replaceAll(",", ".");
                  moedaBD = moedaBD.replaceAll("\$", "");
                  moedaBD = moedaBD.replaceAll("R", "");
                  //_valorRecuperado = moedaBD;
                  
                  //Para exibir na tela
                  var valorDouble = double.parse(moedaBD);
                  var formatador = NumberFormat("#,##0.00" , "pt_BR");
                  var resultado = formatador.format(valorDouble);

                  //_valorRecuperado = "BD: $moedaBD / Exibição: $resultado";  
                  */
                  
                  //Listado Estados
                  for(var item in Estados.listaEstados){

                    print("Estados: $item");

                  }

                  //Listado Estados abreviado
                  for(var item in Estados.listaEstadosSigla){

                    print("Estados abreviado: $item");

                  }

                  //Listado Meses
                  for(var item in Meses.listaMeses){

                    print("Meses: $item");

                  }

                  //Listado Meses abreiado
                  for(var item in Semana.listaDiasSemana){

                    print("Semana: $item");

                  }

                });

              }, 
              child: Text("Recuperar Valor"),
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
           ),

           Text(
              "Valor: ${_valorRecuperado}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
           ),

          ],
        ),
        )
      ),

    );
  }
}