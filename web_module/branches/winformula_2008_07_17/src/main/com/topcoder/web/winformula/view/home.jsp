<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challange :: Powered by TopCoder - Homepage</title>
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
            
            <div class="full-content">
                <p>Participation in ESPN Winning Formula Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money!</p>
                <ol class="howCompete">
                    <li><strong><a href="/reg/" target="_blank">Sign up</a> for FREE to become a TopCoder member</strong> (select at least the &quot;Competition Registration&quot; checkbox)<br />
                    ESPN Winning Formula Challenge is run using a TopCoder programming contest. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step to. <a href="/reg/" target="_blank">Sign up at TopCoder &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Register</a> for the Winning Formula Challenge</strong><br />
                    If you are already a TopCoder member, all you have to do is register for the Winning Formula Challenge! Register now to participate in this contest! <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">Contest registration &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats">Download ESPN's statistical data</a> and build your algorithm</strong><br />
                    Once you've registered, you'll need to download ESPN's statistical data on which your algorithm will be basing its predictions. Use this data to build your algorithm. <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=downloadStats">Download the data &gt;&gt;</a>And <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=problemStatement">view the problem statement &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms">Submit your algorithm</a> each week</strong> (through week 11)<br />
                    You can submit your algorithm each week until the start of that week's first game. The season starts on week 1 and you may continue to update your algorithm through week 11. After week 11 you may not make any changes to your algorithm and your latest uploaded algorithm will be used for the remainder of the season (weeks 12-15). <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms">Submit your algorithm &gt;&gt;</a></li>
                    <li><strong><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete">Win Cash!</a></strong><br />
                    Prizes will be awarded to the season winner and possibly to the next nine finishers. Weekly prizes will also be awarded, even for the &quot;preseason&quot; weeks. While the prize breakout is to be determined, there will be a total of $100,000 awarded!</li>
                </ol>
            </div>
            
            <%-- Temporarily Hidden 
            <div class="weekly-box">
                <h2 class="titleWeekly"><span class="hide">Week 4 Winners</span></h2>
                <table width="97%" class="current-data">
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
                            <td class="alignCenter">1</td>
                            <td><a href="member.htm">fb_boss</a></td>
                            <td>88%</td>
                            <td>329</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt">
                            <td class="alignCenter">2</td>
                            <td><a href="member.htm">chekm8</a></td>
                            <td>83%</td>
                            <td>298</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr>
                            <td class="alignCenter">3</td>
                            <td><a href="member.htm">somegirl</a></td>
                            <td>76%</td>
                            <td>247</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt">
                            <td class="alignCenter">4</td>
                            <td><a href="member.htm">fantasyfber</a></td>
                            <td>75%</td>
                            <td>178</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr>
                            <td class="alignCenter"><strong>5</strong></td>
                            <td><a href="member.htm"><strong>CommunityTop10</strong></a></td>
                            <td>71%</td>
                            <td><strong>157</strong></td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt">
                            <td class="alignCenter">6</td>
                            <td><a href="member.htm">Twixter83</a></td>
                            <td>66%</td>
                            <td>127</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr>
                            <td class="alignCenter">7</td>
                            <td><a href="member.htm">ForRealzMomma</a></td>
                            <td>64%</td>
                            <td>124</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt">
                            <td class="alignCenter">8</td>
                            <td><a href="member.htm">ThaPantha</a></td>
                            <td>64%</td>
                            <td>117</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr>
                            <td class="alignCenter">9</td>
                            <td><a href="member.htm">QBHive</a></td>
                            <td>61%</td>
                            <td>109</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt">
                            <td class="alignCenter">10</td>
                            <td><a href="member.htm">YFL</a></td>
                            <td>60%</td>
                            <td>99</td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="newSection">
                            <td class="alignCenter"><strong>17</strong></td>
                            <td><a href="member.htm"><strong>MyMemberName</strong></a></td>
                            <td>59%</td>
                            <td><strong>96</strong></td>
                            <td><a href="#">picks</a></td>
                        </tr>
                        <tr class="alt newSection">
                            <td class="alignCenter"><strong>22</strong></td>
                            <td><a href="member.htm"><strong>CommunityAverage</strong></a></td>
                            <td>58%</td>
                            <td><strong>89</strong></td>
                            <td><a href="#">picks</a></td>
                        </tr>
                    </tbody>
                </table>
                <p><a class="viewLink" href="standings_weekx.htm">View All Week 4 Results</a></p>
            </div>
            
            <div class="overall-box">
            <h2 class="titleLeader"><span class="hide">Overall Leaders</span></h2>
            <table width="97%" class="current-data">
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
                        <td class="alignCenter">1</td>
                        <td><a href="member.htm">SouthSyde</a></td>
                        <td>84%</td>
                        <td>1432</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter">2</td>
                        <td><a href="member.htm">wicked_games</a></td>
                        <td>81%</td>
                        <td>1388</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr>
                        <td class="alignCenter">3</td>
                        <td><a href="member.htm">enterDragon</a></td>
                        <td>77%</td>
                        <td>1355</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter">4</td>
                        <td><a href="member.htm">fb_boss</a></td>
                        <td>72%</td>
                        <td>1279</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr>
                        <td class="alignCenter">5</td>
                        <td><a href="member.htm">call_me_sista</a></td>
                        <td>71%</td>
                        <td>1232</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter"><strong>6</strong></td>
                        <td><a href="member.htm"><strong>CommunityTop10</strong></a></td>
                        <td>68%</td>
                        <td><strong>1287</strong></td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr>
                        <td class="alignCenter">7</td>
                        <td><a href="member.htm">theprophet</a></td>
                        <td>68%</td>
                        <td>1188</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter">8</td>
                        <td><a href="member.htm">motrrrhead</a></td>
                        <td>62%</td>
                        <td>1045</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr>
                        <td class="alignCenter">9</td>
                        <td><a href="member.htm">somegirl</a></td>
                        <td>61%</td>
                        <td>997</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter">10</td>
                        <td><a href="member.htm">chekm8</a></td>
                        <td>61%</td>
                        <td>984</td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="newSection">
                        <td class="alignCenter"><strong>12</strong></td>
                        <td><a href="member.htm"><strong>MyMemberName</strong></a></td>
                        <td>60%</td>
                        <td><strong>980</strong></td>
                        <td><a href="#">picks</a></td>
                    </tr>
                    <tr class="alt">
                        <td class="alignCenter"><strong>38</strong></td>
                        <td><a href="member.htm"><strong>CommunityAverage</strong></a></td>
                        <td>58%</td>
                        <td><strong>932</strong></td>
                        <td><a href="#">picks</a></td>
                    </tr>
                </tbody>
            </table>
            <p><a href="standings.htm" class="viewLink">View Complete Standings</a></p>
            </div>
            --%>
            
            <div class="emptyBoxTop"></div>
            <div class="emptyBoxBottom">
                <div class="rightContentBox">
                    <h2 class="titleWisdom"> <span class="hide"> Wisdom of the Code </span></h2>
                        <p>We've created two automated contestants based on the community's picks. <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=wisdomCode">CommunityAverage</a> is based on the community's average picks and <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=wisdomCode">CommunityTop10</a> is based on the average picks of the top 10 overall contestants after each week. See how contestants score against the Wisdom of the Code!<br /><br />
                        <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=wisdomCode" class="learnButton" title="Learn More"><span>Learn More</span></a></p>
                </div>
                <div class="imgLeft"> <img src="/i/events/winformula/brain.png" alt="Helmet" /> </div>
            </div>
            
            <%-- Temporarily Hidden 
            <h2 class="titlePredicted"> <span class="hide"> Predicted Results For This Week's Top Games </span></h2>
            <table border="0" align="center" cellpadding="0" width="100%" class="predict-table">
                <tr>
                    <td><strong>Ohio State</strong></td>
                    <td class="alignRight dottedRight"><strong>13</strong></td>
                    <td>Arizona State</td>
                    <td class="alignRight dottedRight">16</td>
                    <td>Tennessee</td>
                    <td class="alignRight dottedRight">7</td>
                    <td><strong>Kansas</strong></td>
                    <td class="alignRight dottedRight"><strong>24</strong></td>
                    <td><strong>Army</strong></td>
                    <td class="alignRight dottedRight"><strong>21</strong></td>
                    <td><strong>LSU</strong></td>
                    <td class="alignRight"><strong>17</strong></td>
                </tr>
                <tr>
                    <td>Michigan</td>
                    <td class="alignRight dottedRight">10</td>
                    <td><strong>USC</strong></td>
                    <td class="alignRight dottedRight"><strong>18</strong></td>
                    <td><strong>Georgia</strong></td>
                    <td class="alignRight dottedRight"><strong>28</strong></td>
                    <td>Missouri</td>
                    <td class="alignRight dottedRight">14</td>
                    <td>NAVY</td>
                    <td class="alignRight dottedRight">13</td>
                    <td>Auburn</td>
                    <td class="alignRight">10</td>
                </tr>
            </table>
            <p class="info">*Based on <a href="#">CommunityAverage's picks</a>. See also <a href="#">CommunityTop10's picks</a>.</p>
            --%>
        </div>
                      
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