<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 168 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 168</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, October 21, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2>
<p>
The fact that 507 coders (or should I say top coders) have registered for 
this match is quite impressive. DIV I coders lived up to their high standard 
and the submission and success rates where pretty solid. But I think there 
was one other quite impressive thing
if not a bit suprising and frustrating....<br/><br/>
Lets look at the following scenario:<br/>
It is probably (if memory serves me correctly) the only time that I have 
seen complete silence in my room (Div II) and basically no submissions for 
the longest period of time.<br/><br/>
Here is how it went: <br/>
We all started with the 250 as usual and we all submitted the easy problem 
within the normal time frame of about 5 to 10 mins. So far, so good. I check 
the submission times and I see that I am ok. I was about 4th in my room at 
the time when I submitted. So what do we all do next? But of course, we open 
and tackle the 500 problem. So we all opened the 500 and...<br/><br/>
And I think that any spectator watching my room would have been quite taken 
aback and would have shaken his applet a bit in order to see why nothing was 
happening. And nothing seemed to be happening for the longest period of 
time. But in actuality we were all hard at work trying to figure out a 
strategy for getting this problem into submission. Time passed, and an 
occasional compilation or testing message would appear on the room history 
list. Finally after what must have been like 40 minutes submissions started 
to trickle in. <br/><br/>But alas! No time was left to even attempt the 1000 and 
in my room there were no submissions for the hard problem. What is even more 
interesting is the fact that most of the submissions for the DIV II 500 
would fail either by a direct coder challenge or through a system test case. 
There was about a 20% success rate for this problem. Any questions? Yes, 
this write-up is dedicated to the coders of alternative submission 
lifestyle. But do read on, as we will have a look at why there was such a 
poor success rate for this problem and we will look at a strategy to 
maximize chances at scoring high points especially for those who would like 
to trade the green of their earthly pastures for the blue of the heavens.
</p>

