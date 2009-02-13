<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="summary"/>
        <jsp:param name="tabLev3" value="room2"/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>ACRush wins Room 2!</span></h1>
            <p><img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
            <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518015">Discuss this match</A><br />Wednesday, October 31, 2007<br />Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/></p>
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/shotR2.jpg"></p>
            <br /><br />
            
            <p><strong>The highest rated TopCoder member <tc-webtag:handle coderId="19849563" context="algorithm"/> had plenty of strong opponents in Semi 2 - <tc-webtag:handle coderId="309982" context="algorithm"/> and <tc-webtag:handle coderId="7390224" context="algorithm"/> (two former 3000+ coders), <tc-webtag:handle coderId="21971539" context="algorithm"/> and <tc-webtag:handle coderId="7421158" context="algorithm"/> (both at the top of their form) and the third highest rated coder <tc-webtag:handle coderId="7442498" context="algorithm"/> (he is also the highest rated polish coder, the title worth many others). Nevertheless, the rating favorite cruised through the packed field with correct solutions for all 3 problems and an impressive win. <tc-webtag:handle coderId="7390224" context="algorithm"/> came second with only a slight lead over third-placed <tc-webtag:handle coderId="7421158" context="algorithm"/>. <tc-webtag:handle coderId="7442498" context="algorithm"/>, <tc-webtag:handle coderId="309982" context="algorithm"/> and <tc-webtag:handle coderId="7563318" context="algorithm"/> rounded the top 6 and extended their title campaign for at least one more day. Good luck to all advancers and hope they'll succeed in the Incredible Race as well!</strong></p>


            
            <br /><br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm"/></p>

<h2>SongsList</h2>

<p>
Let's fix one of 6 possible formats for the song 0 and determine all possible positions of this song, written in this particular format, in the sorted list.
To do this, we divide all the other songs into 3 categories:
</p>

<p>
<ol>
<li>The songs, which come before song 0 lexicographically in any of 6 possible formats.</li>
<li>The songs, which come after song 0 lexicographically in any of 6 possible formats.</li>
<li>All the songs, not included into the previous 2 categories.</li>
</ol>
</p>

<p>
Let C1, C2 and C3 be the number of songs in each of 3 categories, correspondingly, and N be the total number of songs (including song 0).
It's easy to see, that we can't put song 0 into positions 0, 1, ..., C1-1 in the sorted list, because C1 songs from category 1 are
always lexicographically smaller than song 0. Similarly, we can't put song 0 into positions N-C2, N-C2+1, ..., N-1, because C2 songs
from category 2 are always lexicographically larger than song 0. But what about positions Ñ1, C1+1, ..., N-C2-1? We can put song 0
into each of these positions. To put it into position X, C1 &le; X &lt; N-C2, we need to write X-C1 songs from category 3 in such way,
that they are lexicographically smaller than song 0, and all the other songs from category 3 in such way, that they are lexicographically
larger than song 0.
</p>

<p>
We've described all the possible positions of song 0, written in one particular format, in the sorted list. To obtain the answer,
we just need to repeat this procedure for all 6 formats of song 0 and return the union of all available positions.
</p>


<h2>FlashFlood</h2>

<p>
The solution of this problem consists of two parts. In the first part, we break the relief into parts (we call this parts "basins"), using the following
algorithm. To find the first basin, we start from the town and draw the horizontal ray to the left until it crosses the relief. The part above the relief
and under the ray forms the first basin. To find the second basin, we start from the end of the first one and climb to the left until we reach the local
peak. Then we again draw the horizontal ray to the left and form the second basin. The process is repeated to form more basins and terminated
when the ray doesn't cross the relief. The picture below illustrates the process:
</p>

<p><center><img src="/i/education/tccc07AlgoSemi02Basins.gif"></img></center></p>

