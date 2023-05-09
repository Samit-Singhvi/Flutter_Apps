# Stateful Widgets

* State - It is anything that is visible on the app at any point of time, it can be current user logged in, jobs loaded, question being displayed in the quiz app.
* In stateless widget, if any external input (out of the class) has been given then the app can be re-rendered and built again with the change, but no changes can be made from inside the class.
* So for that we need Stateful widget, although stateless are useful when we want some features to be always visible on the app without any change.
* Stateful widget can changed when any change is made inside the class.

Code - 
```
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questions = ['What\'s your fav color', 'What\'s your favorite animal'];
  var questionNumber = 0;

  void answerQuestion() {
    print("Answer Chosen");
    setState(() {
      questionNumber += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
        ),
        body: Column(children: [
          Text(questions[questionNumber]),
          ElevatedButton(onPressed: answerQuestion, child: Text("Answer1")),
          ElevatedButton(onPressed: answerQuestion, child: Text("Answer2")),
          ElevatedButton(onPressed: answerQuestion, child: Text("Answer3")),
          ElevatedButton(onPressed: answerQuestion, child: Text("Answer4")),
        ]),
      ),
    );
    throw UnimplementedError();
  }
}
```

1. The code is almost similar to the Stateless widget. But here there are two classes instead of one.
2. The first class is Stateful Widget class which just point to another class which is the **State** class. Inside the state class all the app structure is built.
3. Now whatever feauture we have to change we need to put that inside the class, but not inside the build method. Here we have to change the question number so we put it inside the class at the beginning.
4. Here we want that whenever user clicks on any answer, a function is called which changes the question. So if we just put questionNumber = questionNumber +1, inside the function answerQuestion, the question will not get update, because we have to specifically tell the flutter to rerender the widget.
5. For that we need setState() function, inside it we update the question number. So whenever this will be called it well tell flutter to again build the widget.
6. Important thing it will not build the whole app, only the widget inside which it is called.
