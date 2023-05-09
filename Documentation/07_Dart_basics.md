# DART Basics

* This file contain certain concepts of Dart that are not too obvious for any person with programming and are helpful in Flutter Execution.

## Multiple Constructors for the same class

* Constructors are used to create objects just by passing values into the class at the time of instantiation, and they are also used to set default values for objects.
* Example 

```
class Person{
    String name;
    int age;
}

Person(name, age){
    this.name = name;
    this.age = age;
}

Person.oldAge({this.name}){
    age = 60;
}
```

Here we created a constructor for Person, in which name and age are passed and they are instantiated. But we also created a constructor with oldAge, so if an object is created like this `Person.oldAge('Max')` so a person with name Max and age 60 will be created.