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
<tc-webtag:forumLink forumID="505565" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 136</span><br>Tuesday, February 25, 2003
<br><br>

<span class="bigTitle">Match summary</span>


<p>Yarin remained red hot, as only one of two coders (radeye was the other) to solve all three problems
    successfully.  His hot streak over the last few challenges has propelled him up to 2nd place overall,
    58 points behind John Dethridge.  SnapDragon, on the other hand had an unusual off night, and dropped 124
    points.</p><p>The div 2 problems were a little on the easy side, with over 50% of submissions being correct
    for all three problems.  The div 1 easy and medium problems were quite well balanced, and most people had
    little trouble with the easy.  The hard on the other hand, was quite difficult, even though it turns out
    that the algorithm involved is relatively simple once someone is kind enough to share it with you.
</p>
                             
<H1> The Problems </H1> 

<font size="+2"><b>Datatype</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505565" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 2 - Level 1:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">164 / 183  (89.62%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">102 / 164  (62.20%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>JWizard</b> for 243.05 points</td></tr>
    </table>
</blockquote>
<p>
    Basically, just look at every character, and classify the string.  There are a number of useful functions that can
    make this even easier.  Regular expression, for example, are perfect here:
</p>
<pre>
    if(var.matches("[0-9]*"))return "INTEGER";
    if(var.matches("[0-9]*\\.[0-9]*"))return "DECIMAL";
    if(var.toLowerCase().matches("false|true"))return "BOOLEAN";
    return "STRING";
</pre>
<font size="+2"><b>MemberCheck</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505565" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 2 - Level 2:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">129 / 183  (70.49%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">93 / 129  (72.09%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>JWizard</b> for 473.45 points</td></tr>
    </table>
</blockquote>Used as: Division 1 - Level 1:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">145 / 149  (97.32%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">135 / 145 (93.10%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>venco</b> for 248.21 points</td></tr>
    </table>
</blockquote>
<p>
    The input here is small enough that runtime is no issue.  So, the simplest way to do it is to loop through all
    people that go to club 1, and see if any of them also went to clubs 2 or 3.  Then, you can check all of the
    people who went to club 2 and see if any of them also went to club 3.  You have to be careful not to repeat the
    elements in the return, but this isn't that difficult, and you can just scan all the dishonest people you have
    found so far, before adding a new one.

</p><font size="+2"><b>BowlSim</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505565" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 2 - Level 3:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">82 / 183  (44.81%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">62 / 82  (75.61%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>kbscores</b> for 926.96 points</td></tr>
    </table>
</blockquote>
<p>The input is ensured to be a complete game, so there is no need to worry about going out of bounds or anything
    like that.  So, what we want to do is calculate the score of each frame independently.  There are three cases to
    consider here: a strike, which takes only one attempt, a spare which takes two attempts, and a normal frame which
    takes two attempts.  Since we know there are exactly 10 frames, we can do something like this:
</p><pre>
int ptr = 0;
int score = 0;
for(int frame = 0; frame&lt;10; frame++){
   if(pinsDown[ptr]==10){//STRIKE
      score = score + pinsDown[ptr] + pinsDown[ptr+1] + pinsDown[ptr+2];
      ptr = ptr + 1;
   }else if(pinsDown[ptr] + pinsDown[ptr+1] == 10){//SPARE
      score = score + pinsDown[ptr] + pinsDown[ptr+1] + pinsDown[ptr+2];
      ptr = ptr + 2;
   }else{//NORMAL
      score = score + pinsDown[ptr] + pinsDown[ptr+1];
      ptr = ptr + 2;
   }
}
</pre>
<font size="+2"><b>Cribbage</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505565" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 1 - Level 2:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">102 / 149  (68.46%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">52 / 102 (50.98%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>antimatter</b> for 404.30 points</td></tr>
    </table>
</blockquote>
<p>
    No single part of this problem is particularly difficult, but when you put it all together, there are so many
    cases and things to remember that it is easy to miss one of them.  There are 5 different ways to score:
    fifteens, pairs, runs, flushes, and his nobs.  Pairs can be counted easily by examining all pairs of cards to
    see if they are the same.  Fifteens can be done in a couple of ways.  A brute force approach to this will work,
    as there are only 2^5 combinations of cards.  Another way to do this is to use a little bit of simple dynamic
    programming, but either way works just as well as the other.  Runs are probably the hardest to check, because
    we have to be careful not to count a run if another run is longer and uses the same cards.  A brute force
    approach would work here also.  We can keep a set of runs found so far, and if a run is super set of a run
    already found, remove the previous one, and if a run is a subset of a run already found, don't add it.  A
    number of other methods will also work, including recursion, or brute forcing over all possible runs that a
    hand might have.  Flushes are pretty simple, as they always involve cards 1 through 4.  We just have to check if card 0 is also part of a flush, and add 1 if it is.  Last, and least, is his nobs.  Simply check all the cards but the starter to see if they are jacks of the same suit as the starter.
</p>

<font size="+2"><b>PrefixSynchronization</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505565" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division 1 - Level 3:
<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">5 / 149  (3.36%) </td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">2 / 5 (40.00%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Yarin</b> for 694.29 points</td></tr>
    </table>
</blockquote>
<p>
    This deals with an interesting problem that actually comes up in some situations.  If you are transmitting
    binary data, in a variable length code, like a Huffman code, a transmission error (a 1 instead of a 0 or
    vice versa) can have drastic consequences for the transmission of future data.  A synchronization code is a
    sequence of bits that guarantees the transmitter will become resynchronized with the receiver.  The solution to
    this problem turns out to be remarkable simple, but it is far from obvious that it will work.  First, we want
    to define a state space that we can search.  In this case, we will define our state to be the set of positions
    that the receiver might be at, in each of the code words.  Thus, our initial state will be that the receiver can
    be in any position in any string.  Then, we want to do a standard breadth first search of our state space, and try
    to find a state where the only position that we can be at is the beginning of a code word.  To do this, we start
    with an empty string, that is associated with the initial state.  Then we add a 0 or a 1 to the empty string,
    and see which of the positions in our start state are invalidated (all those which don't expect a 0 or a 1 -
    whichever we added - to be the next bit).  We add the states reached by adding a 0 or 1 to a queue, and then
    successively add bits to the strings, generating new states.  The key to making this run in time is to cache the
    states so that we never add more than one string which leads to the same state into our queue.
</p>
<p>
    It isn't at all obvious that this approach will work because the state space is potentially very large - greater
    than 2^30.  However, it turns out that the most states you will even have to examine is less than n^2, where
    n is the number of code words.  Don't ask me why this is true, but after 2 days of testing random codes,
    none of them required more than n^2 states.
</p>
<p>
    Another interesting thing to note about this problem is that most Huffman codes have a synchronizing sequence,
    and in fact most codes like this turn out to be "self-synchronizing".  In other words, even if there is a
    transmission error, the receiver will usually (though not always) get back on track and start receiving the
    proper data again.  This fact has been used in fax machines which send data over noisy phone lines.
</p>
<pre>
#include &lt;string&gt;
#include &lt;vector&gt;
#include &lt;iostream&gt;
#include &lt;map&gt;
using namespace std;
class PrefixSynchronization {
public:
string shortest(vector &lt;string&gt; codewords) {
   int len = codewords.size();
   vector&lt;int&gt; pos;
   for(int i = 0; i&lt;len; i++){
      pos.push_back(0);
      for(int j = 0; j&lt;codewords[i].size(); j++)
         pos[i] |= 1&lt;&lt;j;
   }
   vector&lt;vector&lt;int&gt; &gt;queue;
   vector&lt;string&gt; seq;
   vector&lt;int&gt; length;
   map&lt;vector&lt;int&gt;,int&gt; cache;
   queue.push_back(pos);
   seq.push_back("");
   int h = 0;
   while(queue.size()!=h){
      vector&lt;int&gt; p = queue[h];
      for(char ch = '0'; ch&lt;='1'; ch++){
         vector&lt;int&gt; n;
         bool start = false;
         bool done = true;
         for(int i = 0; i&lt;len; i++){
            n.push_back(0);
            for(int j = 0; j&lt;codewords[i].size(); j++){
               if((p[i] &amp; (1&lt;&lt;j)) &amp;&amp; codewords[i][j]==ch){
                  if(j+1==codewords[i].size()){
                     start = true;
                  }else{
                     done = false;
                     n[i] |= 1&lt;&lt;(j+1);
                  }
               }
            }
         }
         for(int i = 0; i&lt;len &amp;&amp; start; i++)n[i] |= 1;
         if(!cache[n]){
            cache[n] = 1;
            queue.push_back(n);
            seq.push_back(seq[h] + ch);
            if(done){
               int t = seq.size()-1;
               cout &lt;&lt; t &lt;&lt; endl;
               return seq[t];
            }
         }
      }
      h++;
   }
   return "NONE";
}
};
</pre>

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
