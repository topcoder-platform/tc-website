<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Studio :: The Digital Run</title>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../../top.jsp"/>
            <jsp:include page="../../topNav.jsp">
                <jsp:param name="node" value="digitalrun"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<h1>Prizes</h1>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="prizes"/>
</jsp:include>

Each month, competitors will accumulate placement points according to the points table. In addition to the competition prize earnings, the top five (5) finishers will win large prizes and the top 1/2 of the point-getters in each Stage will receive a smaller prize. A total of 50% of the total Studio Cup prize pool will be awarded in bonus prizes each month and will be distributed as follows: 
<br /><br />
<strong>Top Five Monthly Prizes</strong><br />
<strong>1st</strong> - 50%<br />
<strong>2nd</strong> - 25%<br />
<strong>3rd</strong> - 13%<br />
<strong>4th</strong> - 8%<br />
<strong>5th</strong> - 4%
<br /><br />
If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order): 
<ol>
<li>The competitor who has the most higher-placed submissions in the month.</li>
<li>If a tie still remains, then the tied competitors will share equally the prize money at hand.</li>
</ol>
<strong>Top Half Monthly Prizes</strong><br />
The remaining 50% of the Studio Cup prize pool will be distributed among the top &#189; of point-getters (all competitors tied for the last spot will be included) and will be allocated based on the value of each placement point. 
<br /><br />
<%--
<strong>For example:</strong><br />
A total of 120 designers accumulate placement points during the Stage. We will sum the total number of placement points accumulated by the top 60 designers and divide $100,000 by that number to find the dollar per placement point bonus that is available to those 60 designers. If the total placement points of those 60 designers are 5,000, then each point is worth $20 ($100,000/5,000 = $20 per placement point). Each of the top 60 designers, including the top 5, will receive $20 for each placement point they earned during the Stage. In addition, the top 5 point-getters in each Stage will receive the Top Five Stage prizes outlined above.
<br /><br />
--%>
As an added prize, the top point-getter of each month in 2008 (July - December) will win a trip to the 2009 TCO finals to be recognized. At the TCO awards presentation, the overall highest point-getter for the entire year will be recognized as the winner of the TopCoder&#174; Studio Cup. 
<br /><br />
Digital Run prize money will be paid at the end of each month within 60 days of announcing the Top Five and Top Half money winners.
<br /><br />

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../../foot.jsp"/>

    </div>
</body>
</html>