<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="com.topcoder.web.winformula.Constants"%>

<c:set value="<%=Constants.WISDOM_ALL%>" var="WisdomOfAllId"/>
<c:set value="<%=Constants.WISDOM_BEST%>" var="WisdomOfTheBestId"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Homepage</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
  
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="homepage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <div id="sidebar">
                <div class="post-box blogPost">
                    <h2 class="titleLatestBlog"><span class="hide">Latest Blog Posts</span></h2>
                    <jsp:include page="?module=RSSFeeder&feed=blog" />
                </div>
                
                <div class="post-box">
                    <h2 class="titleLatestForum"><span class="hide">Latest Forum Posts</span></h2>
                    <jsp:include page="?module=RSSFeeder&feed=forum" />
                </div>
                
                <div class="post-box">
                    <h2 class="titleLatestStories"><span class="hide">Latest Stories</span></h2>
                    <jsp:include page="?module=RSSFeeder&feed=espn" />
                </div>
            </div>
            
            <div id="mainbar">
                <div id="advertisement">
                    <div class="emptyBoxTop"></div>
                        <div class="emptyBoxBottom">
                            <h2 class="titleWrite"> <span class="hide"> Wisdom of the Code </span></h2>
                            <div class="prize">
                                <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete" class="learnButton" title="Learn More"><span>Learn More</span></a>
                            </div>
                        <div class="explanation">ESPN has teamed up with TopCoder to find out what will happen when the best programmers in the world get their hands on the most comprehensive college football game data ever compiled! How will your algorithm stack up against the competition?</div>
                </div>
            </div>
            
            <div class="results-box">
                <h2 class="titleResults"><span class="hide">Results</span></h2>
                <table width="282px" class="stat" align="center">
                  <thead>
                    <tr>
                      <th>#</th>
    
                      <th>Handle</th>
                      <th>%</th>
                      <th>Pts.</th>
                      <th>Picks</th>
                    </tr>
                  </thead>
                  <tbody>
    
                    <tr>
                      <th colspan="5" class="resultsAndLeaders"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewStandings&amp;week=${lp.weekId}" class="viewLink">All ${lp.weekDesc} Results</a>&nbsp;${lp.weekDesc} Top 5</th>
                    </tr>
    
                  <c:forEach items="${weekStandings}" var="standingsItem">
                    <c:choose>
                        <c:when test="${standingsItem.coderId == WisdomOfAllId || standingsItem.coderId == WisdomOfTheBestId || standingsItem.coderId == showUserId}">
                            <tr class="newSection">
                        </c:when>
                        <c:otherwise>
                            <tr>
                        </c:otherwise>
                    </c:choose>
                      <td class="alignCenter">${standingsItem.rank}</td>
                      <td><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}&amp;week=${lp.weekId}">${standingsItem.handle}</a></td>
                      <td ><fmt:formatNumber value="${standingsItem.winPercent}" pattern="0.00"/> %</td>
                      <td ><fmt:formatNumber value="${standingsItem.points}" pattern="0"/></td>
                      <td ><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}">picks</a></td>
                    </tr>
                  </c:forEach>
                    <%-- commented till mini 2 starts <tr> --%>
                      <%-- retain commenting here for now 
                      <th colspan="2" class="resultsAndLeaders"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewStandings&amp;msi=${lp.miniSeasonId}" class="viewLink">All ${lp.miniSeasonDesc} Leaders</a></th>
                      <th class="resultsAndLeaders">&nbsp;</th>
                      <th colspan="2" class="resultsAndLeaders">${lp.miniSeasonDesc} Top 5</th>
                      --%>
                      <%-- commented till mini 2 starts --%> 
                      <th colspan="5" class="resultsAndLeaders"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewStandings&amp;msi=${lp.miniSeasonId}" class="viewLink">All ${lp.miniSeasonDesc} Leaders</a>&nbsp;${lp.miniSeasonDesc} Top 5</th>
                    </tr>
                    <c:forEach items="${miniSeasonStandings}" var="standingsItem">
                        <c:choose>
                            <c:when test="${standingsItem.coderId == WisdomOfAllId || standingsItem.coderId == WisdomOfTheBestId || standingsItem.coderId == showUserId}">
                                <tr class="newSection">
                            </c:when>
                            <c:otherwise>
                                <tr>
                            </c:otherwise>
                        </c:choose>
                      <td class="alignCenter">${standingsItem.rank}</td>
                      <td><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}&amp;week=${lp.weekId}">${standingsItem.handle}</a></td>
                      <td ><fmt:formatNumber value="${standingsItem.winPercent}" pattern="0.00"/> %</td>
                      <td ><fmt:formatNumber value="${standingsItem.points}" pattern="0"/></td>
                      <td><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}">picks</a></td>
                    </tr>
                  </c:forEach>
                  <%-- --%>
                  </tbody>
                </table>
            </div>
            
            <div class="overall-box">
                <h2 class="titleLeader"><span class="hide">Overall Leaders</span></h2>
                <table width="282px" class="stat" align="center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Handle</th>
                            <th>%</th>
                            <th>Pts.</th>
                            <th>Picks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${overallStandings}" var="standingsItem">
                            <c:choose>
                                <c:when test="${standingsItem.coderId == WisdomOfAllId || standingsItem.coderId == WisdomOfTheBestId || standingsItem.coderId == showUserId}">
                                    <tr class="newSection">
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                </c:otherwise>
                            </c:choose>
                          <td class="alignCenter">${standingsItem.rank}</td>
                          <td><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}&amp;week=${lp.weekId}">${standingsItem.handle}</a></td>
                          <td ><fmt:formatNumber value="${standingsItem.winPercent}" pattern="0.00"/> %</td>
                          <td ><fmt:formatNumber value="${standingsItem.points}" pattern="0"/></td>
                          <td><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}">picks</a></td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
                <p><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewStandings" class="viewLink">View Complete Standings</a></p>
            </div>
            
            <div class="full-content">
                <p><strong>Participation in ESPN Winning Formula Challenge is completely FREE! <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete">Click Here</a> to find out how to compete.</strong></p>
                <br />
                <%-- Old info 
                <p>Participation in ESPN Winning Formula Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview:</p>
                <ol class="howCompete">
                    <li><strong><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" target="_blank">Sign up</a> to become a TopCoder member</strong> (select at least the &quot;Competition Registration&quot; checkbox)<br />
                    ESPN Winning Formula Challenge is run using TopCoder's patented competition engine and administered by TopCoder's professional competition staff. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step 2.  <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" target="_blank">Sign up at TopCoder &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Register</a> for the Winning Formula Challenge</strong><br />
                    Once you are a TopCoder member, all you have to do is register for the Winning Formula Challenge! Register now to participate in this contest!  <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Contest registration &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ViewProblemStatement">Read the problem statement</a></strong><br />
                    The problem statement explains the task, scoring mechanism, and specification to the competitor so that the code works with TopCoder's judging engine.  <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ViewProblemStatement">View the problem statement &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats">Download ESPN's statistical data</a> and build your algorithm</strong><br />
                    Now that you've registered and read the problem statement, you'll need to download ESPN's statistical data on which your algorithm will be basing its predictions. Use this data to test your algorithm locally.  <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats">Download the data &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ManageMyAlgorithms">Submit your algorithm</a></strong> (through November 11th)<br />
                    After August 12th, you can submit your algorithm at any time. Your code will be judged by the performance of your algorithm during each mini-season (a period of 3-4 weeks as detailed below. Your algorithm will lock in at 12:01 EDT on the day before each mini-season, but you can make changes for the next mini-season at any time through week 11. After November 11th (day before week 12 and the last mini-season), you may not make any changes to your algorithm and your latest uploaded algorithm will be used for the final mini-season.  <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ManageMyAlgorithms">Submit your algorithm &gt;&gt;</a></li>
                    <li><strong>Win Cash!</strong><br />
                    Prizes will be awarded to the season winner and possibly to the next nine finishers. Weekly prizes will also be awarded, even for the "preseason" weeks. While the prize breakout is to be determined, there will be a total of $100,000 awarded!</li>
                </ol>
                --%>
            </div>
            
            <div class="emptyBoxTop"></div>
            <div class="emptyBoxBottom">
                <div class="rightContentBox">
                    <h2 class="titleWisdom"> <span class="hide">Wisdom of the Code</span></h2>
                        <p>We've created two automated contestants based on the community's picks. <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_ALL%>">WisdomOfAll</a> is based on the community's average picks and <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_BEST%>">WisdomOfTheBest</a> is based on the average picks of the top 10 overall contestants after each week. See how contestants score against the Wisdom of the Code!<br /><br />
                        <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=wisdomCode" class="learnButton" title="Learn More"><span>Learn More</span></a></p>


                </div>
                <div class="imgLeft"> <img src="/i/events/winformula/brain.png" alt="Helmet" /> </div>
            </div>
            
            
            <%--  <h2 class="titlePredicted"> <span class="hide"> Predicted Results For This Week's Top Games </span></h2>
            <table border="0" align="center" cellpadding="0" width="100%" class="predict-table">
                <tr>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=639">Texas Tech</a></td>
                    <td class="alignRight dottedRight">35</td>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=640">Michigan St</a></td>
                    <td class="alignRight dottedRight">15</td>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=638">Michigan</a></td>
                    <td class="alignRight dottedRight">11</td>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=621">Pittsburgh</a></td>
                    <td class="alignRight dottedRight">21</td>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=651">BYU</a></td>
                    <td class="alignRight dottedRight">22</td>
                    <td><a class="black" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=614">Miami (FL)</a></td>
                    <td class="alignRight">18</td>
                </tr>
                <tr>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=639">Oklahoma</a></strong></td>
                    <td class="alignRight dottedRight"><strong>41</strong></td>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=640">Penn St</a></strong></td>
                    <td class="alignRight dottedRight"><strong>32</strong></td>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=638">Ohio St</a></strong></td>
                    <td class="alignRight dottedRight"><strong>30</strong></td>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=621">Cincinnati</a></strong></td>
                    <td class="alignRight dottedRight"><strong>27</strong></td>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=651">Utah</a></strong></td>
                    <td class="alignRight dottedRight"><strong>32</strong></td>
                    <td><strong><a class="red" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;game=614">Georgia Tech</a></strong></td>
                    <td class="alignRight"><strong>22</strong></td>
                </tr>
            </table>
            <p class="info">*Based on <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_BEST%>">WisdomOfTheBest's picks</a>. See also <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&cr=<%=Constants.WISDOM_ALL%>">WisdomOfAll's picks</a>.</p>
            <br /><br /><br />  --%>
        </div>
        
        <div><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete"><img src="/i/events/winformula/timeline_sm.png" alt="Winning Formula Timeline" /></a></div>
        <br />
        
                      
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>
  
    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>