<%@  page
  contentType="text/html"
%>
<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
}
</SCRIPT>
<SCRIPT type="text/javascript">
if (document.images) {
  image2on = new Image();
  image2on.src = "/i/menu_sched_on.gif";
  image3on = new Image();
  image3on.src = "/i/menu_teams_on.gif";
  image4on = new Image();
  image4on.src = "/i/menu_stats_on.gif";
  image5on = new Image();
  image5on.src = "/i/menu_rounds_on.gif";
  image6on = new Image();
  image6on.src = "/i/menu_dev_on.gif";
  image7on = new Image();
  image7on.src = "/i/menu_jobs_on.gif";
  image8on = new Image();
  image8on.src = "/i/menu_press_on.gif";  
  image9on = new Image();
  image9on.src = "/i/menu_support_on.gif";      
  image2off = new Image();
  image2off.src = "/i/menu_sched_off.gif";
  image3off = new Image();
  image3off.src = "/i/menu_teams_off.gif";
  image4off = new Image();
  image4off.src = "/i/menu_stats_off.gif";
  image5off = new Image();
  image5off.src = "/i/menu_rounds_off.gif";
  image6off = new Image();
  image6off.src = "/i/menu_dev_off.gif";
  image7off = new Image();
  image7off.src = "/i/menu_jobs_off.gif";
  image8off = new Image();
  image8off.src = "/i/menu_press_off.gif";  
  image9off = new Image();
  image9off.src = "/i/menu_support_off.gif";    
}
function changeImages() {
  if (document.images) {
    for (var i=0; i<changeImages.arguments.length; i+=2) {
      document[changeImages.arguments[i]].src = eval(changeImages.arguments[i+1] + ".src");
    }
  }
}
</SCRIPT>

<SCRIPT TYPE="text/javascript">
  function getGraph(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
    return;
  }
</SCRIPT>

<script type="text/javascript">
function arena() 
{
  w=window.open("/contest/arena/launch.html","Launch","top=2,left=2,width=300,height=225,status=1");
  return;
}
function tcTime()
{
  w=window.open("/contest/time.html","Time","top=2,left=2,width=250,height=50,status=1");
  return;
}
function sponsorLink(spons)
{
  w=window.open(spons,"Sponsor");
  return;
}
function sponsorLinkWindow(spons,nam,top,lef,wid,hei)
{
  w=window.open(spons,nam,"top="+top+",left="+lef+",width="+wid+",height="+hei+",resizable=no,toolbar=no,location=no,scrollbars=no,menubar=no,status=no");
  return;
}
</SCRIPT>
