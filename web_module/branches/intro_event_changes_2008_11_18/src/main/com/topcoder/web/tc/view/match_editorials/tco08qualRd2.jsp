<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=12008">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519495" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Qualification Round 2</span><br />Saturday, February 9, 2008
<br /><br />



<h2>Match summary</h2> 

<p>This problemset was more traditional than the last one. At least a
fast 250 and a successful challenge were required to advance. Nobody
managed to do it with only challenges, some even failed to do it with
slow solutions to the 500.</p>

<p>The most surprising fact about the results is that there was almost no
discontinuity between those who managed to solve <pre style="display: inline">N</pre> and those with <pre style="display: inline">N + 1</pre> problems.
This made challenges a lot more important than usual because the loss
of 25 points or gain of 50 points could have changed ones rank
considerably.</p>

<p>Among the advancers were 18 red coders (they were required to compete
in the qualifications because they were not active enough), 256
yellows, 190 blue coders, 81 green coders and 5 grey ones.</p>

<p>Three fast solutions secured the first place for <tc-webtag:handle coderId="8365685" context="algorithm"/> with a 82.76
point lead in front of <tc-webtag:handle coderId="22647635" context="algorithm"/>. With the extra help of a successful
challenge <tc-webtag:handle coderId="8584653" context="algorithm"/> managed to finish third.</p> 

 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8608&amp;rd=12008" name="8608">BusAwaiting</a></b> 

</font> 

<A href="Javascript:openProblemRating(8608)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      1335 / 1392 (95.91%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1102 / 1335 (82.55%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Valco</b> for 248.43 points (2 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      205.45 (for 1102 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

<strong>Notation</strong></p>

<pre style="display: inline">N</pre> &nbsp;= number of buses<br><pre style="display: inline">M</pre> &nbsp;= average <pre style="display: inline">COUNT</pre><p><strong>O(N) solution</strong></p>
<p>

There are two cases:</p>
<ol>
<li><pre style="display: inline">arrivalTime &le; START</pre>: you have to wait <pre style="display: inline">START - arrivalTime</pre> &nbsp;units.</li>
<li><pre style="display: inline">arrivalTime &gt; START</pre>: you have to take the first bus 
that comes: <pre style="display: inline">n = &lceil;(arrivalTime - START) / INTERVAL&rceil;</pre>.
<br>The bus will not exist if <pre style="display: inline">n = COUNT</pre>, otherwise you will have to wait <pre style="display: inline">START + n * INTERVAL - arrivalTime</pre> &nbsp;units.</li>
</ol>C++ code:<pre>
int waitingTime(vector &lt;string&gt; buses, int arrivalTime) {
    unsigned result = 0xffffffff; // maximum value, equal to -1 in signed form
    for(int i = 0; i &lt; buses.size(); ++i) {
        int start, interval, count;
        istringstream(buses[i]) &gt;&gt; start &gt;&gt; interval &gt;&gt; count;
        if(arrivalTime &lt;= start)
            result = min(result, unsigned(start - arrivalTime));
        else {
            int t = (arrivalTime - start + interval - 1) / interval;
            if(t &gt; 0 &amp;&amp; t &lt; count)
                result = min(result, unsigned(start + t * interval - arrivalTime));
        }
    }
    return result;
}</pre>
<p><strong>O(N*M) solution</strong></p>
This was the solutions used by most people and was less error prone because 
there were no cases you could miss.<br>Since <pre style="display: inline">N &le; 50</pre> &nbsp;and <pre style="display: inline">M &le; 100</pre> &nbsp;you 
can just iterate over all possible buses and choose the best one.<br>
C++ code:<pre>int waitingTime(vector &lt;string&gt; buses, int arrivalTime) {
    unsigned result = 0xffffffff; // maximum value, equal to -1 in signed form
    for(int i = 0; i &lt; buses.size(); ++i) {
        int start, interval, count;
        istringstream(buses[i]) &gt;&gt; start &gt;&gt; interval &gt;&gt; count;
        for(int j = 0; j &lt; count; ++j) {
            unsigned x = start + j * interval;
            if(x &gt;= arrivalTime)
                result = min(result, x - arrivalTime);
        }
    }
    return result;
}</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8609&amp;rd=12008" name="8609">PhoneNumbers</a></b> 

</font> 

<A href="Javascript:openProblemRating(8609)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      854 / 1392 (61.35%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      536 / 854 (62.76%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Loner</b> for 464.88 points (7 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      285.82 (for 536 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

One of the easiest solutions to this problem is to

recursively generate the

