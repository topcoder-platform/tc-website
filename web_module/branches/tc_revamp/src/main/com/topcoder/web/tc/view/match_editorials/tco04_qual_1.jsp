<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505674" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Open <br> Qualification Problem Set 1</span><BR/>September 7-8, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
This set was the only one not dominated by reds.  In fact, only
one red, <b>Jan_Kuipers</b> cracked the top five, finishing second.  Yellow 
<b>lujo</b> took top honors, with a green and two blues rounding out
the top five, all three rising to yellow in the process.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2941&amp;rd=5873" name="2941">NinePatch</a></b> 
</font> 
<A href="Javascript:openProblemRating(2941)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505674" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      188 / 200 (94.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      176 / 188 (93.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>omkarashish</b> for 247.71 points (2 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.64 (for 176 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
A W-by-L scrap has enough fabric for (W/2)*(L/2) squares, with
both divisions rounding down if necessary.  Add up the squares for
all the scraps, and divide by 9 to get the number of blocks.
</p>
<pre>
    int squares = 0;
    for (int i = 0; i &lt; length.length; i++)
      squares += (width[i]/2)*(length[i]/2);
    return squares/9;
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2008&amp;rd=5873" name="2008">LogCabin</a></b> 
</font> 
<A href="Javascript:openProblemRating(2008)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505674" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      69 / 200 (34.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      36 / 69 (52.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lujo</b> for 711.70 points (15 mins 53 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      478.96 (for 36 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
In general, when you first add strip K, it is adjacent to strips K-1, K-3,
and K-4.  For example, consider strip 7 in the following diagram.
<pre>
    7666
    7325
    7315
    7445
</pre>
Strip 7 is adjacent to strips 6, 4, and 3.  Strip K is not adjacent to strip
K-2, except for the special case of strip 3, which is adjacent to strips
2 and 1.
<pre>
     32
     31
</pre>
</p>

<p>
With those constraints in mind, a recursive depth-first search that tries
all possibilities runs in plenty of time.  There was no need to do anything
fancy like remembering the states that you've visited before.  In each
recursive call, simply try all four fabrics as the next strip, backtracking
when a fabric would be adjacent to itself or when the fabric is shorter
than the desired strip.  During the search, keep track of the most strips 
that are ever used.
<pre>
    int most = 0;
    void dfs(int n) {
       int desiredLength = (n+1)/2;
       for (int f = 0; f &lt; 4; f++) {
          if (fabricLength[f] &lt; desiredLength) continue;
          if (f == strip[n-1] || f == strip[n-3] || f == strip[n-4) continue;
          if (n == 3 &amp;&amp; f == strip[1]) continue; // special case for strip 3

          fabricLength[i] -= desiredLength;
          strip[n] = f;
          most = max(most, n);
          dfs(n+1);
          fabricLength[i] += desiredLength;
       }
    }
</pre>
Then the main function initializes the <tt>strip</tt> array, calls
<tt>dfs(1)</tt>, and returns <tt>most</tt>.
</p>

<p>
In this code, <tt>strip</tt> is an array that keeps track of which
fabric was used in each strip, where <tt>strip[<i>n</i>]</tt> contains
the fabric number (0-3) of the <i>n</i>-th strip.  Notice that the
line 
<pre>
    if (f == strip[n-1] || f == strip[n-3] || f == strip[n-4) continue;
</pre>
refers to strips that do not exist when <i>n</i> &lt;= 4.  
To avoid special cases for these values of <i>n</i>, 
it is useful to insert phantom strips, known as 
<a href="/tc?module=Static&d1=features&d2=090104">sentinels</a>,
in positions 0, -1, -2, and -3, initialized to some non-existent
fabric number like 99.  Then we are guaranteed that the current
fabric will not equal the fabric in, say, strip <i>n</i>-4 when
strip <i>n</i>-4 does not exist.
</p>

<p>
Of course, you are probably working in a language that does not support
negative array indices.  In that case, shift all the strips a few
positions forward, so that the <i>n</i>-th strip is stored in, say, 
<tt>strip[n+4]</tt>.
</p>

<div class="authorPhoto">
    <img src="/i/m/vorthys_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="299177" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
