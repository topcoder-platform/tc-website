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

<div style="float: right; text-align:right;">
<tc-webtag:forumLink forumID="506120" message="Discuss this article" />
<div id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A></div>
<div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A></div>
</div>
<span class="bigTitle">Creating an Intelligent Design</span>

      <p>
      By&#160;<tc-webtag:handle coderId="299911" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>
In working with software, odds are you will eventually come face-to-face with an unpleasant fact: sometimes, developers have agendas. While it's certainly not true for everyone, there are developers out there who are looking not just for a paycheck, but for a way to express who they are through code.
<br><br>
Developers like these are often referred to as "purists." They want to do things in the best way, in the most reusable way, in the most efficient way, and so on.  Given the resources and the time, and left to their own devices, these purists would surely create components and applications that really were close to perfect.  Unfortunately, the world is neither pure nor patient, and some of these developers end up damaging their own careers by trying to convince their more realistic colleagues to push deadlines and expand budgets.  Fortunately, though, there's an approach that allows purists and realists to happily coexist. 
<br><br>
'Best' is often thought of as an absolute quality.  A developer might strive to make things as robust as possible, or infinitely reusable.  A business-centric person wants to do things cheaply and efficiently.  And a customer might just want to get things in their hands quickly.  So make no mistake, best is an absolute - an absolutely subjective quality, that is.
<br><br>
The way to make everyone happy is through compromise.  Best, in this case, is a balance among everyone's needs.  Ideally, everyone should be aware of the needs of the other people they need to interact with, deliver to, or work amongst.  But idealists are about as common as purists.  So what's the solution?  Developers need to be pragmatic, and the best way to do this is by doing their due diligence, which I call intelligent software design.
<br><br>
Purists love to be given the opportunity to design outside the box. They worry that the context of the specific problem and the details of the component's initial use could constrain their thinking.  By remaining agnostic they believe they will, in the end, create a more flexible, reusable design - and I can say from experience that this is almost always the case.  However, there are drawbacks to this approach.
<br><br>
Sometimes time isn't a luxury. Sales is an aggressive field, and those in it will often make forceful claims to grab hold of customers.  These claims may be as small as marketing more features than the product is slated to have -- or as large as stretching the truth about when the next version will be released.
<br><br>
Sometimes robust features or additional reusability may not actually add value.  Not all components can necessarily be used across other applications within an enterprise. How your design is used can be affected the size of the company, how many teams there are, how well - or even if - the teams interact, and the business problems that the company is trying to solve.
<br><br>
And sometimes the very abstractions that provide reusability can force additional burdens on the shoulders of future developers.  If a component is in general more difficult to use (which is arguably poor design, regardless of its reusability), it might take more junior developers a lot longer to learn how to effectively leverage it.
<br><br>
All these factors point toward the need for balance. 'Best' must be defined in terms of what it is seeking to create: a balance between purity and practicality, utility and usability, perfection and pragmatism. And the developer, being the engineer, is in the best and only position to make this happen.
<br><br>
Einstein once said to "make everything as simple as possible, but no simpler."  This is precisely the yardstick that needs to be applied to the field of software engineering.
<br><br>
Before a design begins at least one thing must be understood: the current problem context.  If a developer has an idea of what a component design must solve, then he or she need not spend time over-complicating it with things that may never be used.  To that end, a developer would be wise to consider how the component might be used in the future as well, so as to design the appropriate level of extensibility.
<br><br>
The two preceding points are vertical considerations, because they don't require knowledge of other developments in the enterprise.  However, there are horizontal considerations.  Understanding the overall environment is just as important as understanding one's own problem context. Knowing the enterprise and its needs is essential to identifying opportunities for reuse - or determining that no such opportunities exist, which can save a lot of time up front.
<br><br>
It's a lot to take in. How do you know that you've considered enough points and found the right balance? You may never know for sure. Experience helps - and helps a lot - but you don't need to be a senior developer or expert designer to benefit from a more balanced approach.  
<br><br>
For an example, let's take a look at File Replace 1.0 from the TopCoder component repository.  This is the perfect illustration of how one can gain an advantage early on in the game.  
<br><br>
While the development for this component has not been finished as of the time of this writing, the design portion was done - and that's what's important.  A quick look at the information collected in the specification lets us know that the designer, <tc-webtag:handle coderId="294570" />, was spot on, and picked up on several points to make the design effective, which will in turn make for a smoother and more efficient implementation effort for <tc-webtag:handle coderId="309786" />.
<br><br>
In the first paragraph of the component specification, <tc-webtag:handle coderId="294570" /> points out that there were two major ways of attacking the problem.  One would have been very straight forward, and would produced an API that was both easy to understand and easy to use.  However, from an implementation standpoint, the multithreading possibilities would have been limited, and would have likely lead to performance issues surrounding replacement operations on large file sets.
<br><br>
So a second approach was chosen instead, which at first "may seem counterintuitive on the surface&#8230; [but it actually produces] a much more elegant and efficient design."  Here, the tradeoff seems to work against Einstein's "simpler is better" principle and goes on to make itself more complicated to use.  Actually, it's a blessing in disguise: this designer effectively leveraged the information that came out of the requirements phase, which specifically stated that the "component should take overall response time into account when performing search and replace functionality."  A counterintuitive design needed to be favored over simplicity.  And you're never really at a loss -- a few more minutes of documentation with some hearty examples can, in this case, easily clear up any initial confusion over how to use the API effectively. The last section of the component specification gives some great use cases to drive this alternate design home, and the sequence diagrams help nicely round out the concept as well.
<br><br>
While it might not have been immediately apparent above, the next design decision showcases the designer's pragmatism.  Faced with a choice of whether File Replace should be required to leverage another TopCoder component to perform pattern matching, <tc-webtag:handle coderId="294570" /> weighed the fact that the current problem context didn't require overly elaborate algorithms for finding and replacing strings against the need to extend this component in the future to potentially do more complex operations.  In the end, it was decided that simpler was better.
<br><br>
The requirements make no direct mention of future extensibility needs, but the component specification still points out that extending this component is possible.  So, even though this portion of the design doesn't directly affect the programming interface, it will affect how quickly the developer can write the solution.  In this case, it will also affect how difficult the implementation will be to follow, which indirectly influences how difficult it will be to maintain this component in the future.
<br><br>
I could go on, but I think the point is clear. File Replace 1.0 demonstrates just how important it is for software developers to understand the factors around them that may not directly relate to development, but which contribute to the overall effectiveness of their component or application.
<br><br>
Sometimes the best design isn't always the absolute best solution.  Instead, try to understand your environment to help you choose the blend that works for everyone.  An intelligent design doesn't require a developer to give up on what he or she believes is right; it simply requires one to hide a small negotiator's cap beneath their purist hat. 
        <br><br>
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
