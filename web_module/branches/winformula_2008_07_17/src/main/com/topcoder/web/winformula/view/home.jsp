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
    <script type="text/javascript" src="js/scripts.js"></script>
  
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
                    <ul class="headlines">
                        <li class="dottedBottom"><a href="#">Florida has a Sweet Game</a><br />
                            Suspendisse vitae nisi et dolor posuere scelerisque. Vivamus ornare est sit amet leo. Sed tincidunt, risus nec ultrices elementum...<br />
                        </li>
                        <li class="dottedBottom"><a href="#">Alas! Syracuse Doesn't Lose!!!</a><br />
                        Etiam scelerisque ante non nunc. Duis vehicula, ante at mollis facilisis, risus turpis vulputate dolor, a commodo felis arcu et erat...</li>
                        <li><a href="#">Last week's most improbable victories</a><br />
                        Suspendisse quis quam et lacus interdum ullamcorper. Suspendisse euismod ultrices elit. Curabitur malesuada dictum pede...</li>
                    </ul>
                <div class="clear"><a href="http://topcoderblogs.com/winningformula" class="viewButton" title="View All"><span>View All</span></a></div>
                </div>
                
                <div class="post-box">
                <h2 class="titleLatestForum"><span class="hide">Latest Forum Posts</span></h2>
                    <ul class="headlines">
                        <li class="dottedBottom"><a href="#">Why no love?!?!</a> 
                        <em>(by <a href="member.htm">Coderholic</a> on 2008-07-07 at 17:11)</em>
                        Why is it that my algorithm tastes so good yet doesn't pick the  winners...</li>
                        <li class="dottedBottom"><a href="#">Re: Did someone really pick UCLA over USC?</a> 
                        <em>(by <a href="member.htm">bytebrother</a> on 2008-07-07 at 15:51)</em>
                        I hear ya man. Well I wouldn't have said anything if I wasn't at the quicky mart buying a slurpie! lol...</li>
                        <li><a href="#">Sweet! Corn.</a> 
                        <em>(by <a href="member.htm">binary_mullet</a> on 2008-07-07 at 13:04)</em>
                        Does anyone have a good recipe for creamed corn? I'm going to the Nebraska game this...</li>
                    </ul>
                <div class="clear"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums" class="viewButton" title="View All"><span>View All</span></a></div>
                </div>
                
                <div class="post-box">
                <h2 class="titleLatestStories"><span class="hide">Latest Stories</span></h2>
                    <ul class="headlines">
                        <li class="dottedBottom"><a href="#">Why no love?!?!</a></li>
                        <li class="dottedBottom"><a href="#">Re: Did someone really pick UCLA over USC?</a></li>
                        <li><a href="#">Sweet! Corn.</a></li>
                    </ul>
                <div class="clear"><a href="http://sports.espn.go.com/ncf/index" class="viewButton" title="View All" target="_blank"><span>View All</span></a></div>
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
                        <p>We've created two automated contestants based on the community's picks. <a href="#">CommunityAverage</a> is based on the community's average picks and <a href="#">CommunityTop10</a> is based on the average picks of the top 10 overall contestants after each week. See how contestants score against the Wisdom of the Code!<br /><br />
                        <a href="communitymember.htm" class="learnButton" title="Learn More"><span>Learn More</span></a></p>
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