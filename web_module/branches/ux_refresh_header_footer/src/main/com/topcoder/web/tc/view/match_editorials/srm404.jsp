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
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12176">Match Overview</a><br />
    <tc-webtag:forumLink forumID="521404" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 404</span><br />Thursday, June 5, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
    This match attracted 1439 competitors, 800 Div2 (117 newcomers) and 639 Div1. Div2 coders faced
    with usually hard Easy and Medium problem and a bit harder Hard problem. Div2 coders showed
    great performance in solving Medium problem and even 81.96% of submitted solutions were correct.
    Unfortunatelly, only two Div2 Hard solutions passed the system tests. Div1 coders faced with an easier
    Hard problem and a bit harder Medium problem, what can be seen by their Success Rate. Div1 coders
    showed great perfmormance solving Easy problem (same as Div2 Medium) - over 95% of submission were
    correct. Medium problem has two kind of solutions: one where you could use some data structure and 
    optimized it and in some cases risk will it run 1.99 or 2.01 seconds for some test cases - something
    like that happened to <tc-webtag:handle coderId="22668143" context="algorithm"/>; or to
    find algorithm that don't use any data structure and with high time margin passes the system tests.
</p>
<p>
    At first glance, it seems that Div1 Easy will trouble coders - i.e. a lot of red coders haven't so fast
    submission on this task as they usually have; one of them, 
    <tc-webtag:handle coderId="22675094" context="algorithm"/>, resubmitted his solution.
    <tc-webtag:handle coderId="251074" context="algorithm"/> first submitted Medium 
    problem solution and that was the fastest solution of all. Before challange phase started, first 5 
    positions in Div1    were <tc-webtag:handle coderId="7446789" context="algorithm"/>,
    <tc-webtag:handle coderId="8394868" context="algorithm"/>, 
    <tc-webtag:handle coderId="10574855" context="algorithm"/>, 
    <tc-webtag:handle coderId="251074" context="algorithm"/> and
    <tc-webtag:handle coderId="14768757" context="algorithm"/>. 
    At the beggining of challenge phase coders were focused on Medium problem and it showed as good 
    decision. Challenge phase made some changes in top three positions moving
    <tc-webtag:handle coderId="251074" context="algorithm"/> on the second place. 
    System testing phase made final list.
    Without any challenge made at all <tc-webtag:handle coderId="7446789" context="algorithm"/>
    won the match, folowed by <tc-webtag:handle coderId="251074" context="algorithm"/> who
    thanks to 125 points earned in challenge phase need only 2 points more to won the match. Third place
    took <tc-webtag:handle coderId="8394868" context="algorithm"/> who continue showing
    his great success and became
    target - congrats <tc-webtag:handle coderId="8394868" context="algorithm"/>!
    <tc-webtag:handle coderId="14768757" context="algorithm"/> and
    <tc-webtag:handle coderId="20463878" context="algorithm"/> took fourth and fifth
    place respectively.
</p>

<p>
    In Div2, before the Challange phase started, newcomers 
    <tc-webtag:handle coderId="22715878" context="algorithm"/> and 
    <tc-webtag:handle coderId="22737342" context="algorithm"/> were on the second
    and third place respectively, and
    <tc-webtag:handle coderId="8392846" context="algorithm"/> was on the first place.
    Challenge phase and System testing phase was too cruel to top 3 coders and changed 
    the top 3 places at all. 
    <tc-webtag:handle coderId="22706163" context="algorithm"/> won the match with over
    100 points margin, folowed 
    by <tc-webtag:handle coderId="22675110" context="algorithm"/> who earned 50 points
    in Challange phase. Third place took 
    <tc-webtag:handle coderId="22630124" context="algorithm"/> who won 100 points
    in the Challange phase. Forth and fifth place went to newcomers
    <tc-webtag:handle coderId="22737276" context="algorithm"/> 
    and <tc-webtag:handle coderId="22715878" context="algorithm"/>     respectively.
</p>

<p>
    Note that after this match there are even 15 targets!
