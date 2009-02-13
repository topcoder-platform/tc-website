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
<tc-webtag:forumLink forumID="505527" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 110</span><br>Tuesday, August 27, 2002

<H1> 
The Problems 
</H1> 

<P>
<B>Division II - Level 1 : Handle (250pt)</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505527" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
</P>

<P>
This was a nice easy warm-up exercise for most people to get their fingers moving. You basically had to code for two possible situations: either a) both testers voted for the same handle, in which case you merely return that handle, or b) the testers voted for different handles, in which case you loop through the myPreferences array and return the first element of myPreferences that matches either vote1 or vote2. 
</P>


<P>
<B>Division-II - Level 2 &amp; Division-I - Level 1 : Saxophone</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505527" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
This problem probably should have been worth about 250 pt in Div-II, and should not have appeared in Div-I at all.  All you have to do is loop through all of the check values, find the maximum value, and record the check number for this maximum value.  Since you know that the collection of check numbers constitutes a set of consecutive numbers, and that the number of the check value that you are looking for appears sequentially after the number of the check for the maximum value; all you have to do is return the check value whose index in the check numbers array corresponds to the check number that is one greater than the check number for the maximum value. 
</P>



<P>
<B>Division-II - Level 3 : CardGame (1000pt)</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505527" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
An interesting dichotomy of solutions arose for this problem: C++ coders almost exclusively made use of the next_permutation function to loop through all of the possible card permutations (up to 10! or 3.6 million) and choose the correct one.  Java coders had to do a bit more thinking; they generally examined the order of the cards presented, and calculated the permutation number directly.  
</P>

<P>
Regardless, everyone who solved this problem correctly came up with some form of scoring system for each of the cards.  An easy way to assign values to the cards would be to give 0 points for clubs, 13 points for diamonds, 26 points for hearts and 39 points for spades.  Then add on the numeric value of the card (from 1 to 13) to give you a total ranging from 1 to 52 that is unique for each of the 52 cards.
</P>

<P>
If you were coding in C++, the fastest way to solve this problem would be to use two integer vectors.  The first vector holds the values of the cards as given and the second holds the values of the cards sorted in increasing order.  Then loop through all of the possible permutations of the sorted vector (while incrementing a counting variable), using the next_permutation function until the sorted vector matches the first vector.  Once they match, simply return the value of the counting variable.
</P>

<P>
If you were coding in Java, the best approach would probably be to represent the cards you are given in the form of a zero-based index value for each card.  For example, for four cards your sorted indices would be 0,1,2,3 and the indices of the hand you're given might be 0,3,2,1.  The tricky part is to figure out what permutation number corresponds to the hand that you're given.  All of the Java solutions that I saw did something like this:
</P>

<OL>
   <LI> Setup an array of sorted indices, ex: 0,1,2,3</LI>
   <LI> Setup an array of given indices, ex: 0,3,1,2</LI>
   <LI> Set PermutationNumber to 0 and loop counter i to 0,  then do the following:</LI>
<OL>
   <LI> PermutationNumber+=(index of card i in sorted array)*((n - i -1)!)</LI>
   <LI> Remove card i from sorted array.</LI>
   <LI> i++, if i==n-1 then exit loop, otherwise go back to step 3.1.</LI>
</OL>
   <LI> Return PermutationNumber+1.</LI>
</OL>


<P>
<B>Division-I - Level 2 : Router (500pt)</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505527" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
This problem required a fairly careful reading of the problem statement in order to understand exactly the description of the packet routing protocol. To summarize, you are required to find the number of packets forwarded for a collection of hosts that use the same router. Each host starts by trying to send some known number of packets to the router in sequential order. The router can store up to bufferCap packets and can forward up to forwRate packets per turn.  If a host tries to send too many packets (the remaining space in the buffer is less than what the host is trying to send) the extra packets get dropped and the buffer is completely filled. It is necessary to keep track of which host sent what to the buffer, since when the packets are later forwarded it will be necessary to know whose packets are being forwarded. Once packets are forwarded they are removed from the buffer, and the appropriate counts of the numbers of forwarded packets must be updated for the various hosts. It is also necessary to remember that unless a host loses packets on any given turn, it will try to send one additional packet on the next turn. If a host loses n packets it will send (n+1)/2 packets  on the next turn.
</P>

<P>
Basically this problem boils down to a rigorous test of your array-index accounting skills. Just loop through all of the time units and keep track of who put what in the buffer, and what gets forwarded out of the buffer each turn.  A nice elegant example of how to do this is shown in <B>Ambrose</B>'s solution.
</P>


<P>
<B>Division-I - Level 3 : GlassBalls (1000pt)</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505527" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
All of the successful solutions to this problem used dynamic programming to compute the "worst-case" number of ball drops required to find the building level beyond which balls will break. For the case in which only one ball is available, the solution is trivial, namely the number of floors in the building, since we can only "re-drop" balls that have not been broken and it will be necessary to try the single ball on the 1st floor, the 2nd floor, and so on, until it either breaks or gets dropped from the top of the building. In the worst case we have to take the ball right up to the top of the building.  
</P>

<P>
For 2 or more balls however things become more interesting. All of the successful solutions contained an equation or algorithm that appeared something like this:
</P>

<P>
<PRE>f (ballnum, dropnum) = f(ballnum,dropnum-1) + f(ballnum-1,dropnum-1) + 1</PRE>
</P>

<P>
where f refers to the size of a building in floors that can be handled by an optimal strategy employing ballnum balls and dropnum drops. This just says that the size of a building that you can handle with ballnum balls and dropnum drops is equal to the size of a building that you can handle with the same number of balls and one less drops plus the size of a building that you can handle with one less balls and one less drops plus one additional floor. After you think about it for a while, it does indeed make sense... 
</P>

<P>
Usage of the above algorithm of course requires that you initialize your values for the case of ballnum=1 to the trivial solution, i.e. f(1,x) = x.
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