assignments in lexicographical order and then choose the one that scores the 
highest. To generate the assignments in lexicographical order one has to use a 
dash ('-') as soon as possible. To make sure that you are not wasting your time looking at the end parts of an 
assignment the like of which you have already analyzed you can stop when you 
reach the same position in the number with the same score. This solutions is 
intuitively correct, but as a good exercise you can find a solution with better 
complexity.</p>
<p>C++ implementation:</p>
<pre>struct PhoneNumbers {
  bool visited[100][200];
  string number, result;
  int res_score;
  
  void Solve(int pos, int score, string cur) {
    if(visited[pos][score])
      return;
    visited[pos][score] = true;
    if(pos == number.size()) {
      if(score &gt; res_score) {
        res_score = score;
        result = cur;
      }
      return;
    }
    set &lt;char&gt; S;
    for(int i = 0; i &lt; 3; ++i, ++pos) {
      if(pos &gt;= number.size())
        break;
      if(i == 0 &amp;&amp; cur != &quot;&quot;)
        cur += &quot;-&quot;;
      cur += number[pos];
      S.insert(number[pos]);
      if(i == 1)
        Solve(pos + 1, score + (S.size() == 1? 2: 0), cur);
      else if(i == 2)
        Solve(pos + 1, score + 3 - S.size(), cur);
    }
  }
  
  string bestNumber(string n) {
    memset(visited, 0x00, sizeof(visited));
    number = n;
    res_score = -1;
    Solve(0, 0, &quot;&quot;);
    return result;
  }
};</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8142&amp;rd=12008" name="8142">BlackWhiteRectangles</a></b> 

</font> 

<A href="Javascript:openProblemRating(8142)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519495" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      147 / 1392 (10.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      62 / 147 (42.18%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>pparys</b> for 686.81 points (21 mins 20 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      457.68 (for 62 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

In this problem one had to place rectangles with certain patterns of black 
cells. Since the maximum size of a rectangle is 40000<sup>2</sup> cells then it 
was not possible to directly simulate the process. Instead one could divide 
paper into a maximum of 2N*2N parts and then add the patters of all rectangles 
that cover that particular part. A relatively easy way to do that is to use 
bitmasks of 2*2 bits which represents the lower left corner of the part of the 
sheet being calculated. Once you have the bitmask you know that area <b>0</b> on the picture contains <pre style="display: inline">&lfloor;width / 2&rfloor; * &lfloor;height / 2&rfloor; * number_of_bits(bitmask)</pre> &nbsp;black 
cells. Then you can use parts of the bitmask to calculate the number of black 
cells in areas <strong>1</strong>, <strong>2 </strong>and <strong>3</strong>. 
<p><img alt="Shows positions of 1,2,3&amp;4" src="/i/education/tco08qualRd2.png" width="153" height="109"></p>
<p>A C++ implementation of the described approach:</p>
<pre>int mask[2][2][4];
struct rect1 {
  int x1, y1, x2, y2, type;
};

struct BlackWhiteRectangles {

  void createMasks() {
    memset(mask, 0x00, sizeof(mask));
    for(int sy = 0; sy &lt; 2; ++sy)
      for(int sx = 0; sx &lt; 2; ++sx) {
        for(int y = 0; y &lt; 2; ++y)
          for(int x = 0; x &lt; 2; ++x) {
            mask[sy][sx][0] |= (1 &lt;&lt; (2 * y + x));
            if((sy + y) % 2 == 1)
              mask[sy][sx][1] |= (1 &lt;&lt; (2 * y + x));
            if((sx + x) % 2 == 1)
              mask[sy][sx][2] |= (1 &lt;&lt; (2 * y + x));
            if((sy + y) % 2 == (sx + x) % 2)
              mask[sy][sx][3] |= (1 &lt;&lt; (2 * y + x));
          }
      }
  }
  
  int blackCount(vector &lt;string&gt; rectangles) {
    createMasks();
    set &lt;int&gt; X, Y;
    vector &lt;rect1&gt; rect(rectangles.size());
    foreach(i, 0, rectangles) {
      istringstream sis(rectangles[i]);
      sis &gt;&gt; rect[i].x1 &gt;&gt; rect[i].y1 &gt;&gt; rect[i].x2 &gt;&gt; rect[i].y2 &gt;&gt; rect[i].type;
      X.insert(rect[i].x1);
      X.insert(rect[i].x2);
      Y.insert(rect[i].y1);
      Y.insert(rect[i].y2);
    }
    vector &lt;int&gt; x(X.begin(), X.end());
    vector &lt;int&gt; y(Y.begin(), Y.end());
    int result = 0;
    foreach(i, 1, x)
      foreach(j, 1, y) {
        int black = 0, w = x[i] - x[i - 1], h = y[j] - y[j - 1];
        foreach(k, 0, rect) {
          if((rect[k].x1 &gt;? x[i - 1]) &gt;= (rect[k].x2 &lt;? x[i]))
            continue;
          if((rect[k].y1 &gt;? y[j - 1]) &gt;= (rect[k].y2 &lt;? y[j]))
            continue;
          black |= mask[(y[j - 1] - rect[k].y1 + 1) % 2][(x[i - 1] - rect[k].x1 + 1) % 2][rect[k].type - 1];
        }
        // ..
        // 0.
        result += __builtin_popcount(black) * (w / 2) * (h / 2);
        // ..
        // .1
        if(w % 2 == 1)
          result += __builtin_popcount(black &amp; 10) * (h / 2);
        // 2.
        // ..
        if(h % 2 == 1)
          result += __builtin_popcount(black &amp; 12) * (w / 2);
        // .3
        // ..
        if(w % 2 == 1 &amp;&amp; h % 2 == 1)
          result += __builtin_popcount(black &amp; 8);
      }
    return result;
  }
};</pre>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21547660" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
