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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12170">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520857" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 398</span><br />Tuesday, April 15, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
    <p>
        This match attracted 1280 competitors, 721 Div2 (78 newcomers) and 559 Div1. Div2 problem set turned out to be
        the easier one for Div2 coders. They faced easier Hard problem that was worth 900 points.
        Many of them (even 88 competitiors) solved correctly all three tasks. Div1 coders faced very easy
        250 points problem and almost all of them solved it correctly, however, due to minor bugs some red coders (ex-target) like 
        <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="20812309" context="algorithm"/>
        failed on this problem, but thanks to their excellent coding skills their rating increased. Many coders
        showed that they are familiar with Div1 Medium kind of problems. Some of them took it as easier and had to resubmit
        their solution to avoid <em>Failed system tests</em>. Many coders trapped with Div1 Hard and lot of
        early submited solutions failed.
    </p>
    <p>
        In Div1 <tc-webtag:handle coderId="22629546" context="algorithm"/> first submitted Hard problem, but it 
        came out as incorrect. After 
        solving Medium problem 
        <tc-webtag:handle coderId="7459080" context="algorithm"/>, 
        <tc-webtag:handle coderId="14886245" context="algorithm"/> and 
        <tc-webtag:handle coderId="7394165" context="algorithm"/> took lead. Match is going on and submissions of 
        Hard problem change things - <tc-webtag:handle coderId="7394165" context="algorithm"/>, 
        <tc-webtag:handle coderId="8580975" context="algorithm"/>, 
        <tc-webtag:handle coderId="13351270" context="algorithm"/> (become almost a target)
        and <tc-webtag:handle coderId="22074760" context="algorithm"/> took lead, but
        one of them had 1K problem incorrect solution. <tc-webtag:handle coderId="7394165" context="algorithm"/> 
        showed great performance and thanks
        to 4 successful challenges won the match with over 200 points margin and became target. 
        <tc-webtag:handle coderId="8580975" context="algorithm"/>
        took second place, followed by 
        <tc-webtag:handle coderId="10574855" context="algorithm"/> who resubmited 1K problem, but earned 125 points
        in challenge phase and took third place. Even with third place, <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 
        rating decreased - amazing, isn't?
    </p>
    <p>
        Because the problems in Div2 weren't hard, we've got very fast solutions for each of them. Thanks to 2 successful
        challenges <tc-webtag:handle coderId="22721196" context="algorithm"/> won the match. Although newcomer
        <tc-webtag:handle coderId="22723609" context="algorithm"/> finished challenge phase with -50 points, he
        won second place, followed by 
        <tc-webtag:handle coderId="22658912" context="algorithm"/> who was on third place.
    </p>
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8161&amp;rd=12170" name="8161">MinDifference</a></strong> 
</font> 
<A href="Javascript:openProblemRating(8161)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=520857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      687 / 715 (96.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      571 / 687 (83.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>wenbin</strong> for 248.48 points (2 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214.65 (for 571 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
        <p>Although this is very simple problem, it can be solved in several ways.</p>
            <p><strong>First approach</strong></p>
            <p>Simple checking for the minimum over all pairs will work in <code>O(n^2)</code> time.</p>
            <p><strong>Second approach</strong></p>
            Since <code>O(n^2)</code> solution could be "very slow" on some platforms, it would be very nice if we can come up 
            with faster one.
            Lets look at the element <code>A[i]</code> and divide other elements into two groups:
            <ul type="1">
                <li>Elements lower or equal to <code>A[i]</code></li>
                <li>Elements greater than <code>A[i]</code></li>
            </ul>
            Over all elements from the first group the maximal one will produce the minimal difference with 
            <code>A[i]</code>. Similarly, over all elements from the seconds group the minimal one will produce
            the minimal difference with <code>A[i]</code>. Actually, instead of comparing <code>A[i]</code> to all elements
            from the list, we should compare it to only two elements. After this conclusion, it is obvious that sorting
            the list <code>A</code> is key to the solution. In sorted list, each element should be compared with its 
            left and right neighbour. Implementation in Java of this approach:
<pre><code><font color="#0000FF">public</font> <font color="#0000FF">int</font> closestElements(<font color="#0000FF">int</font> A0, <font color="#0000FF">int</font> X, <font color="#0000FF">int</font> Y, <font color="#0000FF">int</font> M, <font color="#0000FF">int</font> n){
    <font color="#0000FF">int</font> ret = <font color="#FF0000">1000000000</font>;
    <font color="#0000FF">int</font> a[] = <font color="#0000FF">new</font> <font color="#0000FF">int</font>[n];
    a[<font color="#FF0000">0</font>] = A0;
    <font color="#008080">// generate list</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">1</font>; i &lt; n; i++)
        a[i] = (a[i - <font color="#FF0000">1</font>] * X + Y) % M;
    
    Arrays.sort(a);
    <font color="#008080">// in sorted list, min difference is between some two neighbour elements</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">1</font>; i &lt; n; i++)
        ret = <font color="#FF0000">Math</font>.min(ret, <font color="#FF0000">Math</font>.abs(a[i] - a[i - <font color="#FF0000">1</font>]));
    <font color="#0000FF">return</font> ret;
}</code></pre>
            <p>Time complexity of this algorithm is <code>O(n log(n))</code>.
            <tc-webtag:handle coderId="22723609" context="algorithm"/>'s 
            <a href="/stat?c=problem_solution&amp;rm=269825&amp;rd=12170&amp;pm=8161&amp;cr=22723609">solution</a> 
            is short and clear.</p>
            <p><strong>Third approach</strong></p>
            Let's go on and find even faster solution, the one that depends on <code><strong>M</strong></code> and for
            the maximal <code><strong>n</strong></code> and <code><strong>M</strong></code> is faster than <strong>Second approach</strong>. 
            Note that if each element (except 
            <code>A[0] = <strong>A0</strong></code>) of the list is calculated by modulo <code><strong>M</strong></code> then it must fail
            between 0 and <code><strong>M</strong>-1</code>, inclusive.
            So, we have at most <code><strong>M</strong>+1</code> different numbers that are in the 
            range <code>0 .. Max(<strong>M</strong>-1, <strong>A0</strong>)</code>. According
            to the constraints, any number is between 0 and 10000, inclusive. Let's make an array <code>flag</code> of 10001 
            booleans (0 .. 10000) and mark <code>flag[i] = true</code> if <code>i</code> appears in the list. 
            If <code>flag[i]</code> was already set on <code>true</code> return 0. Else, go through the array <code>flag</code>
            and calculate difference between two neighbour elements that are set on <code>true</code> and return the minimal
            difference. Time complexity of the algorithm is <code>O(Max(<strong>M</strong>, <strong>A0</strong>) + <strong>n</strong>)</code>. 
            Implementation in Java of this approach:
<code><pre><font color="#0000FF">public</font> <font color="#0000FF">int</font> closestElements(<font color="#0000FF">int</font> A0, <font color="#0000FF">int</font> X, <font color="#0000FF">int</font> Y, <font color="#0000FF">int</font> M, <font color="#0000FF">int</font> n){
    <font color="#008080">// maximal number of different elements is 10001</font>
    <font color="#0000FF">boolean</font> used[] = <font color="#0000FF">new</font> <font color="#0000FF">boolean</font>[<font color="#FF0000">10001</font>];
    Arrays.fill(used, <font color="#0000FF">false</font>);
    <font color="#0000FF">int</font> ret = <font color="#FF0000">1000000000</font>;
    <font color="#0000FF">int</font> a = A0;
    used[a] = <font color="#0000FF">true</font>;
    <font color="#008080">// generate list</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">1</font>; i &lt; n; i++){
        a = (a * X + Y) % M;
        <font color="#0000FF">if</font> (used[a])
            <font color="#0000FF">return</font> 0;
        used[a] = <font color="#0000FF">true</font>;
    }
    
    <font color="#008080">// find value with minimal index</font>
    <font color="#0000FF">int</font> idx;
    <font color="#0000FF">for</font> (idx = <font color="#FF0000">0</font>; ; idx++)
        <font color="#0000FF">if</font> (used[idx])
            <font color="#0000FF">break</font>;
    
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = idx + <font color="#FF0000">1</font>; i &lt; <font color="#FF0000">10001</font>; i++)
        <font color="#0000FF">if</font> (used[i]){
            ret = <font color="#FF0000">Math</font>.min(ret, i - idx);
            idx = i;
        }
        
    <font color="#0000FF">return</font> ret;
}</pre></code>
        <h4>Exercise</h4>
        <ul>
            <li>
                Think of the following problem: Suppose that <code>1 &lt= <strong>n</strong> &lt;= 10^18</code>, 
                everything else is as in the main problem 
                </code> and you are already given the list <code>A</code>. Memory is not contrained. 
                    <br />
                We could disccuss about the solution on the forum.
            </li>
        </ul>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8157&amp;rd=12170" name="8157">CountExpressions</a></strong> 
