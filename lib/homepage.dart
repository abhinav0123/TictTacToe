// import 'dart:html';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isCross = true;

  String? message;

  List<String>? gameState;

  AssetImage cross = const AssetImage('assets/cross.png');

  AssetImage circle = const AssetImage('assets/circle.png');

  AssetImage edit = const AssetImage('assets/edit.png');

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  playGame(int index) {
    if (this.gameState?[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState?[index] = "Cross";
        } else {
          this.gameState?[index] = "Circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    if (value == 'empty') {
      return edit;
    } else if (value == 'Cross') {
      return cross;
    } else {
      return circle;
    }
  }

  checkWin() {
    if ((gameState?[0] != 'empty') &&
        (gameState?[0] == gameState?[1]) &&
        (gameState?[1] == gameState?[2])) {
      setState(() {
        message = '${gameState?[0]} Wins';
      });
    } else if ((gameState?[3] != 'empty') &&
        (gameState?[3] == gameState?[4]) &&
        (gameState?[4] == gameState?[5])) {
      setState(() {
        message = '${gameState?[3]} Wins';
      });
    } else if ((gameState?[6] != 'empty') &&
        (gameState?[6] == gameState?[7]) &&
        (gameState?[7] == gameState?[8])) {
      setState(() {
        message = '${gameState?[6]} Wins';
      });
    } else if ((gameState?[0] != 'empty') &&
        (gameState?[0] == gameState?[3]) &&
        (gameState?[3] == gameState?[6])) {
      setState(() {
        message = '${gameState?[0]} Wins';
      });
    } else if ((gameState?[1] != 'empty') &&
        (gameState?[1] == gameState?[4]) &&
        (gameState?[4] == gameState?[7])) {
      setState(() {
        message = '${gameState?[1]} Wins';
      });
    } else if ((gameState?[2] != 'empty') &&
        (gameState?[2] == gameState?[5]) &&
        (gameState?[5] == gameState?[8])) {
      setState(() {
        message = '${gameState?[2]} Wins';
      });
    } else if ((gameState?[0] != 'empty') &&
        (gameState?[0] == gameState?[4]) &&
        (gameState?[4] == gameState?[8])) {
      setState(() {
        message = '${gameState?[0]} Wins';
      });
    } else if ((gameState?[2] != 'empty') &&
        (gameState?[2] == gameState?[4]) &&
        (gameState?[4] == gameState?[6])) {
      setState(() {
        message = '${gameState?[2]} Wins';
      });
    } else if (!gameState!.contains('empty')) {
      setState(() {
        this.message = 'Game draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState!.length,
              itemBuilder: (BuildContext context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(image: getImage(this.gameState![i])),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                message!,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: MaterialButton(
              color: Color.fromARGB(255, 4, 82, 146),
              height: 50.0,
              child: Text(
                'Reset Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                resetGame();
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                 'Tic tac toe',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
