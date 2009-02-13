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
<tc-webtag:forumLink forumID="505588" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 152</span><br>Thursday, June 26, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                        <p>
                        SRM 152 went pretty smoothly, with submission rates close to their long-term 
                        averages. The division 2 hard problem was one exception to this, and a great 
                        many people submitted it, but few were successful. <strong>SnapDragon</strong> started on a new 
                        streak, winning the round after his previous steak of 3 SRM's was broken in SRM 
                        151. <strong>LunaticFringe</strong> was a distant second, 126 points behind. In third place, 
                        <strong>tomek</strong> continued to be perfect, successfully submitting all 3 problems for his 
                        4th straight competition. In division 2, <strong>Veloso</strong> edged out the competition by an 
                        equally large margin, getting high scores on all three problems. <strong>jpo</strong>, in fifth 
                        place was the highest scoring new comer, with 1298.59.
                        </p>

<H1> The Problems </H1> 

                        <font size="+2"><b>FixedPointTheorem</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505588" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">193 / 219  (88.13%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">191 / 193 (93.78%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Veloso</b> for 246.60 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        There's not a whole lot to this one. Basically just follow the instructions. 
                        You are given a simple function: F(X)=R*X*(1-X). You start with X = 0.25, and R 
                        is an input. Then, you repeatedly set X = F(X), 200000 times. After this, you 
                        simply do 1000 more iterations, and take the maximum minus the minimum of those 
                        iterations. There wasn't really anything tricky here. One thing to note 
                        is that the range of R ensures that F(X) will always be between 0 and 1, 
                        exclusive. Since it starts in this range, we can show this by induction. 
                        Assuming that it X is in the range 0 to 1, exclusive, we want to show that F(X) 
                        is also in this range. The lower bound is pretty obvious, since both X and (1-X) 
                        are positive. The upper bound comes from the fact that X*(1-X) &lt;= 0.25 for 
                        all 0&lt;X&gt;1, and the fact that R &lt; 1. So, since X is bounded thus, you 
                        don't have to worry about overflow or underflow, as the problem states. 
                        It turns out that there are a few values in the input range that will 
                        not converge in 200,000 iterations (and hence are not allowed), but they will 
                        converge eventually. On the other hand, for larger values of R, above 3.569, 
                        F(X) may not converge at all, but instead forms an infinite, non-repeating 
                        series. 
                        </p>
                        <font size="+2"><b>LeaguePicks</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505588" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">175/219  (79.91%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">131 / 175 (83.55%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Veloso</b> for 492.59 points</td></tr>
                        </table>
                        </blockquote>
                         Used as: Division-I - Level 1:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">130 / 132  (98.48%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText"> 124 / 130 (98.48%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 248.41 points</td></tr>
                        </table>
                        </blockquote>

                        <p>
                        This problem is about a TopCoder fantasy league, an idea which vorthys takes 
                        credit for. In particular, there is a draft where people get to choose who they 
                        have on their fantasy team (dibs on SnapDragon). The order in which the friends 
                        in this problem get to draft people is the same as the way competitors are 
                        assigned to rooms in TopCoder tournaments. Namely, you order everyone, then go 
                        down the list, and back up the list, repeatedly until everyone is drafted. This 
                        problem asks, given your place in the list, the total number of people playing 
                        in the league, and the total number of people to be drafted, which picks will 
                        you get. The most obvious way to do this is to iterate over all picks, and keep 
                        track of whose turn it is. Start by going up, and reverse direction each time 
                        you get to the end of the list. Since there are at most 1600 draftees, this is 
                        plenty fast, are pretty simple to code. Another way to do it is to notice that 
                        you start with the pick numbered the same as your position. friends - 
                        position people then go after you, and each goes twice, and then you get 
                        the next pick. So the next pick is 2 * (friends - position) + 1 later. 
                        After that, the people before you go, so your next pick is 2 * 
                        position - 1 later. If you add these two quantities alternately, you 
                        will get all the right numbers, and you simply terminate when you get to a 
                        number that is bigger than the number of draftees. 
                        </p>

                        <font size="+2"><b>ProblemWriting</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505588" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">99/ 219  (45.21%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">16 / 99 (16.16%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>Veloso</b> for 786.09 points</td></tr>
                        </table>
                        </blockquote>
                        
                        <p>
                        This problem involves checking that a given string conforms to a certain 
                        grammar (which is also used in the division 1 hard), and returning an error 
                        message if it does not. A lot of people seemed to struggle with the notation in 
                        this problem, so before reading the analysis, it might be helpful to read about 
                        <A href="http://cui.unige.ch/db-research/Enseignement/analyseinfo/AboutBNF.html">Backus 
                        Naur Form.</A>That said, the simplest way to implement this is to write a 
                        small state machine. In a state machine, there are a number of different states, 
                        and we simply iterate through all of the characters in the string, changing 
                        states based on what those characters are.There should be 4 states in 
                        our state machine. The first state, which we will call s<SUB>0</SUB>, is our 
                        start state. It indicates that the next character in the string should be a 
                        digit. So, if we are in state s<SUB>0</SUB>, and encounter a digit, we advance 
                        to state s<SUB>1</SUB>. If we are in state s<SUB>0</SUB>, and encounter anything 
                        other than a digit, then an error message should be returned. From 
                        s<SUB>1</SUB>, there are three different state transitions, depending on the 
                        character encountered: 
                        </p>

                        <OL>
                        <LI>If the character is a '.', then move to state s<SUB>2</SUB>.</LI>
                        <LI>If the character is an operator, then we advance to state s<SUB>3</SUB>. </LI>
                        <LI>Otherwise, return an error message </LI>
                        </OL>
                        
                        <p>
                        Now, state s<SUB>2</SUB> turns 
                        out to be exactly the same as state s<SUB>1</SUB> in terms of advancing to other 
                        states (there is an important difference which we will get to later).If we 
                        are in state s<SUB>3</SUB>, then there are two cases based on the character 
                        encountered:
                        </p>
                        
                        <OL>
                        <LI>If the character is a '.', then stay in state s<SUB>3</SUB>. </LI>
                        <LI>If the character is a digit, then we advance to state s<SUB>1</SUB>. </LI>
                        <LI>Otherwise, return an error message </LI>
                        </OL>
                        
                        <p>
                        That is it for our state transitions. Now, the distinction between states s<SUB>1</SUB> and s<SUB>2</SUB>   
                        is that the machine must be in state s<SUB>1</SUB> after all of the characters 
                        have been read, or else an error message should be returned. The idea of a state 
                        machine is a very useful one, and it would behoove all coders to become familiar 
                        with it. Anyhow, here it is in code: 
                        </p>
                        
                        <PRE>   
int S0 = 0, S1 = 1, S2 = 2, S3 = 3;
String ops = "+*-/";
if (dotForm.length() &lt; 1 || dotForm.length() &gt; 25) 
               return "dotForm must contain between 1 and 25 characters, inclusive.";
boolean good = true;
int STATE = S0;
for (int i = 0; i &lt; dotForm.length(); i++) {
      char curr = dotForm.charAt(i);
      good = true;
      if (STATE == S0) {
         if (Character.isDigit(curr)) STATE = S1;
         else good = false;
      } else if (STATE == S1 || STATE == S2){
         if (curr=='.')STATE = S2;
         else if (ops.indexOf(curr)!=-1) STATE = S3;
         else good = false;
      } else if (STATE == S3) {
         if (curr=='.') STATE = S3;
         else if (Character.isDigit(curr)) STATE = S1;
         else good = false;
      }
      if (!good) return "dotForm is not in dot notation, check character "+i+".";
} if (STATE!=S1) return "dotForm is not in dot notation, check character "+(dotForm.length())+".";
return "";
</PRE>
                        <font size="+2"><b>QuiningTopCoder</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505588" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I - Level 2:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">77 / 132 (58.33%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">48 / 77 (62.34%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>LunaticFringe</b> for 351.53 points</td></tr>
                        </table>
                        </blockquote>
                        
<P>
In this problem you had to perform a simulation of a machine executing a 
fairly simple programming language. There were a lot of different cases, and it 
looks overwhelming at first glance. However, if you are methodical, and follow 
the directions well, its not too hard. One way to make it a little more 
manageable is to write two functions, push(int n) and pop(), to handle all of 
your stack management. Doing all of the stack work for each case is a good way 
to make your code harder for everyone, including yourself, to read. Other than 
that, it was mostly just a matter of following directions carefully. The 
character printing could also be made a little more orderly by writing a method 
to handle that, but its not as important as the stack functions. As an 
interesting exercise, try to write a Quine in your language of choice. Some 
languages are can be done with many fewer characters than others. 
</P>
                        <font size="+2"><b>DotNotation</b></font>&#160;
                        <A href="http://forums.topcoder.com/?module=ThreadList&forumID=505588" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I - Level 3:
                        <blockquote>
                        <table cellspacing="2">
                        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">13 / 132  (9.85%) </td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">8 / 13 (61.54%)</td></tr>
                        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 714.58 points</td></tr>
                        </table>
                        </blockquote>
                        
<p>
The best approach to take to this problem is recursion with memoization. 
Start with the entire expression, and determine which expressions within the 
expression could be the dominant ones. Then, for each potentially dominant 
operator, split the expression into two parts around that operator and its dots, 
a left and right operand, and recursively call your function. Your recursive 
method should return a list of all of the possible values that an expression 
could be evaluated to. So, when the lists for the left and right side of an 
operator have both been evaluated, you can take every possible pair of values 
from the left and right, and evaluate the operator. Then, you add all of these 
results into your return list. So, the pseudocode (with memoiziation) goes 
something like this: 
</p>

<PRE>
recurse(string expression){
        if(recurse(expression) has already been calculated)
            return cached value of recurse(expression);
        list ret;
        foreach(possible dominant operator){
            string left = left operand of operator;
            string right = right operand of operator;
            foreach(value l in left){
                foreach(value r in right){
                    if(l op r is not in ret)
                        add l op r to ret;
                }
            }
        }
        save ret to cache;    
        return ret;
    }
</PRE>

<p>
Now, the main part that is left out is how to determine which operators 
might be dominant. The simplest way to determine this is to just try them all. 
For each one, count how many dots there are before and after the operator, and 
then check all of the other operators before and after the operator in question 
to see if the operator in question can be dominant. You also have to be a little 
careful about your data structures. In particular, you don't want to be doing a 
linear search of ret every time you want to add a number to it. Once you have 
your recursive function written, you simply return the size of the list it 
returns when called on the whole expression. 
</p>

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

