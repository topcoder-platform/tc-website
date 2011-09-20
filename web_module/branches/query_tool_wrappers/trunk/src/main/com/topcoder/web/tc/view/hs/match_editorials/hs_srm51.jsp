<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13484&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="521833" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 51</span><br />Thursday, June 26, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
TCHS SRM 51 was held at the same time as SRM 407 and was marked by the use of a common problem between the 
two contests. Unfortunately, this meant that coders could not compete in both of them. However, after a few issues 
with double registrations were resolved, HS round 51 got off to timely and speedy start.
<tc-webtag:handle coderId="22694437" context="hs_algorithm"/> started things off with a submit on the easy barely three
minutes into the round. The next few minutes saw more submits on the 250 pointer. However, it was the ten minute mark 
that saw the first submit on the medium, and the taking of the lead by 
<tc-webtag:handle coderId="21761885" context="hs_algorithm"/>.
<br /><br />
Although there were more submits for the 
medium <tc-webtag:handle coderId="21761885" context="hs_algorithm"/> stayed in the lead until half an hour 
into the round when newcomer and <tc-webtag:handle coderId="22723868" context="hs_algorithm"/>, having skipped the medium,
put in a surprising 828.56 point submission for the hard and became the top scorer. 
The other coders went through the easy and medium problems quicky but were stuck on the hard. 
<br /><br />
By the hour mark, the contestants seemed to have gotten a hang of the 1000 pointer
and the submissions started rolling in. At the end of the contest there were a large number of submits across
the board. The subsequent challenge phase was quite lively, it proved to particularly fruitful for <tc-webtag:handle coderId="22663117" context="hs_algorithm"/>
who racked up 4 successful challenges and took over as the top scorer. On the other hand 
<tc-webtag:handle coderId="22723868" context="hs_algorithm"/>'s lightning quick submit on the hard proved faulty and 
saw him drop out of contention.
<br /><br />
The system test phase did not throw up too many surprises and the contest ended with
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/> from the United States taking the win, 
<tc-webtag:handle coderId="21761885" context="hs_algorithm"/> picking up second and
<tc-webtag:handle coderId="22654002" context="hs_algorithm"/> third.
The best newcomer was 5<sup>th</sup> place finisher <tc-webtag:handle coderId="22652005" context="hs_algorithm"/> 
from Vietnam.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=7920&amp;rd=13484" name="7920">MissingDigits</a></strong> 
</font> 
<A href="Javascript:openProblemRating(7920)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521833" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      61 / 70 (87.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      46 / 61 (75.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>eagaeoppooaaa</strong> for 247.47 points (2 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.70 (for 46 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem had two part, the first was to generate the forbidden numbers and the second 
to check and see if they were present. Both these steps were considerably shortened if one knew some basic string 
operations. <br /><br /> In the solution, ("" + i) + <strong>notAllowed</strong>[i] is used to generate the forbidden numbers and 
(""+<strong>roomNumber</strong>).indexOf() is used to check if they are present.
<pre>
    public String isAllowed(int[] notAllowed,int roomNumber) {
        for(int  i = 0;i &lt; notAllowed.length;i++) {
            if((""+roomNumber).indexOf(("" + i) + notAllowed[i]) &gt; -1)
                return "NO";
        }
        return "YES";
    }    
</pre>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=7858&amp;rd=13484" name="7858">AuctionHouse</a></strong> 
</font> 
<A href="Javascript:openProblemRating(7858)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521833" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      46 / 70 (65.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 46 (80.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>DaViDeX</strong> for 481.20 points (5 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362.06 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The medium was another in which experience with strings and parsing helped. Algorithmically, the problem was not that
difficult, the basic idea was to build a table with the items, update them according to the bids made and finally output
the result in the required format.
<pre>
    for(i = 0;i &lt; bids.length;i++) {
        //Parsing and addition to table        
        String[] tokens = bids[i].split("[ ]");
                
        boolean found = false;
        for(j = 0;j &lt; nitems;j++)    
            if(items[j].equals(tokens[1])) {
                //update according to bids
                found = true;    
                if(maxbid[j] &lt; Integer.parseInt(tokens[2])) {    
                    maxbid[j] = Integer.parseInt(tokens[2]);        
                    bidder[j] = tokens[0];
                }
            }
        
        //Addition to table
        if(!found) {
            nitems++;
            maxbid[j] = Integer.parseInt(tokens[2]);        
            bidder[j] = tokens[0];
            items[j] = tokens[1];
        }
    }

    //Format and return the result
    String[] ret = new String[nitems];    
    for(i = 0;i &lt; nitems;i++) 
            ret[i] = bidder[i]+ " got " + items[i];
    return ret;
</pre>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9794&amp;rd=13484" name="9794">CheapestRoute</a></strong> 
</font> 
<A href="Javascript:openProblemRating(9794)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=521833" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 70 (28.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 20 (30.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>neal_wu</strong> for 644.19 points (24 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      478.92 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As cost of teleport usage depends on number of teleports used before, number of a current 
cell isn't enough to define current position. So we will use a pair (<strong>a</strong>,<strong>b</strong>), 
where <strong>a</strong> is a cell number and <strong>b</strong> is a number of teleports already used, 
to define our position in the corridor. The weight of a move can be defined by a pair 
(<strong>a</strong>,<strong>b</strong>), where <strong>a</strong> is a cost of this move and <strong>b</strong> is time needed 
for this move. As we are looking for the cheapest route with as small number of moves as 
possible for such cost, the comparison for two moves will be defined as: (<strong>a</strong>,<strong>b</strong>)
&lt; (<strong>c</strong>,<strong>d</strong>) &lt;=&gt; (<strong>a</strong>&lt;<strong>c</strong>) or ( (<strong>a</strong>=<strong>c</strong>) and 
(<strong>b</strong>&lt;<strong>d</strong>) ). Now we can introduce the graph with vertices numbered as (<strong>a</strong>,<strong>b</strong>) 
(meaning of <strong>a</strong> and <strong>b</strong> is described above), representing our position in the corridor, 
and edges with weights given using pairs (also introduced above), representing walking and 
using teleports. Our goal is to find a path from vertex (<strong>0</strong>, <strong>0</strong>) to vertex (<strong>n-1</strong>, <strong>i</strong>) 
(where <strong>i</strong> can take any value) with the minimum weight. This problem can be solved using any 
shortest-path algorithm. You can see the implementation of this idea 
<a href="/stat?c=problem_solution&rm=297808&rd=12179&pm=9794&cr=22512513">here</a>.
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/Ishan_big.jpg" alt="Author" />&#160;<img src="/i/m/Gluk_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="286348" context="algorithm" />&#160;<tc-webtag:handle coderId="8433628" context="algorithm" /><br />    <em>TopCoder Members</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
