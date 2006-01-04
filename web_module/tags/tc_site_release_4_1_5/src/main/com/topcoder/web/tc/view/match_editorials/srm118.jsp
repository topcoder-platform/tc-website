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
<tc-webtag:forumLink forumID="505539" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 118</span><br>Tuesday, October 29, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<FONT SIZE="+2"><B>Popcorn</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505539" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">116 / 179 (64.80%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">55 / 116(47.41%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>fvolny4</B> for 227.89 points
        </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          155.82 
        </TD>
      </TR>           
    </TABLE>
  </BLOCKQUOTE>
<P>
This problem was pretty simple conceptually. However, getting all of the number just right and avoiding special 
cases turned out to be difficult, as evidenced by the low success rate. The basic strategy was start at the 
3rd pop, and then go through the array 3/4 of the way, and find the maximum gap between two adjacent pops, 
and then returning that maximal interval. Probably the biggest problem people had was avoiding off by one 
errors, and handling the special case when there are one three pops
</P>
<PRE>

    public int quietTime( int[] popTimes ){
        int len = popTimes.length;
        int num = (3*len)/4; if(4*num != 3*len) num++;
        int t = 0;
        for(int i=3; it) t=popTimes[i]-popTimes[i-1];
        }
        return t;
    }


</PRE>

<FONT SIZE="+2"> <B>Aliens</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505539" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">115 / 179(64.25%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">99 / 115 (86.09%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>dre2xl</B> for 483.35 points
                </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          367.61 
        </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>
<P>
To solve this, you have to do two things given a mapping from characters to digits. First, convert a string into a number, and then convert a number into a string. Both of these can be done with a few simple string operations. To convert a string to a number, start an int at 0 which will store the result. Scan the string left to right, multiplying the result by 10 for each character, and then adding the index of the character in the mapping to your result. To convert a number to a string, start with an empty string, and then convert one digit of the number at a time to a character (you can get the digits of a number by successively taking the number modulus 10 and then dividing the number by 10). This problem turned out to be easier for most people than the first problem. 
</P>
<BR/>


<FONT SIZE="+2"><B>StringFold</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505539" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

   Used as: Division-II, Level 3:
 <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">500 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">18/179 (10.05%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">9/18 (50.00%) 
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Doomhammer</B> for 687.25 points
                </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          596.59 
        </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 1:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">85/118 (72.03%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">79/85 (92.94%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>John Dethridge</B> for 234.65 points
                </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          173.91 
        </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>

<P>
The simplest way to do this is to initialize a big character array (at least twice the length of the input string), and start by adding characters in the middle of the array in the forward (left to right) direction. Then, scan the input string one character at a time. If the character in the input matches the previous character in the input, then reverse direction, and overwrite the last character with its case switched. So, as you scan the input string, you set characters in your array in one direction or the other, and swap the case whenever you are going backwards. For a very clean implementation of this, see <B>John Dethridge</B>'s solution. 
</P>

<BR/>

<FONT SIZE="+2"><B>SpaceDrone</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505539" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 2:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">74/118 (62.71%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">56 / 74 (75.68%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>John Dethridge</B> for 472.01 points
                </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          341.34 
        </TD>
      </TR>      
    </TABLE>
  </BLOCKQUOTE>

<P>
One way to do this was to keep track of which direction the space ship was facing, and which direction was up, and then hard code all cases, and where a Y or an R will lead to next. However, this is a lot of work, and very error prone. A better way to do it is to note that when you turn, the direction that you are facing, is the opposite of the direction that you were previously facing, and the direction that is to your right is the direction that you were previously facing. Similarly, a Y command causes the direction that you are facing to become the opposite of the direction that was previously up for your space ship, while up become the direction that you were facing. This suggests that we should keep track of the direction up, forward, and to our right. Then a R command is just: 
</P>

<PRE>
    newRight = oldForward
    newForward = -oldRight
    newUp = oldUp </PRE>

<P>
A Y command can be implemented similarily, and a F command is just a matter of looking at which direction is currectly being faced. Again, <B>John Dethridge</B> had the high score, and used the method above. 
</P>

<BR/>
<FONT SIZE="+2"><B>MineMapper</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505539" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3:
<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1000 points</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">35/118 (29.66%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">19 / 35 (54.29%) 
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Yarin</B> for 767.99 points
                </TD>
      </TR>
       <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Average Points</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          574.84  
        </TD>
      </TR>       
    </TABLE>
  </BLOCKQUOTE>
<P>
There wasn't really anything too tricky about this problem. You basically just have to follow the directions. A simple way to do this is to just start walking from every previously visited point, over and over again, until you learn nothing new. So, you just have to figure out, if you are currently at some point, what can you mark as a positively a mine or positively not a mine. If you count the number of adjacent squares that are mines, but not known, and the number of squares that are free, but not known, you can figure it out. Basically, if either of these numbers is 0, then you know that all the other unknown squares must be either mines or free (the detector will tell us which), and you can mark them as such. 
See <B>Yarin</B>'s code for an impressively short solution
</P>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
