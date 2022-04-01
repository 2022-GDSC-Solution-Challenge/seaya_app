<img src="https://user-images.githubusercontent.com/66460670/161184505-784d6ad7-e2b5-4bb3-8105-bf616b86acea.png" width="90%" height="90%">


## 1. Noted UN-SGDs

<img src="https://user-images.githubusercontent.com/66460670/161184547-f6d1364f-8aae-4913-9106-00f2fa30a280.jpeg" width="30%" height="30%"> <img src="https://user-images.githubusercontent.com/66460670/161184561-7632e74d-c37e-4fa0-a415-d600e6f61af2.jpeg" width="30%" height="30%">


We are currently impacted by climate change, and will be more and more affected in the future.
Today many people are focusing on environmental issues.
Compared to land, the sea is the basis of daily life and has a relatively low proportion, so interest in marine pollution is lower than that of land.
Our service 'Seaya' has chosen the topic of marine pollution, which is of low interest, and decided to improve people's awareness.

## 2. About Seaya

### Seaya:
"Seaya" is a combination of the Korean word "sight," which means sea and view, meaning that the higher the interest in the marine environment and marine pollution, the wider our view of the clean sea will be.
”Seaya” gives points as users perform more environmental-related functions provided by the app to encourage interest in marine pollution. Through the points given, users can compete, and through competition, users' actions are further triggered.
Therefore, the more people use the visual field app, the more interested they will be in marine pollution, and furthermore, they will act to reduce environmental pollution on the planet.
Our ultimate goal is to change the attitudes of people who look down on environmental issues and make everyone act voluntarily for the environment.

### Brief description of functions:
- You can see the home screen that changes according to the user's score.
- You can easily and quickly check the environmental news summarized through machine learning.
- You can get environmental knowledge by taking environmental quizzes.
- You can practice environmental protection yourself by completing the mission.
- You can compete with your friends and practice environmental protection.

## 3. About Google Technology for this project

