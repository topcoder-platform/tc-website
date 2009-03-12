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
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10964">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516069" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 372</span><br />Wednesday, October 17, 2007
<br /><br />



<h2>Match summary</h2>

 

<p>

SRM 372 was the scene for fierce TopCoder programming action, as 1450 competitors showed up to do battle in the penultimate warmup to the TCCC '07 finals.  <tc-webtag:handle coderId="7340263" context="algorithm"/> jumped out to an early lead with a fast submission of the 1000.  As the coding phase ended, <tc-webtag:handle coderId="19849563" context="algorithm"/> led, followed by <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/>.  <tc-webtag:handle coderId="7340263" context="algorithm"/> and <tc-webtag:handle coderId="15206296" context="algorithm"/> leapt back into the fray with 2 successful challenges each.  In the end, <tc-webtag:handle coderId="19849563" context="algorithm"/> squeaked out victory, just edging out <tc-webtag:handle coderId="7340263" context="algorithm"/> and <tc-webtag:handle coderId="15206296" context="algorithm"/>.

</p><p>

In division 2, <tc-webtag:handle coderId="22635428" context="algorithm"/> leapt into the early lead, but gave way to the dominating <tc-webtag:handle coderId="22651925" context="algorithm"/>.  With the fastest times on both the medium and hard problems, <tc-webtag:handle coderId="22651925" context="algorithm"/> easily won the match.  Following in second place was <tc-webtag:handle coderId="22697299" context="algorithm"/> with a very impressive debut, and <tc-webtag:handle coderId="15115719" context="algorithm"/> took home third.



</p>

 

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8222&amp;rd=10789" name="8222">DietPlan</a></b>

</font>

