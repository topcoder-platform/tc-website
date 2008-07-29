<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Manage My Algorithms</title>
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
        <jsp:param name="tabLev1" value="manage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <%-- Temporarily Hidden 
            <div class="sub-navigation"><a href="manage-algorithms_queue.htm"></a> Manage My Algorithms | <a href="manage-algorithms_current-picks.htm">Current Algorithm's Predictions</a> | <a href="manage-algorithms_queue.htm">Queue Status</a></div>
            --%>
            <h1>Manage My Algorithms</h1>
                <div class="full-content">
                    <p style="font-size:20px;"><strong>Coming August 13th</strong></p>
                </div>
            <%-- Temporarily Hidden 
            <p class="note">[If a user is not logged in they will  see this <a href="login.htm">login page</a>.]</p>
            <h3>Your current algorithm was submitted on 2008-07-09 at 13:45:32 ET (<a href="manage-algorithms_current-picks.htm">view its predictions</a>)</h3>
            <p>&nbsp;</p>
            <div class="form-content">
                <h2>Submit New Algorithm</h2>
                <p>You can submit a new algorithm as many times as you like each week until the start of that week's first game. Weeks 1-4 are considered preseason and no points can be won. The season starts on week 5 and you may continue to update your algorithm through week 8. After week 8 you may not make any changes to your algorithm and your latest uploaded algorithm will be used for the remainder of the season (weeks 9-16).</p>
                <p class="note">[Users will  see either the following message or the upload form]</p>
                <p><strong class="hightlight">Your algorithm submitted on 2008-07-14 at 12:38:45 ET is  in the <a href="manage-algorithms_queue.htm">queue</a>.</strong> You must wait until your algorithm is out of the queue or 30 minutes (whichever takes longer) before submitting a new algorithm.</p>
                <form action="" class="formSubmitAlgorithm">
                    <dl>
                        <dt>
                            <label for="file">Algorithm File:</label>
                        </dt>
                        <dd>
                            <input name="file" type="file" id="file" size="50" />
                        </dd>
                    </dl>
                    <dl>
                        <dd>
                            <div class="floatLeftSubmit">
                                <a href="#" class="learnButton" title="Submit Algorithm"><span>Submit Algorithm</span></a>
                            </div>
                        </dd>
                    </dl>
                </form>
            </div>
            <hr />
            <p>&nbsp;</p>
                <h2>Your Algorithm History</h2>
                <table class="stat" width="100%">
                    <thead>
                        <tr class="resultTH">
                            <th><a href="#">Submitted</a></th>
                            <th class="center"><a href="#">Week(s) Used</a></th>
                            <th class="center"><a href="#">Accuracy</a></th>
                            <th class="center"><a href="#">Actions</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2008-07-14 at 12:38:45 ET</td>
                            <td class="alignCenter">&nbsp;</td>
                            <td class="alignCenter">&nbsp;</td>
                            <td class="alignCenter">(in queue)</td>
                        </tr>
                        <tr>
                            <td>2008-07-09 at 13:45:32 ET</td>
                            <td class="alignCenter"><a href="member.htm">4</a></td>
                            <td class="alignCenter">78%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                        <tr>
                            <td>2008-07-04 at 13:41:02 ET</td>
                            <td class="alignCenter"><a href="member.htm"></a></td>
                            <td class="alignCenter">72%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                        <tr>
                            <td>2008-07-04 at 09:22:53 ET</td>
                            <td class="alignCenter"><a href="member.htm">3</a></td>
                            <td class="alignCenter">74%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                        <tr>
                            <td>2008-06-28 at 14:15:37 ET</td>
                            <td class="alignCenter"><a href="member.htm">2</a></td>
                            <td class="alignCenter">66%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                        <tr>
                            <td>2008-06-21 at 11:55:04 ET</td>
                            <td class="alignCenter"><a href="member.htm"></a></td>
                            <td class="alignCenter">68%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                        <tr>
                            <td>2008-06-20 at 14:53:17 ET</td>
                            <td class="alignCenter"><a href="member.htm">1</a></td>
                            <td class="alignCenter">47%</td>
                            <td class="alignCenter"><a href="#">View Picks</a></td>
                        </tr>
                    </tbody>
                </table>
            --%>

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