<img src="https://user-images.githubusercontent.com/66460670/161185456-85971f15-113c-4591-b719-ba320d34f5f7.png" width="30%" height="30%">

 Flutter - front
 
 <img src="https://user-images.githubusercontent.com/66460670/161185472-3c2a8a9f-5908-4c6f-a896-585fea57ee4d.png" width="30%" height="30%">

 Firebase Auth - SignIn, SignUp
 
 <img src="https://user-images.githubusercontent.com/66460670/161185489-adc77f8f-443e-4076-81b6-44f5d7328bfc.png" width="40%" height="40%"> <img src="https://user-images.githubusercontent.com/66460670/161185639-f88d7ff0-3700-4482-a602-ed1e55436742.png" width="20%" height="20%">

 Google Cloud Platform(Compute Engine) - for running server
 
 ## 4. Tech Stack
 
 - **Design**
    - [Adobe XD](https://www.adobe.com/products/xd.html)
    - [Zeplin](https://zeplin.io/)
    
 - **ML** **(** [Python](https://www.python.org/) : `3.8.12` **)**
   - [tensorflow](https://www.tensorflow.org/?hl=ko) & [keras](https://keras.io/) : `2.6.0`
   - [pandas](https://pandas.pydata.org/) : `1.2.4`
   - [gensim](https://radimrehurek.com/gensim/) :  `3.8.3`
   
 - **Back (** Node.js : `17.5.0` **)**
    - express :  `^4.17.2`
    - [firebase-admin](https://firebase.google.com/docs/reference/admin/python?hl=ko) : `^10.0.2`
    - mysql2 :  `^2.3.3`
    - sequelize :  `^6.16.1`
    - seuqelzie-cli :  `^6.4.1`
    - node-schedule :  `^2.1.0`
    - python-shell :  `^3.0.1`
    - pm2 :  `^5.2.0`

- **Front (** [Dart](https://dart.dev/) : `2.16.1`**)**
    - [Flutter](https://flutter.dev/?gclid=Cj0KCQiAuvOPBhDXARIsAKzLQ8EuCPnbnUymdGONSqwC2_UpSmFtwELET3WliGT5njgvghTP37yBe6MaAtvREALw_wcB&gclsrc=aw.ds) : `2.10.2`
 


## 5. File Structure

```
📦lib
 ┣ 📂models
 ┃ ┣ 📜campaignModel.dart
 ┃ ┣ 📜competitionModel.dart
 ┃ ┣ 📜finduserModel.dart
 ┃ ┣ 📜friendModel.dart
 ┃ ┣ 📜missionModel.dart
 ┃ ┣ 📜newsModel.dart
 ┃ ┣ 📜quizModel.dart
 ┃ ┗ 📜userModel.dart
 ┣ 📂providers
 ┃ ┗ 📜UserProvider.dart
 ┣ 📂screens
 ┃ ┣ 📂competepage
 ┃ ┃ ┣ 📜Competition.dart
 ┃ ┃ ┣ 📜SearchFriend.dart
 ┃ ┃ ┣ 📜addFriends.dart
 ┃ ┃ ┗ 📜friendsList.dart
 ┃ ┣ 📂loginpage
 ┃ ┃ ┣ 📜logIn.dart
 ┃ ┃ ┗ 📜signUp.dart
 ┃ ┣ 📂mainhomepage
 ┃ ┃ ┣ 📜Campaign.dart
 ┃ ┃ ┣ 📜Home.dart
 ┃ ┃ ┣ 📜News.dart
 ┃ ┃ ┣ 📜Sea.dart
 ┃ ┃ ┣ 📜campaignDialog.dart
 ┃ ┃ ┣ 📜missionDialog.dart
 ┃ ┃ ┗ 📜newsDialog.dart
 ┃ ┣ 📂qandmpage
 ┃ ┃ ┣ 📜Q&M.dart
 ┃ ┃ ┣ 📜Quiz.dart
 ┃ ┃ ┣ 📜missionList.dart
 ┃ ┃ ┣ 📜quizEnd.dart
 ┃ ┃ ┗ 📜quizList.dart
 ┃ ┗ 📜splash.dart
 ┣ 📂utilities
 ┃ ┣ 📜Authservice.dart
 ┃ ┣ 📜Seawaves.dart
 ┃ ┣ 📜Setdata.dart
 ┃ ┗ 📜makeJson.dart
 ┣ 📂widgets
 ┃ ┣ 📂aniwidget
 ┃ ┃ ┗ 📜AnimatedWave.dart
 ┃ ┣ 📂menuwidget
 ┃ ┃ ┣ 📜Menu.dart
 ┃ ┃ ┣ 📜appBar.dart
 ┃ ┃ ┣ 📜sign_textform.dart
 ┃ ┃ ┗ 📜signup_button.dart
 ┃ ┗ 📂naviwidget
 ┃ ┃ ┗ 📜Navigation.dart
 ┗ 📜main.dart
```




## 6. How to run Seaya

1. Clone repository (git clone [https://github.com/2022-GDSC-Solution-Challenge/seaya_app.git](https://github.com/2022-GDSC-Solution-Challenge/seaya_app.git))
2. Launch `Terminal` and move to Project Directory
3. Enter `flutter pub get`  (in terminal)
4. Click `Run and Debug` button and Select `Dart & Flutter`
5. Wait building......

## 7. Detailed information about Seaya

**LogIn & SignUp**

<img src="https://user-images.githubusercontent.com/66460670/161186578-70d075c8-c5cf-4c32-a486-8d069900c330.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161186583-a05ef615-06fa-471b-82e5-23130a1994f4.png" width="20%" height="20%">


Log in with your email and password.


**Home Tab**
- sea

<img src="https://user-images.githubusercontent.com/66460670/161187212-a02e798e-429b-460e-b647-ee660aa6466c.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161187271-85cff399-dc99-4de3-8613-935f8555a63e.png" width="20%" height="20%">

You can see the scores they earned while using the app in detail, and when they earn points, the sea on the screen becomes clearer.
The percent index rises with the sentence "the view of the sea has been expanded."

- News & Campaign

<img src="https://user-images.githubusercontent.com/66460670/161187486-dc927b54-918f-49d4-9699-f75c0fd119c1.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161187475-96283861-ffc2-46ed-aacb-9659c859fed2.png" width="20%" height="20%">


By summarizing news articles through machine learning, you can access news more easily and quickly, and learn information about social issues responding to environmental problems by reading articles.

<img src="https://user-images.githubusercontent.com/66460670/161187723-c8ef5a2d-793b-4009-a889-131b5b52ec5a.png" width="20%" height="20%">

Currently, a number of campaign activities are being carried out without our knowledge, but most people are often unaware.
Introduce these campaigns to encourage direct participation.

**Q&M Tab**

- quiz

<img src="https://user-images.githubusercontent.com/66460670/161188394-a9edd432-dfb1-44ed-ac5f-f0e7c5025e54.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161188389-e234e685-cd8a-41cb-9704-c79fe5ac6809.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161188377-0d08632a-2380-4a44-b62d-9cc728083964.png" width="20%" height="20%">

It provides an opportunity to easily access and learn environmental knowledge through quizzes.
For the wrong question, you can mark the correct answer to check which question you are wrong and what was the correct answer.

- mission

<img src="https://user-images.githubusercontent.com/66460670/161188594-b67eb17d-b93b-469f-8819-f4f4e111de52.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161188584-7c05063f-733f-4b57-9cb3-7d853aae42a5.png" width="20%" height="20%">


It provides environmental missions that can be carried out in a day to help small practices become habits in life.
Click on the list tile for more information.


**Social Tab**

- competition

<img src="https://user-images.githubusercontent.com/66460670/161188911-ca1eecdd-5df0-4d72-bfc3-d526102b3b2d.png" width="20%" height="20%">


You can compete with your friends for a week with the scores you get from using the app.

- Friend & Search

<img src="https://user-images.githubusercontent.com/66460670/161189002-3cf0f906-b26b-41eb-934d-9a3530bb0780.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/66460670/161188996-ba545495-ad71-4e6d-8037-5c43f77ae020.png" width="20%" height="20%">


You can search for friends on the Friends page.
The friend list shows your friends, and the receive list shows the person who currently asked for friends.
The request list displays the application I sent.

You can search friend and send friend requests.

## 8. Contributors

- [Park SeolYeon](https://github.com/seolyeonpark) : Front-End
- [Ham YounJin](https://github.com/YounJ00) : Design
- [Park EunChong](https://github.com/0001010) : ML
- [Yi JoonYong](https://github.com/given-dragon): Back-End

