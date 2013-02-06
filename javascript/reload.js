var spinshow = null;
var timespage = null;

function refresh(l) {
    var host;
    var path;
    var newurl;
   
    host = location.hostname;
    path = location.pathname;
    newurl = "Http://" + host + path;
    location.href = newurl + "?l=" + l ;
}

function gettimes() {
    var host;
    var path;
    var newurl;
    var l;
    var s;

    l = document.getElementById("line").value;
    s = document.getElementById("station").value;
    host = location.hostname;
    path = location.pathname;
    newurl = "Http://" + host + path;
    location.href = newurl + "?l=" + l + "&s=" + s;

}

function postRequest(strURL, targetDiv) {
    var xmlHttp;
    
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        var xmlHttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    setTimeout(function () {
        if (xmlHttp.readyState != 4) {
            showspinner();
        }
    }, 200);
    xmlHttp.open('GET', strURL, true);
    xmlHttp.setRequestHeader('Content-Type', 'text/html');
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            hidespinner();
            updatepage(xmlHttp.responseText, targetDiv);
            
        }
    }
    xmlHttp.send(strURL);
    ;
}


function updatepage(str, targetDiv) {
    document.getElementById(targetDiv).innerHTML = str;
}

function gettimes2() {
    var l;
    var s;

    l = document.getElementById("line").value;
    s = document.getElementById("station").value;

    var url = "index.asp?l=" + l + "&s=" + s;
    timespage = url
    postRequest(url, "main");
}


/*
function about() {
alert("Data provided by TFL etc. etc.")
}
*/
function update() {
    url = timespage;
    postRequest(url, "main");
}

function loadstations() {
    var l;
    l = document.getElementById("line").value;
    var url = "index.asp?l=" + l;
    postRequest(url, "stationpicker");
}

function back() {
    var url = "index.asp";
    postRequest(url, "main");
}