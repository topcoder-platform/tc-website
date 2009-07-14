<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%--
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("recent_winners");%>
--%>
<% ResultSetContainer activeContests = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("active_contests");%>
<% ResultSetContainer totalPrizePaidRS = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("total_prize_paid");%>
<% 
NumberFormat formatter = NumberFormat.getInstance();
formatter.setParseIntegerOnly(true);
String totalPrizePaid = formatter.format(totalPrizePaidRS.getFloatItem(0,0)+134598);%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Welcome to TopCoder Studio</title>
    
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_home"/>
    </jsp:include>
   
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
	
    <script type="text/JavaScript" src="/js/RSSProcessor.js"> </script>
    <script type="text/JavaScript" src="/js/AJAXProcessor.js"> </script>
</head>

<c:set var="contests" value="<%=activeContests%>"/>
<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

<body onLoad="loadWinners();loadNews()">
	<div id="page-wrap">
		<div align="center">

        <jsp:include page="top.jsp">
            <jsp:param name="section" value="home"/>
        </jsp:include>
        
    	<br />
<%--  main content --%>
<div id="wrapper">

<div id="content">
	
<%--  begin left container  --%>
<div class="content_l">

    <%--  welcome box  --%>
    <div class="welcome">
        <div id="welcome_head">
            <h1>Welcome to TopCoder Studio!</h1>

            <p>Show off your creative skills in a competitive environment and get paid for being the best!</p>
        </div>
        <div id="welcome_banner">
            <%-- default banner 
            <a href="/?module=ViewActiveContests"><img alt="Get Started Now!" src="/i/v3/welcome_banner.png" width="536" height="121" border="0"/></a>--%>
            
            <%-- TCO09 banner 
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tco09"><img alt="TopCoder Open 2009, Register Now!" style="margin:0 1px;"src="/i/536x121_banner.png" width="534" height="121" border="0"/></a>
            --%>
             <%-- Remix banner --%>
            <a href="http://www.topcoder.com/remix"><img alt="Think outside the Big Box with the Best Buy Remix API" src="/i/remix_banner.jpg" width="536" height="121" border="0"/></a>
         </div>
    </div>
    
     <%-- winners box --%>
    <div class="winners">
	<div id="winners">

    <script>
       function loadWinners() {
			  var rss = "/blog/?feed=rss2&cat=6";
              var template = "js/RecentWinnersTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("winners").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {
              document.getElementById("winners").innerHTML = "Error reading recent winners feed.";
         throw e;
          }
      }
    </script>
    
    	</div>
   </div>

    <%-- contest box --%>
    <c:if test="${not empty contests}">
    <div class="contests">
        <div>
            <h2><span>ACTIVE CONTESTS</span></h2>
            <span class="more"><a href="/?module=ViewActiveContests">View All <%=activeContests.size()%> Active Contests</a></span>
            <table>
                <thead>
                    <tr>
                        <th class="first">Contest</th>
                        <th class="second">Purse</th>
                        <th class="second">SC Points</th>
                        <th class="last">Deadline</th>
                    </tr>
                </thead>
                <tbody>
                <rsc:iterator list="<%=activeContests%>" id="resultRow" end="6">
				<tr>
					<td class="first">
							<a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
							<rsc:item name="name" row="<%=resultRow%>"/></a></td>
					<td class="second"><rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/></td>
					<td class="second"><rsc:item name="dr_points" row="<%=resultRow%>" format="######" ifNull="&nbsp;"/></td>
					<td class="last"><rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z" timeZone="${sessionInfo.timezone}"/></td>
				</tr>
                    </rsc:iterator>
                </tbody>
            </table>
            <div>
                <div></div>
            </div>
        </div>
    </div>
    </c:if>
</div>
 <%-- end left container --%>

 <%-- begin right container --%>
