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


7. Add the google-services.json

Alias name: androiddebugkey
Creation date: Oct 24, 2023
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Tue Oct 24 10:17:42 AST 2023 until: Thu Oct 16 10:17:42 AST 2053      
Certificate fingerprints:
         SHA1: 99:00:C1:72:67:DA:B8:7E:1E:A4:F9:BD:89:09:E2:9E:FE:39:1F:B9        
         SHA256: EF:7C:39:33:05:A3:01:F6:0F:98:98:1E:F4:83:8A:62:AA:9B:8B:DC:5A:DA:EF:61:BB:E1:F9:09:B8:63:78:E1
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk. This algorithm will be disabled in a future update.
