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
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
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
</style>

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

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="514295" message="Discuss this article" />
</div>

<span class="bigTitle">An Introduction to Code Coverage</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/shalinmangar_big4.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10211498" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

The TopCoder component development process places a huge emphasis on unit testing the components to ensure that they function correctly -- and don't fail in unexpected ways -- even in the face of extreme loads and invalid inputs. Well-written unit tests by developers and reviewers achieve this goal rather well, but what happens when the test suite misses testing a crucial method or statement? How can the development process itself be improved to avoid such problems? Can we incorporate methods to measure the extensiveness of our test suite? The answer to these questions is "yes, we can," thanks to code coverage. 
<br /><br />
<span class="bodySubtitle">What is code coverage?</span><br />
Code coverage is all about measuring how well your tests cover our code. It's about finding out which parts of the code base are executed by the test suite and, therefore, which parts are not. A line of code not executed during testing is a potential location for bugs that the tests didn't find. Armed with this knowledge, we can write more tests which cover these lines, thus increasing the quality of the code base. In essence, code coverage helps us increase and verify the quality of the code base by helping us improve the quality of the test suite. 
<br /><br />
<span class="bodySubtitle">How do you measure coverage?</span><br />
There are various ways to measure coverage - not all of them are supported by every coverage tool. Although an explanation of each coverage measure will be beyond the scope of this article, we'll take a look at some of the most common ones below, along with some examples. 
<br /><br />
<span class="bodySubtitle">Method coverage</span><br />
This measure tells us whether each method in our code base is invoked by our test cases or not. It is one of the most basic measures of coverage and helps us to identify the biggest shortcomings in our test suite.
<br /><br />
<span class="bodySubtitle">Line coverage</span><br />
Line coverage, also called statement coverage, tells us about each line that is executed during the run. This form of coverage is very easy to associate with individual source code lines because the developer is immediately informed about the lines that are not executed. Unfortunately, line coverage can miss cases in which the logic may be at fault, even though each line of code gets executed. For example, look at the following piece of code: 

