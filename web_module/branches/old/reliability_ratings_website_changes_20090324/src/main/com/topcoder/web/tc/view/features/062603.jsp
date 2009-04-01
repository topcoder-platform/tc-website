<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>Simple Performance Improvement</strong></font><br />
                        Wednesday, June 26, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=271917"><strong>slowjoe</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>
<b>Introduction</b><br />
At the Collegiate Challenge finals, there was a discussion about improving performance 
levels, and it made me think.  Someone asked two questions: when should he expect his 
performance to peak, and how high should he expect to go.  No answer was given, not 
surprisingly.
</p>

<p>
I'd like to share a few of my thoughts on improving performance in areas other than 
pure programming ability.
</p>

<p>
<b>Talent</b><br />
I've heard it said of soccer players that talent dominates until the age of twenty, and 
after that point, focus and hard work become more important.
</p>

<p>
I don't think this is true of coding.  No one was born knowing Dijkstra or 
Floyd-Warshall.  Everyone has to learn the standard algorithms.  On the other hand, 
some people learned these things earlier than others.  I know that many of the 
leading coders (for example, SnapDragon, dmwright, reid and dgarthur) 
represented their country at the high school level.  I'd say there are two groups of 
coders: those who have slaved over algorithm textbooks, and those who ought to do so. 
</p>

<p>
On the other hand, here are some simple things you can do which will significantly 
improve your performance, which will mean more points at the end of match.
</p>

<p><b>People</b><br />
I've scored zero a couple of times because my girlfriend has picked a fight halfway 
through the first problem.  I'm probably not the only person to have such an 
experience.  The important people in your life should come first: don't lose a 
girlfriend just because of TopCoder. Likewise, TopCoder is not worth losing a job 
or failing an exam over. The best advice in this column is in the next sentence.
</p>

<p>
Make sure there are no urgent problems you should be dealing with while the 
match is on.
</p>

<p>
Try to ensure that your friends and family respect your time and space during a 
match.  If you're in high school, tell your Mom that you feel TopCoder is a career 
move.  If your wife is concerned about the time, phone one of her friends and offer 
to pay for them to go out to dinner together...on TopCoder night.  Even bringing home 
a bunch of flowers or box of chocolates on TopCoder night will reinforce positive 
associations.  Trust me, it works.</p>

<p><b>Computer Setup</b><br />
The TopCoder applet requires a significant amount of memory.  It's worth testing 
what does and does not cause problems with your computer.  My setup has 128Mb 
of RAM, and I like to run a web browser on the java API docs, as well as the applet 
and the PopsEdit java plugin.  I have had swapping problems with this, so if you 
have less than this, it would be wise to consider upgrading your box.
</p>

<p>
Other people I've spoken to tell me they have an old modem and ISP account so they 
have backup in case of network outages.  Overkill?  Maybe, but imagine being a red 
or high yellow knocked out of the Invitational because of a network outage.
</p>

<p><b>Software Setup</b><br />
There is only one thing to say about using JVI or Standard editor:
</p>

<p>
DON'T
</p>

<p>
Your editor, its setup, and your knowledge of it are the clearest areas where coders 
rated blue and below can improve.  Can you tell me what's good about your editor?  
If the answer is "no", you can score at least 50 points extra a match by putting 
some time in here.
</p>

<p>
(Reds and Yellows probably already know their tools.  In the case of the top reds, 
their typing speeds are likely so high that the advantage from editor tuning is small.)
</p>

<p>
So what should you look at in a good setup?  Well, there are standard things that 
any usable editor has:
</p>

<p>
Syntax coloring/error highlighting<br />
Auto-indentation support
</p>

<p>
If your editor doesn't have these, then you should change!  PopsEdit gives you these, 
and other possible solutions (used with FileEdit) are Visual Studio, Emacs, Vim or 
JEdit (the last 3 are free.)
</p>

<p>
Especially for match performance, you should think about the following features:
</p>

<p>
1.  Local compiling and debugging.  
</p>

<p>
Not always necessary, but sometimes the applet runs slow.  On several occasions 
during matches (including cancellations due to poor compiler performance on the 
server), I haven't been aware of the problem until compile/submit.  When 
performance problems strike, having compile and debugging features has added at 
least 100 points to my score.
</p>

<p>
2.  Abbreviations.
</p>

<p>
My typing speed is 30-40 words per minute.  The top reds are likely pushing 
100 wpm and upwards.  How do you close the gap?  Well, if you hunt-and-peck, 
it may be worth doing typing drills.  Another, more productive way to improve is 
to program your editor to do the typing for you.
</p>

<p>
I've aliased "fri" to:
<pre>
for (i=0, i&#60;&#94;; i++) {
}
</pre>
</p>

<p>
(the cursor appears at the caret).  For 4 keystrokes, I get much more.
</p>

<p>
I've got a similar alias "stk":<br />
<pre>
StringTokenizer st = new String Tokenizer(&#94;);
String tok;
while(st.hasMoreElements()) {
   tok = st.nextElement();
}
</pre>
</p>

<p>
There is one strong argument against this sort of thing: you won't be able to use 
it if you get to an onsite final round (you only get a vanilla PC and 15-30 minutes 
to set it up, no notes allowed.)  To a high-ranked red, this may be a significant factor.
</p>

<p>
In my opinion, if you've written the same code more than twice in match solutions, 
you should add it to a code/alias library.  There is more that can be said about a code 
library.  Ideally, it should be kept fresh.  My library has been pruned as I've come 
to rely on Java's Collections API more, and my coding style has changed.  Ideally, each 
alias should either be documented (I marked up my contestapplet.conf file in html at 
one point) or memorized.
</p>

<p>
But you should really think about a code library if you haven't got one.  Trust me on 
this one.
</p>

<p>
3. Testing.
 </p>
 
 <p>
Pops and others have written plugins to extract test cases and create a framework to 
run them.  With a single key press, you can then run all the example tests, and see 
the results.  This is like a golfer being able to hit a driver 100 yards further.  
</p>

<p>
It also avoids the potential embarrassment of failing one of the example tests.  I've 
done that.  It sucks!
</p>

<p>
I originally wrote this article before the arena changes that allow running of example 
test cases.  At that time I included the line:
</p>

<p>
<em>
You absolutely have to be able to run the example tests via a single keystroke.  
There is no discussion.  
</em>
</p>

<p>
Now, of course, matters have changed.  Anyone who fails one of the example test cases 
has nowhere to hide.  One-key test execution has changed into an issue of relative 
competitive advantage.  Once again, ask yourself the question: "Where is my testing 
setup better than the setup of my rivals?"
</p>

<p>
This is by no means an exhaustive list of things to try.  Many sports have seen enormous 
innovations, which changed the game.  For example, wide-body tennis rackets with 
over-sized heads (expected to be used mainly by seniors) have completely changed tennis.  
Innovation is an arms race: you have to keep working to maintain parity, let alone an edge.
</p>



                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
