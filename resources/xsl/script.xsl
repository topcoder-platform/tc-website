<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">



  <xsl:template name="TCOCSS">
    <SCRIPT type="text/javascript"><![CDATA[
if ( window.navigator.appName.indexOf("Netscape")>-1 && window.navigator.appVersion.charAt(0)=='4') {
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle_linux.css"/>');
} else {
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');
}
    ]]></SCRIPT>
  </xsl:template>

  <xsl:template name="CSS">
    <SCRIPT type="text/javascript"><![CDATA[
if ( window.navigator.appName.indexOf("Netscape")>-1 && window.navigator.appVersion.charAt(0)=='4') {
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
} else {
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
}
    ]]></SCRIPT>
  </xsl:template>

  <xsl:template name="DateTime">
<SCRIPT type="text/javascript"><![CDATA[
var months=new Array(13);
months[1]="January";
months[2]="February";
months[3]="March";
months[4]="April";
months[5]="May";
months[6]="June";
months[7]="July";
months[8]="August";
months[9]="September";
months[10]="October";
months[11]="November";
months[12]="December";
var time=new Date();
var lmonth=months[time.getMonth() + 1];
var date=time.getDate();
var year=time.getYear();
if (year < 2000)
year = year + 1900;
document.write(" " + lmonth + " ");
document.write(date + ", " + year + " ");
]]></SCRIPT>
  </xsl:template>


  <xsl:template name="Preload">
<SCRIPT TYPE="text/javascript">
  function getGraph(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('graphPopup.jsp?'+url+'&amp;width='+wd+'&amp;height='+ht,name,size);
    return;
  }
</SCRIPT>

<SCRIPT type="text/javascript">
function tcTime()
{
  w=window.open("http://<xsl:value-of select="/TC/Host"/>/contest/time.html","Time","top=2,left=2,width=250,height=50,status=1");
  return;
}
function arena()
{
  w=window.open("http://<xsl:value-of select="/TC/Host"/>/contest/arena/launch.html","Launch","top=2,left=2,width=300,height=225,status=1");
  return;
}
</SCRIPT>

<SCRIPT type="text/javascript"><![CDATA[
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
function goTo(selection)
{
  sel = selection.options[selection.selectedIndex].value;
  if (sel == "arena")
  {
    arena();
  }


  //quick stats
  else if (sel == "alltimewin")
  {
    window.location = "/stat?c=all_time_wins";
  }
  else if (sel == "winningdebuts")
  {
    window.location = "/stat?c=winning_debuts";
  }
  else if (sel == "impressivedebuts")
  {
    window.location = "/stat?c=impressive_debuts";
  }
  else if (sel == "hightesttotal")
  {
    window.location = "/stat?c=highest_totals";
  }
  else if (sel == "ratingpointgain")
  {
    window.location = "/stat?c=biggest_rating_gains";
  }
  else if (sel == "consecwins")
  {
    window.location = "/stat?c=most_consecutive_wins";
  }
  else if (sel == "submissionaccuracy")
  {
    window.location = "/stat?c=highest_accuracy";
  }
  else if (sel == "challengesuccess")
  {
    window.location = "/stat?c=best_challengers";
  }


  //sponsor
  else if (sel == "general_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_gen";
  }
  else if (sel == "professional_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_prof";
  }
  else if (sel == "student_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_stud";
  }
  else if (sel == "spons_srm_web")
  {
    window.location = "/index?t=about_tc&c=spons_srm_web";
  }
  else if (sel == "spons_srm_applet")
  {
    window.location = "/index?t=about_tc&c=spons_srm_applet";
  }
  else if (sel == "spons_srm_email")
  {
    window.location = "/index?t=about_tc&c=spons_srm_email";
  }
  else if (sel == "spons_tourny_web")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_web";
  }
  else if (sel == "spons_tourny_applet")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_applet";
  }
  else if (sel == "spons_tourny_email")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_email";
  }
  else if (sel == "spons_tourny_marketing")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_marketing";
  }
  else if (sel == "spons_tourny_onsite")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_onsite";
  }
  else if (sel == "spons_tourny_pr")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_pr";
  }
  else if (sel == "spons_report_gen")
  {
    window.location = "/index?t=about_tc&c=spons_report_gen";
  }
  else if (sel == "spons_report_stud")
  {
    window.location = "/index?t=about_tc&c=spons_report_stud";
  }
  else if (sel == "spons_report_prof")
  {
    window.location = "/index?t=about_tc&c=spons_report_prof";
  }

  else
  {}
}
]]></SCRIPT>

  </xsl:template>
</xsl:stylesheet>
