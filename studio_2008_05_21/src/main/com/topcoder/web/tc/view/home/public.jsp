<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

function swapTopTen(topTenID){
    currTopTen = document.getElementById(topTenID);
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

<body onload="init();MM_preloadImages('/i/home/catcDigitalRun.png','/i/home/catcDesign.png','/i/home/catcDevelopment.png','/i/home/catcAssembly.png','/i/home/catcBugraces.png','/i/home/catcMarathon.png','/i/home/catcAlgorithm.png','/i/home/catcStudio.png')">

<%--
<div style="position:absolute; left:200px; top:190px;">
<A href="<tc-webtag:linkTracking link='http://www.theball.com' refer='/tc' />" target="_blank"><img src="/i/interface/tinyBrackets.png" alt="" /></A>
</div>
--%>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
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
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center">
   <jsp:include page="big_promo.jsp" />
      <br><br>
    <table border="0" cellspacing="0" cellpadding="0" width="525">
    <tr>
        <td class="newsTitle" align="right" colspan="2"><i>TopCoder News</i></td>
    </tr>
    <jsp:include page="news.jsp" />
    </table>
      <br><br>
     <jsp:include page="news_archives.jsp" />
      <br><br>
     <jsp:include page="arena.jsp" />
 </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">

    <%-- UNCOMMENT AFTER [TCWEB-322] is done
    <jsp:include page="activeContestsBox.jsp" />
    --%>

    <div>
    <img src="/i/interface/rightNavTop.png" alt="" style="display: block;"/>
    </div>

    <div class="rightNav">
        <div class="setWidth">
            <div class="contain">

                <div align="center">
                    <img src="/i/home/top10.png" alt="Top 10" style="display:block;" />
                </div>

                <div style="padding-bottom: 10px;" align="center">
                <form name="f" action="#">
                    <select name="topTen" onchange="swapTopTen(this.value)">
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

