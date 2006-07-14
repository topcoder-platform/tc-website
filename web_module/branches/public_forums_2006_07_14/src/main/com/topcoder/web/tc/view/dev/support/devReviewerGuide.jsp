<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Development Review Board Guidelines</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="dev_documentation"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

<div class="guide">

<h2>Review Board Guidelines</h2>

The following attempts to address a number of concerns that affect the review boards. In general, most of these issues arise from differences in the interpretation of the review process and scorecards. Hopefully, these clarifications will help eliminate said differences and provide a more consistent set of reviews for each project. Other items in this article address communication between the review board members and TopCoder, and other points of interest.

<H2>Review Phases</H2>
<span class=bodySubtitle>Screening</span><br>
During screening, the primary reviewer needs to answer one question: is a particular design worthy of being reviewed or not? When answering this question, there are several things to take into account. If a submission has a chance of passing review, it should pass screening. Submissions that show a significant amount of work should also be allowed to move on to review, since they certainly deserve a more in-depth analysis than screening can offer. On the other hand, obviously incomplete or incorrect submissions would benefit little from further review.
<br><br>
<span class=bodySubtitle>Review</span><br>
During review, all reviewers need to focus on assigning scores that are fair and consistent with the scorecard guidelines. It is very important that you justify all of your scores, since any point may be appealed. When justifying a score, be specific. The submitter will only have one chance to appeal, and if your original justification was "sloppy design" the appeal will likely be "can you be more specific?" Your appeal response will then explain what's wrong, and the submitter will not be able to do anything else. If you score a submission down without making it perfectly clear what is wrong with it, the appeals phase becomes impossible to do properly.
<br><br>
<span class=bodySubtitle>Appeals</span><br>
In the appeals phase, you will sometimes find that an appeal covers more than one submission. For example, a fix to your test cases can affect the score of every submission you reviewed. Since you can only change scores when somebody submits an appeal, you might not be able to fully correct this problem. In this case, your best option is to email the PM and explain the problem. 
<br><br>
If the review phase was done properly, there shouldn't be that many appeals. Remember that during appeals you only need to justify (or correct) matters of fact...basically, items where you made a mistake. The submitter will not be able to appeal matters of opinion, which leads us to the next point...review based on fact (requirements).

<H2>Role of the Reviewer</H2>
Remember that your role is to review a design or development, not to do it. Oftentimes you will encounter a submission that does things differently than you would have, and the temptation to score the submitter down can be strong. You must avoid this at all costs: review based on how the submission meets the requirements, not on how it meets your own ideal design or development, or how it compares to other submissions. If you have suggestions on how to improve the component, the proper place to make them is in the component's collaboration (customer) forum. Alternatively, you can write them down as comments in the component review. These suggestions are very welcome, and we use them for the next version of the component, but they have no place in the review process.

<H2>Comparing Submissions</H2>
A reviewer should never, for any reason, compare submissions in order to assign scores.  Each submission should be reviewed in a vacuum.  For this reason, justifying an appeal response based on "the score being fair because all other submissions were treated in the same way" is invalid.  Every scorecard and every appeal response should stand by itself.

<H2>Scorecards</H2>
<span class=bodySubtitle>Clarity</span><br>
Every scorecard should be self-explanatory.  At any point in time, anybody should be able to read the scorecard and easily understand why each item was scored the way it was.  The competitors should never need a clarification in order to appeal, the PM should never need a clarification from you in order to determine whether an appeal was properly answered or not, and website visitors shouldn't need to guess in order to know what you thought of the submission.  Every item in the scorecard needs to be properly explained and justified.  Use a separate item for every point you want to make (do not combine several points into the same item, that's what the Add button is for).
<br><br>
<span class=bodySubtitle>Cascading Scores</span><br>
Sometimes a project will have a problem that several different review items address. In this case, the decision on how to score is up to you. A very small problem probably deserves to be scored down only once, while a large problem probably justifies adjusting the score in multiple items. When doing this, please explicitly reference the item that the score is cascading from so the submitter can see where the score comes from. When deciding which item to score down (or up, this principle also applies to enhancements), you should use the more specific items first.
<br><br>
<span class=bodySubtitle>Review Item Wording</span><br>
As mentioned above, review items should be worded with enough detail to make an appeal possible. It must be possible to word an appeal in such a way that your appeal decision will be clear, and the only way to do this is for the original review item to be specific and detailed.
<br><br>
<span class=bodySubtitle>Required vs. Recommended</span><br>
An item should only be marked "Required" if it affects the submission's ability to meet the project requirements (as outlined in the requirements specification and forum for design projects, or the design and forum for development projects).  All other items need to be marked recommended.  Lately we have had a lot of instances of reviewers marking items required out of personal preference.  This practice is detrimental to component quality, as it tends to cause a lot of unnecessary final fixes.  Since final fixes are only reviewed by one person, bugs are much more likely to get introduced.
<br><br>
<span class=bodySubtitle>Logs</span><br>
You should provide a test log file on every development scorecard (pasted into the proper items).  If the log is large and / or confusing, feel free to cut out the passed tests, but all failed tests, error messages, and exceptions should be included.  You should also include logs of any documentation generation issues.
<br><br>
<span class=bodySubtitle>Code Redundancy and Helpers</span><br>
Submitters often use helper classes and methods to factor out certain common tasks such as parameter checking and SQL resource closing.  There has been some debate as to whether using helpers for parameter checking is good or not.  TopCoder's official stance is that using or not using a helper for parameter checking is a minor detail that should not affect a submission's score.

