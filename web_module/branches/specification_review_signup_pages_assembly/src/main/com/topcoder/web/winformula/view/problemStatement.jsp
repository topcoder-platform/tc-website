<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Problem Statement</title>
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
        <jsp:param name="tabLev1" value="compete" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <h1>Problem Statement: FootballPrediction</h1>
                <div class="full-content">
                    <table>
                        <tbody>
                            <tr>
                                <td colspan="2"><h2>Problem Statement</h2></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <h3>Introduction</h3>
                                    <p>Your task in this problem is to predict the outcome of <a href="http://en.wikipedia.org/wiki/College_Football">college football</a> games. You must design an algorithm which predicts the final scores of each week's games based on historical data from games already played. For each game since 2004, you will be given data about every play that occurred during the game, along with some additional summary statistics.</p>
                                    
                                    <h3>Implementation Details</h3>
                                    <p>Your algorithm will be given historical data one week at a time, in chronological order. After each week of historical data, you may be asked to predict the outcome of the next week's games. During example testing, you will always be asked to predict the outcomes of all of the next week's games, to provide the maximum sample size. Furthermore, during example testing you will be asked to provide predictions for all the upcoming games in the 2008 season, not just the next week's games. During the actual testing, however, you will only be asked to provide predictions for one week's games -- the ones which have not occurred yet and are coming up next.</p>
                                    <p>To perform these predictions, you must implement two methods. The first, data, will take a String[], <strong>plays</strong> each element of which represents one play in one game in one week. A second input String[], <strong>players</strong>, will give summary statistics for all the players involved in the week's games. Finally, <strong>summary</strong> will give the results of each game. The second method, predict, will take the names of two teams, as well as the date of the game (formatted as YYYYMMDD), and the location of the stadium they will play in. It should then return a int[] with two elements, the first of which is the home team score and the second of which is the away team score. The team and stadium names will appear as they do in the summary data.</p>
                                    
                                    <h3>Scoring</h3>
                                    <p>This prediction competition will be scored in four parts as shown in the competition schedule. Submissions received prior to each mini-season deadline will be evaluated on all the games in that mini-season. Your solution will be run multiple times in each mini-season -- once per week -- using the most up to date statistics. For each game, you can receive a maximum of 100 points for predicting the exact score of the game. These 100 points are broken down as follows:</p>
                                    <ul class="howCompete2">
                                        <li>Picking the correct winner: 60 points</li>
                                        <li>Picking the correct winner and being off by D on the margin:
                                            <ul class="howCompete2">
                                                <li>D = 0, 20 points</li>
                                                <li>D = 1, 18 points</li>
                                                <li>D = 2, 16 points</li>
                                                <li>D = 3, 13 points</li>
                                                <li>D = 4, 10 points</li>
                                                <li>D = 5, 7 points</li>
                                                <li>D = 6, 4 points</li>
                                                <li>D = 7, 1 points</li>
                                                <li>D > 7, 0 points</li>
                                            </ul>
                                        </li>
                                        <li>For each team, if you are off by X points in your prediction of that team's score, you will receive 10-X points with a minimum of 0</li>
                                    </ul>
                                    <p>For example, let’s say that you predict team A will beat team B 10 to 9, but in reality the score is 15 to 10, with team A winning. You will get 60 points for predicting the correct winner. Your prediction had a spread of 1, while the true spread was 5, so you get 10 points for D=4. You were off by 5 points in your prediction of on team's score, and off by 1 in your prediction of the other team's score, so you get 5+9=14 points for that. Thus your overall score will be 60+10+14=84. If, on the other hand, team B had beat team A by a score of 10 to 9, you would get 0 points for predicting the winner and the spread (you only get spread points if you predict the right winner). Your score predictions would be close, however, and you'd get a total of 18 points. Your overall score will simply be the sum of your individual game scores.</p>
                                    <h3>Data</h3>
                                    <p>The data files for all previous games are available for download in CSV format. Descriptions of the fields are available for the <a href="http://www.topcoder.com/contest/problem/FootballPrediction/playbyplay.html">play-by-play</a> data, the <a href="http://www.topcoder.com/contest/problem/FootballPrediction/players.html">player</a> data, and the <a href="http://www.topcoder.com/contest/problem/FootballPrediction/summary.html">summary</a> data. Feel free to ask further questions related the data in the forums.</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Definition</h2></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Class:</td>
                                                <td>FootballPrediction</td>
                                            </tr>
                                            <tr>
                                                <td>Method:</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td>Parameters:</td>
                                                <td>String[], String[]</td>
                                            </tr>
                                            <tr>
                                                <td>Returns:</td>
                                                <td>int</td>
                                            </tr>
                                            <tr>
                                                <td>Method signature:</td>
                                                <td>int data(String[] plays, String[] summary)</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>Method:</td>
                                                <td>predict</td>
                                            </tr>
                                            <tr>
                                                <td>Parameters:</td>
                                                <td>String, String, String, String</td>
                                            </tr>
                                            <tr>
                                                <td>Returns:</td>
                                                <td>int[]</td>
                                            </tr>
                                            <tr>
                                                <td>Method signature:</td>
                                                <td>int[] predict(String home, String away, String stadium, String date)</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">(be sure your method is public)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Notes</h2></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <ul class="howCompete2">
                                        <li>The time limit for processing all the weekly data and making all the predictions is 9 minutes.</li>
                                        <li>The memory limit is 1024M.</li>
                                        <li>An invalid prediction for a game (negative score, invalid return, etc.) will result in 0 points for that game.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Constraints</h2></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <ul class="howCompete2">
                                        <li>The time limit is 9 minutes. This includes receiving data and making all the predictions.</li>
                                        <li>The memory limit is 1024M.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                
                <hr />
                <p>This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. &copy;2003, TopCoder, Inc. All rights reserved.</p>
                </div>
        </div>
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>