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
    <A href="/tc?module=HSRoundOverview&rd=10655&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506247" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 31</span><br>Monday, February 5, 2007
<br><br>

<h2>Match summary</h2> 

As HS SRM 31 kicked off, 243 young competitors fought their way through traffic in order to complete this problem set.  An exciting battle ensued, as the coders fought for victory in the penultimate SRM of the first season.
<br /><br />
 
As most competitors opened the 250 point problem, scoring was abundant early.  Several quick solutions to this problem, including those by <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, <tc-webtag:handle coderId="20036294" context="hs_algorithm"/>, and <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>, led to a high scoring affair.  <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> was the first to submit on the tricky 500, followed shortly thereafter by <tc-webtag:handle coderId="15600321" context="hs_algorithm"/> , <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, <tc-webtag:handle coderId="22654082" context="hs_algorithm"/>, and <tc-webtag:handle coderId="22641901" context="hs_algorithm"/> almost simultaneously.  As submissions to the 500 started to trickle in, <tc-webtag:handle coderId="22652634" context="hs_algorithm"/> leapt into the lead at the 19 minute mark by going directly to the 1000 problem and submitting it.  His lead was not to last long, as within minutes, <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> submitted his 1000 point problem for 912.02 points.  By the end of the coding phase, <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> had a 52 point lead over <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, with <tc-webtag:handle coderId="22647635" context="hs_algorithm"/>, <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>, and <tc-webtag:handle coderId="22641901" context="hs_algorithm"/> trailing close behind.
<br />
<br />
 

The challenge phase continued the excitement, as many of the hard solutions fell to challenges.  <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> cemented the lead with 175 points during the challenge phase, with <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> and <tc-webtag:handle coderId="22641901" context="hs_algorithm"/> vaulting into second and third, respectively.  However, their time at the top was short lived, as their hard solutions failed system tests.  <tc-webtag:handle coderId="22375930" context="hs_algorithm"/> emerged as the victor, with <tc-webtag:handle coderId="22647635" context="hs_algorithm"/> in second and <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> in third.
<br />
<br />
 

