# despesas_pessoais

video demo: [https://www.youtube.com/watch?v=JgG-RmQJKc4]

 
### Description:
This is my final CS50 project: a simple personal expense app made in Flutter framework, using the Dart language.

The application features a main graph that shapes itself according to the user's spending over the current week, which can be changed to show spending in the current month, it also features a button to add new transactions and a reserved part to show the cards with the details of every transaction made in the last 7 days.

It is also possible to delete a transaction by sliding the card to the side, affecting the graph and the total spend in the selected period.

About the app code, it is divided into 4 main folders based on MVC (model-view-controller) pattern: `Controller`, `Domain`, `Global` and `Presentation`.

#### Controller:
In the `Controller` are the files that manage the application's data, containing functions for adding, deleting and filtering information, it is also in these files that the application's reactivity is built, being classes that extend from ChangeNotifier and use the Observer pattern.


##### file db.dart:
this file is managing database for local persistence of data using sqflite library


##### file statistic_controller.dart:

The `StatisticController` class extends ChangeNotifier class for an native state management approach. this class is responsible for providing statistical data for displaying charts in application.

##### file transaction_controller.dart:

The `TransactionListController` class extends ChangeNotifier class for an native state management approach. this class is responsible for manange all transactions of the aplication.

#### Domain:
The Domain layer is the most abstract layer of the application, where the transaction entity is located, which defines the characteristics of Transaction objects.

#### Gobal:
The Global folder is where you find the app's constants and widgets that are generic, used in various parts of the app.

#### Presentation
In the Presentation folder is where the core of the application is located, the view of the app, there are the main files, such as the "home page" and all the widgets that compose it.


This was CS50.






















