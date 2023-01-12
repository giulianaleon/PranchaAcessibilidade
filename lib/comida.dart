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
      home: Comida(),
    );
  }
}

class Comida extends StatefulWidget {
  const Comida({Key? key}) : super(key: key);

  @override
  State<Comida> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Comida> {
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
            title: const Text ("Comida"),
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
                                texto = "Estou com fome";
                              });
                              _speak(texto);
                            },
                            child: const Text("Estou com fome"),
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
                                texto = "Quero comer";
                              });
                              _speak(texto);
                            },
                            child: const Text("Quero comer"),
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
                                texto = "Café da manhã";
                              });
                              _speak(texto);
                            },
                            child: const Text("Café da manhã"),
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
                                texto = "Almoço";
                              });
                              _speak(texto);
                            },
                            child: const Text("Almoço"),
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
                                texto = "Jantar";
                              });
                              _speak(texto);
                            },
                            child: const Text("Jantar"),
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
                                texto = "Pão";
                              });
                              _speak(texto);
                            },
                            child: const Text("Pão"),
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
                                texto = "Manteiga";
                              });
                              _speak(texto);
                            },
                            child: const Text("Manteiga"),
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
                                texto = "Queijo";
                              });
                              _speak(texto);
                            },
                            child: const Text("Queijo"),
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
                                texto = "Carne";
                              });
                              _speak(texto);
                            },
                            child: const Text("Carne"),
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
                                texto = "Leite";
                              });
                              _speak(texto);
                            },
                            child: const Text("Leite"),
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
                                texto = "Suco";
                              });
                              _speak(texto);
                            },
                            child: const Text("Suco"),
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
                                texto = "Frutas";
                              });
                              _speak(texto);
                            },
                            child: const Text("Frutas"),
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
                                texto = "Presunto";
                              });
                              _speak(texto);
                            },
                            child: const Text("Presunto"),
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
                                texto = "Vegetais";
                              });
                              _speak(texto);
                            },
                            child: const Text("Vegetais"),
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
                                texto = "Arroz";
                              });
                              _speak(texto);
                            },
                            child: const Text("Arroz"),
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
                                texto = "Feijão";
                              });
                              _speak(texto);
                            },
                            child: const Text("Feijão"),
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