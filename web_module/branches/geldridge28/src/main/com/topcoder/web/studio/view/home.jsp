<%--
  - Author: pulky, isv
  - Version: 1.4
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
  -
  - Version 1.2 (BUGR-2268) Change Notes:
  -    * Added carousal buttons #6 and #7.'Compete' and 'Post a Project' links to external pages.
  -    * Added banner rotation every 5 sec. on carousal.
  -    * Right justified the prize amount.
  -    * Added proper links on RSS feeds for 'Thoughts for blogs' and 'Contest Chatter'.
  -
  - Version 1.3 (BUGR-2786) Change Notes:
  -    * If the milestone date has not been reached, use this date to calculate time left 
  -
  - Version 1.4 (Studio Enhancements Release Assembly 1) Change Notes:
  -    * Thoughts From The Blog entry now shows an excerpt from the blog entry
  -    * instead of entire entry.
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

		<!--[if lt IE 7]>
				<script type="text/javascript" src="js/pngfix/unitpngfix.js"></script>
		<![endif]--> 		

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
        <script type="text/javascript" src="/js/jquery.timers.js"> </script> <%-- BUGR-2268: Timers library added --%>
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
                            <div class="jcarousel-control loadWorkaround" 	style="position:relative;">
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/new-member-guide/" class="bt6_compete" id="tab6_compete">6_compete</a>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&d1=support&d2=getStarted" class="bt7_post_project" id="tab7_post_project">7_post_project</a>
                             </div>
                            <ul>
                                <li>
                                    <a href="http://www.topcoder.com/tco10"><img width="909" height="203" src="i/v4/8.png" alt="2010 TopCoder Open!" /></a>
                                </li>
                                    <!--<a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco10&d3=overview&d4=patron"><img width="909" height="203" src="i/v4/tco10-nsa-studio.png" alt="NSA - Event Patron - 2010 TopCoder Open" /></a>-->
                                    <!--<a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco10&d3=overview&d4=sponsor1"><img width="909" height="203" src="i/v4/tco10-yandex-studio.png" alt="Yandex - Event Sponsor - 2010 TopCoder Open" /></a>-->
                                <li style="display:none" class="loadWorkaround">
                                   <a href="http://www.topcoder.com/news/2010/06/10/meet-the-may-coders-and-designers-of-the-month-2/">--><img width="909" height="203" src="i/v4/2.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="http://www.topcoder.com/reg/"><img width="909" height="203" src="i/v4/6.png" alt="" /></a>
                                </li>
                                <li style="display:none" class="loadWorkaround">
                                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&d1=support&d2=startingACompetition"><img width="909" height="203" src="i/v4/7.png" alt="" /></a>
                                </li>
                                <li>
                                    <a href="http://www.topcoder.com/tco10"><img width="909" height="203" src="i/v4/8.png" alt="2010 TopCoder Open!" /></a>
                                </li>
                                <li style="display:none" class="loadWorkaround">
                                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&d1=support&d2=memberRefferalProgram"><img width="909" height="203" src="i/v4/3.png" alt="" /></a>
                                </li>
                                <li style="display:none" class="loadWorkaround">
                                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests"><img width="909" height="203" src="i/v4/1.png" alt="" /></a>
                                </li>
                            </ul>
                            <div class="jcarousel-control loadWorkaround" style="position:absolute; top:225px; left:160px;">
                                <a href="#" class="bt1_5 bt1" id="tab1"><span>1</span></a>
                                <a href="#" class="bt1_5 bt2" id="tab2"><span>2</span></a>
                                <a href="#" class="bt1_5 bt3" id="tab3"><span>3</span></a>
                                <a href="#" class="bt1_5 bt4" id="tab4"><span>4</span></a>
                                <a href="#" class="bt1_5 bt5" id="tab5"><span>5</span></a>
                                <a href="#" class="bt1_5 bt6" id="tab6"><span>6</span></a>
                                <a href="#" class="bt1_5 bt7" id="tab7"><span>7</span></a>
                             </div>
                            <div class="jcarousel-scroll loadWorkaround" style="position:absolute; top:215px; left:160px;">
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
                                    <span class="prize_purse_head">PURSE</span>
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
                                                        Date endDate;
                                                        Object milestoneDate = resultRow.getItem("milestone_date").getResultData(); 
                                                        if (milestoneDate != null && (new Date()).before((Date) milestoneDate)) {
                                                            endDate = (Date) milestoneDate;
                                                        } else {
                                                            endDate = (Date)(resultRow.getItem("end_time").getResultData());
                                                        }
                                                        
                                                        int hours = (int)(((endDate).getTime() - 
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
                            <!-- <div id="bottom_part_r"> -->
                            </div>
                        </div>
                        <br class="clear"/>
                    </div><%-- end of home_content of bottom --%>
                </div><%-- end of bottom_wrapper --%>
            </div>

        </div><%-- #page-wrap ends --%>

        <jsp:include page="foot.jsp">
            <jsp:param name="section" value="home"/>
        </jsp:include>

    </body>
</html>
