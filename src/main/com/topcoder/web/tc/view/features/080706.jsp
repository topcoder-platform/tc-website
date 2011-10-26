<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

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
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }

</style>

</head>

<body>

<jsp:include page="../top.jsp" >
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
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right;"><tc-webtag:forumLink forumID="506087" message="Discuss this article" /></div>
<span class="bigTitle">The Intricate Art of Testing</span>

      <p>
      <img src="/i/m/Vedensky_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="9927526" /><br>
      <span class="smallText"><em>TopCoder Members</em></span><br clear="all" />
      </p>

<span class="bodySubtitle">Introduction</span><br>
At some point, every coder experiences the intense feeling of disappointment that comes when you are told your carefully written solution has "Failed System Test."
<br><br>
How can you keep from repeating such a mishap? The answer is quite simple: learn the art of testing.
<br><br>
Testing is a cornerstone in every aspect of software development. TopCoder SRMs, though, include several unique characteristics that require a new approach:
<ul>
<li>For one thing, there is an active constraint on the total time you can spend writing and testing. Seventy-five minutes seems to be too little: you barely have time to write the solution, let alone test it!</li>
<li>The test cases used during system testing meet the constraints given in the "Constraints" section of the problem statement - since an incorrect test is impossible to run, you do not need to spend any time testing or checking constraints.</li>
<li>Finally, the limit for the program execution time is 2 seconds. Even correct algorithms can be too slow for some inputs to manage in this time. That's why it is critical to estimate the worst-case runtime for your solution and make sure the system can handle it.</li>
</ul>
<span class="bodySubtitle">The psychology of testing</span><br>
Of course, the hardest part of testing has nothing to do with the TopCoder Arena - it all comes down to attitude. Many programmers seem to fundamentally misunderstand the term "testing." Defining testing as a process meant to show "that the program has no errors" or "that the program functions correctly" is totally wrong.
<br><br>
Testing should begin with the assumption that the program does hold errors - which, in fact, is rather likely - and that we need to find them. Testing is executing the program with the goal of finding as many errors as possible.
<br><br>
A correct understanding of the purposes of testing is vitally important. Someone who assumes his code is perfect will unconsciously attempt tests that don't uncover any faults, or he won't try tests at all. A coder who expects to find mistakes, though, will construct tests which are likely to fail. 
<br><br>
The deliberate and single-minded search for faults is an arduous task -- it's difficult to try and tear down what you just built -- but you should learn to do so if you want to succeed. 
<br><br>

<span class="bodySubtitle">Managing time</span><br>
Each coder should approach the SRM with a strategy for managing time -- a model for how he will approach problem statement understanding, coding and testing for each problem.
<br><br>
For successful project development in the real world, the experts recommend that programmers should spend one third of the total project time thinking and planning, one half on testing (including unit testing, system testing and beta testing), and only one sixth on the actual coding itself. In TopCoder competitions such time allocation is unreasonable, but it's useful to have a plan for managing your time in the Arena.
<br><br>
Time spent on testing should depend on the problem's complexity: the more complicated the problem is, the higher the probability of a mistake or pitfall -- and the more you should test your solution.
<br><br>
Let's consider an example: you have coded and submitted both the easy and the medium problems in your division, and there are still 10 or 15 minutes left. You have several options:
<ul>
<li>Spend this time thinking about your outstanding performance and calculating how much your rating will benefit. A pleasant option, maybe, but not the best use of your time.</li>
<li>Review the hard problem statement and rush into coding in frantic haste. If you are a coding genius, if your solution is efficient, or if you are 200% sure that it's correct, that may be acceptable. Otherwise you are almost sure to make several mistakes in the code -- by either misunderstanding the problem statement, by forgetting about some extreme case, or by just not finishing the coding. In the end, this approach most likely won't improve your total performance.</li>
<li>Return to one of the problems you've already submitted and test them once more very carefully. Read the problem statement again and be sure that you understood it clearly and completely. Create more crafty tests and calculate their outputs. If your solutions are correct, no harm done. However if you find a mistake at this point, you still have time to rectify it and resubmit the solution. It's better to lose 10% of your points as a penalty for resubmitting than to lose 100% for failing the System Test.</li>
</ul>

