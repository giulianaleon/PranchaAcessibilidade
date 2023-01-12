import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:prancha01/main.dart';

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
      home: Calendario(),
    );
  }
}

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calendario> {
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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: const Icon (Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      texto = "Voltar ao menu inicial";
                    });
                    _speak(texto);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                );
              },
            ),
            title: const Text ("Calendário e números"),
            backgroundColor: Colors.green,
          ),
          backgroundColor: corFundo == 0 ? Colors.white : corFundo == 1 ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(
                child: Column(children: [
                  // Image.asset('images/logo_sem_fundo.png', width: 400, height: 200),
                  SizedBox(
                    height: MediaQuery.of(context).size.width *.05,
                  ),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *.1,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Segunda-feira";
                              });
                              _speak(texto);
                            },
                            child: const Text("Segunda-feira"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Terça-feira";
                              });
                              _speak(texto);
                            },
                            child: const Text("Terça-feira"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Quarta-feira";
                              });
                              _speak(texto);
                            },
                            child: const Text("Quarta-feira"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Quinta-feira";
                              });
                              _speak(texto);
                            },
                            child: const Text("Quinta-feira"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Sexta-feira";
                              });
                              _speak(texto);
                            },
                            child: const Text("Sexta-feira"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Zero";
                              });
                              _speak(texto);
                            },
                            child: const Text("0"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Um";
                              });
                              _speak(texto);
                            },
                            child: const Text("1"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "dois";
                              });
                              _speak(texto);
                            },
                            child: const Text("2"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "três";
                              });
                              _speak(texto);
                            },
                            child: const Text("3"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "quatro";
                              });
                              _speak(texto);
                            },
                            child: const Text("4"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "cinco";
                              });
                              _speak(texto);
                            },
                            child: const Text("5"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "seis";
                              });
                              _speak(texto);
                            },
                            child: const Text("6"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "sete";
                              });
                              _speak(texto);
                            },
                            child: const Text("7"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "oito";
                              });
                              _speak(texto);
                            },
                            child: const Text("8"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "nove";
                              });
                              _speak(texto);
                            },
                            child: const Text("9"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "dez";
                              });
                              _speak(texto);
                            },
                            child: const Text("10"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Janeiro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Janeiro"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Fevereiro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Fevereiro"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Março";
                              });
                              _speak(texto);
                            },
                            child: const Text("Março"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "abril";
                              });
                              _speak(texto);
                            },
                            child: const Text("Abril"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "maio";
                              });
                              _speak(texto);
                            },
                            child: const Text("Maio"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Junho";
                              });
                              _speak(texto);
                            },
                            child: const Text("Junho"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Julho";
                              });
                              _speak(texto);
                            },
                            child: const Text("Julho"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Agosto";
                              });
                              _speak(texto);
                            },
                            child: const Text("Agosto"),
                          ),
                        ],
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Setembro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Setembro"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Outubro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Outubro"),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Novembro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Novembro"),
                          ),
                        ],
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width *.05,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(fontSize: tamanhoFonte)
                            ),
                            onPressed: () {
                              setState(() {
                                texto = "Dezembro";
                              });
                              _speak(texto);
                            },
                            child: const Text("Dezembro"),
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