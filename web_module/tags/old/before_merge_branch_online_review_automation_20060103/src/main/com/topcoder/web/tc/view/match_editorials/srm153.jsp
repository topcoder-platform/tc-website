<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505589" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 153</span><br>Tuesday, July 1, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                        <p>
                        Going into the system tests, it looked as though a yellow, <strong>gilbert</strong>, might win by a large margin.  
                        However, a couple of small bugs cost him his medium and hard submissions.  But <strong>gilbert's</strong> loss 
                        was <strong>tomek's</strong> gain, as <strong>tomek</strong> got his first SRM win tonight, and extended his flawless streak to 6 
                        SRM's.  The record for the longest TopCoder perfection streak is currently held by <strong>Yarin</strong>, who 
                        correctly submitted every problem for 7 straight SRMs between June 24 and August 12 of 
                        2002.  <strong>tomek</strong> also managed to increase his rating to 2842.  No one has come anywhere close to 
                        this rating in 6 SRM's suggesting that <strong>SnapDragon</strong> may soon be given a run for his money.  
                        <strong>bstanescu</strong> was not far behind in second place, and <strong>SnapDragon</strong> took the bronze in third.  As far a
                        s the division 1 problems went, the first two seemed a little bit harder than average, though not 
                        ridiculously so.  All of them involved doubles in some way, though intense <strong>radeyesque</strong> knowledge 
                        of doubles was not necessary, as all of the problems were numerically stable, pretty much no 
                        matter how you solved them.  In division 2, <strong>guidox</strong> edged out first timer <strong>StandLove</strong> by a little 
                        over 50 points.  The division 2 problems were fairly standard, except for the hard, which 
                        seemed a little more difficult than usual. 
                        </p>

  
