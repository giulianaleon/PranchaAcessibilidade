import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:prancha01/animais.dart';
import 'package:prancha01/calendario.dart';
import 'package:prancha01/comida.dart';
import 'package:prancha01/depoimentos.dart';
import 'package:prancha01/saladeaula.dart';
import 'package:prancha01/saudacoes.dart';
import 'package:prancha01/sentimentos.dart';
import 'package:prancha01/simn%C3%A3o.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.purple,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();

  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  List<String>? languages;
  String langCode = "pt-BR";
  String nomeVoz = "Maria";
  List<String>? vozes = ['Daniel', 'Maria'];
  double tamanhoFonte = 17.0;
  int corFonte = 0; //Preto
  int corFundo = 0; //Branco

  String texto = "";


  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    languages = List<String>.from(await flutterTts.getLanguages);
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event){
        // if (event.isKeyPressed(LogicalKeyboardKey.f5)){    //Tecla F5 para falar
        //   _speak();
        // }

        // if (event.isKeyPressed(LogicalKeyboardKey.f6)){    //Tecla F5 para parar de falar
        //   _stop();
        // }

        if (event.isKeyPressed(LogicalKeyboardKey.altRight)){   //Aumentar fonte
          _aumentarFonte();
        }

        if (event.isKeyPressed(LogicalKeyboardKey.altLeft)){   //Diminuir fonte
          _fonteOriginal();
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text("Text To Speech"),
        // ),
          backgroundColor: corFundo == 0 ? Colors.white : corFundo == 1 ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(
                child: Column(children: [
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *.1,
                      ),
                      Column(
                        children: [
                          Image.asset('images/saudacoes.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Saudações";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Saudacoes()),
                              );
                            },
                            child: const Text("Saudações"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/sala_de_aula.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Sala de Aula";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SalaAula()),
                              );
                            },
                            child: const Text("Sala de Aula"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/animais.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Animais";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Animais()),
                              );
                            },
                            child: const Text("Animais"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/comida.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Comida";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Comida()),
                              );
                            },
                            child: const Text("Comida"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.01,
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.01,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width *.02,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *.1,
                      ),
                      Column(
                        children: [
                          Image.asset('images/depoimentos.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Depoimentos";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Depoimentos()),
                              );
                            },
                            child: const Text("Depoimentos"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/simnãotalvez.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Sim Não ou Talvez";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sim()),
                              );
                            },
                            child: const Text("Sim, Não, Talvez"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/sentimentos.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Sentimentos";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sentimentos()),
                              );
                            },
                            child: const Text("Sentimentos"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          Image.asset('images/horas.jpg', width: 200, height: 200),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Calendário e Números";
                              });
                              _speak(texto);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Calendario()),
                              );
                            },
                            child: const Text("Calendário e Números"),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width *.05,
                  ),

                  Row(
                    children: [

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),

                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.02),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *.08,
                              child: Text(
                                "Volume",
                                style: TextStyle(fontSize: tamanhoFonte, color: corFundo == 0 ? Colors.black : corFundo == 1 ? Colors.white : Colors.black),
                              ),
                            ),
                            Slider(
                              activeColor: Colors.green,
                              min: 0.0,
                              max: 1.0,
                              value: volume,
                              onChanged: (value) {
                                setState(() {
                                  volume = value;
                                });
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.01),
                              child: Text(
                                  double.parse((volume).toStringAsFixed(2)).toString(),
                                  style: TextStyle(fontSize: tamanhoFonte)),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.height *.05,
                      ),

                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.02),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *.08,
                              child: Text(
                                "Tonalidade",
                                style: TextStyle(fontSize: tamanhoFonte, color: corFundo == 0 ? Colors.black : corFundo == 1 ? Colors.white : Colors.black),
                              ),
                            ),
                            Slider(
                              activeColor: Colors.green,
                              min: 0.5,
                              max: 2.0,
                              value: pitch,
                              onChanged: (value) {
                                setState(() {
                                  pitch = value;
                                });
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.01),
                              child: Text(
                                  double.parse((pitch).toStringAsFixed(2)).toString(),
                                  style: TextStyle(fontSize: tamanhoFonte)),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.height *.05,
                      ),


                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.02),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *.08,
                              child: Text(
                                "Velocidade",
                                style: TextStyle(fontSize: tamanhoFonte, color: corFundo == 0 ? Colors.black : corFundo == 1 ? Colors.white : Colors.black),
                              ),
                            ),
                            Slider(
                              activeColor: Colors.green,
                              min: 0.0,
                              max: 1.0,
                              value: speechRate,
                              onChanged: (value) {
                                setState(() {
                                  speechRate = value;
                                });
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.height *.02),
                              child: Text(
                                  double.parse((speechRate).toStringAsFixed(2))
                                      .toString(),
                                  style: TextStyle(fontSize: tamanhoFonte)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height *.04,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: TextStyle(fontSize: tamanhoFonte)
                        ),
                        onPressed: _aumentarFonte,
                        child: const Text("Aumentar Fonte "),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.01,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: TextStyle(fontSize: tamanhoFonte)
                        ),
                        onPressed: _fonteOriginal,
                        child: const Text("Tamanho Original"),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height *.04,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: TextStyle(fontSize: tamanhoFonte)
                        ),
                        onPressed: _altoContraste,
                        child: const Text("Alto Contraste"),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.01,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: TextStyle(fontSize: tamanhoFonte)
                        ),
                        onPressed: _contrasteOriginal,
                        child: const Text("Constraste Original"),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          )),
    );
  }

  void initSetting() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(langCode);
    await flutterTts.setVoice({'name': 'Daniel', 'locale': 'pt-BR'});

    List tts = await flutterTts.getVoices;
    //print (tts);
  }

  void _speak(String texto) async {
    initSetting();
    await flutterTts.speak(texto);
    controller.clear();
  }

  void _aumentarFonte() async {
    setState((){
      tamanhoFonte = tamanhoFonte + 1.0;
    });
    //print(tamanhoFonte);
  }

  void _fonteOriginal() async {
    setState((){
      tamanhoFonte = 17.0;
    });
    //print(tamanhoFonte);
  }

  void _altoContraste() async {
    setState((){
      corFonte = 0;
      corFundo = 1;
    });
  }

  void _contrasteOriginal() async {
    setState((){
      corFonte = 1; //Preto
      corFundo = 0; //Branco
    });
  }

  void _stop() async {
    await flutterTts.stop();
  }
}