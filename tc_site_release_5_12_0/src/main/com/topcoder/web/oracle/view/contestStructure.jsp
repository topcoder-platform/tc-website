<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

            <div style="margin-bottom: 20px;">
                <A href="/"><img src="/i/oracle/layout/topcoder.png" alt="TopCoder" /></A>
            </div>
            
            <jsp:include page="nav.jsp" >
            <jsp:param name="selectedTab" value="structure"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
            </jsp:include>
            
            <div id="bodyColumn">

                <p>
                The competition will be structured as a series of single elimination rounds.  The twist is that the candidates will be eliminated, not the competitors.  This narrowing down of candidates will eventually lead to the determination of the results of the Studio contest.  The candidates will be randomly assigned to a set of rooms.  Rooms will contain at most 50 candidates and candidates will be evenly distributed across rooms.  We will assign competitors to rooms in a round robin fashion.  That means that if there are two rooms, competitor #1 is assigned to room #1, competitor #2 is assigned to room #2, competitor #3 is assigned to room #1, etc.
                </p>
                <p> 
                Candidates will be displayed to competitors in random order.  Competitors are then expected to select and order the top N candidates from the candidates in their room.  Once competitors are satisfied with their ordering of selected candidates, they submit their prediction.  After the competition period is over, TopCoder will tabulate the results, meaning that we will figure out which candidates will advance to the next round.  We will also determine the prize winners from the pool of competitors based on whose predictions were the most accurate.  The number of competition rounds will be determined by the number of candidates and the number of candidates that advance per room.
                 </p>
                <p>
                In order to determine which candidates advance, we will take the predictions from the competitors and process them through the <A target="_blank" href="http://en.wikipedia.org/wiki/Schulze_method">Schulze method voting system</A>.  That will give us the top X candidates per room that will advance to the next round.  Those competitors that most accurately predicted the results of the Schulze election will be awarded prizes:
                <div align="center" style="clear: both; margin-bottom: 10px;">
                    <table cellpadding="3" cellspacing="0">
                    <tbody>
                    <tr><td align="center" style="border-right: 1px solid #999999;"><strong>1st</strong></td><td align="center">$500</td></tr>
                    <tr><td align="center" style="border-right: 1px solid #999999;"><strong>2nd</strong></td><td align="center">$250</td></tr>
                    <tr><td align="center" style="border-right: 1px solid #999999;"><strong>3rd</strong></td><td align="center">$100</td></tr>
                    </tbody>
                    </table>
                </div>

            </div>

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>