<H1> 
The Problems 
</H1>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7425&amp;rd=10655" name="7425">TrafficReport</a></b> 
</font> 
<A href="Javascript:openProblemRating(7425)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506247" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
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
      204 / 225 (90.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189 / 204 (92.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 248.45 points (2 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.41 (for 189 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This is a straight forward problem that can be solved by iteration, and stresses the importance of having a string parser in your code library; if your language doesn't have a built-in parser, it might be a good idea to write one of your own and keep it handy.  First, we parse all of the elements of <b>route</b>.  We split each element into its two parts: the time and the street name.  We sum all of the times, and keep the street names in a table.  Next, we parse all of the elements of <b>report</b>.  For each element, we first check to see if the street is located in the route.  If it is, we add this to the total travel time.  Once we have done this, we return this sum.  Java code follows:

<pre>
public class TrafficReport
{

public int bestRoute(String[] route, String[] report)
{
    int ret = 0;
    String[] rstreet = new String[60];
    for(int i=0; i < route.length; i++)
    {
        String[] temp = route[i].split(" ");
        ret += Integer.parseInt(temp[0]);
        rstreet[i] = temp[1];
    }
    for(int i=0; i < report.length; i++)
    {
        String[] temp = report[i].split(" ");
        int j;
        for(j=0; j < rstreet.length; j++)
            if(temp[1].equals(rstreet[j])) break;
        if(j < rstreet.length) ret += Integer.parseInt(temp[0]);
    }
   
    return ret;
}

};
</pre>

<br /><br />
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7374&amp;rd=10655" name="7374">HighwayJam</a></b> 
</font> 
<A href="Javascript:openProblemRating(7374)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506247" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      124 / 225 (55.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 124 (66.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 466.49 points (7 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      321.13 (for 83 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Inspired by the daily commute to work, this problem turned out to be tricky.  The first thing to realize about the problem is that you should only switch to a lane with a higher index if you are moving to a lane with a higher speed.  To prove this, assume that the fastest route involves traveling in lane j (with speed lanes[j]), but where lanes[i] > lanes[j].  However, this means that dist/lanes[i] < dist/lanes[j], which contradicts the initial assumption.  Thus, we only want to shift away from the exit lane if we will be traveling faster.  Similarly, we want to spend as much time in this faster lane as is possible, to maximize our average velocity.  Therefore, we can greedily try each lane, shifting to that lane as early as possible, and shifting back to the exit as late as possible.  For each lane, the total time will equal the sum of the time taken to get into the lane (for lane i, this will be laneChange*(i-1)), the time taken to get back to exit 0 (also laneChange*(i-1)), and the time spent in the lane.  We can set distance_in_lane =  <b>dist</b>-sumof(2*laneChange*lanes[j]). Thus, the time = distance_in_lane / lanes[i].  We just need to watch out for the corner case in which this time is less than laneChange, at which point we cannot enter that lane (since we cannot safely return to lane 0 in time).  Java code follows:

<pre>
public class HighwayJam
{

public double minTime(int[] lanes, int laneChange, int dist)
{
    double ret = 1.0*dist/lanes[0];
    double dleft = dist;
    double ctime = 0;
   
    for(int i=1; i&lt;lanes.length; i++)
    {
	     dleft -= 2*laneChange*lanes[i-1];
	     ctime += 2*laneChange;
	     if(dleft &lt; laneChange*lanes[i]) break;	// if no time to switch back, we're done
	     ret = Math.min(ret, ctime + dleft/lanes[i]);
    }
    return ret;
}

}
</pre>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6823&amp;rd=10655" name="6823">LicensePlate</a></b> 
</font> 
<A href="Javascript:openProblemRating(6823)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506247" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
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
      85 / 225 (37.78%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      29 / 85 (34.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 912.02 points (9 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      665.66 (for 29 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

One of the important things to check when evaluating algorithms is the size of the input.  In this problem, <b>n</b> can range from 0 to 2,147,483,647, which is too large a number to attempt to generate license plates one by one.  As a result, we need a faster way to parse the plates.  As a simple example, consider a case where format="nu" and n = 123.  If we enumerate all possible plates, we see that the value of the last character is based on the remainder modulo 26; plate 0 is "0A", plate 26 is "1A", plate 52 is "2A", etc.  In this case, since n%26 = 19, we can replace the 'u' with 'T'.  Now, to determine how many times we change the remaining characters, we divide n by 26 (so n=4).  We can then repeat this process on the new plate "nT", with n=4.  This demonstrates how to extend this to larger formats.  We determine the last character, using modulo 10, 26, or 36 if the character in format was 'n', 'u', or 'a' respectively, and then calculating the new value of n by dividing by the same number.  If n is 0 after we have assigned all lowercase letters in the format, then this plate fits in the format and we return it.  If n is greater than 0, then there are not enough plates in this format, and we return "".   Java code follows:
<br />
<br />

<pre>
public class LicensePlate
{

public String getPlate(String format, int n)
{
    String ret="";
   
    for(int i=format.length()-1; i>=0; i--)
    {
        switch(format.charAt(i))
        {
            case 'a':
                if(n%36 < 10) ret = (char)('0'+n%36) + ret;
                else ret = (char)('A'+(n-10)%36) + ret;
                n /= 36;
                break;
            case 'n':
                ret = (char)('0'+n%10) + ret;
                n /= 10;
                break;
            case 'u':
                ret = (char)('A'+n%26) + ret;
                n /= 26;
                break;
            default:
                ret = format.charAt(i) + ret;
        }
    }
    return n > 0 ? "" : ret;
}
}
</pre>

Working left-to-right is also possible, but you need to make sure to use 64-bit integers to avoid running into overflow problems.  See <tc-webtag:handle coderId="22375930" context="hs_algorithm"/>'s or <tc-webtag:handle coderId="22652634" context="hs_algorithm"/>'s code for an example of this method.
<br /><br />
 

<%--
<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />    <em>TopCoder Member</em>
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
