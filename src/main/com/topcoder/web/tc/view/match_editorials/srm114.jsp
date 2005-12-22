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
<tc-webtag:forumLink forumID="505531" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 114</span><br>Tuesday, September 24, 2002

<H1> 
The Problems 
</H1> 

<font size="+2"><b>Snail</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505531" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
  <blockquote>
    <table cellspacing="2">
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
        <td style="background: #eee;" class="bodyText">235 / 256 (91.80%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">195 / 235 (82.98%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">225.28 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>slowjoe</b> for 248 points
                </td>
      </tr>
    </table>
  </blockquote>
  
<P>
Most people got this one pretty easily. You just had to set up a simple loop to count the number of days, and update the position of the snail within the well for each day. Once the position on any given day is outside of the well, it 's time for the function to return:
</P>

<P>
<PRE>
int days=0;
while (depth>0) {
   days++;
   depth-=dayUp;
   if (depth&lt;=0) return days;
   depth+=nightDown;   
}
</PRE>
</P>

<P>
The areas where most people made mistakes on this one were starting with the wrong day (i.e. starting at 1 instead of 0) and using the wrong exit condition (i.e. depth==0 instead of depth&lt;=0).
</P>

<P>
Reference Implementation: <B>Penwiper</B>, practice room
</P>

<p>&#160;</p>

<font size="+2"><b>DirSort</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505531" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division II - Level 2 &amp; Division I - Level 1:
  <blockquote>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-II stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">600 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">172 / 256 (67.19%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">118 / 172 (68.60%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">372.12 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Wombat80</b> for 569.90  points
                </td>
      </tr>
    </table>
   <BR/>
    <table cellspacing="2">
   <tr>
        <td style="background: #eee;" class="bodyText" colspan="2">
          <b>Div-I stats</b>
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">350 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">141 / 146 (96.58%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">128 / 141 (90.78%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">273.11 points
                </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for 344.15   points
                </td>
      </tr>
    </table>
  </blockquote>
  <P>
  As is evident from the above statistics, most people were able to submit this problem, and most ended up solving it successfully. The obvious approach for this problem was to implement a simple loop or nested loops to sort the directories in increasing order. The code that you use to compare two directories must first compare the directories on the basis of how many "forward-slashes" they have. The fewer the number of forward-slashes, the earlier the directory should be in the returned string array. If two given directories have the same number of forward slashes it becomes necessary to implement some sort of comparison function to see which one should come first.
  </P>
  <P>
The comparison function used to compare two directories with equal numbers of forward-slashes should lexicographically compare the text between each set of forward slashes, starting with the text between the first set of forward-slashes. The comparison function should return as soon as the text being compared differs, i.e. it could return -1 to indicate that directory1 is less than directory2, or +1 to indicate that directory1 is greater than directory2.
  </P>
  <P>
Virtually everyone had the right idea for this problem. The mistakes that were made were usually indexing problems or string out of bounds errors.
  </P>

<font size="+2"><b>Tile</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505531" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division II - Level 3:
 <blockquote>
    <table cellspacing="2">
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
        <td style="background: #eee;" class="bodyText">49 / 146 (33.56%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">3 / 49 (6.12%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">421.59 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>vorthys</b> for 590.86 points
                </td>
      </tr>
    </table>
   </blockquote>
  <P>
  Only three coders (<B>vorthys</B>, <B>puzzlehacker</B>, and <B>vesko8</B>) managed to solve this problem correctly. Given the low submission numbers and success rate for this problem, it probably should have been worth a bit more. All three of them used dynamic programming in their solutions. If you tried to solve this problem by trying all of the tile combinations until you got beyond 100,000, then your solution would time out for situations in which there are a large number of tiles that do not add up to 64 easily. For example, take 50 3x3 tiles. No combination of 3x3 tiles adds up to 64, but there are literally hundreds of millions of combinations (approx. 50C8) that come close and would have to be tried!
  </P>
  <P>
Instead, set up an array of 65 values which represents the number of tile combinations that results in a given total ranging from 0 to 64 inclusive. Initialize the zero element of this array to 1, and the rest to zero. Loop over the number of tiles, and the combination totals as follows:
  </P>
  <PRE>
  for (int i=0;i&lt;numtiles;i++) {
   for (int j=64;j&gt;=tilesize[i];j--) {
      numcombos[j]+=numcombos[j-tilesize[i]];
   }
}
  </PRE>

  <P>
  Your return value is simply numcombos[64], the number of tile combinations that add up to an area of 64. Of course if this number is greater than 100,000 return 0 instead.
  </P>
  <P>
  Reference Implementation: <B>vorthys</B>
  </P>

<font size="+2"><b>Highcard</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505531" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division I - Level 2:
  <blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450 points</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">134 / 146 (91.78%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">117 / 134 (87.31%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">375.71 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for 443.15 points
                </td>
      </tr>
    </table>
   </blockquote>

  <P>
     Remind me to never play cards with Chris. This problem required way less work than most Div I - Level 2 problems. Chris is cheating by looking at his friend's cards and optimally re-arranging his own cards. The simplest way for Chris to think about optimizing his own cards is to sort both the hand that he is dealt and the hand that his friend is dealt. Chris then applies his best card to the best card his friend has which is also lower than Chris' best card. Chris then applies his second best card, to the highest card left of his friend's which is also lower than Chris' second best card, and so on. Here's a pseudo-code snippet for Chris' strategy, based on my solution:
  </P>
<PRE>  
Sort(chriscards);
Sort(friendcards);
int friend_index = number of friend cards - 1
int numWinners=0;
int chris_index = friend_index
while (friend_index>=0) {
   if (chris[chris_index]&gt;friend[friend_index]) {
      numWinners++;
      chris_index--;
      friend_index--;
   }
   else {
      friend_index--;
   }
}
return nW;
</PRE>

<P>Reference Implementation: <B>Penwiper</B></P>

<font size="+2"><b>Pipes</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505531" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division I - Level 3:
  <blockquote>
    <table cellspacing="2">
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
        <td style="background: #eee;" class="bodyText">53 / 146 (36.30%) 
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">37 / 53 (69.81%) 
</td>
      </tr>
     <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Average Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">482.34 points
        </td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for 733.71 points
                </td>
      </tr>
    </table>
   </blockquote>
   
  <P>
  This problem was reasonably straightforward, so far as Div I - Level 3 problems go. You are given a map describing how pipes are buried in the ground, and need to calculate how much pressure is available in one of the lowest buried pipes. The pressure available in the first pipe on the top level is defined as 100. The pressure in each pipe below the first level is calculated based on the pipes from the previous level. If two pipes are directly on top of one another, then all of the pressure from the top pipe gets transferred to the pipe below it. If there is a horizontal separation between the two pipes however, the amount of pressure transferred to the lower pipe is inversely proportional to the horizontal distance, such that if two pipes p1 and p2 are distances x1 and x2 from the higher pipe, then the amount of pressure transferred to p1 will be (x2/x1) times the amount of pressure transferred to p2. I'm not certain if this is how pressure is really distributed between vertical pipes, but it sounds reasonable. 
  </P>
  <P>
Given n pipes separated by the distances x1, x2, x3, ..., xn (where none of the xi are equal to zero) from a higher pipe with pressure P, you need to do the following to calculate p(i), the pressure in each of the lower n pipes:
  </P>
  
  <OL>
   <LI>Find the smallest distance, and call it xmin.</LI>
   <LI>Calculate a pressure ratio for each pipe: pratio(i) = xmin / x(i)</LI>
   <LI>Sum all of the ratios.</LI>
   <LI>Calculate pressure in each pipe as: p(i) = pratio(i) / (Sum of ratios) * P and round down in all cases.</LI>
  </OL>
  
  <P>
  Every solution that I looked at calculated the ratios using floating-point arithmetic. Finding a sum of these ratios without using floating-point arithmetic would not be possible for some of the cases of large maps with many pipes. Some people added on things like .00000001 to each value of p(i) to avoid floating point errors, but this proved to be unnecessary, at least for all of the system test cases. 
  </P>
  <P>
  Once you have the above algorithm for calculating the pressures of pipes going from one level to the next, the problem becomes quite simple. Set up a loop to start at the first level and go down to the second last level. At each pipe location in a given level, you start with knowledge of what that pipe's pressure is. Use the above algorithm to find out how much pressure that pipe contributes to each of the pipes below it. Once the loop is completed, you then simply have to return the pressure of the pipe on the last level whose zero-based index is given as an input parameter to the problem. 
  </P>
  

<p>
<img src="/i/m/Penwiper_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="150527" context="algorithm"/><br />
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
