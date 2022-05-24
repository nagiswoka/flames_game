import 'package:flutter/material.dart';

class Flames extends StatefulWidget {
  const Flames({Key? key}) : super(key: key);

  @override
  State<Flames> createState() => _FlamesState();
}

class _FlamesState extends State<Flames> {
  String name1 = "";
  String name2 = "";
  var ans = "";
  @override
  Widget build(BuildContext context) {
    if (ans.isNotEmpty) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("F L A M E S"),
          ),
          body: Center(
            child: Text(
              ans,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.replay,
              color: Colors.white,
              semanticLabel: "Restart",
            ),
            onPressed: () {
              setState(() {
                name1 = "";
                name2 = "";
                ans = "";
              });
            },
          ),
        ),
      );
    } else {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
          backgroundColor: Colors.grey,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[400],
            elevation: 5.0,
            title: const Center(
              child: Text(
                "F L A M E S",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 180,
                  child: TextFormField(
                    cursorHeight: 20.0,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purpleAccent,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0),
                            right: Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0),
                            right: Radius.circular(10.0)),
                      ),
                      hintText: "Enter person-1's name",
                      focusColor: Colors.indigo,
                    ),
                    textAlign: TextAlign.justify,
                    onChanged: ((value) => setState(() => name1 = value)),
                  ),
                ),
                const Divider(
                  color: Colors.white70,
                  thickness: 0.0,
                  height: 30.0,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: TextFormField(
                    cursorHeight: 20.0,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purpleAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0),
                            right: Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0),
                            right: Radius.circular(10.0)),
                      ),
                      hintText: "Enter person-2's name",
                      focusColor: Colors.indigo,
                    ),
                    textAlign: TextAlign.justify,
                    onChanged: ((value) => setState(() => name2 = value)),
                  ),
                ),
                const Divider(
                  color: Colors.white70,
                  thickness: 0.0,
                  height: 30.0,
                ),
                TextButton(
                  onPressed: _flamesGame,
                  child: const Text(
                    "Find..!",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5.0),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void _flamesGame() {
    setState(() {
      name1 = name1.toLowerCase();
      name2 = name2.toLowerCase();
      for (var i = 0; i < name1.length; i++) {
        for (var j = 0; j < name2.length; j++) {
          if (name1[i] == name2[j]) {
            name1 = (i == 0)
                ? name1.substring(1, name1.length)
                : name1.substring(0, i) + name1.substring(i + 1, name1.length);
            name2 = (j == 0)
                ? name2.substring(1, name2.length)
                : name2.substring(0, j) + name2.substring(j + 1, name2.length);
          }
        }
      }
      int unique = name1.length + name2.length;

      switch (gameOf(unique)) {
        case "F":
          ans = "Friends..!";
          break;
        case "L":
          ans = "Loves..!";
          break;
        case "A":
          ans = "Affection..!";
          break;
        case "M":
          ans = "Marriage..!";
          break;
        case "E":
          ans = "Enemy..!";
          break;
        case "S":
          ans = "Sister..!";
          break;
      }
    });
  }

  String gameOf(int unique) {
    String game = "FLAMES";
    if (unique == 1) {
      game = "S";
    } else {
      while (game.length > 1) {
        game = (unique % game.length == 0)
            ? game.substring(0, game.length - 1)
            : game.substring((unique % game.length), game.length) +
                game.substring(0, (unique % game.length) - 1);
      }
    }
    return game;
  }
}