<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b>Swimmers</b>
</font>
<A href="Javascript:openProblemRating(1888)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
260 / 299 (86.96%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
196 / 260 (75.38%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>swanksax2</b> for 238.48 points (6 mins 18 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
191.46 (for 196 correct submissions)
</td>
</tr>
</table></blockquote>
<p>
This is a relatively simple problem but one has to be always on the lookout 
for special cases.<br/>
In a nutshell: A swimmer will plunge into a river at some point A and swim 
downstream a certain given distance to point B (i.e. with the river current) 
and then reverse and swim upstream back to point A (i.e. against the 
current) We are given the distance that swimmer will swim before they will 
reverse. We are also given the speed of the river current and the speed of 
the swimmer. We are to calculate the actual time that it took the swimmer to 
swim from point A to point B and back to point A. It is in fact a simple 
vector addition on the x-axis. One important thing to watch out for is the 
fact that the swimmer might not have enough speed to return. If the speed of 
the river current is greater than or equal to the swimmer's speed then the 
swimmer will never make it back. In such a case we return -1.<br/><br/>

<b>Simple formula:</b><br/>
&#160;&#160;&#160;&#160;	The time to swim from point A to point B is given 
by <br/>
&#160;&#160;&#160;&#160;	TimeFromAtoB = ABDistance/(speedOfSwimmer + 
speedOfCurrent) <br/>
&#160;&#160;&#160;&#160;	Here the swimmer is taking advantage of the fact 
that his/her speed gets added<br/>
&#160;&#160;&#160;&#160;	to the speed of the current.<br/><br/>

&#160;&#160;&#160;&#160;	The time to swim back from point B to point A 
(against the current) is given by<br/>
&#160;&#160;&#160;&#160;	TimeFromBtoA = ABDistance/(speedOfSwimmer - 
speedOfCurrent)<br/>
&#160;&#160;&#160;&#160;	Here the swimmer has to fight the current and in 
fact looses speed which <br/>
&#160;&#160;&#160;&#160;	basically means that the current speed gets 
subtracted from the swimmer's speed.<br/>
&#160;&#160;&#160;&#160;	Thus the total time that the swimmer takes to 
complete their round is going to be the addition of these two.<br/><br/>

<b>Contraints:</b><br/>
	There were a number of things to watch out for though:<br/><br/>

&#160;&#160;&#160;&#160;(1) The return value was to be rounded down (take 
the floor of the result) but one <br/>
&#160;&#160;&#160;&#160;has to be careful <u>not to do</u> the 
following:<br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	floor(ABDistance/(speedOfSwimmer 
+ speedOfCurrent)) + <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	floor(ABDistance/(speedOfSwimmer 
- speedOfCurrent))<br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	as this would result 
occasionally in too small a value.<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	We need to do the 
following:<br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	floor( 
(ABDistance/(speedOfSwimmer + speedOfCurrent)+ <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;               
(ABDistance/(speedOfSwimmer - speedOfCurrent)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;             )<br/>

&#160;&#160;&#160;&#160;(2) The actual distance from A to B could be 0. This 
is a special case and we <br/>
&#160;&#160;&#160;&#160;would return for such a swimmer the time of 0 
regardless of what the swimmer's speed <br/>
&#160;&#160;&#160;&#160;is or the river current speed. This takes precedence 
over case (3) below.<br/>

&#160;&#160;&#160;&#160;(3) If the actual speed of the swimmer is less than 
(or equal-to) the speed of the <br/>
&#160;&#160;&#160;&#160;river current then the swimmer would never make it 
back. In such a case we return -1;<br/>

&#160;&#160;&#160;&#160;(4) Note that we can have a case where we would have 
division by 0 in our <br/>
&#160;&#160;&#160;&#160;formula if the speed of the swimmer is the same as 
the speed of the river current. We <br/>
&#160;&#160;&#160;&#160;need to ensure that we trap this case before it gets 
to our formula. Note that test of <br/>
&#160;&#160;&#160;&#160;(equal-to) in case (3) takes care of that. The code 
would fail if we only checked for the less-than condition.<br/><br/>

<b>Sample java code:</b><br/>

<pre>
	int[] result = new int[speeds.length];

	for(int i=0; i &lt; speeds.length; i++)
	{
	   // case (2)
	   if(distances[i] &lt;= 0)
	   {
	      result[i] = 0;
	      continue;
	   }
	   // case (3) note the (equal-to).
	   if(speeds[i] &lt;= current)
	   {
	      result[i] = -1;
	   }
	   // case (1)
	   else
	   {
	      double temp = ((double)distances[i]/(speeds[i]+current));
	      temp += ((double)distances[i]/(speeds[i]-current));
	      result[i] = (int)(Math.floor(temp));
	   }
	}
	return result;

</pre>
<b>Where did code fail:</b><br/>
Most code that failed the system tests or was successfully challenged did 
not ensure that
case (2) takes precedence over case (3) as well as missing the (equal-to) 
condition in case (3)
</p>

<font size="+2">
<b>Twain</b>
</font>
<A href="Javascript:openProblemRating(1876)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
110 / 299 (36.79%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
23 / 110 (20.91%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>SleepyOverlord</b> for 273.99 points (32 mins 1 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
216.66 (for 23 correct submissions)
</td>
</tr>
</table></blockquote>
<p>
Oh boy, oh boy! This was the killer question for div II. On the surface this 
is a relatively simple problem where we are given a number of rules to 
follow that transform a given input string through a succession of well 
defined steps. There is a maximum of 7 transformations (and a minimum of 0 
where the input string in unchanged) that can be applied to the input 
string. The key to solving this problem successfully is to build the 
solution in increments and test each transformation independently.Basically 
if you followed the rules you would have no problem solving this question. 
But then why did so many coders fail this question? And secondly why was the 
fastest submission time clocked at about 30 mins? <br/><br/>

With this particular question you have to ensure that you read each rule 
carefully as mistakes in such questions are difficult to pinpoint and thus 
very time
consuming to debug.<br/>
Lets look at two sample transformations necessary for this question:<br/><br/>

<u><b>Transformation (1) - year 1</b></u><br/><br/>

&#160;&#160;&#160;&#160;	- If a word starts with "x", replace the "x" with a 
"z".<br/>
&#160;&#160;&#160;&#160;	- Change all remaining "x"s to "ks"s.<br/><br/>

	<u>Solution pseudo-code:</u><br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		find all the "x"'s in the 
input string and for each "x" do the following test:<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		(beginning of a word 
test)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		if the x is the very first 
character in the string (beginning of a word special <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		case) then<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	replace 
this 'x' with 'z'<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		else if the character just 
before the current 'x' is a space character ' ' then<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	replace 
this 'x' with 'z'<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		(inside the word)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;			else<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;				replace 
the 'x' with "ks"<br/><br/>

	<u>Faster Trick Solution:</u><br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Add to the beginning of 
the input String a space: input  = " "+input. This will <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		collapse the word test 
code above from two cases to one generic case.<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Replace each occurrence of 
" x" with " z" (note the added space to test a beginning of a word)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Replace remaining 
occurrences of "x" with "ks"<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;			Remove the extra at the 
beginning " ": input = input.substring(1, input.length());<br/><br/>

		<u>Here is a java code snippet:</u>
		<pre>
		input = " " + input;
		input = input.replaceAll(" x", " z");
		input = input.replaceAll("x","ks" );
		input = input.substring(1);
		</pre>

<u><b>Transformation (5) year 5</b></u><br/><br/>

&#160;&#160;&#160;&#160;	- If a word starts with "sch", change the "sch" to 
a "sk".<br/>
&#160;&#160;&#160;&#160;	- If a "ch" is directly followed by an "r", change 
the "ch" to a "k".<br/>
&#160;&#160;&#160;&#160;	- After applying the above rules, change all "c"s 
that are not directly followed<br/>
&#160;&#160;&#160;&#160;	  by an "h", to a "k".<br/>
&#160;&#160;&#160;&#160;	 (This includes all "c"s that are the last letter 
of a word.)<br/><br/>

	<u>Solution pseudo-code:</u><br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Add to the beginning of 
the input String a space: input  = " "+input;<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Replace each occurrence of 
" sch" with " sk" (note the added space to test a <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		beginning of a word)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Replace each occurrence of 
"chr" with " kr"<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Append a space to the 
input string: input = input + " " (This is a nice trick to <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		ensure that we can test 
for the last letter without falling off the edge)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Replace all occurrences of 
  "c" not followed by an "h" to a "k":<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		(Find all 'c' and then 
check if the next character to the right is an 'h'<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;			if(not) 
then<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;				replace 
the 'c' with "k"<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;		Remove the helper spaces 
from beginning and end.<br/><br/>

		<u>Here is a java code snippet:</u>
		<pre>
		input = " " + input + " ";
		input = input.replaceAll(" sch", " sk");
		input = input.replaceAll("chr","kr" );
		for(int i=0; i &lt; input.length(); i++)
		{
		   if(input.charAt(i) == 'c' &amp;&amp; input.charAt(i+1) != 'h')
		   input = input.substring(0, i) + "k" +
       		   input.substring(i+1);
		}
		input = input.substring(1, input.length()-1);
		</pre>


As can be seen just going over two transformations this can be quite time 
consuming especially if you do not use any tricks and
shortcuts. It is also very error prone. <br/><br/>

<b>Where did code fail:</b><br/>
Basically all over the place. It was easy to make mistakes here. In some 
cases the code had some problems with correctly figuring out where the 
beginning of a word was.<br/><br/>

Here is a suggested strategy that might be useful when you hit a rather 
difficult to write/understand problem:<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(1) Read it carefully a 
couple of times (Always a good thing to do)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(2) Formulate a strategy for 
the solution before you write code<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(3) Test your strategy 
against a couple sample test cases (no code yet)<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(4) if you find that the 
question is very time consuming (i.e. for the 500 I would say if<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	    within 25 minutes you 
are not testing the code) you might consider skipping this <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	    question for now and 
peek if  the next question is perhaps more to your liking.<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	    You can always come 
back (with a loss of time and thus points of course) if you find<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;	    the other question even 
harder.<br/><br/>

	In SRM 169 it turns out that the 1000 point question for Div II was 
actually pretty
	accessible and doable. Skipping the 500 question would have been preferable 
(I think) to
	a lot of people.<br/><br/>

</p>
<font size="+2">
<b>FairWorkload</b>
</font>
<A href="Javascript:openProblemRating(1901)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
19 / 299 (6.35%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
11 / 19 (57.89%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>.</b> for 914.74 points (8 mins 50 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
721.75 (for 11 correct submissions)
</td>
</tr>
</table></blockquote>
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
147 / 184 (79.89%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
132 / 147 (89.80%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>antimatter</b> for 487.35 points (4 mins 36 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
348.60 (for 132 correct submissions)
</td>
</tr>
</table></blockquote>
<p>
This is a very nice question, which can be solved in a couple ways. But 
first and foremost lets try to understand what the problem is asking us to 
do.<br/>
We are given a number of filing cabinets where each cabinet contains some 
number of folders. We are also given the number of available workers. What 
we would like to do is to partition the cabinets amongst the N workers in a 
such a way that<br/>
&#160;&#160;&#160;&#160;(1) each worker works with adjacent cabinets<br/>
&#160;&#160;&#160;&#160;(2) number of folders that each worker has to work 
on (cabinets can not be shared) is spread as evenly as possible.<br/>
We are to return the largest partition in our most evenly spread 
arrangement.<br/><br/>

As an example: if we are given 9 cabinets: <br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;10 20 30 40 50 60 70 80 
90<br/><br/>

and we have 3 workers, the best solution would be:<br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;10 20 30 40 50 | 60 70 | 80 
90<br/><br/>

And the largest partition in this case is 170 (80+90)<br/><br/>

<b>Constraints:</b><br/>
&#160;&#160;&#160;&#160;The number of cabinets we will work with is 
[2..15]<br/>
&#160;&#160;&#160;&#160;The max number of workers we will have is 
[2..15]<br/><br/>

This is a nutshell is a problem of generating all N (number of workers) 
subsets of the cabinets such that the following
is always true:<br/><br/>

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(1) A subset must contain 
only adjacent cabinets<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(2) Cabinets can not 
repeat<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(3) Cabinets can not be 
omitted: The total number of cabinets in all subsets gives<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;us the total set back<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(4) Subsets cannot be 
empty<br/><br/>

Here are a couple approaches to this problem:<br/><br/>

(1) First we can generate all the possible valid subsets as follows:<br/>
We set a globalMax to be the total number of folders.<br/>
We start with the full set of cabinets and we divide this set into two 
subsets LeftSet and RightSet. <br/>
We then take the RightSet and again divide it by into two sets.<br/>
We repeat this process until we have generated the same number of sets as we 
have workers. <br/>

For each subset that we generate in this manner we calcuate the 
LocalMax.<br/>
We then compare this LocalMax to the GlobalMax and if GlobalMax is greater 
than the LocalMax then we set
the new GlobalMax to be the value of the LocalMax.<br/>
Basically we have found at this point a solution that distributes the 
folders better.<br/>
Once we go through all these sets we return the current GlobalMax.<br/><br/>

	This can be done in a recursive manner as follows (after lanenal's solution 
from room 2)<br/>
<pre>
	int globalMax;
	public int getMostWork(int[] f, int w)
	{
		for(int i=0; i&lt;f.length; i++) globalMax += f[i];
		genSubsets(f, -1, w, 0);
		return globalMax;
	}
	void genSubsets(int[] f, int from, int w, int localMax)
	{
	   int sum = 0;
	   // Final subset
	   if(w==1)
	   {
	  	// get the folders for this subset
		for( int i=from+1; i&lt;=f.length-w; i++) sum += f[i];
		   // is this the most folders for the current subsets?
		   // If yes then update the localMax
		   if(localMax&lt;sum) localMax = sum;
		   // Is our localMax less than (better) the globalMax
		   if(localMax &lt; globalMax) globalMax = localMax;
		   return;
	   }

	   for( int i=from+1; i&lt;=f.length-w; i++)
	   {
	   	// the LeftSubset folders sum
		sum += f[i];
		// Generate the RightSubset by dividing the current
		// subset in two with the pivot at i.
		// Propagate localMax to the RightSubset
		genSubsets(f, i, w-1, sum&gt;localMax?sum:localMax);
	   }
	}
</pre>

(2) Application of Binary Search. For a non-recursive example of this 
approach please look at Ukraine's code in room 1.<br/><br/>

(3) We can also use Dynamic Programming. I will leave this as an exercise to 
the reader.<br/><br/>
</p>
<font size="+2">
<b>MineField</b>
</font>
<A href="Javascript:openProblemRating(1877)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
181 / 184 (98.37%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
177 / 181 (97.79%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>ZorbaTHut</b> for 245.83 points (3 mins 42 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
206.02 (for 177 correct submissions)
</td>
</tr>
</table></blockquote>
<p>
This is actually a very easy problem in my opinion.Basically given locations 
of randomly generated mines on a playing grid
we are to return an array which for each location on the grid that is not 
occupied by a mine will give the count of all the mines that
are neighboring this location.<br/><br/>

<b>Constraints:</b><br/>
&#160;&#160;&#160;&#160;9x9 grid<br/>
&#160;&#160;&#160;&#160;Mines input will be [0, 10]<br/>
&#160;&#160;&#160;&#160;Each grid location will neighbor at most 8 
mines.<br/><br/>

I will present here three steps to the solution:<br/><br/>


&#160;&#160;&#160;&#160;(1) Create a grid char Array [10][10] initialized to 
0<br/>
&#160;&#160;&#160;&#160;(The grid is extended by a 1 char buffer in every 
direction)<br/>
&#160;&#160;&#160;&#160;Parse the input string and place the mines in grid. 
(denoted with 'M')<br/>

&#160;&#160;&#160;&#160;(2) For each grid location in the range of 
[1..9][1..9] <br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;int count=0;<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Iterate through 
each neighbor of the current grid location<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if(the neighbor 
location contains 'M')<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;count++;<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Set the current 
grid location to count;<br/>
&#160;&#160;&#160;&#160;(3) Convert the grid representation to the output 
string.<br/><br/>

The reason why I have created the grid to be 10x10 is so that I have a 
buffer (which is empty and thus will not contribute to the count) which 
allows me not to have a boundary testing code when I am looking at the 
neighbors:<br/><br/>

Here is a java snippet for (2) assuming the grid is made to be [10][10]<br/>

<pre>
	char[][] grid = new char[10][10];

	int count;
	for(int row=1; row &lt;= 9; row++)
	{
		for(int col=1; col &lt;= 9; col++)
		{
			count=0;
			if(grid[row][col] = 'M') continue;
			// Test all neighbours
			// (Note no need to test if outside of grid)
			for(int r = row-1; r &lt; = row+1; r++)
			{
				for(int c = col-1; c &lt; = col+1; c++)
				{
					if(row==r &amp;&amp; col==c) continue;
					if(grid[r][c] == 'M')
						count++;
				}
			}
			grid[row][col] = count;
		}
	}

</pre>
<b>Where did code fail:</b><br/>
The success rate for this problem was almost 100% but a few solutions failed 
mostly on incorrectly going through the neighbors. Especially one has to be 
careful with the
<pre>&#160;&#160;&#160;&#160;if(row==r &amp;&amp; col==c) continue
</pre> condition to ensure that one doesn't do this instead:
(for example)
<pre>&#160;&#160;&#160;&#160;if(row==0 &amp;&amp; col==0) continue;</pre>
</p>

<font size="+2">
<b>GoldMine</b>
</font>
<A href="Javascript:openProblemRating(1957)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Three: 
<blockquote><table cellspacing="2">
<tr>
<td class="bodyText" style="background: #eee;">
<b>Value</b>
</td>
<td class="bodyText" style="background: #eee;">
900
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Submission Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
56 / 184 (30.43%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Success Rate</b>
</td>
<td class="bodyText" style="background: #eee;">
39 / 56 (69.64%)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>High Score</b>
</td>
<td class="bodyText" style="background: #eee;">
<b>WishingBone</b> for 757.59 points (12 mins 49 secs)
</td>
</tr>
<tr>
<td class="bodyText" style="background: #eee;">
<b>Average Score</b>
</td>
<td class="bodyText" style="background: #eee;">
472.93 (for 39 correct submissions)
</td>
</tr>
</table></blockquote>

<p>
This is a rather straight forward problem once you realize that is can be 
solved in a greedy manner.<br/>
At any given point a miner has a profit value associated with him depending 
on the state of each mine (i.e is the mine full? How much will the mine 
yield if we add this miner to it) We need to find the mine that will yield 
best profit if we add this miner to it.The basic premise has to do with 
maximizing resources. Given a number of gold mines and a formula for the 
amount of money that each mine would yield given a number of miners working 
in the mine we can use the following observation to solve this 
problem:<br/><br/>

&#160;&#160;&#160;&#160;Take the next available miner and apply him into 
each of the mines.<br/>
&#160;&#160;&#160;&#160;Calculate the profit made by applying this miner to 
each mine and choose the best<br/>
&#160;&#160;&#160;&#160;profit for this miner. Apply this miner to the 
gold-mine that makes the most money from<br/>
&#160;&#160;&#160;&#160;having him.<br/>
&#160;&#160;&#160;&#160;We continue in this manner until all miners have 
been distributed.<br/><br/>

How do we know that this will work? Think of it this way: any given gold 
mine will have profit based on the following function:<br/><br/>

&#160;&#160;&#160;&#160;Profit(gold-mine , num-miners)<br/>
&#160;&#160;&#160;&#160;We could run now this function for every gold mine 
for all the possible num_miners [0..6] <br/>
&#160;&#160;&#160;&#160;that could fit into that mine.<br/>
&#160;&#160;&#160;&#160;This would build for us a profit table for each 
mine.<br/>
&#160;&#160;&#160;&#160;We could then sort this table based on profit and 
number of miners.<br/><br/>

&#160;&#160;&#160;&#160;Then, once we are given the number of available 
miners we would simply look up the <br/>
&#160;&#160;&#160;&#160;most profitable entry in our table for the most 
miners we could fit in it. Then we repeat this <br/>
&#160;&#160;&#160;&#160;process for the remaining miners (after having 
removed the best entry from the profit table)<br/>
&#160;&#160;&#160;&#160;This is in essence a greedy algorithm, which is 
equivalent to the algorithm given before.<br/><br/>

<b>Constraints:</b><br/>
&#160;&#160;&#160;&#160;We can have at most six miners per gold mine.<br/>
&#160;&#160;&#160;&#160;All miners must be placed.<br/><br/>

That's all, folks. Until the next SRM. keep on coding!
</p>

                        <p>
<!--                        <img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />-->
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=252022"><strong>AleaActaEst</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>