<pre class="code">
public String lineCoverageExample(boolean condition)    { 
    String result = null;

    if (condition)   {
    result = getCustomer().getAddress();

    return result.trim();
}
</pre>

Here, if all the tests always call the method with condition as true, the code is reported to be fully covered (though it would throw a <i>NullPointerException</i> when <i>condition</i> is <i>false</i>). Apart from the case in the above example, line coverage also does not report whether <i>for</i> loops reach their termination conditions or whether they are terminated forcefully by <i>break</i> statements. It also does not distinguish between the various cases in a <i>switch-case</i> statement block. 
<br /><br />
<span class="bodySubtitle">Basic block coverage</span><br />
Instead of measuring individual lines, basic block coverage considers each sequence of non-branching statement as a unit of code. This means that, for an <i>if</i> statement, this measure will report 100% coverage only when both the <i>then</i> and the <i>else,</i> blocks get executed. For example, consider the following piece of code: 

<pre class="code">
public void basicBlockCoverageExample(boolean condition)    { 
    if (condition)   {
        System.out.println("This block contains only one line.");
    } else   {
        System.out.println("This block contains multiple lines. This is the first.");
        System.out.println("This is the second.");
        System.out.println("This is the third.");
        System.out.println("This is the fourth.");
        System.out.println("This is the fifth.");
        System.out.println("This is the sixth.");
    }
}
</pre>

In the above example, if we always pass <i>false</i> as the parameter, line coverage will be close to 90% -- giving the illusion of good coverage despite missing a whole branch. In comparison, basic block coverage will report coverage of only 50% for this example. 
<br /><br />
Some tools support <b>partial line coverage</b>, meaning that they project basic block coverage onto the source code line structure so that single lines with multiple blocks are fully exercised by the tests.
<br /><br />
<span class="bodySubtitle">Decision coverage</span><br />
Also known as branch coverage, this tells us whether the expressions in condition statements evaluate both to <i>true</i> and <i>false</i> during testing. With this measure we can find tests which test <i>if-then-else</i> blocks only one way, i.e. tests that exercise only the <i>then</i> or the <i>else</i> but not both. The problem with this approach is that decision coverage considers the expression as a whole and cannot detect whether individual conditions within the expression have been evaluated both ways or not. For example, it cannot detect whether a particular branch in the boolean expression was short-circuited or not, as in the case of a logical OR expression. 

<pre class="code">
public void decisionCoverageExample(boolean first, boolean second)   { 

    if (first && (second || anotherCondition()))   {
        //some code here
    } else   {
        //some code here
    }

}
</pre>

In this example, if the tests call the method with the first parameter as <i>true</i> as well as <i>false</i> and the second parameter with true, then decision coverage will report the above code as fully covered even if <i>anotherCondition()</i> is never evaluated. 
<br /><br />
<span class="bodySubtitle">Condition coverage</span><br />
This is a variant of branch coverage that checks whether each sub-expression in a boolean expression evaluates to both <i>true</i> and <i>false</i> during testing. There is also a variant of condition coverage called <b>multiple condition coverage</b>, which takes the whole expression and all the sub-expressions into consideration. It tells us whether every possible combination of the sub-expressions is evaluated during testing or not. As you can imagine, the number of tests needed for full coverage with this approach increases with the complexity of the boolean expressions involved. However, this isn't always predictable -- two boolean expressions with a similar number of sub-expressions can require a very different number of test cases for full coverage. 
<br /><br />
One note: Full condition coverage does not imply full decision coverage, because condition coverage does not consider the expression as a whole.
<br /><br />
<span class="bodySubtitle">Path coverage</span><br />
Path coverage tells us whether each possible path from the method entry to the return is executed or not. For this purpose, a "path" is defined as a unique sequence of branches from the method entry to the exit, with "exit" defined as either successful completion of the method or a throw statement. The problem with this approach is that there are cases when executing all theoretically possible paths is practically impossible. For example, consider the following piece of code:

<pre class="code">
public void pathCoverageExample(boolean condition)   {
    if (condition)    {
        //Path 1
    } else   {
        //Path 2
    }

    if (condition)   {
        //Path 3
    } else   {
        //Path 4
    }
}
</pre>

In the above example, the number of possible paths is theoretically four but practically only two paths are possible which are {1, 3} and {2, 4}. Paths {1, 4} and {2, 3} can never be executed by any test case. Needless to say, full path coverage is very difficult to measure and achieve.
<br /><br />

<span class="bodySubtitle">How do coverage tools work?</span><br />
There are a variety of coverage tools on the market now. Most of them use one of the following techniques to measure coverage: 
<br /><br />
<span class="bodySubtitle">Source instrumentation</span><br />
Instrumentation is the process of inserting trace statements into the code that can be used for profiling purposes. As the name suggests, source instrumentation-based tools work by inserting custom trace calls into the source code of the application, re-compiling it, and then running the test suite over the modified application. One disadvantage with this approach is that double-compilation may slow the process, particularly for large projects. For examples, <a href="<tc-webtag:linkTracking link="http://www.cenqua.com/clover/"/>" target="_blank" refer="feature021307"/>Clover</a> and <a href="<tc-webtag:linkTracking link="http://jester.sourceforge.net"/>" target="_blank" refer="feature021307"/>Jester</a> work this way. 
<br /><br />
<span class="bodySubtitle">Class instrumentation</span><br />
Tools based on this approach work by inserting instrumentation instructions directly into the compiled files (bytecode and IL) rather than the source code. This has two advantages: it makes the implementation of these tools easier, since bytecode is much more <i>tidy</i> than source code; and it makes them faster, since instrumenting bytecode can usually be done more quickly than instrumenting source code. Instrumenting compiled code can be done either by modifying the compiled files (as a second compilation step) or by using a custom class loader. The open source tools <a href="<tc-webtag:linkTracking link="http://emma.sourceforge.net/"/>" target="_blank" refer="feature021307"/>EMMA</a> and <a href="<tc-webtag:linkTracking link="http://cobertura.sourceforge.net/"/>" target="_blank" refer="feature021307"/>Cobertura</a> use the former approach. <a href="<tc-webtag:linkTracking link="http://hansel.sourceforge.net/"/>" target="_blank" refer="feature021307"/>Hansel</a>, a JUnit extension, uses custom class loaders in combination with explicit instrumentation, through which the developer encapsulates JUnit tests in Hansel's wrapper classes. Through this approach, Hansel measures the specific coverage of individual tests, instead of reporting coverage over the whole code base.
<br /><br />
<span class="bodySubtitle">Virtual machine extensions</span><br />
This kind of tool uses custom virtual machines to profile the code during testing. The virtual machine itself keeps track of the executed portions of the classes that are loaded during testing. These tools use APIs such as <a href="<tc-webtag:linkTracking link="http://java.sun.com/j2se/1.4.2/docs/guide/jvmpi/jvmpi.html"/>" target="_blank" refer="feature021307"/>JVMPI</a>, <a href="<tc-webtag:linkTracking link="http://java.sun.com/j2se/1.5.0/docs/guide/jpda/jvmdi-spec.html"/>" target="_blank" refer="feature021307"/>JVMDI</a>, or <a href="<tc-webtag:linkTracking link="http://java.sun.com/j2se/1.5.0/docs/guide/jvmti"/>" target="_blank" refer="feature021307"/>JVMTI</a> to measure coverage. An example of this approach is <a href="<tc-webtag:linkTracking link="http://jvmdicover.sourceforge.net/"/>" target="_blank" refer="feature021307"/>Java JVMDI Coverage Tool</a>.
<br /><br />
There are also several other coverage measures that this article does not cover, such as loop coverage, race coverage, linear code sequence and jump (LCSAJ) coverage. There are also related methods, such as <a href="<tc-webtag:linkTracking link="http://www.stickyminds.com/sitewide.asp?Function=edetail&ObjectType=ART&ObjectId=2011"/>" target="_blank" refer="feature021307"/>Mutation Testing</a> and <a href="<tc-webtag:linkTracking link="http://www.cs.uoregon.edu/research/perpetual/dasada/Software/Gretel/"/>" target="_blank" refer="feature021307"/>Residual Test Coverage</a>, which you may want to explore.
<br /><br />
<span class="bodySubtitle">Conclusion</span><br />
So, how much coverage is enough? This question is open to debate. Purists believe that coverage should be nothing short of 100%. Achieving 100% code coverage is not an easy task, however, and as we've seen it is no guarantee that the code base is entirely free of bugs. In general, though, as the percentage of code coverage rises we can feel increasingly confident that the code base is less likely to contain bugs. Many experts cite 80% as a good threshold for code coverage - at that level, you get a significant improvement in the quality of the code base without having to go through all the extra work it would take to get from 80% to 100%.
<br /><br />
Wherever TopCoder chooses to set the bar, though, I believe code coverage will help. As <tc-webtag:handle coderId="152342" /> remarked in this <a href="http://forums.topcoder.com/?module=Thread&threadID=515101&start=15&mc=21#575782">forum post</a>, "the chances of improving something are zero unless you measure it." Measuring coverage for TopCoder components will definitely make developers more aware of the extensiveness of their unit tests, and will improve the overall quality of the components.
<br /><br />
One final note: In this article, I've covered the <i>what</i> of code coverage and deliberately left out the <i>how</i>, which will be the topic of a future article. You're welcome to share your experience and opinions of code coverage in the forums, and let me know if there is anything I've overlooked. Thank you!
        <br /><br />
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