</p>

 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8216&amp;rd=12176" name="8216">ReadingBooks</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8216)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521404" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      610 / 789 (77.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      345 / 610 (56.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>SheynHu</strong> for 247.31 points (2 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      167.89 (for 345 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
                This problem was a classical greedy one. If you carefully solve the examples, you will notice
                that starting form the first part of input each time you find 3 different consecutive 
                parts (that means you can read the whole book) take it as one book, increment you result and
                go on from the last choosen part.
                Let's proove that algorithm is correct.<br />
                Suppose there is some set <strong>book1</strong> of three different 
                parts (i.e. "story", "introduction", "eidification") that shouldn't be considered as one book
                in order to get the optimal solution. Consider next set <strong>book2</strong> that contains three different
                parts, but such set that first appears after <strong>book1</strong> and it is part of the optimal solution.
                In that case there are two options:<br />
                <ul>
                    <li><strong>book1</strong> and <strong>book2</strong> do not overlap. We will make this part of proof by 
                        contradiction.<br />
                        If parts that    appear in <strong>book1</strong> are completely removed, it will not affect the optimal 
                        solution. In that case, there is one
                        book more that can be read completely (that is <strong>book1</strong>), so the optimal solution 
                        can be increased, what is    contradiction that the solution without <strong>book1</strong> is 
                        optimal one.
                    </li>
                    <li>
                        <strong>book1</strong> and <strong>book2</strong> overlap. We will show that it doesn't matter whether you
                        choose <strong>book1</strong> or <strong>book2</strong>.<br />
                        Take together all part from the both sets. There will be at most 5 parts. With those 5 parts
                        you can include exactly one book more in the final result - (<strong>book2</strong> and <strong>book1</strong> 
                        gives at least one book, but for more than one book
                        you need at least 6 parts, so there is no way to have two or more books). 
                        But choosing <strong>book1</strong> instead <strong>book2</strong> will not change the rest of optimal solution,
                        because <strong>book1</strong> appears before <strong>book2</strong>. Also, chossing <strong>book1</strong> will disable
                        to choose <strong>book2</strong> and vice versa (so whatever you choose, you will be able
                        to choose only one book), what means that choosing <strong>book1</strong> instead 
                        <strong>book2</strong> doesn't affect the optimal solution at all.
                    </li>
                </ul>
                Once we figure out what it a proper algorithm, coding is quite simple. Below is 
                Java code that uses simple mask. There was a lot of solutions, but basically all of them
                uses same idea.
<code><pre><font color="#0000FF">public</font> <font color="#0000FF">int</font> countBooks(<font color="#FF0000">String</font>[] readParts){
    <font color="#0000FF">int</font> ret = 0;
    <font color="#0000FF">int</font> mask[] = <font color="#0000FF">new int</font>[readParts.<font color="#0000FF">length</font>];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; readParts.<font color="#0000FF">length</font>; i++)
        <font color="#0000FF">if </font>(readParts[i].equals(<font color="#808080">"introduction"</font>))
            mask[i] = 1;
        <font color="#0000FF">else if</font> (readParts[i].equals(<font color="#808080">"story"</font>))
            mask[i] = 2;
        <font color="#0000FF">else</font>
            mask[i] = 4;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 2; i &lt; readParts.<font color="#0000FF">length</font>; i++)
        <font color="#0000FF">if </font>((mask[i] | mask[i - 1] | mask[i - 2]) == 7){
            ret++;
            i += 2;
        }
    <font color="#0000FF">return</font> ret;
}</pre></code>
            
<tc-webtag:handle coderId="22687104" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297489&amp;rd=12176&amp;pm=8216&amp;cr=22687104">solution</a> is
similar as described above. For clean and short solution you can take a look at 
<tc-webtag:handle coderId="22636459" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297491&amp;rd=12176&amp;pm=8216&amp;cr=22636459">solution</a>.


            
            <h4>Homework</h4>
            <ul>
                <li>
                    Try to solve the task when parts have to be read in given order (i.e. first <em>introduction</em>,
                    then <em>story</em>, then <em>edification</em>, so ("introduction", "edification", "story")
                    can't be parts of one book - result 0, but ("introduction", "story", "edification") could be 
                    - result 1).
                    
                </li>
            </ul>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8215&amp;rd=12176" name="8215">RevealTriangle</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8215)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521404" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      381 / 789 (48.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      314 / 381 (82.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Hanaban</strong> for 466.80 points (7 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.28 (for 314 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      617 / 637 (96.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      594 / 617 (96.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 246.89 points (3 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.68 (for 594 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
                This problem was fairly clear and easy to understand. So detailed descrpition of the example 0
            gave almost complete algorithm of the solution. But let us explain the solution completely.<br />
            First of all, if you are given such configuration as it was given in the problem, 
            there always exists unique solution.<br />
            First step is to show if are known two neighbour digits (one in the same row and
            in the row below), than third can be determined uniquely. Let <strong>a</strong> and <strong>c</strong> be known 
            and <strong>b</strong> unknown digit. Then 
            (<strong>a</strong>+<strong>b</strong>) MOD 10=<strong>c</strong>; 0&le;<strong>a</strong>,<strong>b</strong>,<strong>c</strong>&le;9
            <ul>
                <li>
                    if <strong>a</strong>&gt;<strong>c</strong> =&gt; <strong>a</strong>+<strong>b</strong>-10=<strong>c</strong> =&gt; <strong>b</strong>=<strong>c</strong>+10-<strong>a</strong>
                </li>
                <li>
                    if <strong>a</strong>&lt;=<strong>c</strong> =&gt; <strong>a</strong>+<strong>b</strong>=<strong>c</strong> =&gt; <strong>b</strong>=<strong>c</strong>-<strong>a</strong>
                </li>
            </ul>
            When we know the fact explained above, we can determine the trianlge starting with the first row 
            (row with only one element) and moving to the last row. Suppose we determined the row <strong>r</strong> and
            we should determine the row <strong>r+1</strong> where the <strong>k</strong>-th element of the <strong>r+1</strong>-th row
            is known. To determine the row <strong>r+1</strong> we will seperately determined the
            elements on the left side and the element on the right side of <strong>k</strong>-th element.<br />
            <em>elements on the left side</em>: using <strong>k</strong>-th element and an element from the row <strong>r</strong>
            determine the <strong>k-1</strong>-th element; using the element <strong>k-1</strong> and corresponding element
            form the row <strong>r</strong> determine the element <strong>k-2</strong> and so on, until the first element is reached.
            <br />
            <em>elements on the right side</em>: for this side is almost same 
            as for the elements on the left side, just start revealing the element <strong>k+1</strong>, then
            the element <strong>k+2</strong> and so on, until the last element is reached.<br /><br />
            At the begging all digits are uniquely determined (it is part of the problem). Using
            the idea that explain us how to determine third neighbour if two of them are known, a new digit
            is always uniquely determined, so the whole triangle is uniquely determined.<br />
            Below is code written in Java that folows explained solution
<pre><code><font color="#0000FF">public</font> <font color="#FF0000">String</font>[] calcTriangle(<font color="#FF0000">String</font>[] questionMarkTriangle){
    <font color="#FF0000">String</font>[] ret = questionMarkTriangle;
    <font color="#0000FF">int</font> n = ret.<font color="#0000FF">length</font>;
    <font color="#0000FF">if </font>(n == 1)
        <font color="#0000FF">return</font> ret;
    <font color="#0000FF">int</font> pos[] = <font color="#0000FF">new</font> int[n];
    <font color="#0000FF">char</font> cc[][] = <font color="#0000FF">new char</font>[n][n];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; n; i++)
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = 0; j &lt; ret[i].<font color="#0000FF">length</font>(); j++){
            cc[i][j] = ret[i].charAt(j);
            <font color="#0000FF">if </font>(cc[i][j] != '?')
                pos[i] = j;
        }
    <font color="#008080">// go through <strong>questionMarkTriangle</strong> and restore values</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = n - 2; i &gt; -1; i--){
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = pos[i] + 1; j &lt; n - i; j++)
            cc[i][j] = (<font color="#0000FF">char</font>)((cc[i + 1][j - 1] - cc[i][j - 1] + 10) % 10 + 48);
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = pos[i] - 1; j &gt; -1; j--)
            cc[i][j] = (<font color="#0000FF">char</font>)((cc[i + 1][j] - cc[i][j + 1] + 10) % 10 + 48);
    }
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; n; i++)
        ret[i] = <font color="#0000FF">new</font> <font color="#FF0000">String</font>(cc[i], 0, ret[i].<font color="#0000FF">length</font>());
    <font color="#0000FF">return</font> ret;
}</code></pre>
            This problem was solved by lot of coders - even 96.28% of submitted Div1 solutions were correct. 
            Div2 coders were also successful with the problem - 81.96% of submitted solution were correct.
You can take a look at
<tc-webtag:handle coderId="14769155" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297454&amp;rd=12176&amp;pm=8215&amp;cr=14769155">solution</a> or
<tc-webtag:handle coderId="22713379" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297491&amp;rd=12176&amp;pm=8215&amp;cr=22713379">solution</a>.

            <h4>Homework</h4>
            <ul>
                <li>
                    Try to solve the problem where you are given <code>int[] val</code> and 
                    <code>int[] pos</code>, where <code>(pos[i], val[i])</code> means in the 
                    <code>i</code>-th row <code>pos[i]</code>-th element is <code>val[i]</code>, but others in that row
                    are unknown. <code>val[i]</code> fits into 16-bit integer.
                </li>
            </ul>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9755&amp;rd=12176" name="9755">GetToTheTop</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9755)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521404" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      17 / 789 (2.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 17 (11.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>leehark</strong> for 505.17 points (36 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.48 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
            This problem is a dynamic programming problem. Part of the problem involves using math to
            find out whether John can jump from one stair to another stair. First, we will examine the "math
            part".<br />
            Suppose there are two stairs <strong>st1</strong> and <strong>st2</strong>, given by positions of its left
            endpoints (<strong>st1.x</strong>, <strong>st1.y</strong>) and (<strong>st2.x</strong>, <strong>st2.y</strong>) and by its length
            <strong>st1.len</strong> and <strong>st2.len</strong>. We will suppose that <strong>st1.y</strong> &lt; <strong>st2.y</strong>.
            Consider two cases:
            <ul>
                <li>(<strong>st1.x</strong>&lt;=<strong>st2.x</strong> and <strong>st2.x</strong>&lt;=<strong>st1.x</strong>+<strong>st1.len</strong>) or
                        (<strong>st2.x</strong>&lt;=<strong>st1.x</strong> and <strong>st1.x</strong>&lt;=<strong>st2.x</strong>+<strong>st2.len</strong>) (**)- like
                        on the picture presented below<br /><br />
                        <center>
                            <img src="/i/education/srm404_01.gif" alt="gttt1" />
                        </center><br />
                        It is obvioulsy that for each segment <strong>b</strong> (red-dotted segment on the picture) its length
                        is always greater or equal to the length of the segment <strong>a</strong> (blue-filled segment
                        on the picture). So, in this case, the shortest distance between these stairs
                        is just <strong>st1.y</strong>-<strong>st2.y</strong> and if that value is smaller or equal to <strong>K</strong>, 
                        <strong>st2</strong> is reachable from <strong>st1</strong>.
                </li>
                <li>else (The previous condition (**) is not satisfied) - one possibility is
                        presented on the picture below<br /><br />
                        <center>
                            <img src="/i/education/srm404_02.gif" alt="gttt2" />
                        </center><br />
                        Let us calculate a distance between some point of <strong>st1</strong> (on the picture it is 
                        the endpoint) and some point of <strong>st2</strong> (on the picture the length <strong>b</strong>).<br />
                        <strong>b</strong>^2 = (<strong>d2</strong> + <strong>d3</strong>)^2 + <strong>d1</strong>^2 = <strong>d2</strong>^2 + 2*<strong>d2</strong>*<strong>d3</strong>
                        + <strong>d3</strong>^2 + <strong>d1</strong>^2 = <strong>d1</strong>^2 + <strong>d2</strong>^2 + 2*<strong>d2</strong>*<strong>d3</strong> + <strong>d3</strong>^2 
                        &ge; <strong>a</strong>^2, that means <strong>b</strong> &gt; <strong>a</strong>. So, in this case, when we fix point
                        on one stair, the smallest difference between that point and another stair is along
                        the segment that is connected to the endpoint of the second stair. Final conclusion
                        is that the shortest distance have to be founded between stairs' endpoints. If the shortest
                        of all such distances is smaller or equal to <strong>K</strong>, then <strong>st2</strong> is reachable from
                        the stair <strong>st1</strong>.
                </li>
            </ul>
            
            Below is given a short method that returns whether two stairs with indexes <strong>idx1</strong> and
            <strong>idx2</strong> are reachable or not.
<code><pre>
<font color="#0000FF">int</font> sqr(<font color="#0000FF">int</font> val){
    <font color="#0000FF">return</font> val * val;
}

<font color="#0000FF">boolean</font> reachable(<font color="#0000FF">int</font> idx1, <font color="#0000FF">int</font> idx2){
    <font color="#008080">// the first case</font>
    <font color="#0000FF">if</font> ((stair[idx1].x &lt;= stair[idx2].x &amp;&amp; stair[idx2].x &lt;= stair[idx1].x + stair[idx1].len) ||
        (stair[idx2].x &lt;= stair[idx1].x &amp;&amp; stair[idx1].x &lt;= stair[idx2].x + stair[idx2].len))
        <font color="#0000FF">return</font> <font color="#FF0000">Math.</font>abs(stair[idx1].y - stair[idx2].y) &lt;= K;
    <font color="#008080">// the second case</font>
    <font color="#0000FF">return</font> (sqr(stair[idx2].x - stair[idx1].x - stair[idx1].len) + 
        sqr(stair[idx2].y - stair[idx1].y) &lt;= sqr(K)) || (sqr(stair[idx1].x - 
        stair[idx2].x - stair[idx2].len) + sqr(stair[idx1].y - stair[idx2].y) &lt;= sqr(K));
}
</pre></code>
            When we finished with this part, we move step on and define
            how to solve the main problem.<br />
            Let <code>dp[i]</code> be the highest number of sweets that John can collect starting 
            his "jump-journey" from the stair <code>i</code>. We will consider that stairs <strong>st1</strong>, 
            <strong>st2</strong>, ..., <strong>stk</strong> are in the same group iff for each stair all others are reachable - 
            actually, that are all reachable stairs wit same y-coordinate. Note that when John is positioned
            on some stair, he should collect all sweets within the current group of stairs, because
            he can visit all stairs of some group and get back to the stair from which he started visiting to
            decide what next :)<br />
            We explained what should be done with stairs within the same group, John can't move down, so 
            next what he can done is to go up. John can move wherever he wants inside the group, that menas
            from one stair inside the group he can get to each stair that is reachable
            from any stair from the group.
            His next jump to some stair <code>next</code> reachable from the group had to be choosen in 
            such way that <code>dp[next]</code> is maximal.<br />
            When <code>dp</code> value is calculated for each stair, return that one with maximal value.
            Below is commented code in Java that should help to reader to understand the idea of the algorithm.
<code><pre><font color="#0000FF">private</font> <font color="#0000FF">class</font> Stair implements Comparable{
    <font color="#0000FF">int</font> x, y, len, sw;
    Stair(<font color="#0000FF">int</font> x, <font color="#0000FF">int</font> y, <font color="#0000FF">int</font> len, <font color="#0000FF">int</font> sw){
        <font color="#0000FF">this</font>.x = x;
        <font color="#0000FF">this</font>.y = y;
        <font color="#0000FF">this</font>.len = len;
        <font color="#0000FF">this</font>.sw = sw;
    }
    
    <font color="#0000FF">public</font> <font color="#0000FF">int</font> compareTo(<font color="#FF0000">Object</font> stairo){
        Stair stair = (Stair)(stairo);
        <font color="#0000FF">if </font>(y &lt; stair.y)
            <font color="#0000FF">return</font> -1;
        <font color="#0000FF">else if</font> (y &gt; stair.y)
            <font color="#0000FF">return</font> 1;
        <font color="#0000FF">else</font>{
            <font color="#0000FF">if </font>(x &lt; stair.x)
                <font color="#0000FF">return</font> -1;
            <font color="#0000FF">else</font>
                <font color="#0000FF">return</font> 1;
        }
    }
}

Stair stair[];
<font color="#0000FF">int</font> n, K;
<font color="#0000FF">int</font> dp[];

<font color="#0000FF">int</font> memo(<font color="#0000FF">int</font> idx){
    <font color="#008080">// if it is already calculated, return it</font>
    <font color="#0000FF">if </font>(dp[idx] != -1)
        <font color="#0000FF">return</font> dp[idx];
    
    <font color="#008080">// sum sweets that are reachable from current stair and they are placed on same y line</font>
    <font color="#0000FF">int</font> sum = stair[idx].sw, st1, st2, i;
    <font color="#0000FF">for </font>(i = idx - <font color="#FF0000">1</font>; i &gt; <font color="#FF0000">-1</font>; i--)
        <font color="#0000FF">if </font>((stair[i].y == stair[i + <font color="#FF0000">1</font>].y) &amp;&amp; reachable(i, i + <font color="#FF0000">1</font>))
            sum += stair[i].sw;
        <font color="#0000FF">else</font>
            <font color="#0000FF">break</font>;
    st1 = i + <font color="#FF0000">1</font>;
    <font color="#0000FF">for </font>(i = idx + <font color="#FF0000">1</font>; i &lt; n; i++)
        <font color="#0000FF">if </font>((stair[i].y == stair[i - <font color="#FF0000">1</font>].y) &amp;&amp; reachable(i, i - <font color="#FF0000">1</font>))
            sum += stair[i].sw;
        <font color="#0000FF">else</font>
            <font color="#0000FF">break</font>;
    st2 = i - <font color="#FF0000">1</font>;
    <font color="#008080">// now we have the sum. let's go through all stairs and try to jump on any reachable</font>
    dp[idx] = <font color="#FF0000">0</font>;

    <font color="#0000FF">for </font>(i = <font color="#FF0000">0</font>; i &lt; n; i++)
        <font color="#008080">// try reachable stairs</font>
        <font color="#0000FF">if </font>(i != idx &amp;&amp; stair[i].y >= stair[idx].y &amp;&amp; reachable(i, idx)){
            <font color="#0000FF">if </font>(stair[i].y == stair[idx].y)
                dp[idx] = <font color="#FF0000">Math.</font>max(dp[idx], memo(i));
            <font color="#0000FF">else</font>
                dp[idx] = <font color="#FF0000">Math</font>.max(dp[idx], memo(i) + sum);
        }
    <font color="#008080">// now we should update stairs optimal solutions
    // suppose for some group of reachable stairs with the same y-coord, optimal solution
    // exists for stair with index idx. if we move left from idx to check stair on the same line
    // then we can't move from idx-1 to idx (note that dp[idx] = 0 in that time - if it is not, we
    // could get infinite recursion), but we should update dp[idx-1] to dp[idx] later</font>
    <font color="#0000FF">for </font>(i = st1; i &lt;= st2; i++){
        <font color="#008080">// don't update stair that wasn't visited yet, because latter you
        // won't be able to examine that</font>            
        <font color="#0000FF">if </font>(dp[i] == <font color="#FF0000">-1</font>)
            memo(i);
        dp[i] = <font color="#FF0000">Math.</font>max(dp[i], dp[idx]);
    }
    
    <font color="#008080">// if can't reach any stair, then maximum is collected sweets on the y-coord</font>
    dp[idx] = <font color="#FF0000">Math.</font>max(dp[idx], sum);
    <font color="#0000FF">return</font> dp[idx];
}

<font color="#0000FF">int</font> collectSweets(<font color="#0000FF">int</font> K, <font color="#0000FF">int</font>[] sweets, 
        <font color="#0000FF">int</font>[] x, <font color="#0000FF">int</font>[] y, <font color="#0000FF">int</font>[] stairLength){
    <font color="#0000FF">this</font>.K = K;
    n = sweets.<font color="#0000FF">length</font>;
    dp = <font color="#0000FF">new int</font>[n];
    Arrays.fill(dp, <font color="#FF0000">-1</font>);
    stair = <font color="#0000FF">new</font> Stair[n];
    <font color="#0000FF">for </font>(<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++)
        stair[i] = <font color="#0000FF">new</font> Stair(x[i], y[i], stairLength[i], sweets[i]);
    Arrays.sort(stair);
    <font color="#0000FF">int</font> ret = <font color="#FF0000">0</font>;
    <font color="#0000FF">for </font>(<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++)
        <font color="#0000FF">if </font>(stair[i].y &lt;= K)
            <font color="#008080">// for each stair, check if John starting from 
            // it can collect maximum number of sweets.</font>
            ret = <font color="#FF0000">Math.</font>max(memo(i), ret);
    <font color="#0000FF">return</font> ret;
}</pre></code>
<br />
        <strong>Alternative solution:</strong><br /><br />
        Let us remind about groups of stairs. We didn't mention that if some stair from a first group can reach
        some stair from a second group, then from each stair from the first group there is jump-path
        that reaches any stair in the second group - in this case we will say the first group
        can reach the second. This is possible because all stairs
        within same group are jump-reachable. Let us make a short description what we was doing in
        our algorithm: start with some group; visit <strong>all</strong> stairs within that group; reach next group
        and continue with same steps. So much times group that I would like to change it into something another
        - what about graph :) Seriously, if group is represented as node, then two groups can be
        connected or not - reason behind this was just explained. Moving from stair to stair is same
        as moving from group to group. Modeling the problem as graph where each node has cost, the cost
        is actually sum of sweets in the group, we get topological graph and problem is
        to find path with highest sum respect to costs of the nodes.<br />
        Below is code for this kind of solution.
<code><pre><font color="#0000FF">int</font> numg;
<font color="#0000FF">boolean</font> g[][];
<font color="#0000FF">int</font> sumg[], markg[], yg[];
<font color="#0000FF">int</font> ret;

<font color="#0000FF">int</font> dfs(<font color="#0000FF">int</font> v){
    <font color="#0000FF">if </font>(dp[v] != -1)
        <font color="#0000FF">return</font> dp[v];
    <font color="#0000FF">int</font> ret = sumg[v];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; numg; i++)
        <font color="#0000FF">if </font>(g[v][i])
            ret = <font color="#FF0000">Math</font>.max(ret, dfs(i) + sumg[v]);
    <font color="#0000FF">return</font> dp[v] = ret;
}

<font color="#0000FF">public</font> <font color="#0000FF">int</font> collectSweets(<font color="#0000FF">int</font> K, <font color="#0000FF">int</font>[] sweets, <font color="#0000FF">int</font>[] x, <font color="#0000FF">int</font>[] y, <font color="#0000FF">int</font>[] stairLength){
    <font color="#0000FF">this</font>.K = K;
    n = sweets.<font color="#0000FF">length</font>;
    dp = <font color="#0000FF">new int</font>[n];
    Arrays.fill(dp, -1);
    stair = <font color="#0000FF">new</font> Stair[n];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; n; i++)
        stair[i] = <font color="#0000FF">new</font> Stair(x[i], y[i], stairLength[i], sweets[i]);
    Arrays.sort(stair);
    sumg = <font color="#0000FF">new int</font>[50];
    markg = <font color="#0000FF">new int</font>[50];
    yg = <font color="#0000FF">new int</font>[50];
    numg = 0;
    <font color="#008080">// count number of groups</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; stair.<font color="#0000FF">length</font>; ){
        <font color="#0000FF">int</font> j = i + 1, sum = stair[i].sw;
        markg[i] = numg;
        <font color="#0000FF">while</font> (j &lt; stair.<font color="#0000FF">length</font> &amp;&amp; stair[j].y == stair[i].y &amp;&amp; reachable(j - 1, j)){
            sum += stair[j].sw;
            // mark j as part of the group numg
            markg[j] = numg;
            j++;
        }
        <font color="#008080">// number of sweets in the group numg</font>
        sumg[numg] = sum;
        yg[numg] = stair[i].y;
        i = j;
        numg++;
    }
    
    g = <font color="#0000FF">new boolean</font>[numg][numg];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; numg; i++)
        Arrays.fill(g[i], <font color="#0000FF">false</font>);
    <font color="#008080">// make graph</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; stair.<font color="#0000FF">length</font>; i++)
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = i + 1; j &lt; stair.<font color="#0000FF">length</font>; j++)
            <font color="#0000FF">if </font>(markg[i] != markg[j])
                <font color="#0000FF">if </font>(reachable(i, j))
                    g[markg[i]][markg[j]] = <font color="#0000FF">true</font>;
    <font color="#008080">// we got topological graph, run DFS</font>
    Arrays.fill(dp, -1);
    <font color="#0000FF">int</font> ret = 0;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 0; i &lt; numg; i++)
        <font color="#0000FF">if </font>(yg[i] &lt;= K)
            ret = <font color="#FF0000">Math</font>.max(ret, dfs(i));
    <font color="#0000FF">return</font> ret;
}</pre></code>
You can take a look at
<tc-webtag:handle coderId="22706163" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297489&amp;rd=12176&amp;pm=9755&amp;cr=22706163">solution</a> or
<tc-webtag:handle coderId="22675110" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=297496&amp;rd=12176&amp;pm=9755&amp;cr=22675110">solution</a>.

            <h4>Homework</h4>
            <ul>
                <li>
                    Try to solve task if John is not able to make more than <code>maxJump</code> jumps.
                </li>
            </ul>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8154&amp;rd=12176" name="8154">KSubstring</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8154)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521404" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      286 / 637 (44.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      104 / 286 (36.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 446.94 points (10 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301.47 (for 104 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This problem was a bit harder than usual Medium Div1 problem. We will show three
    aproaches, but only one that surely will not TLE.<br /><br />
    <strong>First approach</strong><br />
        For each <code>k</code> (just to remind, <code>k</code> is a length of subsequence) 
        compare all subsequnces. This runs in <code>O(n^3)</code> what is of course too slow to pass
        for 2 sec.<br /><br />
        
    <strong>Second approach</strong><br />
    For each <code>k</code> calc all sums and remember their indexes. Sort all sums.
    Go through all sums from the smallest one. Also provide your algorithm with
    segment/interval tree where you will be able to find maximal element in logarithmic time 
    within some interval. Let us explain how a sum should be added to interval tree.<br />
    Consider sum <code>s(i, k) = val(i)</code>. <code>i</code> is remembered before sorting
    so it is still presented, <code>val(i)</code> is sum and <code>k</code> is the length of
    the subsequence. <code>s(i, k)</code> should be stored in tree as the value of <code>i</code>-th
    leaf. We also should use tree to find what is minimal difference with current sum and
    already processed sums. In order to done that, find maximal value in tree in interval
    <code>[0, i)</code> and <code>[i + k, n)</code> - sums with indexes <code>[i, i + k)</code>
    will overlap with the current one.<br />
    Time complexity of this algorithm is <code>O(n^2 log n)</code> with a "high" constant, so it
    is quite risky, we are not sure will it pass within 2 sec. - probably will not for the worst test case.
    <br /><br />
    <strong>Third approach</strong><br />
    <strong>Lemma 1</strong>:
        <em>If there exists two sums <code>s(i, k)</code> and <code>s(j, k)</code>, (<code>i &lt; j</code>), with
            difference <code>dif</code> and they overlap, then there exists sums <code>s(i1, k1)</code>
            and <code>s(j1, k1)</code> that have the same difference and do not overlap.</em><br />
    <strong>Proof</strong>.
    <code>s(i, k)</code> and <code>s(j, k)</code> can be written as <br />
    <code>s(i, k) = a<sub>i</sub> + a<sub>i+1</sub> + ... + a<sub>i+k-1</sub></code>, and<br />
    <code>s(j, k) = a<sub>j</sub> + a<sub>j+1</sub> + ... + a<sub>j+k-1</sub></code>.
    <br />Because they overlap, there must exists some <code>p</code> such that <code>a<sub>p</sub></code>
    belongs to <code>s(i, j)</code> and <code>s(j, k)</code>. But <br />
    <code>i &lt j, j &le; p =&gt; j</code> belongs to the intersection part<br />
    <code>i &lt j =&gt; i+k-1 &lt; j+k-1</code>, finally we can conclude that
    elements <code>a<sub>j</sub>, a<sub>j+1</sub>, ..., a<sub>i+k-1</sub></code> belong
    to the intersection part (ilustrated on the picture below).<br />
    <center>
        <img src="/i/education/srm404_03.gif" alt="ks" />
    </center>
    <br />
    Rewrite that difference as<br />
    <code>s(i, k) - s(j, k) = (a<sub>i</sub> + a<sub>i+1</sub> + ... + a<sub>j-1</sub> + 
        a<sub>j</sub> + ... + a<sub>i+k-1</sub>) -
        (a<sub>j</sub> + a<sub>j+1</sub> + ... + a<sub>i+k-1</sub> + a<sub>i+k</sub> + 
        ... + a<sub>j+k-1</sub>) = <br />(a<sub>i</sub> + a<sub>i+1</sub> + ... + a<sub>j-1</sub>) - 
        (a<sub>i+k</sub> + a<sub>i+k+1</sub> + ... + a<sub>j+k-1</sub>) = s(i, j-i) - s(i+k, j-i)</code>.
        <br /><br />
        So, <code>s(i, k) - s(j, k) = s(i, j-i) - s(i+k, j-i)</code>.<br /><br />
        
    As in the <strong>Second approach</strong> we are looking for the minimal difference for each possible 
    <code>k</code> starting with the smallest one.
    To find the smallest difference between two subsequence, we will sort all sums and
    consider only neighbour sorted sums. It is already explained in 
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=srm398">editorial</a> 
    for SRM 398 Div2 Easy problem why we can sort elements in order to find the minimal difference.
    <strong>Lemma 1</strong> guarantee that if we compare two elements that have minimal difference, 
    but they overlap, then we also found the same difference between two sums that didn't overlap.
    <br /><br />
    Algorithm could be divided into two parts whether minimal difference reached 0 or not.
    <ul>
        <li>If the minimal difference didn't reach 0 yet, we just should compare
        two neighbour sorted sums as it was explained above.</li>
        <li>
            If the minimal difference is 0, then within the sorted sums we only should check
            if there exist subsequnces with the same sum values - we need this in order to update
            <code>k</code> that should be returned. But now, if for each sum value we check with
            all others to find out whether it overlap or not, our algorithm could become too slow.
            The trick is to find minimal and maximal index of all sums with a same sum value
            and check whether they overlap or not; or we can sort sums by sum and indexes (as it was
            done in the solution below).
        </li>
    </ul>
    This algorithm uses only sort and two loops and it passes for the worst test case in about 1 second.
<code><pre><font color="#0000FF">private</font> <font color="#0000FF">class</font> Sum implements Comparable{
    <font color="#0000FF">int</font> idx;
    <font color="#0000FF">long</font> val;
    Sum(long val, <font color="#0000FF">int</font> idx){
        <font color="#0000FF">this</font>.val = val;
        <font color="#0000FF">this</font>.idx = idx;
    }
    
    <font color="#0000FF">public</font> <font color="#0000FF">int</font> compareTo(<font color="#FF0000">Object</font> sumo){
        Sum sum = (Sum)(sumo);
        <font color="#0000FF">if </font>(val &lt; sum.val)
            <font color="#0000FF">return</font> -1;
        <font color="#0000FF">else if</font> (val == sum.val){
            <font color="#0000FF">if </font>(idx &lt; sum.idx)
                <font color="#0000FF">return</font> -1;
            <font color="#0000FF">else if</font> (idx == sum.idx)
                <font color="#0000FF">return</font> 0;
            <font color="#0000FF">else</font>
                <font color="#0000FF">return</font> 1;
        }
        <font color="#0000FF">else</font>
            <font color="#0000FF">return</font> 1;
    }
}

<font color="#0000FF">int</font>[] maxSubstring(<font color="#0000FF">int</font> A0, <font color="#0000FF">int</font> X, <font color="#0000FF">int</font> Y, <font color="#0000FF">int</font> M, <font color="#0000FF">int</font> n){
    <font color="#0000FF">long</font> A[] = <font color="#0000FF">new</font> <font color="#0000FF">long</font>[n];
    <font color="#0000FF">long</font> ss[] = <font color="#0000FF">new</font> <font color="#0000FF">long</font>[n + 1];
    ss[0] = 0;
    ss[1] = A0;
    A[0] = A0;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = 1; i &lt; n; i++){
        A[i] = ((A[i - 1] * (<font color="#0000FF">long</font>)(X) + (<font color="#0000FF">long</font>)(Y)) % (<font color="#0000FF">long</font>)(M));
        ss[i + 1] = ss[i] + A[i];
    }

    <font color="#0000FF">int</font> retlen = 1 &lt;&lt; 20, i, j, slen;
    <font color="#0000FF">long</font> val = 1L &lt;&lt; 60L, sum;
    Sum s[] = <font color="#0000FF">new</font> Sum[n];
    slen = n + 1;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> len = 1; 2 * len &lt;= n; len++){
        slen--;
        <font color="#0000FF">for</font> (i = 0; i &lt; slen; i++)
            s[i] = <font color="#0000FF">new</font> Sum(ss[i + len] - ss[i], i);

        Arrays.sort(s, 0, slen);
        
        <font color="#0000FF">if </font>(val &gt; 0)
            <font color="#0000FF">for</font> (i = 0; i &lt; slen - 1; i++){
                <font color="#008080">// try to update return values if subsequences do not overlap</font>
                <font color="#0000FF">if </font>(s[i + 1].val - s[i].val &lt;= val &amp;&amp;
                    <font color="#FF0000">Math</font>.min(s[i + 1].idx, s[i].idx) + len &lt;= Math.max(s[i + 1].idx, s[i].idx)){
                        val = s[i + 1].val - s[i].val;
                        retlen = len;
                    }
                }
        <font color="#0000FF">else</font>{
            <font color="#008080">// sorted array is something like a..ab...bc..cd..d.... and we find
            // max and min index in each x..x - they are sorted, so we should find the index
            // of the leftomost and the rightmost x</font>
            i = 0;
            <font color="#0000FF">while</font> (i &lt; slen){
                j = i + 1;
                <font color="#0000FF">while</font> (j &lt; slen &amp;&amp; s[j].val == s[i].val)
                    j++;
                <font color="#0000FF">if </font>(s[i].idx + len &lt;= s[j - 1].idx)
                    retlen = len;
                i = j;
            }
        }
    }
    <font color="#0000FF">int</font> ret[] = <font color="#0000FF">new</font> <font color="#0000FF">int</font>[2];
    ret[0] = retlen;
    ret[1] = (<font color="#0000FF">int</font>)(val);
    <font color="#0000FF">return</font> ret;
}</pre></code>
    <br />
    As a references on a different solutions, you can take a look at
    <tc-webtag:handle coderId="10428762" context="algorithm"/>'s
    <a href="/stat?c=problem_solution&amp;cr=10428762&amp;rd=12176&amp;pm=8154">solution</a>,
    at <tc-webtag:handle coderId="15805598" context="algorithm"/>'s
    <a href="/stat?c=problem_solution&amp;rm=297469&amp;rd=12176&amp;pm=8154&amp;cr=15805598">solution</a>
    or 
    <tc-webtag:handle coderId="251074" context="algorithm"/>'s
    <a href="/stat?c=problem_solution&amp;rm=297457&amp;rd=12176&amp;pm=8154&amp;cr=251074">solution</a>
    <h4>Homework</h4>
    <ul>
        <li>
            Try to solve task if in case there are more solutions with same difference and <code>k</code>,
            return that one with a highest difference between minimal elements of the resulting
            subsequences.
        </li>
        <li>
            Try to solve task if in case of tie difference with the smallest <code>k</code> should be returned.
        </li>
        <li>
            Is it important if we instead starting with the smallest <code>k</code>, start with
            the highest, but everything is still same in the algorithm (just change definition 
            <code>for</code> loop)? If it is not same, then why?
        </li>
    </ul>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8155&amp;rd=12176" name="8155">SoftwareCompanies</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8155)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521404" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 637 (13.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      43 / 86 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>JongMan</strong> for 776.23 points (14 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      520.30 (for 43 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This problem wasn't so hard (that is the reason why it worth 950 points). It involves
    knowledge about max-flow graph theory and careful coding just to avoid possible mistakes
    when there is part about "tricky" examples. Here will not be explained the algorithm for max-flow, because
    it is already explained in tutorial 
    <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=maxFlow">Maximum Flow</a> by
    <tc-webtag:handle coderId="8593420" context="algorithm"/>. The point of this editorial
    is to explain how graph should be constructed. Take a look at the picture below.
    <center>
        <img src="/i/education/srm404_04.gif" alt="sc" />
    </center>
    Each company is represented as node (actually two nodes).
    Of each node are made two edges (<em>node in</em> and <em>node out</em>). Between <em>node in</em> and
    <em>node out</em> is set flow equal to corresponding value of <strong>amount</strong>. <em>node out</em> is connected
    with companies/nodes given by <strong>process</strong> and flow between them is set to infinity.<br />
    Once you make a graph, push infinite flow through <em>source node</em> (the node given by 
    <strong>company1</strong>) and calc how much will get to the <em>sink node</em> (the node given by
    <strong>company2</strong>). You can push infinite flow through <em>source node</em> because statement
    says it, but do not worry, maximal (producing) capacity of the sink company is limited by <strong>amount</strong>.
    Statement just says that you can consider that <strong>company1</strong> is provided with enough data.<br />
    To return a final list, go through all possible sets of companies, find set such that using its companies
    gives    maximal possible flow which cost is minimal of all maximal flows and if there are
    more max-flow min-cost sets, return the one lexicographically smallest.<br />
    You can take a look at <tc-webtag:handle coderId="8394868" context="algorithm"/>'s
    <a href="/stat?c=problem_solution&amp;rm=297469&amp;rd=12176&amp;pm=8155&amp;cr=8394868">solution</a>.
</p>





<br /><br />


<div class="authorPhoto">
    <img src="/i/m/boba5551_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20394568" context="algorithm"/><br />
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
