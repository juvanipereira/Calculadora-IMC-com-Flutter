
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }

}
class TelaInicialState extends State<TelaInicial>{
  String _textoResultado = "IMC é";

  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController _controllerAltura = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora"),),
       body: SingleChildScrollView(
         child: Column(
          children: <Widget>[
            criarCampoTexto("Peso: (kg):",_controllerPeso), criarCampoTexto("Altura (cm)", _controllerAltura ),
            Text(_textoResultado, style: TextStyle(fontSize: 25.0),),


            Container(
              height: 50.0, width: 200.0,
              child: ElevatedButton(

                onPressed: (){

                   var peso = double.tryParse (_controllerPeso.text);
                   var altura = double.tryParse(_controllerAltura.text);

                  debugPrint('Peso: $peso');
                  debugPrint('Altura: $altura');

                    if (peso!=null && altura!=null){
                      altura = altura/100;
                      double imc = (peso / (altura*altura));

                      setState(() {

                        _textoResultado = 'Seu IMC é: $imc';
                    });
                      if (imc <18.5) {
                        _textoResultado ='Abaixo do Peso (${imc.toStringAsPrecision(3)})';
                      } else if(imc >= 18.5 && imc < 24.9){
                        _textoResultado = 'Peso Normal (${imc.toStringAsPrecision(3)})';
                      } else if(imc >= 25 && imc < 29.9){
                        _textoResultado = 'Sobrepeso (${imc.toStringAsPrecision(3)})';
                      } else if(imc >= 30 && imc < 34.9){
                        _textoResultado = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
                      } else if(imc >= 35 && imc < 39.9){
                        _textoResultado = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
                      } else if(imc >= 40){
                        _textoResultado = 'Obesidade Grau III ou Mórbida (${imc.toStringAsPrecision(3)})';
                      }



                    } else{
                       setState(() {
                         _textoResultado = "Informe seus dados";
                       });


                }

                }, child: Text('Calcular IMC'),
              ),

            )


          ],
      ),
       ),
    );

  }




TextField criarCampoTexto(String texto, TextEditingController controller){
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: texto,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 25.0, color: Colors.blue
        )
      ),
    );
   }

}