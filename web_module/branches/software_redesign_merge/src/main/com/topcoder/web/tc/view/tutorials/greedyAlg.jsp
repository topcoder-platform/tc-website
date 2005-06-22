<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../../script.jsp" />
<style type="text/css">
.codeBox
{
	width: 600;
	padding: 10px;
	margin: 20px;
	color: #333;
	font-size: 11px;
	font-weight: normal;
	line-height: 14px;
	background-color: #EEEEEE;
	border: 1px solid #999;
    }
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
	color: #333;
	font-size: 11px;
	font-weight: normal;
	line-height: 14px;
}
.GAtableText{	background-color: #EEEEEE; }
.GAtableText2{	background-color: #FF6600; }
.GAtableText3{	background-color: #FFCC00; }
.GAtableText4{	background-color: #FFFF00; }
.GAtableText5{	background-color: #FFFF99; }

</style>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">
            
            <h2>Greedy is Good</h2>

			<p>
			<img src="/i/m/supernova_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
			By&#160;<tc-webtag:handle coderId="7371063" context="algorithm"/><br />
			<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
			</p>

<p>
John Smith is in trouble! He is a TopCoder member and once he learned to master the "Force" of dynamic programming, he began solving problem after problem. But his once obedient computer acts quite unfriendly today. Following his usual morning ritual, John woke up at 10 AM, had a cup of coffee and went to solve a problem before breakfast. Something didn't seem right from the beginning, but based on his vast newly acquired experience, he wrote the algorithm in a flash. Tired of allocating matrices morning after morning, the computer complained: <strong>"Segmentation fault!"</strong>. Despite his empty stomach, John has a brilliant idea and gets rid of his beloved matrix by adding an extra "for cycle". But the computer cries again: <strong>"Time limit exceeded!"</strong>
<br><br>
Instead of going nuts, John makes a radical decision. Enough programming, he says! He decides to take a vacation as a reward for his hard work. 
<br><br>
Being a very energetic guy, John wants to have the time of his life! With so many things to do, it is unfortunately impossible for him to enjoy them all. So, as soon as he eats his breakfast, he devises a "Fun Plan" in which he describes a schedule of his upcoming activities: 
<br><br>

<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td>ID</td>
      <td>Scheduled Activity</td>
      <td>Time Span</td>
   </tr>
   <tr class="GAtableText">
      <td>1</td>
      <td>Debug the room </td>
      <td>Monday, 10:00 PM - Tuesday, 1:00 AM</td>
   </tr>
   <tr class="GAtableText">
      <td>2</td>
      <td>Enjoy a trip to Hawaii</td>
      <td>Tuesday, 6:00 AM - Saturday, 10:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>3</td>
      <td>Win the Chess Championship</td>
      <td>Tuesday, 11:00 AM - Tuesday, 9:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>4</td>
      <td>Attend the Rock Concert</td>
      <td>Tuesday, 7:00 PM - Tuesday, 11:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>5</td>
      <td>Win the Starcraft Tournament</td>
      <td>Wednesday, 3:00 PM - Thursday, 3:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>6</td>
      <td>Have some paintball fun</td>
      <td>Thursday, 10:00 AM - Thursday, 4:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>7</td>
      <td>Participate in the TopCoder Single Round Match</td>
      <td>Saturday, 12:00 PM - Saturday, 2:00 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>8</td>
      <td>Take a shower</td>
      <td>Saturday, 8:30 PM - Saturday 8:45 PM</td>
   </tr>
   <tr class="GAtableText">
      <td>9</td>
      <td>Organize a Slumber Party</td>
      <td>Saturday, 9:00 PM - Sunday, 6:00 AM</td>
   </tr>
   <tr class="GAtableText">
      <td>10</td>
      <td>Participate in an "All you can eat" and "All you can drink" contest</td>
      <td>Saturday, 9:01 PM - Saturday, 11:59 PM</td>
   </tr>
</table>

<br><br>
He now wishes to take advantage of as many as he can.  Such careful planning requires some cleverness, but his mind has gone on vacation too. This is John Smith's problem and he needs our help.
<br><br>
Could we help him have a nice holiday?	Maybe we can! But let's make an assumption first. As John is a meticulous programmer, once he agrees on something, he sticks to the plan. So, individual activities may either be chosen or not.  For each of the two choices regarding the first activity, we can make another two choices regarding the second. After a short analysis, we find out that we have 2 ^ N possible choices, in our case 1024.  Then, we can check each one individually to see whether it abides the time restrictions or not. From these, finding the choice with the most activities selected should be trivial. There are quite a lot of alternatives, so John would need to enlist the help of his tired computer. But what happens if we have 50 activities? Even with the most powerful computer in the world, handling this situation would literally take years. So, this approach is clearly not feasible.		
<br><br>
Let's simply the problem and trust our basic instinct for a moment. A good approach may be to take the chance as the first opportunity arises. That is, if we have two activities we can follow and they clash, we choose the one that starts earlier in order to save some time. In this case John will start his first evening by debugging his room. Early the next morning, he has a plane to catch. It is less than a day, and he has already started the second activity. This is great! Actually, <strong>the best choice</strong> for now. But what happens next? Spending 5 days in Hawaii is time consuming and by Saturday evening, he will still have only two activities performed.  Think of all the activities he could have done during this five day span! Although very fast and simple, this approach is unfortunately not accurate. 
<br><br>
We still don't want to check for every possible solution, so let's try another trick. Committing to such a time intensive activity like the exotic trip to Hawaii can simply be avoided by selecting first the activity which takes the least amount of time and then continuing this process for the remaining activities that are compatible with those already selected. According to the previous schedule, first of all we choose the shower. With only 15 minutes consumed, this is by far the <strong>best local choice</strong>. What we would like to know is whether we can still keep this <strong>"local best"</strong> as the other compatible activities are being selected. John's schedule will look like this: 
<ul>
   <li>Take a shower (15 minutes)</li>
   <li>Participate in the TopCoder Single Round Match (2 hours)</li>
   <li>Participate in an "All you can eat" and "All you can drink" contest (2 hours 58 minutes)</li>
   <li>Debug the room (3 hours)</li>
   <li>Attend the Rock Concert (4 hours)</li>
   <li>Have some paintball fun (6 hours)</li>
</ul>
Out of the 10 possible activities, we were able to select 6 (which is not so bad).  We now run the slow but trustworthy algorithm to see if this is actually the best choice we can make.  And the answer is indeed 6. John is very appreciative for our help, but once he returns from the holiday, confident in our ingenious approach, he may face a serious problem:    			
<br>
<div align=center><img src="/i/education/greedyAlg1.gif" alt="" border="0" /></div>
<br>
By going for the short date, he misses both the school exam and the match of his favorite team. Being the TopCoders that we are, we must get used to writing reliable programs. A single case which we cannot handle dooms this approach to failure.
<br><br>
What we generally have to do in situations like this is to analyze what might have caused the error in the first place and act accordingly to avoid it in the future. Let's look again at the previous scenario. The dating activity clashes with both the exam and the match, while the other two only clash with the date.  So, the idea almost comes from itself.  Why not always select the activity that produces the minimum amount of clashes with the remaining activities? Seems logical - it all makes sense now! We'll try to prove that this approach is indeed correct.  Suppose we have already selected an activity X and try to check if we could have selected two activities A and B that clash with X instead. A and B should of course not clash, otherwise the final result will not improve. But now, we are back to the previous case (X has two clashes, while A and B have only one). If this is the case, A and B are selected from the beginning. The only way to disprove our assumption is to make A and B clash more, without affecting other activities except X. This is not very intuitive, but if we think it through we can (unfortunately) build such a case:
<br>
<div align=center><img src="/i/education/greedyAlg2.gif" alt="" border="0" /></div>
<br>
The activities represented by the blue lines are the optimal choice given the above schedule. But as the activity in red produces only 2 clashes, it will be chosen first. There are 4 compatible activities left before, but they all clash with each other, so we can only select one. The same happens for the activities scheduled after, leaving space for only one more choice. This only gives us 3 activities, while the optimum choice selects 4. 
<br><br>
So far, every solution we came up with had a hidden flaw. It seems we have to deal with a devilish problem. Actually, this problem has quite an elegant and straightforward solution. If we study the figure above more carefully, we see that the blue activity on the bottom-left is the only one which finishes before the "timeline" indicated by the thin vertical bar. So, if we are to choose a single activity, choosing the one that ends first (at a time <strong>t1</strong>), will leave all the remaining time interval free for choosing other activities. If we choose any other activity instead, the remaining time interval will be shorter. This is obvious, because we will end up anyway with only one activity chosen, but at a time <strong>t2 > t1</strong>. In the first case we had available all the time span between <strong>t1</strong> and <strong>finish</strong> and that <strong>included</strong> the time between t2 and finish. Consequently, there is no disadvantage in choosing the activity that finishes earlier.  The advantage may result in the situation when we are able to insert another activity that starts between <strong>t1</strong> and <strong>t2</strong> and ends up before the end of any activity that starts after time <strong>t2</strong>. 
<br><br>
Known as the <strong>"Activity Selection"</strong>, this is a standard problem that can be solved by the <strong>Greedy Method</strong>. As a greedy man takes as much as he can as often as he can, in our case we are choosing at every step the activity that finishes first and do so every time there is no activity in progress. The truth is we all make greedy decisions at some point in our life. When we go shopping or when we drive a car, we make choices that seem best for the moment. Actually, there are two basic ingredients every greedy algorithm has in common:
<ul>
   <li><strong>Greedy Choice Property</strong>:  from a local optimum we can reach a global optimum, without having to reconsider the decisions already taken.</li>
   <li><strong>Optimal Substructure Property</strong>: the optimal solution to a problem can be determined from the optimal solutions to its subproblems.</li>
</ul>
The following pseudo code describes the optimal activity selection given by the "greedy" algorithm proven earlier:

<pre class="codeBox">
Let N denote the number of activities and 
{I}  the activity I  ( 1 <= I <= N )
For each {I}, consider S[I] and F[I] its starting and finishing time
Sort the activities in the increasing order of their finishing time
- that is, for every I < J we must have F [I] <= F [J]

<font color="blue">//  A denotes the set of the activities that will be selected</font>
A = {1}
<font color="blue">//  J denotes the last activity selected</font>
J = 1                                  
For I = 2  to N                 
<font color="blue">// we can select activity 'I' only if the last activity
// selected has already been finished</font>
      If S [I] >= F [J]
<font color="blue">//  select activity 'I'</font>
                A = A + {I}
<font color="blue">// Activity 'I' now becomes the last activity selected</font>
                J = I                   
      Endif
Endfor
Return A
</pre>
	
After applying the above algorithm, Johnny's "Fun Plan" would look like this: 
<ul>
   <li>Eliminate all the bugs and take some time to rest</li>
   <li>Tuesday is for chess, prepare to beat them all</li>
   <li>A whole day of Starcraft follows, this should be fun</li>
   <li>The next two days are for recovery</li>
   <li>As for the final day, get a few rating points on TopCoder, take a shower and enjoy the versatile food and the good quality wine</li>
</ul>
The problem of John Smith is solved, but this is just one example of what Greedy can do. A few examples of real TopCoder problems will help you understand the concept better. But before moving on, you may wish to practice a little bit more what you have read so far on a problem similar with the Activity Selection, named <A href="http://www.topcoder.com/stat?c=problem_statement&pm=2977&rd=5880">Boxing</A>. 
<br><br>

<span class=bodySubtitle>BioScore</span><br>
In this problem you are asked to maximize the average homology score for all the pairs in the set. As an optimal solution is required, this may be a valuable clue in determining the appropriate method we can use. Usually, this kind of problems can be solved by dynamic programming, but in many cases a Greedy strategy could also be employed. 
<br><br>
The first thing we have to do here is to <strong>build the frequency matrix</strong>.  This is an easy task as you just have to compare every pair of two sequences and count the occurrences of all the combinations of nucleic acids (AA, AC, AG, AT, CA, CC, CG, CT, GA, GC, GG, GT, TA, TC, TG, TT).  Each of these combinations will be an element in the matrix and its value will represent the total number of occurrences. For example, let's take the set { "ACTAGAGAC", "AAAAAAAAA", "TAGTCATAC", "GCAGCATTC" }  used in Example 2. 
<br>
<div align=center><img src="/i/education/greedyAlg3.gif" alt="" border="0" /></div>
<br>
In the bottom-right part of the figure above, you can see the resulting frequency matrix. Let us denote it by <strong>F</strong> What we have to do from now is to find another matrix <strong>S</strong> such that the sum of the 16 corresponding products of the type <strong>F[I,J] * S[I,J]</strong> (1 <= I,J <= 4) is maximized.
<br><br>
Now, let's look at the matrix restrictions and analyze them one by one:
<br><br>
<strong>1) The sum of the 16 entries must be 0.</strong>
<br><br>
This is more like a commonsense condition. With all the elements in <strong>F</strong> positive, the final score tends to increase as we increase the elements in S. But because the sum must be kept at 0, in order to increase an element, we'll have to decrease others. The challenge of this problem resides in finding the optimal distribution. 
<br><br>
<strong>2) All entries must be integers between -10 and 10 inclusive</strong>
<br><br>
Another commonsense condition! Our search space has been drastically reduced, but we are still left with a lot of alternatives. 
<br><br>
<strong>3) It must be symmetric ( score(x,y) = score(y,x) )</strong>
<br><br>
Because of the symmetry, we must attribute the same homology score to combinations like "AC" and "CA". As a result, we can also count their occurrences together. For the previous example, we have the set of combinations with the following frequencies:
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="0" align="center">
   <tr class="bodyText">
      <td>AA:  14</td>
      <td>CC: 3</td>
      <td>GG: 0</td>
      <td>TT: 1</td>
   </tr>
   <tr class="bodyText">
      <td>AC + CA: 11</td>
      <td>AG + GA: 10</td>
      <td>AT + TA: 10</td>
      <td>&#160;</td>
   </tr>
   <tr class="bodyText">
      <td>CG + GC: 2</td>
      <td>CT + TC:  0</td>
      <td>&#160;</td>
      <td>&#160;</td>
   </tr>
   <tr class="bodyText">
      <td>GT + TG: 3</td>
      <td>&#160;</td>
      <td>&#160;</td>
      <td>&#160;</td>
   </tr>
</table>
<br><br>
An intuitive approach would be to assign a higher homology score to the combinations that appear more often. But as we must keep the score sum to 0, another problem arises. Combinations like AA, CC, GG and TT appear only once in the matrix. So, their homology score contribute less to the total sum.
<br><br>
<strong>4) Diagonal entries must be positive ( score(x,x)>0 )</strong>
<br><br>
This restriction differentiates the elements on the diagonal from the others even further. Basically, we have two groups: the four elements on the diagonal (which correspond to the combinations AA, CC, GG and TT) and the six elements not on the diagonal (which correspond to the combinations AC + CA, AG + GA, AT + TA, CG + GC, CT + TC and GT +TG).  Each of these groups can have different states, depending on the value we assign to their elements.
<br><br>
To make things easier, <strong>for each possible state in the first group we wish to find an optimal state for the second group</strong>. As all the elements in the second group have the same property, we will try to find their optimal state by using a <strong>Greedy approach</strong>. But because the elements in the first group can take any values between 1 and 10, the sum we wish to obtain for the scores we choose in the second group has to be recalculated. It's easy to notice that the sum of the elements in the first group can range anywhere between 4 and 40. As a result, depending on the choice we make for the first group, we'll have to obtain a sum between -2 and -20 for the second (we shall not forget that the symmetrical elements in the matrix have been coupled together, thus they count twice in the score matrix).  
<br><br>
Now, we have finally reached to the <strong>problem core</strong>. The solution to the entire problem depends on finding the optimal choice for the scores in the second group. If the problem has indeed the <strong>greedy choice property</strong> and the <strong>optimal substructure property</strong>, we'll be able to pick one element form the group, assign it the best scenario and proceed with the remaining elements in the same manner.
<br><br>
<strong>Claim: If we always give the highest possible score to the combination that has the most occurrences in the group, we'll obtain in the end the highest possible score for the entire group.</strong>
<br><br>
The first thing we have to do is to sort these six elements in matrix F. Then, we have to actually compute the corresponding score values in S. As the total score we should obtain is at least -20, one quick insight tells us that the first two elements could be given a score of 10 (if we assign -10 to all the remaining four elements, -20 can still be achieved). We know as well that the final score is less than 0.  Because we want to maximize the scores for the first elements, the last three elements can only be -10 (in the best case the score sum of the elements is -2 and then, we assign scores in the following manner: [10, 10, 8, -10, -10, -10]). Finally, the value of the third element will depend on the choices we make for the first group. From the maximum of 10, we subtract half of the score sum of the elements in the first group (we should note here that the aforementioned sum must be even).
<br><br>
Now, we have to make sure that our approach is indeed correct. The proof is quite straightforward, as in order keep the sum in <strong>S</strong> constant we can only decrease from the score of a combination with more occurrences and increase to the score of a combination with fewer occurrences. Let  <strong>f1</strong> and <strong>f2</strong> be the frequencies of the two combinations and <strong>f1 >= f2</strong>. We have f1 * s1 + f2 * s2 = X, where <strong>X</strong> is the sum we should maximize. By our <strong>greedy assumption, s1 >= s2</strong>.  As s1 + s2 remains constant, the previous sum changes to: f1*(s1 - a) + f2*( s2 + a) = Y, where a is strictly greater than 0. We find out that Y - X = a * (f2 - f1). Because f1 >= f2, this difference will always be less than or equal to 0.  It results that Y <= X. As Y was chosen arbitrarily, it can be concluded that the initial greedy choice always gives the maximum possible score. 
<br><br>
We apply the algorithm described above for each state of the elements in the first group and save the best result. 
<br><br>
<strong>Representation</strong>: Instead of using the matrices <strong>F</strong> and <strong>S</strong>, <strong>we find it more convenient to use arrays for storing both the combination frequencies and their corresponding score</strong>. The first 4 elements of <strong>F</strong> will denote the frequency of the combinations AA, CC, GG and TT. The next 6 elements will denote the other possible combinations and are sorted in the decreasing order of their frequency (F[5] >= F[6] >= F[7] >= F[8] >= F[9] >= F[10]). <strong>S</strong> will be an array of 10 elements such that S[I] is the score we attribute to the combination I. 
<br><br>
The main algorithm is illustrated in the following pseudo code: 
<pre class="codeBox">
Best = -Infinity
For S [1] = 1 to 10
      For S [2] = 1 to 10
            For S [3] = 1 to 10
                  For S [4] = 1 to 10 
                        If  (S [1] + S [2] + S [3] + S [4]) mod 2 = 0
                             S [5] = S[6] = 10
                             S [7] = 10 - (S [1] + S [2] + S [3] + S[4]) / 2 
                             S [8] = S [9] = S [10] = -10
<font color="blue">//  in Best we save the greatest average homology score</font>
                             Best = max (Best , score (F,S))        
<font color="blue">//  obtained so far.</font>
                       Endif                                                       
                 Endfor
           Endfor
      Endfor
Endfor
Return Best
</pre>
Given the score matrix (in our case the array <strong>S</strong>), we compute the final result by just making the sum of the products of the form F[I] * S[I] ( 1 <= I <=10) and divide it by N * (N-1) / 2 in order to obtain the average homology score.
<br><br>
<span class=bodySubtitle><A href="http://www.topcoder.com/stat?c=problem_statement&pm=1957&rd=4650">GoldMine</A></span><br>
We are now going to see how a gold mine can be exploited to its fullest, by being greedy. Whenever we notice the maximum profit is involved, a greedy switch should activate. In this case, we must allocate all the miners to the available mines, such that the total profit is maximized. After a short analysis, we realize that we want to know how much money can be earned from a mine in all the possible cases. And there are not so many cases, as in each mine we can only have between 0 and 6 workers. The table below represents the possible earnings for the two mines described in the example 0 of the problem statement:
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">0 workers</td>
         <td nowrap="nowrap">1 worker</td>
         <td nowrap="nowrap">2 workers</td>
         <td nowrap="nowrap">3 workers</td>
         <td nowrap="nowrap">4 workers</td>
         <td nowrap="nowrap">5 workers</td>
         <td nowrap="nowrap">6 workers</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">57</td>
      <td class="GAtableText">87</td>
      <td class="GAtableText">87</td>
      <td class="GAtableText">67</td>
      <td class="GAtableText">47</td>
      <td class="GAtableText">27</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">52</td>
      <td class="GAtableText">66</td>
      <td class="GAtableText">75</td>
      <td class="GAtableText">75</td>
      <td class="GAtableText">66</td>
      <td class="GAtableText">48</td>
   </tr>
</table>
<br><br>
As we are going to assign workers to different mines, we may be interested in the profit a certain worker can bring to the mine he was assigned. This can be easily determined, as we compute the difference between the earnings resulted from a mine with the worker and without.  If we only had one worker, the <strong>optimal choice</strong> would have been to allocate him in the mine where he can bring the best profit. But as we have more workers, we want to check if assigning them in the same manner would bring the <strong>best global profit</strong>.
<br><br>
In our example we have 4 workers that must be assigned. The table below shows the profit obtained in the two mines for each additional worker.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">Initially</td>
         <td nowrap="nowrap">Worker 1</td>
         <td nowrap="nowrap">Worker 2</td>
         <td nowrap="nowrap">Worker 3</td>
         <td nowrap="nowrap">Worker 4</td>
         <td nowrap="nowrap">Worker 5</td>
         <td nowrap="nowrap">Worker 6</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText">57</td>
      <td class="GAtableText">30</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText">52</td>
      <td class="GAtableText">14</td>
      <td class="GAtableText">9</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-9</td>
      <td class="GAtableText">-20</td>
   </tr>
</table>
<br><br>
We notice that the first mine increases its profit by 57 if we add a worker, while the second by only 52. So, we allocate the first worker to the first mine.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">Initially</td>
         <td nowrap="nowrap">Worker 1</td>
         <td nowrap="nowrap">Worker 2</td>
         <td nowrap="nowrap">Worker 3</td>
         <td nowrap="nowrap">Worker 4</td>
         <td nowrap="nowrap">Worker 5</td>
         <td nowrap="nowrap">Worker 6</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText2">57</td>
      <td class="GAtableText">30</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText">52</td>
      <td class="GAtableText">14</td>
      <td class="GAtableText">9</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-9</td>
      <td class="GAtableText">-20</td>
   </tr>
</table>
<br><br>
Now, an additional worker assigned to the first mine would only increase its profit by 30. We put him in the second, where the profit can be increased by 52.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">Initially</td>
         <td nowrap="nowrap">Worker 1</td>
         <td nowrap="nowrap">Worker 2</td>
         <td nowrap="nowrap">Worker 3</td>
         <td nowrap="nowrap">Worker 4</td>
         <td nowrap="nowrap">Worker 5</td>
         <td nowrap="nowrap">Worker 6</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText2">57</td>
      <td class="GAtableText">30</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText3">52</td>
      <td class="GAtableText">14</td>
      <td class="GAtableText">9</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-9</td>
      <td class="GAtableText">-20</td>
   </tr>
</table>
<br><br>
The third miner would be more useful to the first mine as he can bring a profit of 30.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">Initially</td>
         <td nowrap="nowrap">Worker 1</td>
         <td nowrap="nowrap">Worker 2</td>
         <td nowrap="nowrap">Worker 3</td>
         <td nowrap="nowrap">Worker 4</td>
         <td nowrap="nowrap">Worker 5</td>
         <td nowrap="nowrap">Worker 6</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText2">57</td>
      <td class="GAtableText4">30</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText3">52</td>
      <td class="GAtableText">14</td>
      <td class="GAtableText">9</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-9</td>
      <td class="GAtableText">-20</td>
   </tr>
</table>
<br><br>
As for the last miner, we can either place him in the first mine (for a zero profit) or in the second (for a profit of 14). Obviously, we assign him to the second.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap"></td>
         <td nowrap="nowrap">Initially</td>
         <td nowrap="nowrap">Worker 1</td>
         <td nowrap="nowrap">Worker 2</td>
         <td nowrap="nowrap">Worker 3</td>
         <td nowrap="nowrap">Worker 4</td>
         <td nowrap="nowrap">Worker 5</td>
         <td nowrap="nowrap">Worker 6</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">First mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText2">57</td>
      <td class="GAtableText4">30</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
      <td class="GAtableText">-20</td>
   </tr>
   <tr>
      <td class="sidebarTitle" nowrap="nowrap">Second mine</td>
      <td class="GAtableText">-</td>
      <td class="GAtableText3">52</td>
      <td class="GAtableText5">14</td>
      <td class="GAtableText">9</td>
      <td class="GAtableText">0</td>
      <td class="GAtableText">-9</td>
      <td class="GAtableText">-20</td>
   </tr>
</table>
<br><br>
In the end two of the workers have been allocated to the first mine and another two to the second. The example shows us that this is indeed the choice with the best total profit.  But will our "greedy" approach always work?
<br><br>
<strong>Claim:  We obtain the maximum total profit when we assign the workers one by one to the mine where they can bring the best immediate profit.</strong>
<br><br>
<strong>Proof:</strong>  Let A and B be two mines and a1, a2, b1, b2 be defined as below:<br>
a1 - the profit obtained when an additional worker is assigned to mine A<br>
a1 + a2 - the profit obtained when two additional workers are assigned to mine A<br>
b1 - the profit obtained when an additional worker is assigned to mine B<br>
b1 + b2 - the profit obtained when two additional workers are assigned to mine B<br>
Let us now consider that we have two workers to assign and a1 >= b1.
<br><br>
Our greedy algorithm will increase the profit by a1 for the first worker and by max (a2, b1) for the second worker.  The total profit in this case is <strong>a1+max(a2,b1)</strong>.  If we were to choose the profit b1 for the first worker instead, the alternatives for the second worker would be a profit of a1 or a profit of b2. 
<br><br>
In the first case, the total profit would be b1+a1 <= a1 + max (a2,b1).<br>
In the second case, the total profit would be b1+b2. We need to prove that b1+b2 <= a1+max(a2,b1).  But b2 <= b1 as <strong>the profit of allocating an extra worker to a mine is always higher or equal with the profit of allocating the next extra worker to that mine</strong>.
<br><br>
<table class="formFrame" width="400" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle">
         <td nowrap="nowrap">Gold Mine Status</td>
         <td nowrap="nowrap">Profit from extra-worker 1</td>
         <td nowrap="nowrap">Profit from extra-worker 2</td>
   </tr>
   <tr class="GAtableText">
      <td nowrap="nowrap">number of ores > number of workers + 2</td>
      <td>60</td>
      <td>60</td>
   </tr>
   <tr class="GAtableText">
      <td nowrap="nowrap">number of ores = number of workers + 2</td>
      <td>60</td>
      <td>50</td>
   </tr>
   <tr class="GAtableText">
      <td nowrap="nowrap">number of ores = number of workers + 1</td>
      <td>50</td>
      <td>-20</td>
   </tr>
   <tr class="GAtableText">
      <td nowrap="nowrap">number of ores < number of workers + 1</td>
      <td>-20</td>
      <td>-20</td>
   </tr>
</table>
<br><br>
As b1+b2 <= a1+b2 <= a1+b1 <= a1+max(a2,b1), the greedy choice is indeed the best .
<br><br>
Coding this is not difficult, but one has to take into account the problem constraints (all miners must be placed, there are at most six workers in a mine and if a worker can be optimally assigned to more than one mine, put him in the mine with the lowest index).
<br><br>
<a name="worldpeace"></a>
<span class="bodySubtitle"><A href="http://www.topcoder.com/stat?c=problem_statement&pm=2420&rd=5850">WorldPeace</A></span><br>
The greedy algorithms we have seen so far work well in every possible situation as their correction has been proven. But there is another class of optimization problems where Greedy Algorithms have found their applicability. This category mostly includes NP-complete problems (like the <A href="http://www.tsp.gatech.edu/">Traveling Salesman Problem</A>)  and here, one may prefer to write an heuristic based on a greedy algorithm than to wait ... The solution is not always the best, but for most real purposes, it is good enough. While this problem is not NP, it is an excellent example of how a simple greedy algorithm can be adapted to fool not only the examples, but also the carefully designed system tests. Such an algorithm is not very hard to come with and after a short analysis we notice that in order to maximize the total number of groups <strong>it is always optimal to form a group from the k countries that have the highest number of citizens</strong>. We apply this principle at every single step and then sort the sequence again to see which are the next k countries having the highest number of citizens. This idea is illustrated in the following pseudo code:
<pre class="codeBox">
Groups = 0
Repeat
<font color="blue">// sorts the array in decreasing order</font>
       Sort (A)
       Min= A[K]
       If Min > 0 Groups = Groups + 1
        For I = 1 to K
               A[I] = A[I] - 1
        Endfor           
Until  Min = 0 
Return Groups
</pre>

Unfortunately, a country can have up to a billion citizens, so we cannot afford to make only one group at a time. Theoretically, for a given set of k countries, we can make groups until all the citizens in one of these countries have been grouped. And this can be done in a single step: 
<pre class="codeBox">
Groups = 0
Repeat
<font color="blue">// sorts the array in decreasing order</font>
       Sort (A)           
       Min= A[K]
       Groups = Groups + Min
        For I = 1 to K
               A[I] = A[I] - Min
        Endfor           
Until  Min = 0 
Return Groups
</pre>
The execution time is no longer a problem, but it is the algorithm! As we check it on the example 0, our method returns 4 instead of 5. The result returned for the examples 1, 2 and 3 is correct. As for the last example, instead of making 3983180234 groups, we are able to make 3983180207. Taking into account the small difference, we may say that our solution is <strong>pretty good</strong>, so maybe we can refine it more on this direction.
<br><br>
So far, we have two algorithms:
<ul>
   <li>a first greedy algorithm that is accurate, but not fast enough</li>
   <li>a second greedy algorithm that is fast, but not very accurate.</li>
</ul>
What we want to do is to optimize accuracy as much as we can, without exceeding the execution time limit. Basically, we are looking for <strong>a truce between speed and accuracy</strong>. The only difference in the two algorithms described above is the number of groups we select at a given time.  The compromise we will make is to select an arbitrarily large number of groups in the beginning, and as we approach the end to start being more cautious. When we are left with just a few ungrouped citizens in every country, it makes complete sense to use the safe brute force approach. In the variable <strong>Allowance</strong> defined in the algorithm below, we control the number of groups we want to make at a given moment.
<pre class="codeBox">
Groups = 0
Repeat
<font color="blue">// sorts the array in decreasing order</font>
       Sort (A)
       Min= A[K]
       Allowance = (Min+999) / 1000
       Groups = Groups + Allowance
        For I = 1 to K
               A[I] = A[I] - Allowance
        Endfor           
Until  Min = 0 
Return Groups
</pre>
If this approach is correct indeed, remains to be seen.  Despite the fact it escaped both Tomek's keen eyes and system tests, it is very likely that the result is not optimal for all the set of possible test cases. This was just an example to show that a carefully chosen refinement on a simple (but obvious faulty) greedy approach can actually be the "right" way. For more accurate solutions to this problem, see the <A href="http://www.topcoder.com/index?t=statistics&c=srm204_prob">Match Editorial</A>.
<br><br>
<span class="bodySubtitle">Conclusion</span><br>
Greedy algorithms are usually easy to think of, easy to implement and run fast. Proving their correctness may require rigorous mathematical proofs and is sometimes insidious hard.  In addition, greedy algorithms are infamous for being tricky. Missing even a very small detail can be fatal.  But when you have nothing else at your disposal, they may be the only salvation. With backtracking or dynamic programming you are on a relatively safe ground.  With greedy instead, it is more like walking on a mined field. Everything looks fine on the surface, but the hidden part may backfire on you when you least expect. While there are some standardized problems, most of the problems solvable by this method call for heuristics. There is no general template on how to apply the greedy method to a given problem, however the problem specification might give you a good insight. Advanced mathematical concepts such as <A href="http://mathworld.wolfram.com/Matroid.html">matroids</A> may give you a recipe for proving that a class of problems can be solved with greedy, but it ultimately comes down to the keen sense and experience of the programmer. In some cases there are a lot of greedy assumptions one can make, but only few of them are correct (see the <A href="#worldpeace">Activity Selection Problem</A>). In other cases, a hard problem may hide an ingenious greedy shortcut, like there was the case in the last problem discussed, <A href="#worldpeace">WorldPeace</A>.  And this is actually the whole beauty of greedy algorithms! Needless to say, they can provide excellent challenge opportunities...
<br><br>
A few final notes
<ul>
   <li>a problem that seems extremely complicated on the surface (see <A href="http://www.topcoder.com/stat?c=problem_statement&pm=2894&rd=5853">TCSocks</A>) might signal a greedy approach.</li>
   <li>problems with a very large input size (such that a n^2 algorithm is not fast enough) are also more likely to be solved by greedy than by backtracking or <A href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=dynProg">dynamic programming</A>. </li>
   <li>despite the rigor behind them, you should look to the greedy approaches through the eyes of a detective, not with the glasses of a mathematician.</li>
</ul>
         				 				                           
<table class="bodyText" cellpadding="10" cellspacing="0" align="center">
   <tr class="bodyText">
      <td align="center"><strong>A good detective</strong><br><div align=center><img src="/i/education/greedyAlg4.gif" alt="" border="0" /></div></td>
      <td align="center"><strong>Greedy and lucky</strong><br><div align=center><img src="/i/education/greedyAlg5.gif" alt="" border="0" /></div></td>
      <td align="center"><strong>Greedy and not so lucky</strong><br><div align=center><img src="/i/education/greedyAlg6.gif" alt="" border="0" /></div></td>
   </tr>
</table>

<ul>
   <li>in addition, study some of the standard greedy algorithms to grasp the concept better (<A href="http://www-cse.uta.edu/~holder/courses/cse2320/lectures/l15/node3.html">Fractional Knapsack Problem</A>, <A href="http://www-b2.is.tokushima-u.ac.jp/~ikeda/suuri/dijkstra/Prim.shtml">Prim Algorithm</A>, <A href="http://www-b2.is.tokushima-u.ac.jp/~ikeda/suuri/kruskal/Kruskal.shtml">Kruskal Algorithm</A>, <A href="http://www-b2.is.tokushima-u.ac.jp/~ikeda/suuri/dijkstra/Dijkstra.shtml">Dijkstra Algorithm</A>, <A href="http://www.cs.duke.edu/csed/poop/huff/info/torials&d2=index">Huffman Coding</A>, <A href="http://www.maths.abdn.ac.uk/~igc/tch/mx4002/notes/node45.html">Optimal Merging</A>, <A href="http://www.owlnet.rice.edu/~comp314/04spring/lec/week6/Topological.htm">Topological Sort</A>).</li>
</ul>

<span class=bodySubtitle>Further Problems</span><br>
<span class=bodySubtitle>Level 1</span><br>
<A href="/stat?c=problem_statement&pm=3450&rd=5868">GroceryBagger</A> - SRM 222<br>
<A href="/stat?c=problem_statement&pm=2235&rd=5070">FanFailure</A> - SRM 195<br>
<A href="/stat?c=problem_statement&pm=3002&rd=5863">PlayGame</A> - SRM 217<br>
<A href="/stat?c=problem_statement&pm=1119&rd=5879">SchoolAssembly</A> - TCO04 Round 2<br>
<A href="/stat?c=problem_statement&pm=2984&rd=5862">RockStar</A> - SRM 216<br>
<A href="/stat?c=problem_statement&pm=2312&rd=5850">Apothecary</A> - SRM 204<br>
<A href="/stat?c=problem_statement&pm=2977&rd=5880">Boxing</A> - TCO04 Round 3<br>
<A href="/stat?c=problem_statement&pm=2945&rd=5884">Unblur</A> - TCO04 Semifinal Room 3<br>
<br><br>
<span class=bodySubtitle>Level 2</span><br>
<A href="/stat?c=problem_statement&pm=3042&rd=5863">Crossroads</A> - SRM 217<br>
<A href="/stat?c=problem_statement&pm=2894&rd=5853">TCSocks</A> - SRM 207<br>
<A href="/stat?c=problem_statement&pm=2982&rd=5881">HeatDeath</A> - TCO04 Round 4<br>
<A href="/stat?c=problem_statement&pm=3038&rd=5882">BioScore</A> - TCO04 Semifinal Room 1<br>
<A href="/stat?c=problem_statement&pm=2347&rd=5870">Rationalization</A> - SRM 224<br>
<br><br>
<span class=bodySubtitle>Level 3</span><br>
<A href="/stat?c=problem_statement&pm=1957&rd=4650">GoldMine</A> - SRM 169<br>
<A href="/stat?c=problem_statement&pm=2236&rd=5879">MLBRecord</A> - TCO04 Round 2<br>
<A href="/stat?c=problem_statement&pm=3076&rd=5866">RearrangeFurniture</A> - SRM 220<br>
<A href="/stat?c=problem_statement&pm=2420&rd=5850">WorldPeace</A> - SRM 204<br>
</p>
            

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
