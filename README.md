# despesas_pessoais

 
#### Description:
This is my final CS50 project: a simple personal expense app made in Flutter, using the Dart language.

The application features a main graph that shapes itself according to the user's spending over the current week, which can be changed to show spending in the current month, it also features a button to add new transactions and a reserved part to show the cards with the details of every transaction made in the last 7 days.

The application's design is closer to something more modern, featuring rounded edges and a color gradient for some of the app's fields.

It is also possible to delete a transaction by sliding the card to the side, affecting the graph and the total spend in the selected period.

About the app code, it is divided into 4 main folders: Controller, Domain, Global and Presentation.
In the Controller are the files that manage the application's data, containing functions for adding, deleting and filtering information, it is also in these files that the application's reactivity is built, being classes that extend from ChangeNotifier and use the Observer pattern.

In the Domain folder is where the "transaction" entity is, which defines the characteristics of Transactions objects.    

The Global folder is where you can find the application's constants and widgets that are generic.

In the Presentation folder is where the core of the application is located, there are the main files, such as the "home page" and all the widgets that compose it.

 More information:

The app provides users with an easy and efficient way to monitor their expenses on a daily, weekly, or monthly basis, which can help them make better financial decisions and avoid overspending.

Users can add new transactions by tapping the "Add Transaction" button, which opens a form where they can enter details such as the transaction amount, category, and notes. Once the transaction is added, it appears on the graph and in the list of recent transactions.

The app also allows users to filter their transactions by category, which can help them analyze their spending habits and identify areas where they can cut back or save more.

The app's design is user-friendly and intuitive, with clear and concise labels and icons that make it easy to navigate and understand. The color scheme and font choices are also aesthetically pleasing and modern.

The app's code is well-organized and follows best practices for software development. The use of the Observer pattern and ChangeNotifier classes ensures that the app is reactive and responds to changes in the data in real-time.

The app could be enhanced with additional features such as the ability to set budgets for different categories, generate reports and insights based on spending patterns, and sync data across multiple devices.

Overall, the app is a great example of how technology can be used to simplify and streamline personal finance management, making it more accessible and empowering for everyone.

This was CS50.






















