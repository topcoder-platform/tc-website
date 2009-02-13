<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="summary"/>
                    <jsp:param name="tabLev3" value="room1"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Jan_Kuipers wins Room 1!</span></h1>
                        <img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=514954">Discuss this match</A><br>
Wednesday, June 27, 2007<br>
Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/>

<img style="float:right; width:200px; 350px; padding-left:10px;" src="/i/tournament/tco07/shotR1.jpg">
<br><br>

<p>TopCoder Open 2007 started with the Algorithm Semifinal 1.
Number 1 seed <tc-webtag:handle coderId="19849563" context="algorithm"/> and TCO 2005 Algorithm Champion <tc-webtag:handle coderId="8355516" context="algorithm"/> 
were fighting for their spots with 14 other members, with each of them 
wanting to upset the favorites.
<tc-webtag:handle coderId="19849563" context="algorithm"/> showed he deserved his status with a lightning submission of the 250-pointer,
distantly followed by <tc-webtag:handle coderId="7446789" context="algorithm"/>, <tc-webtag:handle coderId="8355516" context="algorithm"/> and <tc-webtag:handle coderId="13351270" context="algorithm"/>.
</p>
<p>
The medium appeared to be much more difficult than it seemed, with the first 
submission coming only 50 minutes after the coding started. 
Soon after that, <tc-webtag:handle coderId="7421158" context="algorithm"/> submitted the 1000 problem quickly followed by <tc-webtag:handle coderId="10157606" context="algorithm"/> 

submitting the 500. Right before the end of the coding phase, coders rushed to submit whatever they had.
<tc-webtag:handle coderId="309453" context="algorithm"/> managed to stun the crowd by submitting the medium for 400+ points, which was more than 100 points better than the 
previous highest score on that problem, while <tc-webtag:handle coderId="19849563" context="algorithm"/> took the lead with a strong 700 of 1000.
</p>
<p>
The challenge phase didn't change the standings significantly, while system testing caused many solutions to fail.
As the result, all 3 submissions for the hard failed and <tc-webtag:handle coderId="309453" context="algorithm"/> advanced to the finals thanks to his amazing score on the medium.
<tc-webtag:handle coderId="8355516" context="algorithm"/> also advances to the finals thanks to his challenge, while <tc-webtag:handle coderId="10157606" context="algorithm"/>, <tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="7446789" context="algorithm"/> all go to the WildCard. 

<tc-webtag:handle coderId="7390467" context="algorithm"/>, with a successful challenge, takes the last Wild Card spot, with a tiny half-point lead over <tc-webtag:handle coderId="13351270" context="algorithm"/>.

</p>
<p>
Congratulations to the advancers and good luck to the coders competing in the next rounds!
</p>

<br>
<p><span style="font-size:14px; font-weight:bold;">CostMatrix</span></p>
by <tc-webtag:handle coderId="269554" context="algorithm"/>
<br /><br />
An insight that almost immediately solves this problem is realizing that if the cost to go between cities A and B is <i>x</i>,
and there exists some city C such that the cost to go from A to B and then to C equals <i>x</i>, then there need not be
any direct flight between A and B (because that flight could never be cheaper than removing the other two flights).
If we find that the cost by going through C is cheaper than <i>x</i>, then we have an inconsistency, and should return -1.
So after the input parsing, the solution is to simply do a triple nested loop, trying all values of A, B and C, and
deducing what direct flights are not needed.
<br />
<br />