<div class="content_r">

    <%-- login box --%>
  
    
     <%-- prizes paid box --%>
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/"><div id="prizesPaidBox">
    	<p>$<%=totalPrizePaid%></p>
    </div></a>

     <%-- news box --%>
    <div id="newsBox" class="newsBox">
    <script>
       function loadNews() {
              var rss = "/blog/?feed=rss2";
              var template = "js/WhatsNewTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("newsBox").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {

              document.getElementById("newsBox").innerHTML = "Error reading news";
         throw e;
          }
       }
    </script>
    </div>
    
    <%--
    <div id="newsBox" class="newsBox">
    </div>

    <div>
    <script>
       function loadNews() {
              var rss = "rss/?feed=rss2";
              var template = "js/WhatsNewTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("newsBox").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {

              document.getElementById("newsBox").innerHTML = "Error reading news";
         throw e;
          }
       }
    </script>
    </div>
    --%>

	<%-- designer box --%>
    <div>
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&d1=support&d2=memberRefferalProgram"><img width="224" height="215" alt="Member Referral Program" src="/i/v4/member-referral-promo.jpg"/></a>
    </div>

    <%-- designer box --%>
    <div class="designerBox">
        <h2>DESIGNER OF THE MONTH</h2>
        <p>
            <img class="member" width="57" height="63" alt="Designer of the Month" src="http://<%=ApplicationServer.SERVER_NAME%>/i/m/nophoto.jpg"/>
            <b>June 2009</b><br />
            <b><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=iamtong">iamtong</a></b>
            won $4,625 in 5 contests!<br /><br />
      <%--      <b><a href="http://www.topcoder.com/news/2009/06/19/meet-the-may-coders-and-designers-of-the-month/">Read The Interview</a></b> --%>
        </p>

        <div></div>
    </div>

    <%-- assignement box --%>
    <div class="assignmentBox">
        <p class="simpleArrow">
            Have you signed your assignment document?<br />
            <img alt="More Info" src="/i/v3/right_arrow.png"/><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&d1=support&d2=assignmentDocFaq" class="img_c" >
            Click here for more info!</a>
        </p>
    </div><!--assignement box-->

</div> <!--content_r-->

<br class="clear"/>

</div>
 <%-- end content main --%>
</div>
 <%--  end wrapper --%>
</div>

<!-- LINKS BLOCK -->
    <div id="links">
        <div class="wrapper2">
            <div class="col">
                <h4>Customer Service</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Support</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy">Privacy Policy</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms &amp; Conditions</a></li>
                </ul>
            </div>
            
            <div class="col">
                <h4>About TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm">Public Relations</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/rss.jsp">RSS Feeds</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">Press Room</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=jobs">Working at TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=terms">Legal Information</a></li>
                </ul>

            </div>
            
            <div class="col">
                <h4>Platform Tools</h4>
                <ul><li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Upcoming+Contests">Pipeline</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/TopCoder+UML+Tool">UML Tool</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=22">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Component Catalog</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/">TopCoder Wiki</a></li>
                </ul>
          </div>
            
            <div class="col">
                <h4>TopCoder Community</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">TopCoder Community Home</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                </ul>
            
                <h4>TopCoder Blogs</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/blogs/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/blog/">Studio TopCoder</a></li>
                </ul>
            </div>
            
            <div class="col">
                <h4>My Account</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">TopCoder Registration</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">Manage Profile</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">TopCoder Digital Run</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Studio Cup</a></li>
                </ul>
            </div>
            
            <div class="col">
                <h4>Powered by TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Studio TopCoder</a></li>
                </ul>
            </div>

        </div><!-- .wrapper ends -->
    </div><!-- #links block ends -->
  </div><!-- #page-wrap ends -->
    
    <!-- FOOTER BLOCK -->
    <div id="footer">
        <div class="wrapper2">
            <p id="footer_1800"><strong>1-866-TOPCODER or Service@TopCoder.com</strong></p> <!--chjanged from id-->
            <p>TopCoder is the world's largest competitive software development community with over 185,000 developers representing over 200 countries.</p>
            <p>Copyright &copy;2001-2009, TopCoder, Inc. All rights reserved.</p>
        </div><!-- .wrapper ends -->
    </div><!-- #footer ends -->

 <%--  Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-6340959-3");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>
