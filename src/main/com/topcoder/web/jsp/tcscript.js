if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
}

  function getGraph(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('/statistics/graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
    return;
  }

function arena() {
  w=window.open("/contest/arena/launch.html","Launch","top=2,left=2,width=300,height=225,status=1");
  return;
}

function tcTime() {
  w=window.open("/contest/time.html","Time","top=2,left=2,width=250,height=50,status=1");
  return;
}

function sponsorLink(spons) {
  w=window.open(spons,"Sponsor");
  return;
}

function sponsorLinkWindow(spons,nam,top,lef,wid,hei) {
  w=window.open(spons,nam,"top="+top+",left="+lef+",width="+wid+",height="+hei+",resizable=no,toolbar=no,location=no,scrollbars=no,menubar=no,status=no");
  return;
}

function infoWindow(url) {
  var width = 300
  var height = 250
  var left = (screen.availWidth - width) / 2;
  var top = (screen.availHeight-height)/2;
  OpenWin=this.open(url,"Info",
            "toolbar=no,menubar=no,location=no,scrollbars=no,resizable=yes"
            + ",width=" + width + ",height=" + height
            + ",left=" + left + ",top=" + top);
}