<span class="bodySubtitle">Standard is NOT Enough</span><br>
Too often competitors rely on the problem writer and don't look beyond the "Examples" section of the problem statement. Of course, there are many problems, usually in Division 2, for which the "Examples" describe all possible cases exhaustively, and such testing is enough.
<br><br>
But most problems in Division 1 tend to contain pitfalls that aren't obvious at first glance, and aren't cited in the "Examples." It's up to the coder to take a creative approach to problem-solving, to devise tests that differ qualitatively than those in the "Examples," and to watch out for problem statements that intentionally mislead competitors.
<br><br>
Let's view several problems which should be tested more inventively than the "Examples" section permits.
<br><br>
<A href="/stat?c=problem_statement&pm=5893&rd=8070">SnakeTurbo</A> (SRM 273, Div1 Medium)
It might seem that changing the moving direction more than once is senseless. With a little thought, though, it becomes clear that you should write a more complicated DP solution that takes into account a case involving multiple direction changes, like (startLocation = 100, endLocation = 1000000, orbs = {0, 99, 110}).
<br><br>
<A href="/stat?c=problem_statement&pm=4847&rd=8081">Smooshing</A> (SRM 284, Div1 Medium)
Reserved words could contain capital letters, while not starting with them. Most of the incorrect solutions would have failed test "qWerty," considering "Werty" as a variable name and trying to shorten it.
<br><br>
<A href="/stat?c=problem_statement&pm=5973&rd=9808">MooresLaw</A> (SRM 287, Div1 Medium)
If you solve this problem using an exact formula, you should regard years = 1 and years = 2 separately, because for them the optimal value "when you should buy the computer and start computations" is negative, and you can't start earlier than now. The "Examples" section has a minimum value of 3.
<br><br>
<span class="bodySubtitle">Think the tests through!</span><br>
If you are testing the algorithm itself and not its processing time, you should know the desired result for a given input parameter in order to compare it with the actual return value. If determining the desired output is hard to calculate, you should at least estimate the output's accuracy, and not be satisfied with its mere presence. You should never first run the test, then watch the output, mutter "OK, credible," and continue with the next test!
<br><br>
That's why the algorithm itself should be tested using either the "Examples" section inputs, or small inputs which are easy to calculate mentally or on a scrap of paper.
<br><br>
<span class="bodySubtitle">A sensible test and how to find it</span><br>
You're convinced - you've come to believe that testing your solution is as essential as the coding itself. But now what?
<br><br>
How do you go about selecting a good test - in other words, an input that is likely to reveal a flaw in your solution? After all, you can't run the program on every single input in the definitional domain of the problem. So how do you identify inputs that are small and easy to calculate, but that are also effective for error mining?
<br><br>
The worst of all possible methods is so called "stochastic testing", i.e. running the program on randomly chosen inputs. By their very randomness, these tests are hard to calculate and unlikely to have useful properties. The following are some useful principles for sensibly selecting test cases:

<ul>
 <li><b>Equivalent fragmentation</b><br>
   All the inputs that meet the constraints of the problem usually can be divided into a finite number of subsets, called equivalence classes. Each partition uses one or several features issuing from the problem statement, not the solution realization. Members of the same equivalence class behave equally, obey the same logic and should be processed in the same way -- if one test shows a mistake, you can expect all other tests from the same equivalence class to show the same mistake.
   <br><br>
   Having trouble identifying equivalence based on the problem statement features? It might help to work backwards, and consider equivalence classes issuing from the solution or the outputs.
   <br><br>
   It is important to note that this concept of equivalence classes differs from the exact mathematical definition. The same test can belong to several classes, each of them describing one feature of the test. In that case you should run tests that belong to each combination of classes.
   <br><br>
   <A href="/stat?c=problem_statement&pm=6013&rd=9808">TwoEquations</A> (SRM 287, Div1 Easy, Div2 Medium) is a good example to illustrate this idea. Classes issuing from the outputs are {no solutions}, {multiple solutions} and {one concrete solution}. Classes issuing from the problem solution are {zero determinant} (with subclasses {proportional equations}, {non-proportional equations} and {equations with no solutions, like 0*x+0*y=1}) and {non-zero determinant}. Classes issuing from managing with fractions are {negative denominator} and {non-reduced fraction}.
   <br><br>
   For the <A href="/stat?c=problem_statement&pm=5973&rd=9808">MooresLaw</A> (SRM 287, Div1 Medium) evident classes are {years&lt;=0}, {years&gt;1000000000} and {0&lt;years&lt;=1000000000}. Yet for the exact solution you should distinguish {1, 2} as values that need a special approach.
   <br><br>
 </li>
 <li><b>Boundary conditions analysis</b><br>
   The boundary conditions analysis approach issues from the equivalent fragmentation. Boundary conditions appear at or near the borders of equivalence classes. Testing should necessarily check all classes' boundaries, since mistakes on processing boundary values are very common even if the classes themselves are processed correctly.
   <br><br>
   Usually the boundary cases are easy to distinguish in math problems. If the input integer value lies in the range of [a, b], you should check values a and b. If the input is an array, you should check the processing of arrays of minimum and maximum length and of the first and the last items of the array.
   <br><br>
   But sometimes the problem of border cases search is not as apparent as it seems. You can write a solution for the <A href="/stat?c=problem_statement&pm=4645&rd=8036">TokenGrid</a> (TCO'05, Online Round 4, Medium) that will use iterating through cycles of sending. Thus, the maximum number of iterations is a boundary condition, and you should choose it carefully.
   <br><br>
   One serious disadvantage to the above-mentioned methods is that they don't examine combinations of values of variables in the input, and there are problems in which addressing this is essential.
   <br><br>
   The last example for the <A href="/stat?c=problem_statement&pm=4823&rd=8074">UnionOfIntervals</A> (SRM 277, Div2 Hard) is a perfect case of a conditions combinations test. Each of the bounds can be stored as an int variable, but the length of the interval cannot. If you store intervals' lengths as int, you will get an overflow in some tests, and you might not find this mistake using only the boundary conditions analysis.
   <br><br>
   A methodical search of combinations of values in the input is usually a rather complicated task, but it's often "a must."
   <br><br>
 </li>
 <li><b>Mistake assumption, or a guess about the mistake</b><br>
   It is worth mentioning that some people are excellent testers even without special training. They are good at hunting out mistakes in code without special procedures. This is caused by unconscious use of the method called mistake assumption.
   <br><br>
   A coder possessing a certain amount of practical experience can find likely types of mistakes intuitively and then work out tests to find them.
   <br><br>
   A training practice described in the article <A href="/tc?module=Static&d1=tutorials&d2=planApproach1">"Planning an Approach to a TopCoder Problem"</A> as "Coding Kata" is extremely useful for developing the talent of intuitive error-mining. 
   <br><br>
   It results in not only the obvious benefit of theoretical exercise, but also provides an opportunity to track down, identify and correct your most common individual mistakes.
   <br><br>
   If your problem failed the System Test, you should attend the corresponding Practice Room and investigate your mistake in order to avoid its repetition.
   <br><br>
   Besides, it's useful to communicate with coders who performed several successful challenges on the same test case on the same problem. Their experience can give you the flavor of typical mistakes.
   <br><br>
   For example, a very common mistake is computation imprecision while managing doubles. In <a href="/stat?c=problem_statement&pm=5943&rd=9809">FindTriangle</A> (SRM 288, Div1 Easy, Div2 Medium) there are several ways of computing a triangle's area. If you use Heron's formula, you will get a non-zero area when all vertices belong to the same line and are rather distant.
</li>
</ul>

<span class="bodySubtitle">Test or Challenge?</span><br>
Testing your solution can result in one more very useful effect. If you have found some special or boundary case which is not covered in the "Examples", and you believe that it's rather unobvious, you can make use of it in the Challenge Phase. A five-minute intermission can be just enough time to test your submitted solution once last time and invent some intricate test. Even if you find your mistake now, there's still time to redeem your position! You need only to devise a test to reveal this mistake and to use it as a challenge case. If you succeed, you could possibly score more points for that challenge case than you would have achieved for the correct submission.
<br><br>
<span class="bodySubtitle">Conclusion</span><br>
No doubt there are mistakes that can only be found through the system tests. In the <A href="/stat?c=problem_statement&pm=5895&rd=8070">FallingCoconuts</A> (SRM 273, Div1 Easy, Div2 Medium) problem, it is difficult to determine whether the character which stands for a coconut is the numeral '0' (zero) or the capital letter 'O' (capital letter) while using the default font in the Arena. And if you miswrite the symbol, your otherwise correct solution will fail. In general though, taking the right approach to testing - and assuming that your own code is wrong -- will earn you many more points and help increase your rating.
<br><br>
Related reading:
<ul>
<li><A href="/tc?module=Static&d1=tutorials&d2=dissectProblem">"How To Dissect a TopCoder Problem Statement"</A> by <tc-webtag:handle coderId="275071" /></li>
<li><A href="/tc?module=Static&d1=tutorials&d2=planApproach1">"Planning an Approach to a TopCoder Problem"</A> by <tc-webtag:handle coderId="282560" /></li>
<li><A href="/tc?module=Static&d1=tutorials&d2=complexity1">"Computational Complexity"</A> by <tc-webtag:handle coderId="8357090" /></li>
<li><A href="/tc?module=Static&d1=features&d2=102403">"Challenging 101,"</A> by <tc-webtag:handle coderId="299709" /></li>
</ul>
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
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
