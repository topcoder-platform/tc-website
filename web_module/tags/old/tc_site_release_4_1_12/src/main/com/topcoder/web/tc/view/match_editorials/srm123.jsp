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
<tc-webtag:forumLink forumID="505550" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 123</span><br>Tuesday, December 10, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>Etiquette</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505550" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">214 / 233 / (91.84%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">171 / 214 (79.91%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>yotaku</b> for 247.32 points 
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
Reference implementation: <B>yotaku</B> 
</P>
 
 
<P>
60 out of 231 coders, who opened Etiquette, received 0 points.
</P>


<h4>Implementation</h4>
<P>
The problem was very straightforward. It was easy as it had to be for a Div-II, Level 1 problem.
</P>

<P>
<PRE>To solve the problem go through entire string and do the following for every char:
if current char is 'L' set LadyfirstState=true;
if current char is 'G' and LadyfirstState is true then increment badGentelment count;
if current char is space LadyfirstState=false;</PRE>
</P>

<P>
Return badGentelment after a loop is completed.
</P>

<font size="+2"><b>TypingJob</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505550" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">550</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">117 / 233 (50.21%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">40 / 117 (34.19%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Adrian Kuegel</b> for 521.77 points 
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:<b>slavik</b> (practice room)

<P>
180 out of 220 coders, who opened TypingJob, received 0 points.
</P>

<BR/>
<h4>Implementation</h4>
<P>
The brute force can be used to solve this problem because we have 3 assistants and a maximum of 
10 jobs to be assigned to them. The worst-case scenario would take 3^10 = 59049 iterations. 
</P>

<P>
To actually solve this problem a recursive function can be built to assign every job to one of the 3 assistants. Once all jobs are assigned, take the maximum time for one of the three assistants to do the job and compare it to the best so far. 
</P>

<PRE>
void do_it(int index,int q1,int q2,int q3) {
   if (index=a.size()) {
      int current= q1&gt;q2 ? q1
      if (q3&gt;current) current=q3;
      if (current&lt;best) best=current;
      return;
   }
   do_it(index+1,q1+a[index],q2,q3);
   do_it(index+1,q1,q2+a[index],q3);
   do_it(index+1,q1,q2,q3+a[index]);
}

This approach could be optimized in the following ways: 
If time for one of the assistants is more then current best, exit from the function. 
Always assign job 1 to assistant one 
(it would reduce number of iterations to 3^9=19683).
</PRE>

<P>None of the optimizations are necessary because the problem would work 
fine without them. There are other ways to solve this problem but they would probably involve more typing.
</P>

<font size="+2"><b>TeaCoffee</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505550" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

   Used as: Division-II, Level 3:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">87 / 233 (37.33%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">55 / 87 (63.22%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>vietchau</B>  for 767.64 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
143 out of 198 coders who opened TeaCoffee, received 0 points. 
</P>
 

    Used as: Division-I, Level 2:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">98 / 114 (85.96%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">78 / 98 (79.59%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>SnapDragon</B> for 429.52 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
32 out of 110 coders who opened TeaCoffee, received 0 points.
</P>
 
Reference implementation:
    <b>Yarin</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem is a simulation problem where you just follow the rules to get a result. The most difficult part was probably the parsing of input. Most of the C++ coders already have tokenizers implemented and Java coders can always use the standard StringTokenizer class. There are two common ways to keep track of friends: to build an adjacency matrix or to create a vector of vectors. Most of the Div-I coders preferred building a vector of vectors to make the implementation easier and shorter. Once we have all inputs parsed and placed into easy-to-access data structures, the only thing left is to build a simulation which would work like this: Create a loop of 52 iterations and do the following for every iteration: If all people had the same drink last week (or the first time) the solution is found, return current week index. Create another list of drinks that people are having this week according to rules of the simulation. Set last week's list of drinks to the current week's list of drinks and go to the next iteration.
</P>

<P>
Return -1 if we went through all 52 iterations and no solution was found.
</P>

<font size="+2"><b>Cactus</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505550" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 1:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">350</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">45 / 114 (39.47%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">37 / 45 (82.22%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>nullspace</B>  for 332.43 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
75 out of 112 coders who opened Cactus, received 0 points. 
</P>
 
Reference implementation:
    <b>Yarin</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem seems to be more difficult then its 350 point value because only 37 out of 114 were able to solve this problem correctly. Almost all successful solutions had the same approach to this problem: build four nested loops, where each one of them would iterate the number of cactuses of each color (or combination of colors). For this solution to work one must keep track of the maximum and minimum amount of money spent to buy the current number of cactuses. For the rare cactuses (red with a white) assume the price is 3500 for the first one and is incremented by 1 for each following cactus. Once the inner loop is reached and the minimum amount of money spent for the current number of cactuses is less then allocated money and the maximum amount of money spent for the current number of cactuses is greater or equal to the allocated money, we have a unique combination of colors we shall count.
</P>

<font size="+2"><b>BestCircle</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505550" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1000</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">35 / 114 (30.70%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">5 / 33 (14.29%)  
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>SnapDragon</B> for 778.96 points  
                </td>
      </tr>
    </table>
  </blockquote>
<P>
85 out of 90 coders who opened BestCircle, received 0 points.
</P>
Reference implementation: <B>SnapDragon</B>
<BR/>
<h4>Implementation</h4>

<P>
The number of points (circle centers) for this problem is unlimited (because the center of the circle can be a pair of double numbers). So there is no way to brute force the solution for this problem. To solve this problem we just have to carefully choose the points we try:  
</P>

<OL>
   <LI> All given points in the field shall be considered as circle center.</LI>
   <LI> Let's consider all circle centers with the following coordinates: For every two given points, a and b, the circle center shall be x=(a.x+b.x)/2 and y=(a.y+b.y)/2;</LI>
   <LI> Let's consider all circle centers with the following coordinates: For every three given points, a, b and c, create a triangle bounded by a, b and c and find the center of this triangle. To find the center of this triangle we need to find an intersection of two lines perpendicular to the two slopes of the triangle and crossing corresponding slopes of the triangle in the middle.</LI>
</OL>
<P>
The worst case scenario for this solution is 50 + 50*50 + 50*50*50 = 127,550 (circle centers) and should not time out.
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
