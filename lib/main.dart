import 'package:destini_game_flutter/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storybrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  void updateStory(int choiceNumber) {
    setState(() {
      storybrain.nextStory(choiceNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.justify,
                    '${storybrain.getStoryTitle()}',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  child: TextButton(
                    onPressed: () {
                      updateStory(1);
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 14.0,
                      ),
                      child: Text(
                        '${storybrain.getChoice1()}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storybrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      updateStory(2);
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 14.0,
                      ),
                      child: Text(
                        '${storybrain.getChoice2()}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