<p><span style="font-size:14px; font-weight:bold;">DifferentPokerHands</span></p>
by <tc-webtag:handle coderId="269554" context="algorithm"/>
<br /><br />
This might not be one of the more algorithmically challenging problems the onsite competitors will face.
Instead, some careful coding and case analysis is required. Precision is of essence; if you failed the last
example after all the coding, bug tracking might take quite a while.
<br />
<br />
It should be obvious that the core function in this problem will be a method that evaluates a 5 card poker hand.
One could immediately try and deduce the rank of a 7 card hand, but this is much more error prone.
So how do you best evaluate such a hand, so that it can be compared with other hands, taking all the tie breaking
rules into consideration? The best way is, probably, to calculate an integer score for a 5 card poker hand.
Assuming we have such a function, evaluating a 7 card hand would then be the best score among all 7 choose 5 possible
hand selections, and the number of different evaluated poker hands could be found be looping through all 47 choose 2
remaining cards, evaluating the 7 card poker hand and storing the best score in a set. The result would then simply be the size of this set.
<br />
<br />
The integer score for a hand can be represented as a six digit base-13 number, where the most significant
digit represents the rank (0 for high card, 1 for pair, and so on). The second most significant digit
would be the value of the first tiebreaker card (the overall highest card in many cases, but for full house
for instance, it would be a card among the three-of-a-kind etc), the third digit would be the second tiebreaker card, and so on.
<br /><br />
The evaluation begins by counting the number of aces, kings, queens and so forth in the hand, and store the result in a <i>valueCount</i> array.
We can then count the elements in <i>valueCount</i> to find the number of pairs, three-of-a-kinds and four-of-a-kinds we have.
From there on, it's mostly a number of if-statements that check the various conditions.
<br />
<br />
If one likes obfuscated C++ code, the following function is an example of an implementation of a 5 card poker hand evaluator:

<pre>
int pokerEval(int c[]) // c[i] = 13 * suit + value
{
  int i,j,s=0,f=1,vc[13],sc[5],sv[5],sw[5];
  for(i=0;i&lt;13;i++) vc[i]=0;
  for(i=0;i&lt;5;i++) { sc[i]=sv[i]=0; f&amp;=c[i]/13==c[0]/13; vc[c[i]%13]++; }
  for(i=12;i&gt;=0;i--) { sc[j=vc[i]]++; sw[j]=sv[j]; sv[j]=i; if (j==1) s=s*13+i; }
  if (sc[4]) return 7000000+sv[4]*30940+sv[1];
  if (sc[2]&amp;&amp;sc[3]) return 6000000+sv[3]*30927+sv[2]*14;
  if (sc[3]) return 3000000+sv[3]*30927+s;
  if (sc[2]) return sc[2]*1000000+(sv[2]&gt;?sw[2])*30758+(sv[2]&lt;?sw[2])*182+s;
  if (s==349674) return 90258+1000000*(f?8:4);
  if (s==368714&amp;&amp;f) return 9000000+s;
  int st=(s-121186)%30941==0;
  return s+(st&amp;&amp;f?8:st?4:f?5:0)*1000000;
}
</pre>


