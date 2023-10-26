# Setting up FireBase

1. Make sure node.js is installed and create project in Firebase

2. Install firebase tools
```
npm install -g firebase-tools
```

3. Login to firebase
```
firebase login
```

4. Activate the flutterfire_cli
```
dart pub global activate flutterfire_cli
```
> Add the path C:\Users\{user}\AppData\Local\Pub\Cache\bin

5. run flutterfire configure
```
flutterfire configure --project=reddit-clone-tutorial-7a7f2
```

6. Add dart dependencies

firebase_core, firebase_storage, cloud_firestore, firebase_auth, google_sign_in, flutter_riverpod