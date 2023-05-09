# Building a Basic Clean Functional App

* This page shows how to build a basic app from scratch and explaining with each feature of flutter used.

<!--[basic_app](images/basic_app.png)-->

Code - 

```
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is Samit's App"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 216, 77, 209),
        ),
        body: Center(
          child: Text("This is a demo APP made by me"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("+"),
          onPressed: () {},
        ),
      ),
    ));
```

## Steps and Explaination

1. First we import the flutter package to use in-built features, widgets made available by the flutter itself.
2. Then we create the main function, it is the function which is called as soon as the app loads. Here we treated it as an arrow function, and as soon as it is called , it directly calls another function runApp, it takes the app as an argument and renders it onto the screen.
3. Here the argument is MaterialApp, it is a basic widget which is the app itself, it doesn't contain anything, it just empty.
4. In this MaterialApp widget we can put several properties.
5. Here the first property used is home, it is used to decide what to displat on the home page, and its value is **Scaffold** which is another widget, it generates an app with basic features and has certain defined features, like rendereing Title Bar, its color,body, buttons etc. If we don't use, still we can print text but its poorly formatted.
6. Inside it we used appBar propert which has AppBar widget as its value, this is used to design the title bar of the home page. Inside it we put the text, background color, and made the text center-align.
7. The next property is body in the scaffold, we used Center widget, so that whatever we put in it is algined centrally. 
8. At last we inserted a floating button at the bottom right corner.

# Creating own widget

Code - 
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Text("HELLO This is a flutter App"),
    );
    throw UnimplementedError();
  }
}
```

* Here StatelessWidget is a baseclass of the material.dart package which allows us to create our own widget.


## Adding Multiple Widgets together 

* We can use Column or Row widget to multiple widgets together respectively.

Code - 

```
body: Column(children: [
          Text('This is the Question???'),
          ElevatedButton(onPressed: null, child: Text("Answer1")),
          ElevatedButton(onPressed: null, child: Text("Answer2")),
          ElevatedButton(onPressed: null, child: Text("Answer3")),
          ElevatedButton(onPressed: null, child: Text("Answer4")),
        ]),
```

* Here the property body has its value as Column Widget which itself can have multiple widgets inside it.
* So we put all the widgets as its children, using the children property.
* The children property consist all Widgets in list data structure.