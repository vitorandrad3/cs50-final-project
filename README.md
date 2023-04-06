# despesas_pessoais

#### Video Demo: <> 
#### Description:
This is my final CS50 project: a simple personal expense app made in Flutter, using the Dart language.
The application features a main graph that shapes itself according to the user's spending over the current week, which can be changed to show spending in the current month, it also features a button to add new transactions and a reserved part to show the cards with the details of every transaction made in the last 7 days.
The application's design is closer to something more modern, featuring rounded edges and a color gradient for some of the app's fields.
It is also possible to delete a transaction by sliding the card to the side, affecting the graph and the total spend in the selected period.
About the app code, it is divided into 4 main folders: Controller, Domain, Global and Presentation.
In the Controller are the files that manage the application's data, containing functions for adding, deleting and filtering information, it is also in these files that the application's reactivity is built, being classes that extend from ChangeNotifier and use the Observer pattern.
In the Domain folder is where the "transaction" entity is, which defines the characteristics of Transactions objects
The Global folder is where you can find the application's constants and widgets that are generic.
In the Presentation folder is where the core of the application is located, there are the main files, such as the "home page" and all the widgets that compose it.

This was CS50.











