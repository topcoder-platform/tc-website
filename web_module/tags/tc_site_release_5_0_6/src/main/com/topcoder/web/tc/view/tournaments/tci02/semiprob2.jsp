<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <jsp:include page="links_summary.jsp" />
<BR CLEAR="all"/>         
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Problem Analysis & Opinion</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<p>Friday, November 22, 2002</p>

<a name="Isoceles"></a><font size="+2"><b>Isoceles</b></font><BR/><font size="-1">
Used as: Level 1</font><h4>Implementation</h4><p>
This is one of the easier problems of this round.  The input is limited to 50 points, so there is no problem with simply checking all combinations of three points, which is simply O(n<sup>3</sup>).  Once we have three points, we just have to determine if the three points form a right isoceles triangles.  To determine if three points form a right triangle, we have to check and see if each of the three points is the vertex of an isoceles triangle with a right angle.  It is trivial to find if the triangle is isoceles, since we can simply use the pythagorean theorem to find the length of each edge coming out of the chosen point.  Then, all we have to see is if the triangle is right.  You could use some complicated trigonometry to figure this out, but there is a much easier way.  We know from the pythagorean theorem, that any right triagle with hypotoneuse c, has a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>.  The converse is also true, and every triangle with a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup> is a right triangle.  So, the solution looks something like:
</p>
<pre>
int count = 0;
for(int i = 0; i&lt;numPoints; i++)
for(int j = i+1; j&lt;numPoints; j++)
for(int k = j+1; k&lt;numPoints; k++){
    int a = (x[i]-x[j])*(x[i]-x[j])+(y[i]-y[j])*(y[i]-y[j]);
    int b = (x[i]-x[k])*(x[i]-x[k])+(y[i]-y[k])*(y[i]-y[k]);
    int c = (x[j]-x[k])*(x[j]-x[k])+(y[j]-y[k])*(y[j]-y[k]);
    if((a == b && a + b == c) || (a == c && a + c == b) || (b == c && b + c == a))
        count++;
}
</pre>

<p>&#160;</p><a name="Escape"></a><font size="+2"><b>Escape</b></font><BR/><font size="-1">
Used as: Level 2</font><h4>Implementation</h4>
<p>
In this problem, we have a graph with up to 500 * 500 = 250000 vertices.  Each edge is weighted either 0 or 1.  So, clearly a depth first search is out of the question, as it will take 250000<sup>2</sup> iterations in worst case.  Djikstra's, however will run in time easily, with a worst case of 250000*log(250000).  However, implementing Djikstra's requires using a priority queue, which is a bit of work.  Instead, we can solve this problem with a breadth first search, mainting two simple first in first out queues.  We start by breadth first searching from the start, (0,0), to find all locations that can be reached going through 0 harmful locations.  As we do this, we maintain another queue of locations adjacent to those which can be reached going through 0 harmful locations and are not deadly.  After we find all of the locations that can be reached going through 0 harmful locations, we start working on the other queue which contains all regions reachable going through 1 harmful location.  So, we just continually do this, maintaining a working queue, and a frontier queue, where all vertices in the frontier queue require exactly going through exactly one more harmful location than those in the working queue.  In pseudocode, where queue is just a first in first out queue, and visited could simply be an array:
</p><pre>
queue working, frontier;
set visited;
working.add(0,0);
visited.add(0,0);
int swaps = 0;
while(working is not empty or frontier is not empty){
    if(working is empty){
        working = frontier;
        frontier = new queue;
        swaps++;
    }
    point p = working.removeFirst();
    if(p is (500,500))return swaps;
    for each(t adjacent to p not in visited){
        if(t is deadly)continue;
        else if(t is harmful) {
            frontier.add(t);
            visited.add(t);
        }else{
            working.add(t);
            visited.add(t);
        }
    }
}
return -1;
</pre>
<p>&#160;</p><a name="SumSort"></a><font size="+2"><b>SumSort</b></font><BR/><font size="-1">
Used as: Level 3</font><h4>Implementation</h4><p>
Obviously, with the range going up to 1000000000, sorting all numbers will not work.  The most straightforward way to solve this is probably to write a method, which given a target sum, and an integer, top, finds how many numbers between 0 and top, inclusive, have the given sum.  This method clearly has to be sublinear, and a simple way to do it is to use dynamic programming on the number of digits, to find the number for each number of digits.  You start with 1 digit, and can get each of the sums 0..9 in 1 way.  Then, with n+1 digits, you can find how many number there are with a given sum, m, by taking the sum from i = 0 to 9 of the number of ways to get the sum m-i with n digits.  Then, given any number you can find the number of ways to get the sum m something like this:
</p><pre>
int count(int n, int target){
    if(n==0)return target==0?1:0;
//where dp[i][j] represents the number of ways to get the sum j, with i digits
    int digits = (int)(log(n)/log(10)+1E-9);
    int ret = dp[digits][target];
    ret += count((int)(n-Math.pow(10,digits)),target-1);
    return ret;
}
</pre>
<p>
Once you have this method written, you can easily find the sum at the index with a simple linear search.  You then set the index to be the original index minus the number of numbers with a sum which is between 0 and the sum-1, inclusive.  This will give you the index of the number in the range that has the correct sum.  After that a binary search will allow you find the exact number in logorithmic time.
</p>


<IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          </TD>
            </TR>                  
            <!-- <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/invit02/Betting.pdf" CLASS="bodyText">Betting</A><BR/>
Level Two (500) - <A HREF="/i/invit02/Roadmap.pdf" CLASS="bodyText">Roadmap</A><BR/>
Level Three (1000) - <A HREF="/i/invit02/Omaha.pdf" CLASS="bodyText">Omaha</A><BR/>

          </TD>
            </TR> -->
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
              

<BR/><B>CODING PHASE</B><BR/>
11:00:04 AM - dgarthur opens the Level One problem<BR/>
11:00:08 AM - lars opens the Level One problem<BR/>
11:00:30 AM - reid opens the Level One problem<BR/>
11:00:31 AM - dmwright opens the Level One problem<BR/>
11:05:45 AM - reid submits the Level One problem for 193.47 points (final submission)<BR/>
11:06:19 AM - reid opens the Level Two problem<BR/>
11:06:30 AM - dgarthur submits the Level One problem for 190.40 points (final submission)<BR/>
11:06:40 AM - dgarthur opens the Level Two problem<BR/>
11:12:16 AM - dmwright submits the Level One problem for 172.39 points (final submission)<BR/>
11:12:30 AM - dmwright opens the Level Three problem<BR/>
11:13:06 AM - lars submits the Level One problem for 167.75 points (final submission)<BR/>
11:13:17 AM - lars opens the Level Two problem<BR/>
11:30:37 AM - lars submits the Level Two problem for 415.89 points (final submission)<BR/>
11:30:39 AM - reid submits the Level Two problem for 352.56 points (final submission)<BR/>
11:30:51 AM - dgarthur submits the Level Two problem for 353.69 points (final submission)<BR/>
11:30:58 AM - reid opens the Level Three problem<BR/>
11:31:06 AM - dgarthur opens the Level Three problem<BR/>
11:31:10 AM - lars opens the Level Three problem<BR/>
12:00:59 PM - dmwright opens the Level Two problem<BR/>
12:13:41 PM - dgarthur submits the Level Three problem for 465.73 points (final submission)<BR/>
12:14:12 PM - reid submits the Level Three problem for 461.94 points (final submission)<BR/><BR/>

<B>CHALLENGE PHASE</B><BR/>
No Activity<BR/>


          </TD>
            </TR>            
                                   
          </TABLE>


      </TD>
   </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
