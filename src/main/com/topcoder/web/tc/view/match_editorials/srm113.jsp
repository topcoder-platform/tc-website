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
<tc-webtag:forumLink forumID="505530" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 113</span><br>Tuesday, September 10, 2002

<H1> 
The Problems 
</H1> 

<font size="+2"><b>GameCipher</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505530" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <td style="background: #eee;" class="bodyText">219 / 250 (87.60%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">148 / 219 (67.58%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>fiddlybit</b> for 239.89  points
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
93 out of 241 coders who opened GameCipher, received 0 points. 
</P>
 
 
<P>
Reference implementation:
</P>


<h4>Implementation</h4>
<P>
The problem is very straightforward and as easy as it has to be for Div-II Level 1 250 problem. Al
</P>

<P>
To solve the problem check every pair for the following:<BR/>
if a==b return index<BR/>
if a is vowel and b is not vowel return index<BR/>
if b is vowel and a is not vowel return index <BR/>
if a is mapped return index<BR/>
if b has mapping to return index<BR/>
</P>

<p>&#160;</p>

<font size="+2"><b>Nash</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505530" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <td style="background: #eee;" class="bodyText">88 / 250 (35.20%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">48 / 88 (54.55%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>uglyfool</b> for 474.60  points
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:
    <b>slavik</b> (practice room)

<P>
179 out of 227 coders who opened Nash, received 0 points.
</P>

<BR/>
<h4>Implementation</h4>
<p>
To solve this problem we have to parse the entire input first which could be easily done by using String Tokenizer or strtkn() for C++ coders. Once we have entire matrix values in array structure in memory the best way to solve the problem is to find all columns maximum values for column player and all rows maximum values for row player. Once we have those two arrays we can go through the matrix one more time and for every element of the matrix check if this element is best for row player and is the best for the column player. To do that we just check if maximum for this row is the current element for row player and if maximum for this column is the current element for the column player. One those two conditions are meet we have found a Nash Equilibrium.
            </p>
<p>&#160;</p>

<font size="+2"><b>LazyYear</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505530" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">900</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27 / 250 (10.80%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">1 / 27 (3.70%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>uglyfool</B> for 482.59 points 
                </td>
      </tr>
    </table>
  </blockquote>
<P>
164 out of 165 coders who opened Nash, received 0 points. 
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
        <td style="background: #eee;" class="bodyText">63 / 229 (27.51%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">19 / 63 (30.16%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>Garzahd</B> for 275.47 points 
                </td>
      </tr>
    </table>
  </blockquote>
<P>
108 out of 127 coders who opened LazyYear, received 0 points. 
</P>
 
Reference implementation:
    <b>SnapDragon</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem was just plain ugly with no way to do it elegantly and short. The smallest and easiest to understand was solution by SnapDragon who realized that the next year with a valid date after the year such as year%4==0 is another year where year%4==0. So he just solved this problem by doing brute force computation where worst case took about 4-6 seconds.
</P>

<P>
To do a check on the year itself was not that hard - just a lot of ugly special cases.
</P>

<P>
Some people where checking the first 3 digits of the year and if those were not a valid date, skipped a significant amount of empty computations by incrementing those 3 digits instead of the least significant digits of the year.
</P>

<P>
Most common mistakes were:
<OL>
   <LI> Incrementing year by 1 and timing out.</LI>
   <LI> Leap year computations.</LI>
   <LI> Special case as no date like 1-01-XXXX.</LI>
</OL>
</P>

<p>&#160;</p>

<font size="+2"><b>CodeBloat</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505530" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 1:
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
        <td style="background: #eee;" class="bodyText">120 / 229 (52.40%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">40 / 120 (66.67%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>b0b0b0b</B>  for 248.27 points 
                </td>
      </tr>
    </table>
  </blockquote>
<P>
46 out of 126 coders who opened CodeBloat, received 0 points. 
</P>
 
Reference implementation:
    <b>Slavik</b>
<BR/>
<h4>Implementation</h4>
<P>
This problem was a typical enumeration problem where all possible combinations have to be enumerated and tried out. There are two ways of doing that: iterate from 0 to 2^N where each iteration in the loop is used as a bitmask to get combinations of inputs to try. The second and more efficient way is to build a recursive function which would try or not try every member of the input:
</P>
<PRE>
int do_it(int index,int cur,int maxx) { 
      if (cur&gt;maxx) return 0; 
      if (index==d.size()) return cur; 
      int d1=do_it(index+1,cur,maxx); 
      int d2=do_it(index+1,cur+d[index],maxx); 
      return (d1&gt;d2) ? d1:d2; 
} 
</PRE>

<p>&#160;</p>

<font size="+2"><b>Logical</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505530" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
        <td style="background: #eee;" class="bodyText">33 / 229 (15.31%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">25 / 33 (75.76%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
<B>Yarin</B> for 920.02 points 
                </td>
      </tr>
    </table>
  </blockquote>
<P>
72 out of 97 coders who opened Logical, received 0 points.
</P>
Reference implementation: <B>ambrose</B>
<BR/>
<h4>Implementation</h4>

<P>
One of the solutions to the problem is to enumerate all possible true and 
false assignment to all letters used. There is a maximum of 20 distinct 
letters which can be used in this problem, so this enumeration will take O 
(2^20) combinations. Then each block in the statement has to be evaluated. 
So, there should be a loop to remove blocks which values are false. Number 
of the remove blocks should be compared to the best so far.
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
