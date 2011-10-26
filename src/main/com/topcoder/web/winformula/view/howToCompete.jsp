<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - How To Compete</title>
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
        
        
            <h1>How to Compete</h1>
            <div class="full-content">
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
                    Prizes will be awarded to the season winner and possibly to the next nine finishers. Some pretty decent prizes will also be awarded at the conclusion of each mini-season. All in all, there will be a total of $100,000 awarded!</li>
                </ol>
                <br />
                <div align="center"><img src="/i/events/winformula/timeline.png" alt="Winning Formula Timeline" /></div>
                <h2><em>Full details</em></h2>
                <br />
                
                
                <h2>Registration</h2>
                <p>In order to compete in the ESPN Winning Formula Challenge one must first register and account on the TopCoder website <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">here</a>. Once you have that account, you can register for the ESPN Winning Formula Challenge <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001">here</a>. At that point, you will have all of the tools at your disposal to craft a winning formula and earn your chance to win your share of the $100,000 purse!</p>
                
                
                <h2>The problem definition and historical data</h2>
                <p>Your first stop in crafting a solution will be to go to the Manage My Algorithms link on the navigation bar above or go <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ManageMyAlgorithms">here</a>. On this page it will show you all of the formulas you have previously submitted, and will allow you to link to the predictions made by your currently submitted solution. On this page there will be a link to the problem definition.</p>
                <p>The problem definition is a specification for submitting a solution in one of five programming languages: C++, C#.NET, VB.NET, Java, and Python. Follow the instructions on that page to create a file with the source code of your solution. On this page you will also be able to download the historical data that your code will always be supplied with so that you can run your simulation locally before you submit it.</p>
                
                
                <h2>Submitting a solution</h2>
                <p>Once you are ready to submit a solution, navigate to the Manage My Algorithms link. You will see a Submit option on that page; clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language, and submit your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown on the Manage My Algorithms page. If the compilation was successful, the submission will then be placed on a queue for automated testing; you will know this by seeing the words "In Queue". This indicates your place in line to wait for your predictions to be processed by your submission.</p>
                <p>When your submission has finally been processed, you will receive an email indicating such and you will then be able to see your predictions from that algorithm by clicking View Picks in the Actions column across from your submission. The prediction page will show you the predicted score for each match that occurs for each week within the span time between now and the end of the current mini-season. If for some reason your algorithm failed to run, the errors returned by your algorithm and the testing system will be returned in a Program Returned field, broken down into debug messages (from <code>stdout</code>), error messages (from <code>stderr</code>), and fatal errors returned by the system. These fields will also be shown for correctly working algorithms for debugging purposes.</p>
                <p>You may only submit and see your new predictions once every 4 hours. There is no penalty for multiple submissions, and competitors are encouraged to resubmit as many times as they want in order to perfect their winning formulas.</p>
                
                
                <h2>Schedule and lock-in</h2>
                <p>The algorithms will be tasked with predicting the results of the 15-week NCAA college football season for Fall of 2008. These predictions will be broken up into four 3-4 week periods called mini-seasons. The mini-seasons are scheduled as follows:</p>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="stat">
                    <tr>
                        <th class="alignCenter">Mini-season 1: "Preseason"<br />-- August 28th to September 17th</th>
                        <th class="alignCenter">Mini-season 2: "Homecoming"<br />-- September 18th to October 15th</th>
                        <th class="alignCenter">Mini-season 3: "Rivalries"<br />-- October 16th to November 12th</th>
                        <th class="alignCenter">Mini-season 4: "The Red Zone"<br />-- November 13th to December 10th</th>
                    </tr>
                </table>
                <br />
                <p>When you have the submission you want to use for your predictions, make sure it is the last submission on the Manage My Algorithms link. When time elapses for submissions on the next mini-season (always at 12:01AM EDT, or 12:01AM EST if after November 2, 2008, on the day before the start of the next mini-season), that algorithm will be flagged with an indicator showing that it will be used for that mini-season. At this point the algorithm is locked in, meaning that it can no longer be changed, and it will be used to make the predictions for that mini-season.</p>
                
                
                <h2>Prediction results and scoring</h2>
                <p>Once the NCAA College Football season starts, you can look at the predictions that your algorithms have made on the "My Profile" link on the navigation bar above. That page will show you the prediction your algorithm for that mini-season made, the actual results of that game (if they are yet available) and the scoring for that algorithm. You will also see some comparison metrics illustrating how you are doing against the rest of the community, such as ranking, winning percentage, and current score.</p>
                <p>Your predictions will be scored using the following formula. Each prediction will start off by scoring 100 points, just for being there. Once the actual results are in, your prediction will be penalized by how far off it was from the correct result as follows:</p>
                <ol class="howCompete">
                    <li>If you predict the wrong winner, you will lose 60 points.</li>
                    <li>If you predict the incorrect margin of victory, you will be penalized on the following scale:<br />
                        <table width="35%" border="0" cellpadding="0" cellspacing="0" class="stat">
                            <tr class="light">
                                <td class="alignCenter">Correct margin of victory</td>
                                <td class="alignCenter">0</td>
                            </tr>
                            <tr class="dark">
                                <td class="alignCenter">1 point off</td>
                                <td class="alignCenter">-2</td>
                            </tr>
                            <tr class="light">
                                <td class="alignCenter">2 points off</td>
                                <td class="alignCenter">-4</td>
                            </tr>
                            <tr class="dark">
                                <td class="alignCenter">3 points off</td>
                                <td class="alignCenter">-7</td>
                            </tr>
                            <tr class="light">
                                <td class="alignCenter">4 points off</td>
                                <td class="alignCenter">-10</td>
                            </tr>
                            <tr class="dark">
                                <td class="alignCenter">5 points off</td>
                                <td class="alignCenter">-13</td>
                            </tr>
                            <tr class="light">
                                <td class="alignCenter">6 points off</td>
                                <td class="alignCenter">-16</td>
                            </tr>
                            <tr class="dark">
                                <td class="alignCenter">7 points off</td>
                                <td class="alignCenter">-19</td>
                            </tr>
                            <tr class="light">
                                <td class="alignCenter">8 or more points off</td>
                                <td class="alignCenter">-20</td>
                            </tr>
                        </table>
                    </li>
                    <li>For each side, you will lose 1 point (up to 10 points per side) for each point you are away from the correct score for that side.</li>
                </ol>
                <p>This formula is designed so that the lowest score on a prediction is 0, and the highest score is 100.</p>
                <p>Winners for each mini-season will be chosen by summing the scores of their predictions for the time period that encompasses that mini-season. The overall winner of the ESPN Winning Formula challenge will be the member who has the highest score over all games in the NCAA College Football season.</p>
                
                
                <h2>Communication</h2>
                <p>There are many ways to communicate with your competitors and the administrators of the competition to ask questions and exercise bragging rights. <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums">Forums will be available</a> to answer any questions you have regarding the competition or to discuss events related to NCAA College Football. Please keep in mind that <em>at no time are you allowed to disclose the method that any of your algorithms use to create predictions</em>, regardless of whether or not they are your most recent algorithm. If you have a question about your particular situation that you wish to keep private or you cannot legally discuss on the forums, you may send a request to the administrator's email <a href="mailto:service@topcoder.com">here</a>, who will respond to you in a timely manner.</p>
                <p>Administrators will also post announcements and responses to <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums?module=ThreadList&amp;forumID=2&amp;mc=1">this forum</a>. It is your responsibility to keep informed by checking the forums for problem clarifications and format changes. The administration will make their best efforts to inform particular members in the event of a rule change during the process of the competition.</p>

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
