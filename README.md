
# ☕ Mocha Moments

Mocha Moments is a dedicated app for a coffee shop, designed to enhance the customer experience by allowing users to browse the menu, order products, and manage their accounts seamlessly. Built using Flutter, the app ensures smooth performance across both Android and iOS devices.

## 🌟 Overview
**Name**: Mocha Moments  
**Purpose**: To provide a user-friendly interface for ordering coffee and snacks, claiming loyalty rewards, and managing user accounts.  
**Target Audience**: Coffee enthusiasts who frequent the coffee shop.  
**Unique Selling Proposition**: Comprehensive features for ordering and account management with a focus on user experience.

## 📋 Features
1. **User Registration**:
   - Register using an email address.
   
2. **Menu Screen**:
   - Browse a list of products categorized into hot drinks, cold drinks, and snacks.
   - Tap on a product to view its description.
   - Options to buy products caffeine-free and see if the product is vegan.
   - Add products to the cart.
   
3. **Free Products Screen**:
   - View and claim free products using fidelity tokens.
   
4. **Cart Screen**:
   - Review and place orders for selected products.
   
5. **Settings Screen**:
   - Change username.
   - Log out of the app.
   - Delete account.
   - View order history with filtering options (e.g., last week, last month).
   - Filter menu to show only vegan products.
  
  ![IMG_7099](https://github.com/AlexMarcus17/coffeeshopapp/assets/67654354/93838851-a6dc-4628-89b1-39118eac894b)

## 🛠️ Tech Stack
- **Development**: Flutter, Dart
- **State Management**: BLoC, Hydrated BLoC
- **Animations**: Lottie
- **Dependency Injection**: Get_it
- **Backend and Authentication**: Firebase
- **Testing**: Device_preview

## 🏗️ Architecture
- **Authentication**:
  - Auth screen connects to Auth Repository.
  - Auth Repository utilizes Firebase Authentication.
  
- **Menu and Gifts**:
  - Menu and Gifts screens connect to Menu Repository.
  - Menu Repository interacts with Firestore (Firebase).

- **Cart**:
  - Cart screen uses Hydrated BLoC for state management.
  - Cart items are stored in a local database.

- **Orders**:
  - Orders screen connects to Order BLoC for state management.
  - Order BLoC connects to Order Repository.
  - Order Repository interacts with Firestore and depends on Auth Repository.
 
<img width="1086" alt="Screenshot 2024-05-22 at 13 19 19" src="https://github.com/AlexMarcus17/coffeeshopapp/assets/67654354/c58622e4-4636-4808-99b5-62bd7d9b15ad">

## ⚙️ Configuration
- **Firebase Setup**: To use the code, you need to generate the `firebase_options.dart` file using the FlutterFire CLI.


First you need to install Firebase CLI via npm.


```sh
npm install -g firebase-tools
```



```sh
dart pub global activate flutterfire_cli
```

In the root of your application, run the configure command

```sh
flutterfire configure
```


The configuration command will guide you to generate `firebase_options.dart`

##### By leveraging the robust Flutter framework and Firebase services, Mocha Moments provides a seamless and enjoyable experience for coffee shop customers, enhancing their interaction with the shop's offerings and loyalty programs.


## 📄 License

GNU General Public License v3.0

