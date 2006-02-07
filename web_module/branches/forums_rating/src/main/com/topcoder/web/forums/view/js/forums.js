function toggle(obj) {
    var el = document.getElementById(obj);
    if ( el.style.display != "none" ) {
        el.style.display = 'none';
    }
    else {
        el.style.display = '';
    }
}

var req;
function rate(messageID, voteValue) {
   var url = "?module=Rating";
   if (window.XMLHttpRequest) {
       req = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       req = new ActiveXObject("Microsoft.XMLHTTP");
   }
   req.open("POST", url, true);
   req.onreadystatechange = callback;
   req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   req.send("messageID="+messageID+"&voteValue="+voteValue);
}

function callback() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            var resp = req.responseXML.getElementsByTagName("response")[0];
            var messageID = req.responseXML.getElementsByTagName("messageID")[0].firstChild.nodeValue;
            var posRatings = req.responseXML.getElementsByTagName("posRatings")[0].firstChild.nodeValue;
            var negRatings = req.responseXML.getElementsByTagName("negRatings")[0].firstChild.nodeValue;
            displayVotes(messageID, posRatings, negRatings);
        }
    }
}

function displayVotes(messageID, posVotes, negVotes) {
    mspan = document.getElementById("ratings"+messageID);
    mspan.innerHTML = "(+"+posVotes+"/-"+negVotes+")";
}