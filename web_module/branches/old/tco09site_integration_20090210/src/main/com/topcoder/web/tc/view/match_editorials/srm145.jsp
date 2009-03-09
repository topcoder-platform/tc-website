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
<tc-webtag:forumLink forumID="505581" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 145</span><br>Tuesday, May 6, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                            <p>
                            Last night's problems were a good mix, with some dynamic programming, some simulation, and a couple relatively straightforward 
                            number problems. The set seemed to be pretty well-balanced also. Despite a rather wordy div 1 medium /div 2 hard problem, 
                            the submission percentages were all pretty well in line with the averages.</p>
                            <p>
              <b>SnapDragon</b> and <b>Yarin</b> were neck and neck during the challenge phase, and <b>Yarin</b> could have won the round 
         if he had gotten one more challenge. But, in the end <b>SnapDragon</b> was able to hold on for the win, thanks to <b>Yarin's</b> 
         resubmission of the 600 point problem. In division 2, <b>shadowless</b> was able to narrowly edge out first timer <b>andlehay</b> for the win.

<H1> The Problems </H1> 

                        <font size="+2"><strong>DitherCounter</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505581" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 1:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">250</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">192 / 234 (82.05%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">185 / 192 (96.35%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>pointone</strong> for 248.05 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
                        Despite all of its fancy talk about bitmaps and dithering, this problem really has very little to do with any of that.  To solve it, you simply have to go 
                        through each character in the given String[] (vector&lt;string&gt;) and see if that character is in <b>dithered</b>.  Count how many such characters 
                        exist, and return that number.
                        </p>

                        <font size="+2"><strong>Exercise Machine</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505581" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 2:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">500</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">154 / 234 (65.81%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">119 / 154 (77.27%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>xxfobxx</strong> for 488.95 points</td></tr>
                        </table>
                        </blockquote>
                        
                     
                        <h4>Implementation</h4>

                      <p>
                        This problem seems a little bit nonsensical at first glance.  After all, what sort of exercise machine would be programmed in the manner described.  
                        However, the writer assured me that he has seen exercise machines that have wacky behavior along these lines. </p>
                        <p>
                        So, to solve this, you can loop over either seconds, or over percentages.  Either way, you can get one from the other, and then determine if they are both 
                        exact or not.  Here is how you would do it if looping over percentages, if <tt>s</tt> is the total number of seconds that the workout lasts:
<pre>
   int ret = 0;
   for(int i = 1; i&lt;100; i++){
      if((s*i)%100==0)ret++;
   }
</pre>
                    It also turns out that the answer is always <tt>gcd(s,100)-1</tt>.  This is a lot harder to come up with, but much easier to code.  I'll leave the proof as an 
                    exercise to the reader.  As a hint of where to start, consider the case where gcd(s,100) = 2.  In this case, the only number the display shows is 50%.  
                    Once you see this, it isn't too hard to work up to the general case.
                    </p>


     
                        <font size="+2"><strong>VendingMachine</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505581" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">1100</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">18 / 234 (7.69%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">10 / 18 (55.56%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>lgas</strong> for 570.28 points</td></tr>
                        </table>
                        </blockquote>
                        
                          Used as: Division-I, Level 2:
                        
                         <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">600</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">84 / 127 (66.14%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">73 / 84 (86.90%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>SnapDragon</strong> for 508.66points</td></tr>
                        </table>
                        </blockquote>



                        <h4>Implementation</h4>

                        <p>
                        
                           Despite the length of this problem, it is actually relatively simple to code.  Basically, you just have to follow all of the instructions to the letter, 
                           and you will be fine.<br/><br/>The first thing to do is parse the <b>prices</b> input into some structure like a 2-D array.  Then, since the 
                           purchases are given to you in order, it is pretty easy to apply them iteratively.  For each purchase, if it is 5 or more minutes after the 
                           previous one, rotate to the most expensive column before applying the purchase.  Then rotate to the column of the purchase item, and set t
                           he price of the purchased item to 0.  As you are buying items, if someone tries to buy an item whose price is 0, return -1.  
                            the rotations is relatively simple also.  You don't actually need to rotate anything, just keep an int representing which column is facing out.  Then, 
                            to get from column <tt>a</tt> to column <tt>b</tt>, you need either <tt>abs(a-b)</tt> seconds of rotation, or else <tt>numColumns - abs(a-b)</tt> 
                            seconds of rotation, whichever is less.  Finding the most expensive column is also pretty straightforward.  So, none of the components of this problem 
                            were really very difficulty, but putting things all together could be a little tricky, just because there are a lot of things going on.  But basically, 
                            if you didn't have any bugs, there wasn't much here that was algorithmically difficult.

                        </p>

                        <font size="+2"><strong>Bonuses</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505581" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I, Level 1:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">250</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">126 / 127 (99.21%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">112 / 126 (88.98%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>Yarin</strong> for 246.24 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
 
Understanding how the division operator works is key to many problems, both in TopCoder and the real-world.  In this problem we want to first find the 
percentage of the total point that each person has - truncated down to the nearest percentage.  An easy way to do this after you've calculated the total number 
of points is <tt>percent[i] = (100 * points[i])/totalPoints</tt>.  Then, you add up all the percentages, and find the number of percentage points that are left over, 
<tt>100 - totalPercentage</tt>.  Since the number of percentage points left over is relatively small, you can loop over them all and assign them one at a time, 
keeping track of who has already got one.  One thing to note is that there will never be more percentage points left over than there are people.  This is because 
when you truncate, you are removing less than one percentage point from each person.  So, the total number of percentage points must be less than the number of people.
  
                        
                        </p>

                        <font size="+2"><strong>HillHike</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505581" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">1000</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">21 / 127 (16.54%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">13 / 21 (61.90%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>Yarin</strong> for 914.29 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
This is a good dynamic programming problem, and can be solved with either a number of nested loops, or with memoized recursion.  As with all DP problems, 
the trick is to come up with the correct recurrence.  After that, it is relatively straightforward.  So, the recursion:
<br/>
There are quite a few variables that could potentially go into our recurrence.  It turns out that the 4 essential ones are: current horizontal distance, current vertical 
height, number of landmarks that have been seen, and whether or not the maximum height has been reached yet or not.  To ease the explanation, we will define a 
function <tt>f(h,d,lm,max)</tt>, which represents the number of ways to reach distance <tt>d</tt>, height <tt>h</tt>, having seen <tt>lm</tt> landmarks, and having 
already reached the maximum height if and only if <tt>max</tt> is <tt>true</tt>
</p>
<p>
Now, the question is how to evaluate <tt>f(h,d,lm,max)</tt>.  Clearly, since the path goes strictly from lower horizontal distances to higher ones, <tt>f(h,d,lm,max)</tt> 
depends only on <tt>f(*,d-1,*,*)</tt>, where *'s can represent any value.  Also, since you can only move up one, down one, or stay at the same 
level, <tt>f(h,d,lm,max) = f(h-1,d-1,*,*) + f(h,d-1,*,*) + f(h+1,d-1,*,*)</tt>.  Now, there are two cases when considering whether or not the maximum height 
has been reached.  If the height being considered, <tt>h</tt>, is the maximum height, then we have something like <tt>f(h,d,lm,true) = f(h-1,d-1,*,true) + 
f(h-1,d-1,*,false) + f(h,d-1,*,true)</tt>, and <tt>f(h,d,lm,false) = 0</tt>.  Otherwise, if <tt>h</tt> is not the maximum height, then <tt>f(h,d,lm,max) 
= f(h-1,d-1,*,max) + f(h,d-1,*,max) + f(h+1,d-1,*,max)</tt>, for max either true or false.
</p>
<p>Now, for the hard part: what to do about the landmarks.  First we must observe that we should always assume that a landmark occurs as early as possible along a path.  
In other words, if considering whether or not a path is valid, a greedy approach to placing landmarks is always best.  This means that, if we have placed <tt>lm</tt> 
landmarks, and the next landmark to be placed is at height <tt>h</tt>, then we can assume that the landmark was placed there, and move on to the next landmark.  
This allows us to finish our recurrence, with 4 cases: 

<ul>
<li><tt>h = maxHeight, h = landmark[lm]</tt>:<br/> <tt>f(h,d,lm,true) = f(h,d-1,lm-1,true) + f(h-1,d-1,lm-1,true) + f(h-1,d-1,lm-1,false)<br/> f(h,d,lm,false) = 0</tt></li>
<li><tt>h = maxHeight, h != landmark[lm]</tt>:<br/> <tt>f(h,d,lm,true) = f(h,d-1,lm,true) + f(h-1,d-1,lm,true) + f(h-1,d-1,lm,false)<br/> f(h,d,lm,false) = 0</tt></li>
<li><tt>h != maxHeight, h = landmark[lm]</tt>:<br/> <tt>f(h,d,lm,max) = f(h+1,d-1,lm-1,max) + f(h,d-1,lm-1,max) + f(h-1,d-1,lm-1,max)</tt><br/> for max = true of false</li>
<li><tt>h != maxHeight, h != landmark[lm]</tt>:<br/> <tt>f(h,d,lm,max) = f(h+1,d-1,lm,max) + f(h,d-1,lm,max) + f(h-1,d-1,lm,max)</tt><br/> for max = true of false</li>
</ul>
</p>
<p>
Now, armed with this recurrence, we can implement it something like this (thanks to schveiguy for his pretty code).  Note that while it is somewhat hidden, 
this code actually does implement the above recurrence:
<pre>
typedef long long int64;
struct HillHike
{
  int64 numPaths(int distance, int maxHeight, vector&lt;int&gt; landmarks)
  {
    int64 cache1[2][52][51];
    int64 cache2[2][52][51];
    memset(cache1, 0, sizeof(cache1));
    cache1[0][0][0] = 1;
    landmarks.push_back(-1);
    for(int i = 1; i &lt; distance; i++){
      memset(cache2, 0, sizeof(cache1));
      for(int j = 1; j &lt;= maxHeight; j++){
        int ni = (j == maxHeight ? 1 : 0);
        for(int k = 0; k &lt; landmarks.size(); k++)
          for(int d = -1; d &lt;= 1; d++){
            int lm = (j == landmarks[k] ? k + 1 : k);
            cache2[ni][j][lm] += cache1[0][j + d][k];
            cache2[1][j][lm] += cache1[1][j + d][k];
          }
      }
      memcpy(cache1, cache2, sizeof(cache1));
    }
    return cache1[1][1][landmarks.size()-1];
  }
};
</pre>
</p>
     
<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