<p><span style="font-size:14px; font-weight:bold;">WorstCaseQuicksort</span></p>
by <tc-webtag:handle coderId="269554" context="algorithm"/>
<br /><br />
Optimization problems are of course very common in TopCoder. Usually we only have to return
the minimized (or maximized) value, but sometimes the &quot;way&quot; to that value must be returned.
Since TopCoder problems must have one single solution for a test case, some tie breaking
scheme is needed (often the lexicographically first &quot;way&quot; is to be selected). Usually these tie breakers
cause no (or very little) extra head ache; one often only has to make sure the loops are in the right order.
This problem, however, is the total opposite. To find a sequence of integers that maximizes
the nesting depth is very easy, and only a few lines of code are needed. To find the lexicographically
first such sequence, however, is a much harder task.
<br />
<br />
Let Z[<i>n</i>] be the maximum nesting depth for a sequence of <i>n</i> distinct integers. Obviously Z[1] = 1, and
it should also be obvious that Z is a non-decreasing sequence.
Let <i>f<sub>1</sub></i>, <i>f<sub>2</sub></i>, <i>f<sub>3</sub></i> be the indexes in the sequence for a fixed value of <i>n</i>. We can assume that <i>f<sub>1</sub></i> &lt;= <i>f<sub>2</sub></i> &lt;= <i>f<sub>3</sub></i>.
If <i>f<sub>1</sub></i> = <i>f<sub>2</sub></i> or <i>f<sub>2</sub></i> = <i>f<sub>3</sub></i>, the same index is included at least twice, so we know what the position of the pivot element
will be no matter how we arrange the integers. If we put the smallest integer in the sequence at this known position,
we will get a worst case, since the &quot;less&quot; list will be empty, and the &quot;right&quot; list will have length <i>n</i> - 1.
Because Z is non-decreasing, this is the best we can get, so in that case Z[<i>n</i>] = Z[<i>n</i> - 1].
If <i>f<sub>1</sub></i> &lt; <i>f<sub>2</sub></i> &lt; <i>f<sub>3</sub></i>, we can't get the smallest (or largest) integer selected as pivot element. We have to
settle for the second smallest, so in this case Z[<i>n</i>] = Z[<i>n</i> - 2].
<br /><br />
It might be intuitive from this to conclude that the pivot element select at each step should
either be the smallest, second smallest, second largest or largest. However, this turns out not to be the case,
which the first example showed (five elements, where the pivot element should be the middle element).
<br /><br />
So, in order to determine the lexicographically first sequence of <i>n</i> numbers, in true DP style
we assume we know the lexicographically first sequence for all sequence lengths less than <i>n</i>.
We now try all integers between 1 and <i>n</i> (between 2 and <i>n</i>-1 if <i>f<sub>1</sub></i> &lt; <i>f<sub>2</sub></i> &lt; <i>f<sub>3</sub></i>) as the pivot, and call this value <i>p</i>.
The length of the two lists less and greater will then be <i>p</i> - 1 and <i>n</i> - <i>p</i>. We must first check that
such a split indeed yields an optimal solution, by confirming that Z[<i>n</i>] = 1 + max(Z[<i>p</i> - 1], Z[<i>n</i> - <i>p</i>]).
Assuming this is the case, then for both the less and greater list we can use the already computed
optimal sequence of those lengths. In the case of the greater list, we need to modify its elements
by adding <i>p</i>.
<br /><br />
We know have two lists, <i>lt</i> and <i>gt</i>, and a pivot element <i>p,</i> which should merge into a single sequence <i>seq</i>,
so that <i>seq</i>[<i>f<sub>1</sub></i>] &lt;= <i>seq</i>[<i>f<sub>2</sub></i>] &lt;= <i>seq</i>[<i>f<sub>3</sub></i>]
and <i>seq</i>[<i>f<sub>2</sub></i>] = <i>p</i>. One must be a bit careful in implementing this
merge in order to get the lexicographically first sequence. It can be done in one loop with several
if-statements, but from a practical point of view it might be easier to split it up into several cases,
depending on whether<i> f<sub>1</sub></i>, <i>f<sub>2</sub></i> and <i>f<sub>3</sub></i> are different or not. It can look like this:

<pre>
// Input: lt, gt, f1, f2, f3
boolean allDifferent = f1 != f2 &amp;&amp; f2 != f3;
int seq[] = new int[n];
int seqPos = 0, ltPos = 0, rtPos = 0;
while (seqPos &lt; n)
{
    if (seqPos == f1 &amp;&amp; allDifferent)
        seq[seqPos++] = lt[ltPos++];
    else if (seqPos == f2)
        seq[seqPos++] = p;
    else if (seqPos == f3 &amp;&amp; allDifferent)
        seq[seqPos++] = rt[rtPos++];
    else if (ltPos + (seqPos &lt; p1 &amp;&amp; allDifferent ? 1 : 0) &lt; lt.length)
        seq[seqPos++] = lt[ltPos++];
    else
        seq[seqPos++] = rt[rtPos++];
}

</pre>

This sequence can then be compared to the sequences generate by other selected values of <i>p</i> for a particular <i>n</i>,
so that the lexicographically first sequence is chosen.
<br /><br />
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
