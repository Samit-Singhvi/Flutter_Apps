# Custom Widgets

* Ideally we should have a seperate dart file for each widget in our app

Code - 

```
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}

```

```
import 'package:flutter/material.dart';

..
.
Question(questions[questionNumber]),
```

1. Here earlier we were using Text widget to display our question, but now we created a seperate **questions.dart** file, and then imported the **Question** widget from there inside our main file to display question.
2. For this, inside **questions.dart** file, we create a stateless widget named as **Question**, and also made a constructor which would take question from the main.dart file and assign it to the variable **questionText**.
3. Also inside the **main.dart** file, we import the **questions.dart** file, so that we can use the Question widget and passed the question from the list into the widget.
4. **Here it is not of much use, but suppose we had to style our question widget , do some formatting then using Text widget and applying style would make code hectic, and then it would be of much use**.
5. We have used final data type for questionText because Question is a **Stateless widget**, so all of its properties and methods should not change internally.

# Styling the Question

Code - 

```
Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
```

* Here we used certain properties to style the text like increasing font size, centering it etc.
We used Container, because otherwise the Text widget itsef take ony that much space that is required, then it would not center its content, so we use Container, make it to conver whole screen and then center the Text widget.

