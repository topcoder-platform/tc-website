<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505538" message="Discuss this match" /></div>
<span class="bodySubtitle">2002 TopCoder Invitational<br>Online Round #3</span><BR/>Wednesday, October 23, 2002
<br><br>

<H1> The Problems </H1> 

<font size="+2"><b>Billboard</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505538" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 1<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">250 / 253 (98.81%)   
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">225 / 250 (90.00%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>venco</b> for 247.10 points 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          217.00
        </td>
      </tr>          
    </table>
    </blockquote>
<P>
26 out of 251 coders who opened Billboard, received 0 points.
Reference implementation: <B>SnapDragon</B>
</P>

<P>
<B>Implementation</B>
</P>


<P>
I think the problem was extremely easy to solve for Round 3 Invitational. The difficulty level of this problem is more like Div-II Level One problem.
</P>

<P>
To solve the problem one should allocate a string array (5 x a.length()*6-1) and fill this array with '.'
Go through all the letters of the desired string and find their mapping in the input array.
</P>

<P>
Once we have found a Y coordinate in the input array of the letter to be inserted, copy a 5x5 letter from the input array to the output buffer: 
</P>

<PRE>
for( x = 0; x &lt; 5; x++ ) 
   for( y = 0; y &lt; 5; y++ ) 
      ret[y][6*i +x] = b[Y][6*y+x+2]; 
(where i is a desired string index)
</PRE>
    


<font size="+2"><b>Resort</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505538" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 2<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">500 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">213 / 253 (84.19%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">99 / 213 (46.48%) 
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 439.44 points 
        </td>
      </tr> 
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          315.18   
        </td>
      </tr>         
    </table>
    </blockquote>
<P>
 144 out of 243 coders who opened Resort, received 0 points.
Reference implementation: <B>SnapDragon</B>
</P>
   
<P>
<B>Implementation</B>
</P>

<P>
One of the ways to solve this problem is to build an adjacency matrix. All values of the matrix shall be initialized to a very high number. 0 node in the matrix is the base of the mountain. Let set the easy level as 0, medium as 1 and hard as 2 inside the adjacency matrix. Now for any three nodes on the mountain a, b and c assume a&gt;b, b&gt;c, a&gt;c then select a max from a&gt;b and b&gt;c then compare that maximum value to a&gt;c and select the minimum and assign to matrix value for a&gt;c.
</P>

<P>
The outer loop should iterate 'b' nodes. Second nested loop shall iterate 'a' nodes and the third nested loop shall iterate 'c' nodes
</P>

<PRE>
for( b = 0; b &lt; nam.size(); b++ ) 
   for( a = 0; a &lt; nam.size(); a++ ) 
      for( c = 0; c &lt; nam.size(); c++ ) 
         path[a][c] &lt;?= path[a][b] &gt;? path[b][c]; 
Now the matrix is fully solved for all nodes and we just have to pick the 
correct one to return.
</PRE>    

<BR/>

<font size="+2"><b>RiverHill</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505538" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
 
Used as: Level 3<BR/>
<blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">119 / 253 (47.03%)   
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">56 / 119 (47.06%)  
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ante</b> for 749.62 points
        </td>
      </tr> 
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Points</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          505.37  
        </td>
      </tr>          
    </table>
    </blockquote>
<P>
190 out of 246 coders who opened RiverHill, received 0 points.
Reference implementation: <B>ante</B>
</P>

    
<P>
<B>Implementation</B>
</P>

<P>
The brute force approach would work for this problem: try to start a river from all the locations on the map and select the location where river would cover the maximum area.
</P>

<P>
For every location one shall use a floodfill-like algorithm, or a breadth-first search, on the map. One shall worry about the efficiency on the floodfill algorithm, since you might be doing it 1600 times on a 40x40 grid, but with some number of optimizations it shall work. Well, it did work for some of the successful submissions.
</P>

<p>
<img src="/i/m/slavik_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="160082" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

