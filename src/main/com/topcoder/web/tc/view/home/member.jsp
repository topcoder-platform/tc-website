<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_home"/>
</jsp:include>

<script type="text/javascript" src="/js/main.js"  ></script>
<script type="text/javascript" src="/js/cookie.js"  ></script>
<script type="text/javascript" src="/js/slashtc20080411.js"  ></script>
<script type="text/javascript">
var currTopTen = null;
function swapTopTen(topTenID){
    hide('topTenAlgo');
    hide('topTenAlgoSchools');
    hide('topTenAlgoCountries');
    hide('topTenDes');
    hide('topTenDev');
    hide('topTenMM');
    showBlock(topTenID);
    createCookie('defaultTopTen',topTenID,365);
}

function init() {
   id = readCookie('defaultTopTen');
   if (id == null) id = 'topTenAlgo';
   
   for (var i = 0; i < document.f.topTen.length; i++) {
      if (document.f.topTen.options[i].value == id) {
         document.f.topTen.selectedIndex = i;
         break;
      }
   }
   
   swapTopTen(id);
}
</script>
</head>

<body onload="init();MM_preloadImages('/i/home/catcDigitalRunV2.png','/i/home/catcDesignV2.png','/i/home/catcDevelopmentV2.png','/i/home/catcAssemblyV2.png','/i/home/catcBugracesV2.png','/i/home/catcMarathonV2.png','/i/home/catcAlgorithmV2.png','/i/home/catcStudioV2.png')">

<%--
<div style="position:absolute; left:200px; top:190px;">
<a href="<tc-webtag:linkTracking link='http://www.theball.com' refer='/tc' />" target="_blank"><img src="/i/interface/tinyBrackets.png" alt="" /></a>
</div>
--%>

<jsp:include page="../top.jsp" >
   <jsp:param name="level1" value="competition"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="competition_home"/>
         </jsp:include>
         <jsp:include page="coder_of_month.jsp" />
      </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt="" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center">
    <jsp:include page="big_promo.jsp" />
  <br /><br />
    <table border="0" cellspacing="0" cellpadding="0" width="525">
    <tr>
        <td class="newsTitle" align="right" colspan="2"><em>TopCoder News</em></td>
    </tr>
    <jsp:include page="news.jsp" />
    </table>
    <br /><br />
    <jsp:include page="news_archives.jsp" />
    <br /><br />
    <jsp:include page="arena.jsp" />
 </td>
<!-- Center Column Ends -->

<!-- Gutter -->
 <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt="" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
 <td width="180">

    <jsp:include page="activeContestsBox.jsp" />

    <div>
    <img src="/i/interface/rightNavTop.png" alt="" style="display: block;" />
    </div>

    <div class="rightNav">
        <div class="setWidth">
            <div class="contain">

                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td><jsp:include page="message.jsp" /></td></tr>
                </table>
                <jsp:include page="my_stats_right.jsp" />

            </div>
        </div>
    </div>

    <div style="margin-bottom: 20px;">
    <img src="/i/interface/rightNavBottom.png" alt="" style="display: block;" />
    </div>
                
    <div>
    <img src="/i/interface/rightNavTop.png" alt="" style="display: block;" />
    </div>

    <div class="rightNav">
        <div class="setWidth">
            <div class="contain">

                <div align="center" style="margin-bottom: 4px;">
                    <img src="/i/home/top10.png" alt="Top 10" style="display:block;" />
                </div>

                <div style="padding-bottom: 10px;" align="center">
                    <form name="f" action="#">
                    <select name="topTen" onchange="swapTopTen(this.value);" >
                    <option value="topTenAlgo" selected="selected">Algorithm</option>
                    <option value="topTenAlgoSchools">Algorithm Schools</option>
                    <option value="topTenAlgoCountries">Algorithm Countries</option>
                    <option value="topTenDes">Design</option>
                    <option value="topTenDev">Development</option>
                    <option value="topTenMM">Marathon Matches</option>
                    </select>
                    </form>
                </div>
                
                <jsp:include page="top_coders.jsp" />
                <jsp:include page="top_schools.jsp" />
                <jsp:include page="top_countries.jsp" />
                <jsp:include page="top_designers.jsp" />
                <jsp:include page="top_developers.jsp" />
                <jsp:include page="top_mm_coders.jsp" />

            </div>
        </div>
    </div>

    <div>
    <img src="/i/interface/rightNavBottom.png" alt="" style="display: block;" />
    </div>

 </td>
<!-- Right Column Ends -->
   </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>
<%-- Google Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3257193-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>

</html>
