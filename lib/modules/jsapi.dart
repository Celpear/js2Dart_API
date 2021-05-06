import 'dart:js' as js;
import 'dart:html' as http;
import 'dart:js_util';

class JSApi {
  void jscallDARTfunction(String jsfunctionName, Function _callback) {
    print("JSApi function: window.${jsfunctionName}");
    setProperty(http.window, jsfunctionName, js.allowInterop(_callback));
  }

  dynamic calljsFunction(Object method, [List<dynamic> args]) {
    return js.context.callMethod(method, args);
  }

  bool jshasProperty(dynamic _property) {
    return js.context.hasProperty(_property);
  }
}
