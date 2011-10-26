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
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10702&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514493" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 1 Alpha</span><br>Monday, February 26, 2007
<br><br>



<h2>Match summary</h2> 

<p> 
Forty-eight contestants from the United States, Canada, Mexico and Poland were registered for this round.
<tc-webtag:handle coderId="8384426" context="hs_algorithm"/> was the first to submit a correct solution for the 250-point problem, and the first to advance to the next round. The 250 was fairly elementary, however, and all contestants solved it, earning them all a shot at the next round.
Ten coders successfully solved all three problems.
<tc-webtag:handle coderId="15117368" context="hs_algorithm"/> earned 175 points during the challenge phase, 
which put him over the top with 1778.66 points in total.  
<tc-webtag:handle coderId="10399429" context="hs_algorithm"/> took second place with 1704.90 points, 
and <tc-webtag:handle coderId="13298470" context="hs_algorithm"/> came in third with 1670.45 points.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7525&amp;rd=10702" name="7525">SearchDisks</a></b> 
</font> 
<A href="Javascript:openProblemRating(7525)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 47 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 47 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Penguincode</b> for 249.37 points (1 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.99 (for 47 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This was a really easy problem, and all contestants solved <b>SearchDisk</b> correctly.
The most difficult part of the solution is the parsing of the string. Some of the contestants wrote their own parser, but it is possible to use the standard function <i>split</i>.

<pre>

public class SearchDisks { 
    public int numberToTakeOut(String diskNames, String searchingDisk) { 
        String[] diskNamesArray = diskNames.split(&quot; &quot;); 
        int res = diskNamesArray.length; 
        for(String curDisk : diskNamesArray) { 
            --res; 
            if (curDisk.equals(searchingDisk)) { 
                return res; 
            } 
        } 
        return -1; 
    } 
} 
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7494&amp;rd=10702" name="7494">TwoTrains</a></b> 
</font> 
<A href="Javascript:openProblemRating(7494)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      44 / 47 (93.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      39 / 44 (88.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>msg555</b> for 495.09 points (2 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      400.13 (for 39 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem it was enough to find the time when the next trains to NewVasyuki and OldVasyuki come.
Here is one solution:
<pre>

public class TwoTrains { 
    public int passengerNewVasyuki(int t1, int t2, int[] timeCome) { 
        int ans = 0; 
        for(int time : timeCome) { 
            int nextTrain1 = 0, nextTrain2 = 0; 
            while (nextTrain1 &lt; time) nextTrain1 += t1; 
            while (nextTrain2 &lt; time) nextTrain2 += t2; 
            if (nextTrain1 &lt;= nextTrain2) ++ans; 
        } 
        return ans; 
    } 
} 
</pre></p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7522&amp;rd=10702" name="7522">CrazyCompetition</a></b> 
</font> 
<A href="Javascript:openProblemRating(7522)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      33 / 47 (70.21%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 33 (30.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gurugan1</b> for 893.41 points (10 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      750.14 (for 10 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First  it is necessary to convert input to int[]:
<pre>
int[] readTemperature(String[] temperature) { 
    int len = 0; 
    for(String s : temperature) { 
        len += s.length(); 
    } 
    int[] tem = new int[len]; 
    len = 0; 
    for(String s : temperature) { 
        for(char c : s.toCharArray()) { 
            if (Character.isLowerCase(c)) { 
                tem[len++] = c - 'a' + 1; 
            } else if (Character.isUpperCase(c)) { 
                tem[len++] = -(c - 'A' + 1); 
            } else tem[len++] = 0; 
        } 
    } 
    return tem; 
} </pre>

To solve this problem you could iterate over all possible beginnings of the Winter and Summer phases of "Crazy Competition" and choose the best variant.
This is a rather slow method, though. The easiest way to make it quick enough is to calculate partial sums.<br>
In other words, find int[] <b>sum</b> (<b>sum</b>[i] = <b>tem</b>[0] + <b>tem</b>[1] + ... + <b>tem</b>[i - 1]). 
Now calculate (<b>tem</b>[l] + <b>tem</b>[l + 1] + ... + <b>tem</b>[r - 1]) and calculate (<b>sum</b>[r] - <b>sum</b>[l]):

<pre>
public double differenceTemperature(int daysSummer, int daysWinter, String[] temperature) { 
    double res = -Double.MAX_VALUE; 
    int[] tem = readTemperature(temperature); 
    int n = tem.length; 
    int[] sum = new int[n + 1]; 
    sum[0] = 0; 
    for(int i = 0; i &lt; n; ++i) { 
        sum[i + 1] = sum[i] + tem[i]; 
    } 
    for(int startSummer = 0; startSummer + daysSummer &lt;= n; ++startSummer) { 
        double summerTemperature = (double)(sum[startSummer + daysSummer] - sum[startSummer]) / daysSummer; 
        for(int startWinter = 0; startWinter + daysWinter &lt;= startSummer; ++startWinter) { 
            double winterTemperature = (double)(sum[startWinter + daysWinter] - sum[startWinter]) / daysWinter; 
            res = Math.max(res, summerTemperature - winterTemperature); 
        } 
        for(int startWinter = startSummer + daysSummer; startWinter + daysWinter &lt;= n; ++startWinter) { 
            double winterTemperature = (double)(sum[startWinter + daysWinter] - sum[startWinter]) / daysWinter; 
            res = Math.max(res, summerTemperature - winterTemperature); 
        } 
    } 
    return res; 
} 
</pre>

</p>

<div class="authorPhoto">
    <img src="/i/m/VitalyGoldstein_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="19721111" context="algorithm"/><br />    <em>TopCoder Member</em>
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
