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
<tc-webtag:forumLink forumID="505523" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 106</span><br>Thursday, August 1, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<P>
<B>Division-II, Level 1: Insomnia</B> (250pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505523" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 91% (169/186)<BR/>
Success rate - 93% (158/169)<BR/>
Avg. Score - 216.78pt<BR/>
Best Score - <B>dre2xl</B>, 248.09pt<BR/>
</P>

<P>
I'll have to try this creative cure for insomnia sometime...
</P>

<P>
This problem can be simply solved by looping through all of the minutes and adding or 
subtracting sheep (+15 or -10) depending on where you are in the count.  
For the first hour, third hour, fifth hour, etc. add 15 sheep per minute.  
At all other times subtract 10 sheep per minute.  Just make sure to switch 
from +15 to -10 and vice-versa every 60 minutes.
</P>


<P>
<B>Division-II, Level 2 &amp; Division-I, Level 1: Auction</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505523" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
Div-II (500pt)<BR/>
Submission rate - 75% (140/186)<BR/>
Success rate - 59% (83/140)<BR/>
Avg. Score - 313pt<BR/>
Best Score - <B>leibniz</B>, 440.19pt<BR/>
</P>

<P>
Div-I (250pt)<BR/>
Submission rate - 99% (106/107)<BR/>
Success rate - 79% (84/106)<BR/>
Avg. Score - 196.67pt<BR/>
Best Score - <B>b0b0b0b</B>, 241.02pt<BR/>
</P>

<P>
A clever scheme for selling "counter-intuitive math problems" to math geeks was 
described in this problem.  Given a number of email bids for a math paper, the 
task is to find the maximum possible profit, also given that the selling price 
will be equal to the maximum non-winning bid, and anyone bidding higher than the 
maximum non-winning bid will pay the non-winning bid price for the paper.
</P>

<P>
Probably the fastest and simplest way to solve this problem is to make a copy of 
the bids input, sort the copy, then iterate through the copy, looking for consecutive 
elements that are non-identical.  In the event that consecutive elements differ, 
compute the profit which would ensue from using the lower of the two elements as the 
maximum non-winning bid.  If the profit is greater than the maximum profit calculated 
so far, then store the maximum non-winning bid.  After this loop simply generate the 
output by finding all of the indices with bids greater than the maximum non-winning bid.
</P>


<P>
<B>Division-II, Level 3: Handles</B> (1000pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505523" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 35% (66/186)<BR/>
Success rate - 23% (15/66)<BR/>
Avg. Score - 481.4pt<BR/>
Best Score - Gojira, 578.12pt<BR/>
</P>

<P>
This problem was a straightforward parsing exercise to determine the complexity of 
a given string based on 11 pre-defined rules.  None of these rules in themselves poses 
an extreme challenge, but coding all of them takes some time, and of course it only 
takes one bug to mess up your solution.  Familiarity with easy-to-use text parsing 
routines in the language of your choice would be a definite asset for solving this problem in a timely fashion.
</P>


<P>
<B>Division-I, Level 2: Dance</B> (500pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505523" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 49% (52/107)<BR/>
Success rate - 63% (33/52)<BR/>
Avg. Score - 283.76pt<BR/>
Best Score - leibniz, 440.19pt<BR/>
</P>

<P>
TopCoders need to have fun at dances too... 
</P>

<P>
This problem asked you to find the total number of distinct combinations of 
dancing pairs, given a list of who everyone would be willing to dance with.  
The problem can be broken down by counting the number of distinct combinations 
with just 1 pair, the number of distinct combinations with 2 pairs, and so on.  
There are at most 10 elements to the input of this problem, so no more than 10 
people are willing to dance with others.  One good way to keep track of things 
for this problem (inspired by kv) would be to parse the input strings and form 
a bitmask for each of the dancers which describes which other dancers they were 
willing to dance with.  Then start an array list whose elements describe all of 
the various dance combinations.  Loop through all of the possible dancing pairs 
(in which person A is willing to dance with B and vice-versa) and if there is an  
element in the list whose bitmask does NOT indicate person A dancing with person B, 
then add an element to the list whose bitmask is the same as the previous bitmask, 
in addition to  including person A dancing with person B.  Also create an element in 
the list whose mask indicates just A dancing with B.  The total number of dance combos 
will just be the number of elements in the list.
</P>


<P><B>Division-I, Level 3: FakeCoin</B> (900pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505523" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 23% (25/107)<BR/>
Success rate - 52% (13/25)<BR/>
Avg. Score - 515pt<BR/>
Best Score - SnapDragon, 679.06pt<BR/>
</P>

<P>
Given that one coin out of twelve is known to be a fake, how do you figure out from 
a series of balance weighings which one is the fake, and whether it is heavier, 
lighter, etc.?  dmwright came up with a rather elegant solution to this problem.  
He basically used two status flags for each coin to indicate whether or not that coin 
could be (a)"fake and heavier" or "not fake and heavier" and (b)"fake and lighter" or 
"not fake and lighter".  All status flags for all 12 coins were initialized as being both 
fake and heavier and fake and lighter.   Each of the balance readings were parsed, and the 
following steps were taken for the coins in each equation:
<OL>
   <LI><P>If a coin appears on either side of an "=" sign, then it must be real (since there can only be one fake coin) so set the flags for this coin to be "not fake and heavier" and "not fake and lighter".</P></LI>
   <LI><P>If a coin appears to the left of a "&lt;" sign or to the right of a "&gt;" sign then there is no way that it can be fake and heavier, so set the "not fake and heavier" flag for this coin.</P></LI>  
   <LI><P>If a coin appears to the right of a "&lt;" sign or to the left of a "&gt;" sign then there is no way that it can be fake and lighter, so set the "not fake and lighter" flag for this coin.</P></LI>
   <LI><P>If a coin does NOT appear to the left or right of any given "&lt;" or "&gt;" sign then it can not be a fake, once again for the reason that there can be only one fake coin. Set the flags for this coin to be "not fake and heavier" and "not fake and lighter".</P></LI>
</OL>
</P>

<P>
Once these steps are completed for each of the balance equations, enough information 
exists to solve the problem.  Count the number of fake coins by checking to see if either 
the "fake and heavier" or "fake and lighter" flags are set for each of the coins.  If the 
number of fake coins is zero, then this is obviously a contradiction of the problem statement.  
Output "CONTRADICTION".  Otherwise, output one of the following for each coin, depending on the 
status of its flags and the total number of fakes counted:
<OL>
   <LI><P>If both flags for the coin are set to "not fake and heavier" and "not fake and lighter" then this coin is obviously not a fake, so output 'R'.</P></LI>
   <LI><P>Otherwise, one of the flags indicates a fake; if there is more than one fake counted (out of 12), then you have not been given enough equations to determine which coin is the fake, so output 'U' for this coin.</P></LI>
   <LI><P>If only one fake was counted and the "fake and heavier" flag is set, output 'H'.</P></LI>
   <LI><P>If only one fake was counted and the "fake and lighter" flag is set, output 'L'.</P></LI>
   <LI><P>If only one fake was counted and both the "fake and heavier" and "fake and lighter" flags are set, you are sure the coin is a fake, but have not been given enough equations to determine whether or not it is heavier or lighter, so output 'F'.</P></LI>
</OL>
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