</font> 
<A href="Javascript:openProblemRating(8157)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=520857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      471 / 715 (65.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      428 / 471 (90.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ILoveWangYeMore</strong> for 491.07 points (3 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      322.70 (for 428 correct submissions) 
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
      548 / 559 (98.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      528 / 548 (96.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Gumx</strong> for 248.53 points (2 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.87 (for 528 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This task is pretty straighforward. It doesn't involve any special knowledge. Almost each brute-force solution
    would pass. One way to solve the task is first to generate all possible positions for <code><strong>x</strong></code>. Then for
    each fixed position of <code><strong>x</strong></code> and <code><strong>y</strong></code> try all the possibilites for operators. Time
    complexity of this algorithm is constant, about <code>O(2^4 * 3^3)</code>. <br />
    Shorter and simpler solution is to replace generating all possible positions of <code><strong>x</strong></code> with several
    recurent calls. Bellow is solution of tester <tc-webtag:handle coderId="10481120" context="algorithm"/>
<code><pre>
<font color="#0000FF">int</font> a, b, val;

<font color="#0000FF">int</font> rec(<font color="#0000FF">int</font> ca, <font color="#0000FF">int</font> cb, <font color="#0000FF">int</font> cur) {
    <font color="#0000FF">if</font> (ca==<font color="#FF0000">2</font> &amp;&amp; cb==<font color="#FF0000">2</font>) return (cur==val ? <font color="#FF0000">1</font> : <font color="#FF0000">0</font>);
    <font color="#0000FF">int</font> res=<font color="#FF0000">0</font>;
    <font color="#0000FF">if</font> (ca<<font color="#FF0000">2</font>) res += rec(ca+<font color="#FF0000">1</font>, cb, cur+a) + rec(ca+<font color="#FF0000">1</font>, cb, cur-a) + rec(ca+<font color="#FF0000">1</font>, cb, cur*a);
    <font color="#0000FF">if</font> (cb<<font color="#FF0000">2</font>) res += rec(ca, cb+<font color="#FF0000">1</font>, cur+b) + rec(ca, cb+<font color="#FF0000">1</font>, cur-b) + rec(ca, cb+<font color="#FF0000">1</font>, cur*b);
    <font color="#0000FF">return</font> res;
}

<font color="#0000FF">public</font> <font color="#0000FF">int</font> calcExpressions(<font color="#0000FF">int</font> a, <font color="#0000FF">int</font> b, <font color="#0000FF">int</font> val) {
    <font color="#0000FF">this</font>.a=a; <font color="#0000FF">this</font>.b=b; <font color="#0000FF">this</font>.val=val;
    return rec(<font color="#FF0000">1</font>, <font color="#FF0000">0</font>, a) + rec(<font color="#FF0000">0</font>, <font color="#FF0000">1</font>, b);
}    </pre></code>
    
    For a short and fast iterative solution take a look at <tc-webtag:handle coderId="15056181" context="algorithm"/>'s
    solution <a href="/stat?c=problem_solution&amp;rm=269795&amp;rd=12170&amp;pm=8157&amp;cr=15056181">here</a>.
    

        <h4>Exercise</h4>
        <ul>
            <li>
                Try to solve the task if operator precedence is defined.
            </li>
            <li>
                Add operators '/' (real division), '\' (integer division) and '^' (power) and then solve the task.
            </li>
            <li>
                Change task in the following way :"In each expression <code><strong>x</strong></code> and <code><strong>y</strong></code>, each
                of them must be used at least once, but can be used at most <code><strong>k</strong></code> times. 
                <code><strong>k</strong></code> (1 &lt;= <code><strong>k</strong></code> &lt;= 4) is given." Try to solve this task.
            </li>
        </ul>
    
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8160&amp;rd=12170" name="8160">MatchString</a></strong> 
</font> 
<A href="Javascript:openProblemRating(8160)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=520857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      226 / 715 (31.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      104 / 226 (46.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dlwjdans</strong> for 852.28 points (6 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      541.34 (for 104 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This task was a greedy one. The key to the solutions was to check all possible positions of <code><strong>matchString</strong></code>.
    Once you figure out that, the problem becomes very easy. Let <code>maxlen</code> be the length of the longest
    word from <code><strong>matchWords</strong></code> and <code>lp</code> be the furthest possible position where
    <code><strong>matchString</strong></code> should be placed - that means if there is a solution at <code>lp+m</code> position, 
    <code>m &gt; 0</code>, then    there is the solution at the position <code>lp</code>. Let's show 
    <code>lp=maxlen</code>. Suppose it is not truth, and there is some <code>pos=maxlen+m</code> optimal position.
    Then each word must be placed between the position <code>pos-maxlen+1</code> and the position <code>pos</code>.
    But <code>pos-maxlen+1=maxlen+m-maxlen+1=m+1</code> which means that each word is shifted at least <code>m</code> times.
    If we shift each word <code>m</code> times, arrangement is the same as we didn't make those <code>m</code> shifts at all.
    So, <code>m</code> shifts are sufficient in this case and <code>lp=maxlen</code>.<br />
    When you put <code><strong>matchString</strong></code> at some position, each word <code><strong>matchWords</strong>[i]</code> 
    shift as less as you need in order to overlap corresponding letter in <code><strong>matchWords</strong>[i]</code>
    with <code><strong>matchString</strong></code> letter at the position <code>i</code>. Bellow is solution in Java:
<code><pre>    <font color="#0000FF">public</font> <font color="#0000FF">int</font> placeWords(<font color="#FF0000">String</font> matchString, String[] matchWords){
    <font color="#0000FF">int</font> n = matchString.length();
    <font color="#0000FF">int</font> inf = <font color="#FF0000">1</font> &lt;&lt; <font color="#FF0000">20</font>;
    <font color="#0000FF">int</font> sum = inf;
    <font color="#008080">// find the last possible position of matchString</font>
    <font color="#0000FF">int</font> lp = <font color="#FF0000">0</font>;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++)
        lp = Math.max(lp, matchWords[i].<font color="#0000FF">length</font>());

    <font color="#FF0000">String</font> word;
    <font color="#008080">// try for each position</font>
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> pos = <font color="#FF0000">0</font>; pos &lt; lp; pos++){
        <font color="#0000FF">int</font> s = <font color="#FF0000">0</font>;
        <font color="#008080">// for fixed position of matchString, calc position of elements in matchWords</font>
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++){
            word = matchWords[i];
            <font color="#008080">// this calc we can do greedy. start from the last possible character of matchWords el
            // and move to the begging of the element. if you find some position that can
            // make solution remember it, else just continue with next position of matchString</font>
            <font color="#0000FF">int</font> lidx = <font color="#FF0000">Math</font>.min(pos, word.<font color="#0000FF">length</font>() - <font color="#FF0000">1</font>), j;
            <font color="#0000FF">for</font> (j = lidx; j &gt; -<font color="#FF0000">1</font>; j--)
                <font color="#0000FF">if</font> (word.charAt(j) == matchString.charAt(i)){
                    s += (pos - j);
                    <font color="#0000FF">break</font>;
                }
            <font color="#0000FF">if</font> (j == -<font color="#FF0000">1</font>){
                s = inf;
                <font color="#0000FF">break</font>;
            }
        }
        <font color="#0000FF">if</font> (s &lt; sum)
            sum = s;
    }
    <font color="#0000FF">if</font> (sum == inf)
        <font color="#0000FF">return</font> -<font color="#FF0000">1</font>;
    <font color="#0000FF">return</font> sum;
}</pre></code>

    You can take a look at <tc-webtag:handle coderId="22691091" context="algorithm"/>'s solution
    <a href="/stat?c=problem_solution&amp;rm=269849&amp;rd=12170&amp;pm=8160&amp;cr=22691091">here</a>.<br />
    Time complexity of described algorithm is <code>O(maxlen^2*n)</code>, where <code>n</code> is number
    of puzzle words. With simple precalculating time complexity can be reduced to <code>O(maxlen*n)</code>. 
    Let <code>c</code> be <code>i</code>-th letter of <code><strong>matchString</strong></code>. For each position <code>j</code>,
    <code>0&lt;=j&lt;<strong>matchWords</strong>[i].length()</code>, calc the last occurence of the letter <code>c</code>
    in the first <code>j</code> letters of <code><strong>matchWords</strong>[i]</code>. With this information, instead
    to each time calculate where is the last occurence of some letter, you can get the answer
    in constant time. As reference you can take a look at my solution in the practice room.
    
    <br /><br />
        <h4>Exercise</h4>
        <ul>
            <li>
                Try to solve the task if you should return int[], where i-th element represents number of places i-th word was
                shifted - sum of shifts still have to be minimal. In case of tie return int[] with first element minimal; 
                in case of tie return int[] with two first element minimal etc.
            </li>
        </ul>    
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8158&amp;rd=12170" name="8158">CountPaths</a></strong> 
</font> 
<A href="Javascript:openProblemRating(8158)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=520857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      349 / 559 (62.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      256 / 349 (73.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>hesibo</strong> for 474.85 points (6 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297.96 (for 256 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
    This is modification of well-known dynamic programming problem. Let special field <code>i</code> be field given
    by (<code><strong>fieldrow</strong>[i]</code>, <code><strong>fieldcol</strong>[i]</code>).<br />
    Let <code>DP[i][j][k][len]</code> be number of differents path of length <code>len</code> from 
    position (1, 1) to the position (i, j) with the last
    visited special field <code>k</code>. The problem statement says that position (i, j) could be reached only from the positions
    (i-1, j) and (i, j-1), so number of different paths from (1, 1) to (i, j) depends only on number of different paths
    from (1, 1) to (i-1, j) and (1, 1) to (i,j-1), so first calc <code>DP[i-1][j]</code> and 
    <code>DP[i][j-1]</code> and then <code>DP[i][j]</code>.<br />
    Let's define recursive relation for position (i, j):
    <ul>
        <li>
            (i, j) is special field:<br />
            <code>DP[i][j][k][len] = DP[i-1][j][0][len-1] + DP[i][j-1][0][len-1] + DP[i-1][j][1][len-1] + DP[i][j-1][1][len-1] + ... +
            DP[i-1][j][k-1][len-1] + DP[i][j-1][k-1][len-1]</code><br />
            If (i, j) is special field and path from (1, 1) to (i, j) has <code>len</code> special fields as part of it, then
            paths from (1, 1) to (i-1, j) and (1, 1) to (i, j-1) must have <code>len-1</code> special fields.
        </li>
        <li>
            (i, j) is not special field:<br />
            <code>DP[i][j][k][len] = DP[i-1][j][k][len] + DP[i][j-1][k][len]</code>. In this case nothing has changed except 
            for position. If number of special fields from position (1, 1) to (i, j) contains <code>len</code> 
            special fields and as part of it contains path from (1, 1) to (i-1, j) then that path from (1, 1) to (i-1, j)
            must contain <code>len</code> special fields. It is similary for last visited special field.
        </li>
    </ul>
    And one more thing should be explained: let set A contains all diferent paths from (1, 1) to (i-1, j) and set B
    contains all different path from (1, 1) to (i, j-1), then it is obvious that A union B contains all different
    paths because at least <em>the last</em> visited field of each path from set A (field at position (i-1, j)) is different from
    <em>the last</em> visited field of each path from set B (field at the position (i, j-1)). Bellow is implementation in Java:
<code><pre>    <font color="#0000FF">public</font> int[] difPaths(<font color="#0000FF">int</font> r, <font color="#0000FF">int</font> c, int[] fieldrow, int[] fieldcol){
    <font color="#0000FF">int</font> mod = <font color="#FF0000">1000007</font>;
    <font color="#0000FF">int</font> n = fieldrow.<font color="#0000FF">length</font>;
    <font color="#0000FF">int</font> ret[] = <font color="#0000FF">new</font> int[n + <font color="#FF0000">1</font>];
    <font color="#008080">// dp[i][j][k][l] - positions (i, j), with last visited field k, length l
    // if l = 0, it will be considered that k = 0, although k doesn't exists</font>
    <font color="#0000FF">int</font> dp[][][][] = <font color="#0000FF">new</font> int[r + <font color="#FF0000">1</font>][c + <font color="#FF0000">1</font>][<font color="#FF0000">Math</font>.max(n, <font color="#FF0000">1</font>)][n + <font color="#FF0000">1</font>];
    <font color="#0000FF">int</font> pos[][] = <font color="#0000FF">new</font> int[r + <font color="#FF0000">1</font>][c + <font color="#FF0000">1</font>];
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt;= r; i++){
        Arrays.fill(pos[i], -<font color="#FF0000">1</font>);
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = <font color="#FF0000">0</font>; j &lt;= c; j++)
            <font color="#0000FF">for</font> (<font color="#0000FF">int</font> k = <font color="#FF0000">0</font>; k &lt; n; k++)
                Arrays.fill(dp[i][j][k], <font color="#FF0000">0</font>);
    }
    
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">0</font>; i &lt; n; i++)
        pos[fieldrow[i]][fieldcol[i]] = i;
    dp[<font color="#FF0000">1</font>][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>] = <font color="#FF0000">1</font>;
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> i = <font color="#FF0000">1</font>; i &lt;= r; i++)
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> j = <font color="#FF0000">1</font>; j &lt;= c; j++){
            <font color="#008080">// l = 0</font>
            <font color="#0000FF">if</font> (pos[i][j] == -<font color="#FF0000">1</font>)
                dp[i][j][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>] += (dp[i - <font color="#FF0000">1</font>][j][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>] + dp[i][j - <font color="#FF0000">1</font>][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>]) % mod;
            <font color="#0000FF">for</font> (<font color="#0000FF">int</font> l = <font color="#FF0000">1</font>; l &lt;= n; l++)
                <font color="#0000FF">if</font> (pos[i][j] == -<font color="#FF0000">1</font>)
                    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> k = <font color="#FF0000">0</font>; k &lt; n; k++)
                        dp[i][j][k][l] += (dp[i - <font color="#FF0000">1</font>][j][k][l] + dp[i][j - <font color="#FF0000">1</font>][k][l]) % mod;
                <font color="#0000FF">else</font>{
                    <font color="#0000FF">int</font> cp = pos[i][j];
                    <font color="#0000FF">if</font> (l == <font color="#FF0000">1</font>)
                        dp[i][j][cp][l] += (dp[i - <font color="#FF0000">1</font>][j][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>] + dp[i][j - <font color="#FF0000">1</font>][<font color="#FF0000">0</font>][<font color="#FF0000">0</font>]) % mod;
                    <font color="#0000FF">else</font>{
                        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> k = <font color="#FF0000">0</font>; k &lt; cp; k++)
                            dp[i][j][cp][l] += (dp[i - <font color="#FF0000">1</font>][j][k][l - <font color="#FF0000">1</font>] + dp[i][j - <font color="#FF0000">1</font>][k][l - <font color="#FF0000">1</font>]) % mod;
                    }
                }
        }
    <font color="#0000FF">for</font> (<font color="#0000FF">int</font> l = <font color="#FF0000">0</font>; l &lt;= n; l++){
        ret[l] = <font color="#FF0000">0</font>;
        <font color="#0000FF">for</font> (<font color="#0000FF">int</font> k = <font color="#FF0000">0</font>; k &lt; <font color="#FF0000">Math</font>.max(n, <font color="#FF0000">1</font>); k++){
            ret[l] += dp[r][c][k][l];
            ret[l] %= mod;
        }
    }
    <font color="#0000FF">return</font> ret;
}</pre></code><br />
    It seems that some memoization solutions for this problem was too slow, so be careful. Also, solution will 
    probably timeout if at each step for some field you check whether it is special field or not. It is better
    to cacl that information once and store somewhere. This algorithm gives time and space complexity <code>n^4</code>.
    
    
    For clean and fast solution you can take a look at <tc-webtag:handle coderId="22653720" context="algorithm"/>'s solution 
    <a href="/stat?c=problem_solution&amp;rm=269806&amp;rd=12170&amp;pm=8158&amp;cr=22653720">here</a>.

        <br />
        <h4>Exercise</h4>
        <ul>
            <li>
                With number of special fields below 10 and if return is sum of path of all lenghts, could 
                that problem be solved as combinatorial one?
            </li>
        </ul>    