<H1> The Problems </H1> 


                        <font size="+2"><b>MostProfitable</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505589" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">203 / 210  (96.67%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">172 / 203 (84.73%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>PolariStar</b> for 246.65 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        The division 2 easy problem is usually pretty much a gimme, and tonight was no exception.  To successfully solve this, 
                        you needed only to figure out that <pre>total profit = sales * (price - cost).</pre>Then, you find the item that has the maximum 
                        profit, and return the String associated with it.  The only special case is when none of the items gives you a positive profit, 
                        when you return "".  Pretty much every solution did the same thing, so if you want to see a simple implementation of this, 
                        you can look at any successful submission. 
                        </p>
                        <font size="+2"><b>Inventory</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505589" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
                        Used as: Division-II - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">178/210  (84.76%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">108 / 178 (60.67%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>derelikt</b> for 478.64 points</td></tr>
                        </table>
                        </blockquote>
                         Used as: Division-I - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">124 / 128  (96.88%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 99 / 124 (79.84%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>ZorbaTHut</b> for 245.35 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        This problem was a little bit harder, but not too bad.  Each month a company sells a certain number of goods.  Since it 
                        sometimes runs out of goods, we want to figure out how many goods it would have sold in that month, if it had not run out.  
                        Thinking about a few simple cases makes it pretty easy to see how to calculate this in general.  For example, when the item 
                        is available for 15 days, or half a month, the company would have sold twice as many goods as it did were they available.  
                        A couple more cases makes it obvious that the number of goods the company would have sold is: <pre>actualSales * 30 / daysAvailable.</pre>
                        So, take the average of this number over all months when the item was available for at least 1 day, and divide that by the number 
                        of months that the item was available for at least 1 day, to get the expected sales per month.  Its important that all of your 
                        calculations up to this point be performed on doubles, otherwise you will end up with rounding errors in your solution.  
                        The last step is to round up.  There are a couple of ways to do this, but the most common was to use the build in ceiling functions.  
                        As mentioned in the notes of the problem, it is important to subtract a very small number like 10<sup>-9</sup> from your result before 
                        rounding it, or you might end up a victim to the minor imprecision of floating point numbers.  It turns out that C++ is more 
                        accurate when dealing with floating point numbers, and that this step was probably not necessary in that language. 
                        </p>
                        <p>
                        Now, another approach to this problem, which is much more complicated, is to solve it without using any floating point numbers.  
                        If you add up the numbers as fractions, rather than floating point numbers, you could put your mind at ease about floating 
                        point numbers.  However, this was making things more complicated than they needed to be. 
                        </p>
                        <p>
                        The most common error on this problem was to ignore months where an element of sales was 0, rather than ignoring months 
                        when with a <tt>daysAvailable</tt> of 0. 
                        </p>

                        <font size="+2"><b>PickTeam</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505589" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
                        Used as: Division-II - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">26/ 210  (12.38%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">5 / 26 (19.23%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Veloso</b> for 576.99 points</td></tr>
                        </table>
                        </blockquote>
                        
                        <p>
                        Whenever you see a constraint that says "... will have between x and 20 elements, inclusive", you should always 
                        think <strong>brute force</strong>!  If you are taking subsets of 20 things, then each of the 20 things has two possible states: in 
                        the subset, or not in the subset.  Thus, there are 2<sup>20</sup> possible subsets of 20 things, and 2<sup>20</sup> is small enough 
                        (about a million) that you can try all possible subsets of 20 elements.  In this case you were only concerned with 
                        subset of a specific size, so there are even less than that.  Now, there are two ways to create the subsets of interest: 
                        iteratively and recursively.  I'm rather partial to the iterative approach, because I think it is cleaner, but I'll go 
                        into both of them.  First, the iterative approach: 
                        </p>
                        <p>
                        A good way to generate subsets is to use a bitmask.  In other words, have a single integer represent the subset, and 
                        have the bits in that integer represent whether elements are in the subset or not.  For example, if you had the set 
                        {A,B,C}, then the bitmask 011 (3 in decimal) could represent the subset {B,C}.  Similarly, the bitmask 101 
                        (5 in decimal) would represent the subset {A,C}.  Using bitmasks like this allows us to iteratively generate subsets 
                        with a single for loop.  In the loop, we count from 0 (representing the empty set) up to 2<sup>n</sup>-1 (representing the 
                        entire set), where n is the number of elements in the original set.  Every possible subset of nelements is represented 
                        by one of the number in this range.  Furthermore, the number of elements in the subset is equal to the cardinality 
                        (number of ones in binary) of the number representing the subset.  So, we can get all of the subsets of a certain size 
                        by looking only at numbers of a certain cardinality.  The code for this part of the problem looks something like this 
                        (if you are not familiar with the &lt;&lt; operator, it means shift left, and 1&lt;&lt;n = 2<sup>n</sup>): 
                        </p>

<pre>                        
for(int i = 0; i&lt;(1&lt;&lt;n); i++){
   if(cardinality(i)==teamSize){
      //i represents a set of the correct size, so figure out the score.
   }
} 
</pre>

                        <p>
                        Now, once we have all a valid subset represented as an int, we need only evaluate the score for that subset.  The 
                        simplest way to do this is with two nested loops.  Also, its useful to be familiar with bitwise operations.  In particular, 
                        the expression <tt>((1&lt;&lt;j)&#38;i)&gt;0</tt> will be true if and only if the j<sup>th</sup> bit of i is a one.  So, using this expression, and assuming 
                        that the input has already been parsed into a 2-D array called <tt>g</tt>, we can evaluate the score of a subset as follows: 
                        </p>
                        
<pre>
//i represents a set of the correct size, so figure out the score.
int score = 0;
for(int j = 0; j&lt;n; j++){
   for(int k = 0; k&lt;n; k++){
      if(((1&lt;&lt;j)&#38;i)&gt;0 &#38;&#38; ((1&lt;&lt;k)&#38;i)&gt;0){
         score += g[j][k];
      }
   }
}
</pre>
                        
                        <p>
                        Then, all that's left is to find the subset with the maximum score, and put their names into a String[].  Here is all of the code, in Java: 
                        </p>

<pre>
import java.util.*;
public class PickTeam{
     int cardinality(int n){return n==0?0:(n&#38;1)+cardinality(n&gt;&gt;1);}
     public String[] pickPeople(int teamSize, String[] people){
         String ret[] = new String[teamSize];
         int max = -1000000;
         int n = people.length;
         int[][] g = new int[n][n];
         for(int i = 0; i&lt;n; i++){
               for(int j = 0; j&lt;n; j++){
                  g[i][j] = Integer.parseInt(people[i].split(" ")[j+1]);
               }
               people[i] = people[i].split(" ")[0];
         }
         for(int i = 0; i&lt;(1&lt;&lt;n); i++){
            if(cardinality(i)==teamSize){
               int score = 0;
               for(int j = 0; j&lt;n; j++){
                  for(int k = 0; k&lt;n; k++){
                     if(((1&lt;&lt;j)&#38;i)&gt;0 &#38;&#38; ((1&lt;&lt;k)&#38;i)&gt;0){
                        score += g[j][k];
                     }
                  }
               }
               if(score&gt;max){
                  max = score;
                  for(int j = 0, ptr = 0; j&lt;n; j++){
                     if((i&#38;(1&lt;&lt;j))&gt;0){
                        ret[ptr++] = people[j];
                     }
                  }
               }
            }
         }
         Arrays.sort(ret);
         return ret;
     }
} 
</pre>

 
                        
                        <p>
                        Without going into as much detail, the idea behind the recursive implementation is similar.  The primary 
                        difference is that the subsets are generated recursively, instead of iteratively.  The recursive function 
                        should have a parameter specifying the current subset, and also the next element to be considered for addition.  
                        The recursive function should then make two calls to itself, one of which adds the element to the subset, and 
                        one of which does not.  So sticking with our bitmask representation of subsets, our recursive function would 
                        look something like: 
                        </p>
<pre>
void recurse(int subset, int ptr){
   if(ptr==n){
        //there are no more elements to cosider adding, so evaluated the subset as above
   }else{
      recurse(subset,ptr+1);
      recurse(subset|(1&lt;&lt;ptr),ptr+1);
   }
}
</pre>

                        <p>
                        The rest of the code is pretty similar.  The recursive version can be made to run a little faster than the iterative 
                        version, since it is easy to cut out all of the subsets that are the wrong size.  However, the limit of 20 elements 
                        makes this unnecessary. 
                        </p>
                        
                        <font size="+2"><b>Collision</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505589" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
                        Used as: Division-I - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">450</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">61 / 128 (47.66%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">42 / 61 (68.85%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>antimatter</b> for 419.36 points</td></tr>
                        </table>
                        </blockquote>
                        
<p>
This one turned out to be a bit undervalued.  In this problem you have to compare two potential 
implementations of a number of components that assign unique IDs.  In one implementation, the 
components remember which IDs they have assigned, and don't assign them again.  In the other 
implementation, the components have no memory and may assign the same ID multiple times.  
In both implementations, the components are independent and two different components may 
assign the same ID more than once.  The problem asks you to evaluate the probability that a 
collision will occur in each implementation and return the difference between the two.  It turns 
out that it is easier to evaluate the probability that there will not be a collision, and since the 
difference is the same either way, we will do this.  The trick to figuring out how to evaluate the 
probabilities is to realize that you can specify that the IDs be assigned in any order that is 
convenient.  So, first let's look at the implementation with no memory. 
</p>

<p>
First, let sum be the sum of the number of IDs assigned by all components, and ids be the total 
number of IDs.  Without any loss of generality, we can assume that the IDs are all assigned one 
at a time in some order, and since the components have no memory, each assignment is identical 
to each other assignment.  Clearly, the probability that the first ID will not collide with another 
ID is 1.  The next ID to be assigned, however, has a probability of <tt>(ids-1)/ids</tt> of not colliding 
with the first ID, since there are <tt>(ids-1)</tt> IDs that don't cause a collision, and ids IDs total, each 
of which has an equal probability of being assigned to the second client.  Thus, in general, the 
probability that the <tt>i</tt><sup>th</sup> (starting at zero) ID to be assigned will not collide is <tt>(ids-i)/ids</tt> .  Now, 
since each ID must be unique for there to be no collision, we can simply multiply all of these 
probabilities together to get the overall probability that there is no collision.  Thus, for the 
final probability is <tt>(ids-0)/ids * (ids-1)/ids * (ids-2)/ids * ... * (ids-sum+1)/ids</tt>.
</p>
<p>
The probability that there is no collision in the components with memory is slightly more complicated.  
In this case, we can safely assume that the IDs are assigned one component at a time (since the probability 
is the same, no matter what the order).  Let <tt>comp[i]</tt> represent the number of IDs assigned by the <tt>i</tt><sup>th</sup> 
component.  So, for the first component, the probability is either 0 (if more IDs are assigned than 
there are total) or 1.  For the second component, there are <tt>ids-comp[0]</tt> IDs that have not yet been 
assigned, so the first ID assigned has a probability of <tt>(ids-comp[0])/ids</tt> of not causing a collision.  
The next ID assigned by the second component has a probability of <tt>(ids-comp[0]-1)/(ids-1)</tt> of not 
causing a collision, since there are <tt>(ids-comp[0]-1)</tt> available IDs and <tt>(ids-1)</tt> that the component 
might assign.  In general, the probability that the <tt>i</tt><sup>th</sup> ID (starting at zero) assigned by the second component 
will not cause a collision is <tt>(ids-comp[0]-i)/(ids-i)</tt> .  The third component is similar, except we replace 
<tt>comp[0]</tt> with <tt>(comp[0]+comp[1])</tt> in our equations, and so on for the rest of the components.  Again, 
we can take the product of all the probabilities to get the final probability. 
</p>
<p>
Now, the hard part of this problem is the theory, and once you have that, its pretty easy to code.  The one 
tricky case is when you have something like <tt>assignments = {1005,0}</tt> and <tt>ids = 1000</tt>, which can cause 
division by 0.  There was an example like this though, so it didn't really trip people up.  Translating it 
into code should go pretty quick: 
</p>

<pre>
public double probability(int[] assignments, int ids){
   double p1 = 1;
   double p2 = 1;
   double d = ids;
   for(int i = 0; i&lt;assignments.length; i++){
      if(assignments[i]&gt;ids)return 0;
      int n = ids;
      for(int j = 0; j&lt;assignments[i]; j++){
         p1 *= d/ids;
         p2 *= d--/n--;
      }
   }
   return p2-p1;
}
</pre>

                        <font size="+2"><b>GasStations</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505589" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">18 / 128  (14.06%) </td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">11 / 18 (61.11%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>tomek</b> for 637.01 points</td></tr>
                        </table>
                        </blockquote>
                        
<p>
If only such complete information were really available!  In this problem, you are trying to minimize the cost of a road trip.  
You are told the locations and prices for a number of gas stations along the way, and are to determine the minimum cost of the trip.  
In other words, you have to figure out exactly how much gas to buy at each gas station to minimize the trip cost.  Of course, certain 
factors like the frequency of stops were not taken into account in the problem, but I'm sure it would still be useful.  (Try to solve 
the same problem with another parameter specifying the maximum number of stops if you want a more difficult version of the problem.) 
</p>
<p>
There are three different approaches to solving this problem, depending on how you look at it and how you sort the gas stations.  I'll present 
them here in decreasing order of difficulty to code: 
</p>
<p>
One way to look at it is to buy as much of the cheapest gas possible first, and then the next cheapest, and so on.  If you take this approach, you 
want to sort the gas stations by price first, and then go through each gas station, starting with the cheapest.  Then, you keep track of intervals 
for which you have already purchased gas.  For example, the first thing that you do is purchase gas for the interval from the cheapest gas 
station to either the end of the trip or the point <tt>mpg*tankSize</tt> miles from the cheapest gas station.  Then, for each gas station, you add the 
maximum interval possible that hasn't already been added.  So, at each gas station, you buy enough gas to cover all of the interval from that gas 
station to either the end of the trip or the point <tt>mpg*tankSize</tt> miles away that is previously uncovered.  This requires that you keep track of a 
bunch of intervals, either implicitly (keep track of the amount of gas at each station) or explicitly. 
</p>
<p>
That was the hard way to solve the problem.  An easier way is to think about the gas stations in the order that you encounter them while driving.  
In other words, sort the gas stations by distance from the start.  When you get to the first gas station, you have some amount of gas left, and 
you have the option of getting some more.  Thinking about this intuitively, you don't want to get any gas at a particular gas station if there is a 
cheaper one right down the road.  Applying this intuition to the problem, when we get to a gas station we want to find the next gas station down 
the road that is cheaper than the one we are at.  Since all of the ones in between our current location and that gas station are more expensive, we 
want to be sure to get enough gas to make it to the next cheaper location, if possible.  If it is possible, then we should get exactly enough gas to get 
to that cheaper location.  Otherwise, all of the gas stations that we can reach from this gas station are more expensive, so we should fill up our 
tank at this one.  So, in pseudocode, we have:
</p>

<pre>
   sort gas stations by distance; 
//set currentGas to the amount of gas we have when 
//we reach the first gas station currentGas = tankSize;
   cost = 0;
   foreach (gas station gs){
      currentGas = currentGas - (distance from previous gas station)/mpg;
      look down the road and find the closest gas station, gs', that is cheaper than gs;
      if(gs' does not exist and tripLength &lt;= dist[gs] + tankSize * mpg){ 
//there are no cheaper gasStations along the way, 
//and we can get to the end of the trip 
         add = max(0,(tripLength-dist[gs])/mpg - gas);
         currentGas = currentGas + add;
         cost = cost + price[gs]*add;
      }else if(gs' does not exist or dist[gs'] - dist[gs] &gt; tankSize * mpg){ 
//There are no cheaper gas stations that 
//we can reach, so fill up the tank 
         fill up tank;
      }else if(currentGas*mpg &gt; dist[gs'] - dist[gs]){ 
//we already have enough gas to get to gs', so do nothing here 
      }else{ 
//we need to get some gas to get to gs' 
            add = (dist[gs']-dist[gs])/mpg - gas;
            currentGas = currentGas + add;
            cost = cost + price[gs]*add;
       }
} 
</pre>
<p>
Here is some real code in C++ (pardon my ugly XOR swapping): 
</p>
<pre>
double tripCost(vector &lt;int&gt; dist, vector &lt;int&gt; price, int mpg, int tankSize, int tripLength){
   for(int i = 0; i&lt;dist.size(); i++)
      for(int j = 0; j&lt;i; j++)
         if(dist[i]&lt;dist[j]){
            dist[i]^=dist[j]^=dist[i]^=dist[j];
            price[i]^=price[j]^=price[i]^=price[j];
         }
   double currentGas = tankSize;
   double ret = 0;
   for(int i = 0; i&lt;dist.size(); i++){
      int next = tripLength&lt;?dist[i]+mpg*tankSize;
      for(int j = i+1; j&lt;dist.size(); j++)
         if(dist[j] &lt; next &#38;#38; price[j] &lt; price[i])next = dist[j];
      currentGas -= ((double)dist[i] - (i?dist[i-1]:0))/mpg;
      double add = 0&gt;?((double)next-dist[i])/mpg - currentGas;
      currentGas += add;
      ret += add*price[i];
   }
   return ret;
} 
</pre>
<p>
Lastly, the easiest way to solve the problem is to initialize a large array, each of whose elements represents the price of gas for a single mile.  
So, if an element were 14, for example, that would mean that the gas for the mile represented by this element cost 14.  Then, at the end we can 
just add up the costs for all of the miles, and return that sum.  So, the trick is to get all of the elements set properly.  This is easier than it may 
sound, and after you see how to do it you will probably kick yourself (I know I did, figuratively).  Basically, any mile that is within the range 
<tt>(tankSize * mpg)</tt> of a gas station can receive the price from that gas station.  This is the same idea introduced when discussing the 
solution with intervals.  The difference here is that we don't keep track of any intervals.  Instead, we just set the price of gas at each mile to 
the lowest price (divided by <tt>mpg</tt>) of any gas station that can reach it.  So, the code goes like this (thanks to gilbert, whose code this is based 
on, and who would have passed with a larger array):
</p>

<pre>
double best[11000];
   double tripCost(vector &lt;int&gt; dist, vector &lt;int&gt; prices, int mpg, int tankSize, int tripLength) {
      for(int i = 0; i &lt; tripLength; i++) best[i] = 1000000;
      for(int i = 0; i &lt; mpg * tankSize; i++) best[i] = 0.0;
      for(int i = 0; i &lt; dist.size(); i++)
         for(int j = 0; j &lt; mpg*tankSize; j++)
            if(dist[i] + j &lt; tripLength)
               best[dist[i]+j] &lt;?= prices[i]/(1.0*c);
      double sum = 0;
      for(int i = 0; i &lt; e; i++) sum += best[i];
      return sum;
} 
</pre>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
