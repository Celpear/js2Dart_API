# js2dart API

Create your Flutter web app and call very simple JS functions from Dart. For example, you can use web3 and MetaMask Wallet to create dApps with Flutter and Dart.

Currently, we do not support null safety!
So, please use the SDK Version
```yaml
environment:
sdk: ">=2.11.0 <3.0.0"
```
## Import all necessary files:

Import the following file in your Dart code.
```dart
import 'modules/jsapi.dart';
//Create JSApi object at the beginning of your class.
JSApi js = new JSApi();
```
Import the following JS Script into your web folder and import it in the index.html.
```html
<script src="jsapi.js" type="application/javascript"></script>
```

# How to use it:

### Call JS function from Dart:
```dart
//call a JS function without any parameters from Dart
dynamic result = js.calljsFunction('name_of_js_function');
//call a JS function with parameters from Dart (JS function: function alertMessage(text){})
js.calljsFunction('alertMessage', ['Hello World :)']);
//Retrieve ChainID from the Metamask wallet when browser extension is enabled
dynamic result = js.calljsFunction('getChainID'); 
```

### Call Dart function from JS:
#### Dart:
```dart
// Attach function with custom name to DOMWindow
//In this case we create the JS Function "dartFunction" and attach them to the DOMWindow. So we can call this function in JS via. window.dartFunction(void);
//In JS, the dart callback function "receive_data_from_js_cb" can be called this way.
js.jscallDARTfunction("dartFunction", receive_data_from_js_cb);
```
#### JS:
```JS
window.dartFunction();
```

### Run on MacOS:
#### Debug code:
```shell
flutter run -d chrome
```
#### Build web and let it run:
```shell
flutter build web
cd build/web/
open http://127.0.0.1 && python3 -m http.server 80
```


I hope it helps you further.
Cheers!