<p>Each basin is drawn by its own color - red, green or blue. Each basin has the area (flooded in the picture) and the speed of rain (shown
using the arrows of basin's color). As only rain fills all the area of the basin, it's become overflooded. Obviously, water starts
flooding the town exactly, when the rightmost basin will become overflooded.</p>

<p>Now comes the second part of the solution, in which we just simulate the process. In this part, we calculate for each basin the time,
needed to overflood it (this time is basin's free area, divided by basin's rain speed), and choose the basin, which will be overflooded
first. If it's the rightmost basin, then the process is finished. Otherwise, the water from the overflooded basin will become flow
to the basin immediately to the right. Now, from our point of view, the overflooded basin and the basin immediately to the right
can be treated as one larger basin. The area, the filled area and the speed of rain in this new basin equal to the sum of areas,
filled areas and rain speeds in two old basins. We replace two old basins by the new one and continue simulation. The described procedure
is repeated until the rightmost basin will be overflooded.
</p>


<h2>ReliefMeasuring</h2>

<p>
Let's call a map <em>correct</em>, if it might be accurate, and <em>incorrect</em> otherwise. First we establish some properties of
correct maps.
</p>

<p><em>Basic criteria.</em> A map is correct with peak at cell (R, C) if and only if there are no two neighbouring cells A and B such,
that A is a 1-cell, B is a 0-cell and B is closer to the peak than A.</p>

<p><em>Proof.</em> If there are such two cells A and B, then A's height is greater than some constant value,
and B's height is not, so A's height is greater than B's height. It means, that the map doesn't satisfy to the property from the
problem statement, i.e. it is incorrect. From the other hand, if there are no such two cells A and B, then we can assign height 1 to
each 1-cell and height 0 to each 0-cell. This assignment satisfies to the property from the problem statement, so the map is correct.
<em>End of proof.</em></p>

<p>
Now let's find some deeper properties of correct maps with peak at cell (R, C). It's easy to see that the map, containing only 0-cells,
is correct. As this case is easy to check, we'll consider only maps, containing at least one 1-cell. Let LC be the index of the leftmost
column of the map, containing at least one 1-cell, and RC be the index of the rightmost such column.
</p>

<p><em>Property 1.</em> LC &le; C &le; RC. Each column c, LC &le; c &le; RC, contains at least one 1-cell.

<p><em>Proof.</em> Let (r1, LC) be any 1-cell in LC-th column of the map and (r2, RC) be any 1-cell in RC-th column of the map.
If LC &gt; C, then pair of cells A=(r1, LC), B=(r1, C) won't satisfy to the basic criteria. If RC &lt; C then pair of cells
A=(r2, RC), B=(r2, C) won't satisfy to the basic criteria. If some column c, LC &lt; c &le; C, doesn't contain
1-cells, then pair of cells A=(r1, LC), B=(r1, c) won't satisfy to the basic criteria. At last, if some column c, C &le; c &lt; RC,
doesn't contain 1-cells, then pair of cells A=(r2, RC), B=(r2, c) won't satisfy to the basic criteria. <em>End of proof.</em></p>

<p>
According to the property 1, for each column c, LC &le; c &le; RC, there are numbers st<sub>c</sub> - the row index of the topmost
1-cell in the column c, and fn<sub>c</sub> - the row index of the bottommost 1-cell in the column c. The following two properties
can be proven in the similar way, as it was done while proving the property 1 (i.e. we suppose the property doesn't hold and find
the pair of cells which doesn't satisfy to the basic criteria), so their proof is left to readers.
</p>

<p><em>Property 2.</em> For each column c, LC &le; c &le; RC, and each row index r, st<sub>c</sub> &le; r &le; fn<sub>c</sub>,
the cell (r, c) will be the 1-cell.

<p><em>Property 3.</em> The following inequalities will hold:
<ul>
<li>st<sub>LC</sub> &ge; st<sub>LC+1</sub> &ge; ... &ge; st<sub>C-1</sub> &ge; st<sub>C</sub> &le; st<sub>C+1</sub> &le; ... &le;
st<sub>RC-1</sub> &le; st<sub>RC</sub>;</li>
<li>fn<sub>LC</sub> &le; fn<sub>LC+1</sub> &le; ... &le; fn<sub>C-1</sub> &le; fn<sub>C</sub> &ge; fn<sub>C+1</sub> &ge; ... &ge;
fn<sub>RC-1</sub> &ge; fn<sub>RC</sub>;</li>
<li>st<sub>c</sub> &le; R &le; fn<sub>c</sub>, for every c, LC &le; c &le; RC.</li>
</ul>

<p>It can be proven, that if map satisfies to all 3 established properties, it will also satisfy to the basic criteria, so correct maps
are exactly those maps, which satisfy to all 3 properties. This fact allows us to solve the problem using dynamic programming. As we
can brute force all possible values of R, let's suppose for the next paragraphs, that the value of R is fixed.</p>

<p>Note, that every map can be broken into two parts - the <em>left</em> part consists of columns between 0 and C, inclusive, and the <em>right</em>
part consists of columns between C+1 and last, inclusive. Let F(i, j, k) be the minimal number of characters, we need to replace in
the columns of map between 0 and i, inclusive, in such way, that these columns will form the left part of a correct map with
C=i, st<sub>C</sub>=j and fn<sub>C</sub>=k.</p>

<p>To calculate F(i, j, k), we use dynamic programming. It is possible that LC=i, in this case we need to change all cells
in columns between 0 and i-1, inclusive, to 0-cells. It is also possible that LC&lt;i, in this case we can iterate through
all possible values of st<sub>i-1</sub> and fn<sub>i-1</sub>, st<sub>i</sub> &le; st<sub>i-1</sub> &le; R &le; fn<sub>i-1</sub> &le; fn<sub>i</sub>,
and try to add i-th column to the best possible left part for the columns between 0 and i-1, inclusive (it's cost is F(i-1, st<sub>i-1</sub>,
fn<sub>i-1</sub>)). Among all possible cases we choose the best one.</p>

<p>Let G(i, j, k) be the minimal number of characters, we need to replace in the columns of map between i+1 and last, inclusive,
in such way, that these columns will form the right part of a correct map with C=i, st<sub>C</sub>=j and fn<sub>C</sub>=k.
Note, that G-values can be calculated using dynamic programming in a similar way as it was done when calculating F-values.</p>

<p>Now, when we have F and G, it's easy to get the answer. We need to iterate through all possible values of C, st<sub>C</sub> and fn<sub>C</sub>,
and note, that if C, st<sub>C</sub> and fn<sub>C</sub> are fixed, then the minimal number of changes for the correct map is obtained
by gluing the best corresponding left and right parts together, i.e. this number equals to F(C, st<sub>C</sub>, fn<sub>C</sub>) +
G(C, st<sub>C</sub>, fn<sub>C</sub>).</p>


            
            

        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>