</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8144&amp;rd=12170" name="8144">MyFriends</a></strong> 
</font> 
<A href="Javascript:openProblemRating(8144)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=520857" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      119 / 559 (21.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 119 (20.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>nigulh</strong> for 833.26 points (13 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      538.88 (for 24 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
            This problem can be divided into four parts. First two parts contain proofs that number of friends for each kid 
            (used as array <code>f</code> in the parts) is unique. First and third part give
            algorithm that is used to obtain array <code>f</code>. Forth part shows how this task can be transformed
            into graph problem and gives one solution for the final answer - "POSSIBLE" or "IMPOSSIBLE".
            Now let's examine each part in details.<br /><br />
            <strong>First part</strong><br />
            Let <code>f[i]</code> be number of kid <code>i</code>'s friends, <code>S</code> the sum of friends of all kids and
            <code>SSF</code> sum of all <code>sumFriends[i]</code> from the input. 
            Then statements for some kid <code>i</code> could be written as<pre><code>
            J_i: sumFriends[i] = S - f[i] - f[(i+k)%n]</pre></code>
            Let's sum all <code>J_i</code><code><pre>
            SSF = n*S - (f[0] + f[1] + ... + f[n-1]) - (f[(0+k)%n] + f[(1+k)%n] + ... + f[(n-1+k)%n]  &lt;=&gt;
            SSF = n*S - S - S &lt;=&gt;
            SSF / (n-2) = S
            </pre></code>
            This is part where we check if return could be "IMPOSSIBLE" - <code>SSF</code> must be 
            divisible by <code>n-2</code>. Let's go on and transform <code>J_i</code>:<br />
            <code>J_i: S - sumFriends[i] = f[i] + f[(i+k)%n]</code> - let <code>C[i]</code> be <code>S - sumFriends[i]</code><br />
            We know <code>S</code> and we know <code>sumFriends[i]</code>, so we know <code>f[i]+f[(i+k)%n]</code>.
            Now we should check that <code>f[i]+f[(i+k)%n] &gt;= 0</code> holds for every <code>i</code>.<br /><br />
            <strong>Second part</strong><br />
            Suppose that <code>(i+p*k)%n=(i+q*k)%n</code> and <code>0&lt;=p&lt;=q&lt;n/GCD(n, k)</code>.
            Lets transform that into <code>(q*k-p*k)%n=((q-p)*k)%n=0</code>. We have two options <br />
            1. <code>q - p = 0  =&gt;  q = p</code><br />
            2. <code>(q - p)*k = r*LCM(n, k) = r*k*n / GCD(n, k) =&gt; (q-p) = r*n / GCD(n, k)</code>, but 
                <code>0 &lt;= p &lt; q &lt; n/GCD(n, k)</code>, so this option is impossible.<br />
            We proved that in case above <code>p = q</code> - call it <strong>Proof 1</strong>.<br /><br />
            
            Define <code>Seq_i</code> as list: <code>i, (i+k)%n, (i+2*k)%n, ..., (i+m*k)%n</code>; where <code>(i+m*k)%n</code> is 
            first index that already exists in <code>Seq_i</code> for some <code>(i+r*k)%n</code>,     <code>r &lt; m</code>. Such
            <code>r</code> must exists because <code>Seq_i</code> is finite. It is also true that 
            <code>m &lt;= n/GCD(n, k)</code>.
            Let's proove that <code>m = n/GCD(n, k)</code>.<br />
            <code>m = n/GCD(n, k)</code> is the highest value of <code>m</code>, because <code>i=(i+k*n/GCD(n, k))%n</code>.<br />
            Suppose <code>m&lt;n/GCD(n, k)</code> and there exists some <code>p</code> such that 
            <code>(i+p*k)%n=(i+m*k)%n, 0&lt;=p&lt;m</code>, but according to the <strong>Proof 1</strong> it is impossible, so
            <code>m=n/GCD(n, k)  =&gt;  (i+m*k)%n=i</code>.<br />
            That means indexes of each <code>Seq_i</code> form a cycle and all <code>Seq</code> have the same length - 
            the length <code>n/GCD(n, k)</code>. For each <code>Seq_i</code> and <code>Seq_j</code> we should proove that 
            either <code>Seq_i</code> is same as <code>Seq_j</code> or they don't have common elements. Although it
            is very obvious, let's make short proof.<br />
            Suppose that <br />
            <code>Seq_i: i, (i+k)%n, (i+2*k)%n, ..., (i+c1*k)%n,..., (i+m*k)%n</code><br />
            <code>Seq_j: j, (j+k)%n, (j+2*k)%n, ..., (j+c2*k)%n,..., (j+m*k)%n</code><br />
            and <code>(j+c2*k)%n = (i+c1*k)%n</code>. But that means <code>((j-i)+(c2-c1)*k)%n = 0</code>. Because 
            <code>Seq_j</code> is cyclic we can always choose such <code>j</code> that <code>c1 = c2</code> and then we
            have <code>(j-i)%n=0, 0&lt=i,j&lt;(n-1)  =&gt;  i=j</code>.<br /><br />
            We can conclude that number of different lists <code>Seq</code> is equal to
            <code>n/(n/GCD(n, k))=GCD(n, k)</code> and each list has odd number of elements (<code>n</code> is an odd number, so
            <code>n/GCD(n, k)</code> is an odd number, too).<br /><br />
            <strong>Third part</strong><br />
            In order to make it easier for reading and understanding, let <code>gr=n/GCD(n, k)-1</code>.<br />
            Consider particular list <code>Seq_i</code> that actually represents independent system of equations. 
            From the first part we can write:<code><pre>
                J_i: f[i]         + f[(i+k)%n]    = C[i]
        J_((i+k)%N): f[(i+k)%n]   + f[(i+k*2)%n]  = C[(i+k)%n]
      J_((i+k*2)%N): f[(i+k*2)%n] + f[(i+k*3)%n]  = C[(i+k*2)%n]
                                       ...
                                       ...
                                       ...
     J_((i+k*gr)%n): f[i]         + f[(i+k*gr)%n] = C[(i+k*gr)%n]</pre></code>
            Sum left and right sides:<br /> 
            <code>J_((i+k*gr)%n) - J_i + J_((i+k)%n) - J_((i+2*k)%n) + J_((i+3*k)%n) - ... + J_(i+k*(gr-1)) =<br />
                C[i+k*gr] - C[i] + C[(i+k)%n] - C[(i+2*k)%n] + C[(i+3*k)%n] - ... + C[i+k*(gr-1)] = <br />
                2 * f[(i+k*gr)%n]</code><br />
            
            Now we can calculate <code>f[(i+k*gr)%n]</code>, then <code>f[(i+k*(gr-1))%n]</code>, ..., and finally
            <code>f[i]</code>. If we do this for all <code>Seq</code>s, we will get all <code>f[i]</code>.<br />
            We can take this way of suming in order to get <code>f[i]</code> because number of equations in the system is odd. In case
            it is even the     sum will be 0.<br />
            At each part you are dividing something, check whether it is possible to divide and get integer without reminder 
            as the result. Also check whether number of friends of some kid is non-negative number and less than number of all
            kids. If these conditions are not satisfied, return "IMPOSSIBLE".
            <br /><br />
            <strong>NOTE</strong>: All three parts could be replaced by Gaussian elimination. However, in this case we should guess that
            the solution is unique. 
            
        <br /><br />
        <strong>Forth part</strong><br />
        When we get <code>f[i]</code>, each kid can be represented as vertex and there will be edge between two kids
        iff those kids are friends. So, the question becomes: "If you are given degrees of all vertices in the graph, 
        return whether such graph exists."<br />
        To give the answer, we can use Havel-Hakimi algorithm. Here is short description of the algorithm:<br />
<code><pre>init array deg[i] &lt;- f[i]
repeat this n times
    sort array deg in ascending order
    take the highest one, let it be deg[n-1]
    deg[n-1] &lt;- 0
    for n-1-f[n-1] &lt= i &lt= n-2
        if deg[i] is 0 return "IMPOSSIBLE"
        else deg[i] &lt;- deg[i]-1
loop
return "POSSIBLE"</pre></code>
    You can take a look at <tc-webtag:handle coderId="15329571" context="algorithm"/>'s solution 
    <a href="/stat?c=problem_solution&amp;rm=269796&amp;rd=12170&amp;pm=8144&amp;cr=15329571">here</a> which seems very clear.
<br /><br />

        <h4>Exercise</h4>
        <ul>
            <li>
                Solve the task if <code><strong>n</strong></code> is even. What condition should 
                be satisfied so that values <code>f[i]</code> have unique solution?
            </li>
        </ul>
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