<A href="Javascript:openProblemRating(8222)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516069" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      662 / 731 (90.56%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      590 / 662 (89.12%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tstan436</b> for 246.90 points (3 mins 11 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      195.89 (for 590 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Due to the low constraints on input, this problem can easily be solved by brute force.  You can simply loop over all possible types of food ('A'-'Z'), and check to see whether they are present in the <b>diet</b>, and in the food you have already eaten.  If you've eaten it and it is not part of the <b>diet</b>, then you have cheated, and we return "CHEATER".  If you have not eaten it and it is in the <b>diet</b>, then we add it to the return string.  By looping in alphabetical order, we can then return the appropriate string.  Java code for this would look like:

 </p><p>

<pre>
String eaten = breakfast + lunch;
String ret="";
for(char c='A'; c<='Z'; c++)
 if(diet.indexOf(c)==-1 &&  eaten.indexOf(c)!=-1)    // We ate it but not in diet
     return "CHEATER";
 else if(diet.indexOf(c)!=-1 && eaten.indexOf(c)==-1) // We didn't eat it yet
     ret += c;
return ret;
</pre>
 </p><p>

<b>Homework</b>

 </p><p>

Let's make the problem a little harder and say that you may need to eat multiples of certain foods (for example, your diet may consist of 2 'A', 3 'B', and 1 'D').  Can you solve this problem in O(D+E) time, where D is the size of diet and E is the size of breakfast+lunch?


</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8223&amp;rd=10789" name="8223">RoadConstruction</a></b>

</font>

<A href="Javascript:openProblemRating(8223)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516069" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      246 / 731 (33.65%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      136 / 246 (55.28%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>XiaoXiaoqing</b> for 473.83 points (6 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      281.40 (for 136 correct submissions)

    </td>

  </tr>

</table></blockquote>

 

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

      493 / 603 (81.76%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      423 / 493 (85.80%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 241.70 points (5 mins 18 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      173.74 (for 423 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem (inspired by the fact that drivers in certain US states apparently don't understand how to merge into one lane when entering a construction zone) can be solved simply through simulation.  For each time step, we determine which car is allowed to exit; we can keep track of which cars have already yielded by keeping a boolean array called yield, in which yield[i] is true if the front car in lane i has already yielded to another car.  The car that is due to exit during this timestep will be the car in the lowest numbered lane that has already yielded.  If no cars have yielded, then the car in the highest lane that still has a car can exit.  If that car is 'D', we can return the number of cars that have previously exited.  The code to determine which lane can exit is O(N) (where N is the number of lanes), and in the worst case (where the car exits last) we have to go through all M cars, thus making the algorithm overal O(NM); for N=50 and M=2500, this is more than sufficient.  Java code follows:

</p><p>

<pre>
 int N = lanes.length;
 boolean yield[] = new boolean[N];
 int frontCar[] = new int[N];
 
 for(int ret = 0; true; ret++)
 {
  int i=0, last = 0;
  for(i=0; i < N ; i++)
   if(yield[i]) break;    // if the car has already yielded, we want it
   else if (frontCar[i] != lanes[i].length() )
   {
    yield[i] = true;    // the front car of this lane has now yielded
    last = i;            // and we keep track of the last car we see
   }			
			// if no lanes have yielded
  if(i==N) i = last;    // pick the highest numbered lane
  if(lanes[i].charAt(frontCar[i])=='D') return ret;
  frontCar[i]++;    // move the pointer to the next car
  yield[i] = false;    // the new car has not yet yielded
 }
</pre>

 </p><p>

<b>Homework</b>

 </p><p>

1)  Assume that you can find the location of the diplomat's car in constant time.  Find a O(N) algorithm to determine the cars that exit before the diplomat.</p><p>

2)  Assume that there are still N lanes, but now there are an infinite number of cars in each lane.  You know the lane that the diplomat is in, and the number of cars in front of him.  Determine the number of cars that exit before the diplomat in O(1) time.

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8065&amp;rd=10789" name="8065">RainyDay</a></b>

</font>

<A href="Javascript:openProblemRating(8065)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516069" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      47 / 731 (6.43%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      9 / 47 (19.15%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>XiaoXiaoqing</b> for 710.11 points (19 mins 56 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      532.87 (for 9 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<i>Approach 1 - Dynamic Programming</i>

 </p><p>

This problem proves to be a good exercise in dynamic programming.  In order for a dynamic programming solution to be attempted, we need to show that we can break down the big problem into subproblems, and then build up from there.  Assume that we are at section <i>n</i> at time <i>t</i>.  We can thus let dpTable[n][t] be the minimum number of times that we get wet to get home from there.  This means that the value to return will be dpTable[<i>y</i>][0] (where <i>y</i> is the section in which you start).  To prove that this will not exceed memory/time limits, we need to determine the maximum time that we will take to reach home while as dry as possible.  Assume that the section in which you are standing is covered.  Your next move that does not involve you standing still should move you one step closer to your home (proof:  If you move away from home in some optimal route, you eventually will return to that section on your way home; if you choose to just stand still until that time instead, you will be just as dry).  Furthermore, let N be the number of sections of path; there will be an optimal time to move toward home within N minutes of arriving in that section.  Thus, there is an optimally dry route to the home that takes at most N<sup>2</sup> minutes.  With N being at most 50, the dpTable will take up to 125,000 bytes of memory and thus easily will fit into memory.

</p><p>

<pre>

int N;
int dpTable[][];
String p, f;

int getWet(int cur, int t)
{
 if(cur < 0 || cur >=N) return 1; // illegal input
 if(p.charAt(cur)!='.') return 0; // can't get wet
 if(f.charAt((cur+t)%N)=='R') return 1; // wet
 return 0; // dry
}

int dp(int cur, int t)
{
 if(t > N*N) return 10000;
 if(cur < 0 || cur >=N) return 10000;
 if(p.charAt(cur)=='H') return 0; // HOME!
 if(dpTable[cur][t] > -1) return dpTable[cur][t];

 dpTable[cur][t] = 10000; // set dpTable to high value
 // Step 1:  Try not moving
 dpTable[cur][t] = Math.min(dpTable[cur][t],
        getWet(cur, t) + getWet(cur, t+1) + dp(cur, t+1) );
 // Step 2:  Try moving right
 dpTable[cur][t] = Math.min(dpTable[cur][t],
        getWet(cur+1, t) + getWet(cur+1, t+1) + dp(cur+1, t+1) );
 // Step 3:  Try moving left
 dpTable[cur][t] = Math.min(dpTable[cur][t],
        getWet(cur-1, t) + getWet(cur-1, t+1) + dp(cur-1, t+1) );

 return dpTable[cur][t];

}

public int minimumRainTime(String path, String forecast)
{
 N = path.length();
 dpTable = new int[N][N*N+1];
 for(int i=0; i < N; i++)
  Arrays.fill(dpTable[i], -1);
 p = path;
 f = forecast;

 return dp(path.indexOf('Y'), 0);
}

</pre>

</p><p>

Although this is sufficient, if the constraints were a little larger this algorithm would not work.  For instance, if N were 500, the dpTable would take up 125,000,000 bytes.  To fix this issue, consider the state that we currently use; it is based on the position and time.  However, N minutes later, we face exactly the same subproblem; the <b>forecast</b> is the same as it was N minutes ago, and we are at the same position.  Thus, we can save the state as dpTable[n][t%N], and this program uses N<sup>2</sup> memory, easily working for N=500.

 </p><p>

<i>Approach 2 - (alternatively titled, "You mean I could have avoided DP this whole time?')</i>

 </p><p>

If you aren't a fan of dynamic programming, there is a greedy method which can be used to solve the problem.  Assume you are about to embark from a covered section into an uncovered section.  One can prove that any time you step into an uncovered section, your next move will be to immediately move 1 section closer to home.  The only time you should delay is when standing in a dry area while waiting for the <b>forecast</b> to rotate to its optimal place.  Assume you start with the index of 'H' greater than that of 'Y'.  If you come across <i>n</i> consecutive sections that are uncovered, you will move across them in <i>n</i> minutes.  During that time period, you will be exposed to 2<i>n</i> sections from the <b>forecast</b> (since you alternate moving with the forecast).  Since you are allowed to wait as long as you want to move, you can simply start at each part of <b>forecast</b> (from 0 to N-1) and determine how many times you get wet in that time.  We can easily do this in O(N<sup>2</sup>) time, which is no problem with N=50.  If 'H' is to the left of 'Y', we can use the same principle, except that we only care about segments of forecast of length 2 (because the rain is moving in the same direction as you).  The code will therefore look something like this:

</p><p>

<pre>
int minWet(String f, int t)
{
 t *= 2;    // we can potentially get wet twice per section
 int ret = 100000;
 for(int i=0; i < f.length(); i++)
 { int counter = 0;
  for(int j=0; j < t; j++)
   if(f.charAt((i+j)%f.length() ) == 'R')    // if there's rain there
    counter++;    // increment the counter
  ret = Math.min(ret, counter);    // take the best so far
 }
 return ret;
}

public int minimumRainTime(String path, String forecast)
{
 int y = path.indexOf('Y');
 int h = path.indexOf('H');
 if(y < h) // if we move right
 {
  int ret = 0;
  int openCount = 0;
  for(int i=y; i<=h; i++)
  {
     // keep track of how long the open space is
   if(path.charAt(i)=='.') openCount++;
   else
   {    // call the function to find out minimum wetness
    ret += minWet(forecast, openCount);
    openCount = 0;
   }
  }
  return ret;
 }
 else
 {
  int wetCount = minWet(forecast, 1);
  int ret = 0;
  for(int i=y; i>=h; i--)
   if(path.charAt(i)=='.') ret += wetCount;
  return ret;
 }

}
</pre>

 </p><p>

<b>Homework</b>

</p><p>

The above getWet() function runs in O(N<sup>2</sup>) time.  Rewrite the function to run in O(N) time instead.


</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8005&amp;rd=10789" name="8005">RoundOfEleven</a></b>

</font>

<A href="Javascript:openProblemRating(8005)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516069" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      268 / 603 (44.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      204 / 268 (76.12%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>JongMan</b> for 485.00 points (5 mins 1 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      317.30 (for 204 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Let us represent the number <b>n</b> in base 10.  So <b>n</b> = a<sub>0</sub>*10<sup>0</sup> + a<sub>1</sub>*10<sup>1</sup> + ... + a<sub>m</sub>*10<sup>m</sup>.  Now if we write this expression modulo 11, and keep in mind that (p-1) mod p = -1 mod p, we get:

 </p><p>

<b>n</b> = (a<sub>0</sub>*10<sup>0</sup> + a<sub>1</sub>*10<sup>1</sup> + a<sub>2</sub>*10<sup>2</sup> ... + a<sub>m</sub>*10<sup>m</sup>) % 11<br>

<b>n</b> = (a<sub>0</sub>*10<sup>0</sup>)%11 + (a<sub>1</sub>*10<sup>1</sup>)%11 + (a<sub>2</sub>*10<sup>2</sup>)%11 ... + (a<sub>m</sub>*10<sup>m</sup>) % 11<br>

<b>n</b> = a<sub>0</sub>*1 + a<sub>1</sub>*(-1) + a<sub>2</sub>*1 + ... + a<sub>m</sub>*(-1<sup>m</sup>)

</p><p> 

Thus, to determine if <b>n</b> is a multiple of 11, we can alternately add and subtract the digits of the number; if the result is 0 modulo 11, then the original number was a multiple of 11.

 </p><p>

So, how do we apply this to the problem at hand?  We can solve the problem using DP; in this case, our state consists of which digit we are at (from 0 to m), the current sum modulo 11, and the amount of money that we have left.  Our goal is to have the sum equal to 0 after processing digit m; if that is the case, we return the money we have left.  To process each digit, we can simply try changing it to all digits between 0 and 9; it costs us abs(a<sub>i</sub>-d) dollars to convert a<sub>i</sub> into d.  We then add this to the alternating sum, and move on to the next digit.  Java code follows:

</p><p>

<pre>

 long dpTable[][][];
String N;

long dp(int cur, int mod, int money)
{
 if(money < 1) return 0;
 if(cur==N.length() )
  return mod==0?money:0;

 if(dpTable[cur][mod][money] > -1)
  return dpTable[cur][mod][money];
 dpTable[cur][mod][money] = 0;
       // Try changing digit
 for(int i=0; i < 10; i++) // cur to i
 { int tempMod;
  if(cur%2==0) // if at an even place
   tempMod = (mod+i)%11;
  else   // if at an odd place
   tempMod = (mod-i+11)%11;
  dpTable[cur][mod][money] += 
   dp(cur+1, tempMod, money-Math.abs(N.charAt(cur)-'0'-i));
 }

 return dpTable[cur][mod][money];
}

public long maxIncome(int n, int money)
{
 N = "" + n;
  dpTable = new long[12][11][money+1];
 for(int i=0; i < 12; i++) for(int j=0; j < 11; j++)
  Arrays.fill(dpTable[i][j], -1);

 return dp(0, 0, money);
}

</pre>

 </p><p>

<b>Homework</b>

 </p><p>

1.  If we change the game from Round of Eleven to some other number (for example, Round of Twenty Three), how can we adapt the above algorithm to solve this problem?
</p><p>
2.  Assume that there are <b>N</b> people in your kingdom, where <b>N</b> may be less than the number of prizes available from the show.  Find a DP algorithm to determine your subjects' winnings in O(LM), where L is the number of digits in <b>n</b>, and M is the money you start with.



</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8143&amp;rd=10789" name="8143">RadarGuns</a></b>

</font>

<A href="Javascript:openProblemRating(8143)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516069" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      119 / 603 (19.73%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      55 / 119 (46.22%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ACRush</b> for 941.35 points (7 mins 10 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      676.83 (for 55 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem is a classic example of the <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow2">min-cost maximum flow</a> algorithm.  We can represent this problem as a bipartite graph, placing the enter times on the left, and the exit times on the right.  We then connect these nodes, giving them costs of 0 if end[j]-start[i] >= speedTime, infinity if start[i] >= end[j], or the appropriate cost otherwise.  We then attach the source to all start nodes, and the sink to all exit nodes.  Runnning the minimum cost flow algorithm yields the minimum fine that we can collect; if this is an infinite amount, then we know it is impossible to correctly pair the points.  Now that we have the minimum fines, we want to determine the maximum fines that can be collected.  The easiest way to do this is simply to multiply all of the weights (except for infinity) by -1.  By running the minimum cost flow algorithm again, we then get a number that equals -1 times the maximum weight.  We can thus return the correct answer, as can be seen in <tc-webtag:handle coderId="7340263" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=266780&rd=10789&pm=8143&cr=7340263">code</a>.

 </p><p>

<b>Homework</b>

 </p><p>

Assume that there is no longer a <b>fineCap</b>.  Is there an algorithm with O(1) additional memory (e.g. no DP tables allowed) that can determine the maximum fines to collect?  What about the minimum?


</p>

<br /><br />


<%--
<div class="authorPhoto">
    <img src="/i/m/bmerry_big2.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