<H2>Tests</H2>
<span class=bodySubtitle>Standards and Documentation</span>
<br><br>
<span class=bodySubtitle>Kinds of Tests</span><br>
<i>Stress</i><br>
Stress reviewers should try to find the kinds of problems that only appear under heavy load. If a program leaks resources, the stress tests should find this. Similarly, if a component is supposed to be thread safe then the stress tests should try to find deadlocks and race conditions. Stress tests should also try to find inefficient implementations by timing them out.
<br><br>
<i>Failure</i><br>
Failure reviewers should concern themselves with whether the component handles error conditions as the design specifies. Trigger every kind of error the component should handle, and verify that the component handles it properly (throws the proper exception, doesn't leak resources, etc.)
<br><br>
<i>Accuracy</i><br>
Accuracy reviewers should find out whether the component produces the right results for any valid input. Find and test the boundary cases, just like you would in an algorithm competition's challenge phase.
<br><br>
<span class=bodySubtitle>Tests Should Run Together</span><br>
Tests should properly run together as a single batch.  It is not acceptable to mark a component complete if tests conflict with each other.  This is generally a sign that the setUp() and tearDown() methods are wrong and should be fixed.
<br><br>
<span class=bodySubtitle>Intermittent Test Failures</span><br>
Sometimes, a test fails only once every few runs.  Sometimes it'll fail once, and then run properly many times in a row.  These incidents must be investigated, since there are bugs that only show up rarely or when the system is under heavy load.  Just because a tests runs properly once does not mean that the code is correct.  As a corollary, always run each test suite several times.
<br><br>
<span class=bodySubtitle>Validity</span><br>
Tests should be valid for an indefinitely long period of time, as clients may wish to run the tests every time they deploy the component. Do not assume that temporary conditions (such as the existence of an external email address) will hold when the tests are run. 
<br><br>
Moreover, tests should be valid on any environment. Assuming that a certain file or directory is read-only, for example, makes a possibly invalid assumption about the environment the tests will be run on. A much better approach would be to first find out if the conditions to run the test are met, and then decide whether to run it or not. Other common (and troublesome) assumptions include assuming that the directory separator character is either '/' or '\', and any other type of hardcoding. 
<br><br>
One last comment about environment setup: When writing tests for a component, it is always better to replicate a real environment than to simulate it with mockup classes. For example, a component that uses database persistence should be tested using a real database whenever possible.
<br><br>
<span class=bodySubtitle>Configuration</span><br>
To address the above hardcoding problem, tests that need configurable information can use Java resource bundles, the Configuration Manager, etc. to specify it. You can use whichever is most appropriate for the situation, but try to minimize the dependencies you add to the component. For example, if it doesn't use Configuration Manager already then it's probably best not to use it for test configuration since that would add a component dependency. Common items to configure can be server addresses, file paths, database connection strings, etc. Test configuration files should reside under the test_files directory.
<br><br>
During final review, the primary reviewer should ensure that all tests are configurable and that, if possible, they all read from the same configuration file for database and other server connections.  That way, the user of the component does not need to configure four separate files just to get the database connection working.

<H2>Code Origin</H2>
Tests should never utilize a submitter's code. All code should be your own. The only exception to this is the following: when reviewing an upgrade component, you may choose to reuse the existing tests from the previous version (provided that they are still valid).

<H2>Upgrade Projects</H2>
Certain projects involve upgrading a previous component. When reviewing these projects, you should only concern yourself with the modifications (and not the pre-existing component). The submitter is only responsible for fixing any parts of the old component that needed to be changed to fit the new requirements. For example, if a sequence diagram that the submitter modified contained problems, those problems should be fixed as well. Sequence diagrams the submitter did not need to modify can be left as they were. The same applies to previous documentation on changed methods, etc. 
<br><br>
If a submitter chooses to improve aspects of the old component that are not addressed by the requirements, the best place to reward that extra work is the overall comments review item. We encourage submitters to overachieve, but the bulk of the scorecard is concerned with how the requirements are met and exceeded.
<br><br>
<span class=bodySubtitle>Trivial Issues</span><br>
Please concentrate on the core aspects of a design or development.  It is important to also consider the details, but you shouldn't be spending time chasing down issues that have no impact on the overall design or development.  For example, whether a Java interface's methods are explicitly declared public or not has no bearing on the readability of the code, or on the resulting bytecode after compilation.  This should not be considered an issue at all.

<H2>Common Sense</H2>
Sometimes you'll encounter a submission for which a scorecard item or maybe even one of these guidelines doesn't make sense. Perhaps a submission allocates no resources, making setup/teardown methods unnecessary. If your better judgment tells you that they are indeed unnecessary, a review answer like "None were needed." will do just fine. In general, apply common sense to all aspects of a review: if there is no good reason for something, then perhaps it shouldn't be done. If you have any doubts during a review, please contact the PM for your project.

</div>
            <br/>
            <br/>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
