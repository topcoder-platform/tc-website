<%--
  - Author: TCSDEVELOPER
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio home page.
  -
  - Version 1.1 (Studio Release Assembly 1) Change notes:
  - * The layout of this page was updated to include several modifications: (among others)
  -    * New banner carousel.
  -    * New Design Showcase section.
  -    * New Thoughts From The Blog section.
  -    * New Contest Chatter section.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>

<% ResultSetContainer activeContests = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("active_contests");%>
<% ResultSetContainer totalPrizePaidRS = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("total_prize_paid");%>
<% NumberFormat formatter = NumberFormat.getInstance();
   formatter.setParseIntegerOnly(true);
   String totalPrizePaid = formatter.format(totalPrizePaidRS.getFloatItem(0,0)+134598);%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>Welcome to TopCoder Studio</title>

        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_studio_home"/>
        </jsp:include>

        <%-- Javascript code --%>
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

        <script type="text/JavaScript" src="/js/FeedLoader.js"> </script>
        <script type="text/JavaScript" src="/js/RSSProcessor.js"> </script>
        <script type="text/JavaScript" src="/js/AJAXProcessor.js"> </script>
        <script type="text/javascript" src="/js/NewStyleHeaderFooter/carousel/jquery.jcarousel.js"></script>
        <script type="text/javascript" src="/js/NewStyleHeaderFooter/carousel/scripts.js"></script>
    </head>

    <c:set var="contests" value="<%=activeContests%>"/>
    <c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
    <c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
    <c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

    <body onLoad="loadHomePageFeeds();">
        <div id="page-wrap">
            <jsp:include page="top.jsp">
                <jsp:param name="section" value="home"/>
            </jsp:include>

            <br />
            <%--  main content --%>
            <div id="wrapper">
                <div class="home_content">
                    <div id="top_part">
                        <div id="mycarousel" class="jcarousel-skin-tango">
                            <div class="jcarousel-control">
                                <a href="#" class="bt6" id="tab6">6</a>
                                <a href="#" class="bt7" id="tab7">7</a>
                            </div>
                            <ul>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/1.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/2.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/3.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/4.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/5.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="#"><img width="909" height="203" src="i/v4/6.png" alt="" /></a>
                                </li>
                                <li
                                    <a href="#"><img width="909" height="203" src="i/v4/7.png" alt="" /></a>
                                </li>
                            </ul>
                            <div class="jcarousel-control">
                                <a href="#" class="bt1_5 bt1" id="tab1"><span>1</span></a>
                                <a href="#" class="bt1_5 bt2" id="tab2"><span>2</span></a>
                                <a href="#" class="bt1_5 bt3" id="tab3"><span>3</span></a>
                                <a href="#" class="bt1_5 bt4" id="tab4"><span>4</span></a>
                                <a href="#" class="bt1_5 bt5" id="tab5"><span>5</span></a>
                            </div>
                            <div class="jcarousel-scroll">
                                <form action="">
                                    <a href="#" id="mycarousel-prev"></a><a href="#" id="mycarousel-next"></a>
                                </form>
                            </div>
                        </div><%-- End of #mycarousel --%>
                    </div><%-- End of #top_part --%>
                    <div id="center_content">
                        <c:if test="${not empty contests}">
                            <div id="active_contest">
                                <div id="active_contest_head">
                                    <span class="active_contests_head">ACTIVE CONTESTS</span>
                                    <span class="prize_purse_head">PRIZE PURSE</span>
                                    <span class="time_left_head">TIME LEFT</span>
                                </div>
                                <div id="active_contest_content">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="first"></th>
                                                <th class="second"></th>
                                                <th class="last"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <rsc:iterator list="<%=activeContests%>" id="resultRow" end="6">
                                                <tr>
                                                    <td class="first">
                                                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
                                                             <rsc:item name="name" row="<%=resultRow%>"/>
                                                        </a>
                                                    </td>
                                                    <td class="second">
                                                        <rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                                                    </td>
                                                    <td class="last">
                                                        <%
                                                        int hours = (int)((((Date)(resultRow.getItem("end_time").getResultData())).getTime() - 
                                                            System.currentTimeMillis()) / 1000 / 3600);
                                                        if (hours < 24) {
                                                            out.print(hours + " hour");
                                                            if (hours > 1) {
                                                                out.print("s");
                                                            }
                                                        } else {
                                                            out.print((hours / 24) + " Day");
                                                            if (hours >= 48) {
                                                                out.print("s");
                                                            }
                                                        }
                                                        %>
                                                    </td>
                                                </tr>
                                            </rsc:iterator>
                                        </tbody>
                                    </table>
                                    <div id="view_contest_button">
                                        <a href="/?module=ViewActiveContests">View All <%=activeContests.size()%>
                                            Active Contests
                                        </a>
                                    </div>
                                </div><%-- End of #active_contest_content --%>
                            </div><%-- End of #active_contest --%>
                        </c:if>
                        <div id="showcase">
                            <div id="showcase_head">
                                <h1>DESIGN SHOWCASE</h1>
                            </div>
                            <div id="showcase_content">
                            </div><%-- End of #showcase_content --%>
                        </div><%-- End of showcase --%>
                    </div><%-- End of center_content --%>
                </div><%-- End of .home_content --%>
                <div id="bottom_wrapper">
                    <div class="home_content">
                        <div id="bottom_part">
                            <div id="bottom_part_l">
                                <div id="thoughts_from_blog">
                                </div>
                                <div id="post_content">
                                </div>
                                <div id="left_more">
                                    <a href="/blog/">more<img src="i/v4/arrow_r.png" /></a>
                                </div>
                            </div>
                            <div id="bottom_part_r">
                            </div>
                        </div>
                        <br class="clear"/>
                    </div><%-- end of home_content of bottom --%>
                </div><%-- end of bottom_wrapper --%>
            </div>

            <%-- LINKS BLOCK --%>
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


					<%-- designer box --%>
					<div class="designerBox">
						<h2>DESIGNER OF THE MONTH</h2>
						<p>
							<img class="member" width="57" height="63" alt="Designer of the Month" src="http://<%=ApplicationServer.SERVER_NAME%>/i/m/nophoto.jpg"/>
							<b>June 2009</b><br />
							<b><a href="http://studio.topcoder.com/?module=ViewMemberProfile&ha=iamtong">iamtong</a></b>
							won $4,625 in 5 contests!<br /><br />
					  <b><a href="http://www.topcoder.com/news/2009/07/20/meet-the-june-coders-and-designers-of-the-month/">Read The Interview</a></b>
						</p>
					</div>


                </div><%-- .wrapper ends --%>
            </div><%-- #links block ends --%>
        </div><%-- #page-wrap ends --%>

        <%-- FOOTER BLOCK --%>
        <div id="footer">
            <div class="wrapper2">
                <p id="footer_1800"><strong>1-866-TOPCODER or Service@TopCoder.com</strong></p> <%--chjanged from id--%>
                <p>TopCoder is the world's largest competitive software development community with over 185,000 developers representing over 200 countries.</p>
                <p>Copyright &copy;2001-2009, TopCoder, Inc. All rights reserved.</p>
            </div><%-- .wrapper ends --%>
        </div><%-- #footer ends --%>

        <%--  Analytics --%>
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-6340959-3");
                pageTracker._trackPageview();
            } catch(err) {}
        </script>
    </body>
</html>
