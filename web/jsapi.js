function alertMessage(text) {
    alert(text)
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}

function callDartFunctioninJS(){
    window.dartFunction();
}

function getChainID(){
    if(window.hasOwnProperty("ethereum")){
        if(window.ethereum.hasOwnProperty("networkVersion")){
            return window.ethereum.networkVersion;
        }
    }
    return "Metamask is not active";
}