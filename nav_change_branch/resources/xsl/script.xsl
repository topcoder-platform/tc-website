<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">



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
    <SCRIPT type="text/javascript"><![CDATA[
if (document.images) {
  image2on = new Image();
  image2on.src = "/i/menu_tces_on.gif";
  image3on = new Image();
  image3on.src = "/i/menu_applet2_on.gif";
  image4on = new Image();
  image4on.src = "/i/menu_tcs_on.gif";
  image5on = new Image();
  image5on.src = "/i/menu_rounds_on.gif";
  image6on = new Image();
  image6on.src = "/i/menu_dev_on.gif";
  image7on = new Image();
  image7on.src = "/i/menu_practice_on.gif";
  image8on = new Image();
  image8on.src = "/i/menu_press_on.gif";  
  image9on = new Image();
  image9on.src = "/i/menu_support_on.gif";      
  image2off = new Image();
  image2off.src = "/i/menu_tces_off.gif";
  image3off = new Image();
  image3off.src = "/i/menu_applet2_off.gif";
  image4off = new Image();
  image4off.src = "/i/menu_tcs_off.gif";
  image5off = new Image();
  image5off.src = "/i/menu_rounds_off.gif";
  image6off = new Image();
  image6off.src = "/i/menu_dev_off.gif";
  image7off = new Image();
  image7off.src = "/i/menu_practice_off.gif";
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
]]></SCRIPT>

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
  

  //schedule
  else if (sel == "jan_02")
  {
    window.location = "/index?t=schedule&c=jan_02";
  }
  else if (sel == "feb_02")
  {  
    window.location = "/index?t=schedule&c=feb_02";
  } 
  else if (sel == "mar_02")
  {
    window.location = "/index?t=schedule&c=mar_02";
  } 
  else if (sel == "apr_02")
  {
    window.location = "/index?t=schedule&c=apr_02";
  }  
  else if (sel == "may_02")
  {
    window.location = "/index?t=schedule&c=may_02";
  }  
  else if (sel == "june_02")
  {
    window.location = "/index?t=schedule&c=june_02";
  }  
  else if (sel == "july_02")
  {
    window.location = "/index?t=schedule&c=july_02";
  } 
  else if (sel == "aug_02")
  {
    window.location = "/index?t=schedule&c=aug_02";
  } 
  else if (sel == "sept_02")
  {
    window.location = "/index?t=schedule&c=sept_02";  
  } 
  else if (sel == "oct_02")
  {
    window.location = "/index?t=schedule&c=oct_02";  
  } 
  else if (sel == "nov_02")
  {
    window.location = "/index?t=schedule&c=nov_02";  
  }  
  
  

  else
  {}
}
]]></SCRIPT>
  </xsl:template>
</xsl:stylesheet>
