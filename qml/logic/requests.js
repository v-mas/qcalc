.pragma library

function sendResultToFirebase(calcResult){
    var http = new XMLHttpRequest()
    var url = "https://qcalc-cbb53.firebaseio.com/.json";

    var jsonBuild = new Object()
    jsonBuild.result = calcResult
    var params1 = JSON.stringify(jsonBuild)

    console.log("sent message:"+ params1)
     http.open("POST", url, true);

     // Send the proper header information along with the request
     http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     http.setRequestHeader("Content-length", params1.length);
     http.setRequestHeader("Connection", "close");

     http.onreadystatechange = function() { // Call a function when the state changes.
                 if (http.readyState == 4) {
                     if (http.status == 200) {
                         console.log("ok")
                     } else {
                         console.log("error: " + http.status)
                     }
                 }
             }
     http.send(params1);
}

function makeGetRequest(){
    request('https://qcalc-cbb53.firebaseio.com/.json', function (o) {
        console.log("MyResponse:" + o.responseText)
    })
}

function abcd(){
    var doc = new XMLHttpRequest()
    doc.onreadystatechange = function () {
        if (doc.readyState === XMLHttpRequest.DONE) {
            // otput response of request
            console.log(doc.responseText)
        }
        console.log("request done:" + doc.statusText + "   " + doc.toString(
                        ))
    }
    //doc.open("GET", "http://ip.jsontest.com/");
    doc.open("GET", "https://qcalc-cbb53.firebaseio.com/.json")
    doc.send()
}

function request(url, callback) {
    var xhr = new XMLHttpRequest()
    xhr.onreadystatechange = (function (myxhr) {
        return function () {
            callback(myxhr)
        }
    })(xhr)
    xhr.open('GET', url, true)
    xhr.send('')
}
