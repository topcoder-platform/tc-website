<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Review Guidelines</title>

<jsp:include page="../../../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="compDocumentation"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

<div class="guide">

        <h2>Reviewer Guidelines</h2>

		<p>
		The following article attempts to address a number of concerns that affect the review boards.  In general, most of these issues arise from differences in the interpretation of the review process and scorecards.  Hopefully, these clarifications will help eliminate said differences and provide a more consistent set of reviews for each project.  Other items in this article address communication between the review board members and TopCoder, and other points of interest.
		</p>

		<ul>
		<li><span class=bodySubtitle>1 Review Phases</span><br/>
			<ul>
			<li><span class=bodySubtitle>1.1 Screening</span><br/>
			During screening, the primary reviewer needs to answer one question: is a particular design worthy of being reviewed or not?  When answering this question, there are several things to take into account.  If a submission has a chance of passing review, it should pass screening.  Submissions that show a significant amount of work should also be allowed to move on to review, since they certainly deserve a more in-depth analysis than screening can offer.  On the other hand, obviously incomplete or incorrect submissions would benefit little from further review.
			<br/><br/>
			<li><span class=bodySubtitle>1.2 Review</span><br/>
			Some screeners go as far as sending the PM a short email with a one-line comment per submission, telling us what's right or wrong with them.  We take those opinions very seriously, and they are appreciated.
			<br/><br/>
			During review, all reviewers need to focus on assigning scores that are fair and consistent with the scorecard guidelines.  It is very important that you justify all of your scores, since any point may be appealed.  When justifying a score, be specific.  The submitter will only have one chance to appeal, and if your original justification was "sloppy design" the appeal will likely be "can you be more specific?"  Your appeal response will then explain what's wrong, and the submitter will not be able to do anything else.  If you score a submission down without making it perfectly clear what is wrong with it, the appeals phase becomes impossible to do properly.
			<br/><br/>
			</li>
			<li><span class=bodySubtitle>1.3 Appeals</span><br/>
			In the appeals phase, you will sometimes find that an appeal covers more than one submission.  For example, a fix to your test cases can affect the score of every submission you reviewed.  Since you can only change scores when somebody submits an appeal, you might not be able to fully correct this problem.  In this case, your best option is to email the PM and explain the problem.
			<br/><br/>
			If the review phase was done properly, there shouldn't be that many appeals.  Remember that during appeals you only need to justify (or correct) matters of fact...basically, items where you made a mistake.  The submitter will not be able to appeal matters of opinion, which leads us to the next point...review based on fact (requirements).
			<br/><br/>
			</li>
			</ul>
		</li>
		<li><span class=bodySubtitle>2 The role of the Reviewer</span><br/>
		Remember that your role is to review a design or development, not to do it.  Oftentimes you will encounter a submission that does things differently than you would have, and the temptation to score the submitter down can be strong.  You must avoid this at all costs:  review based on how the submission meets the requirements, not on how it meets your own ideal design or development, or how it compares to other submissions.  If you have suggestions on how to improve the component, the proper place to make them is in the component's collaboration (customer) forum.  Alternatively, you can write them down as comments in the component review.  These suggestions are very welcome, and we use them for the next version of the component, but they have no place in the review process.
		<br/><br/>
		</li>
		<li><span class=bodySubtitle>3 Scoring</span>
		<br/><br/>
			<ul>
			<li><span class=bodySubtitle>3.1 Cascading scores</span><br/>
			Sometimes a project will have a problem that several different review items address.  In this case, the decision on how to score is up to you.  A very small problem probably deserves to be scored down only once, while a large problem probably justifies adjusting the score in multiple items.  When doing this, please explicitly reference the item that the score is cascading from so the submitter can see where the score comes from.  When deciding which item to score down (or up, this principle also applies to enhancements), you should use the more specific items first.
			<br/><br/>
			</li>
			<li><span class=bodySubtitle>3.2 Review item wording</span><br/>
			As mentioned above, review items should be worded with enough detail to make an appeal possible.  It must be possible to word an appeal in such a way that your appeal decision will be clear, and the only way to do this is for the original review item to be specific and detailed.
			<br/><br/>
			</li>
			</ul>
		</li>
		<li><span class=bodySubtitle>4 Design</span>
		<br/><br/>
			<ul>
			<li><span class=bodySubtitle>4.1 Sub-components</span><br/>
			Sometimes a design includes a request for one or more new components.  The submitter does not need to provide designs for the sub-components, but he or she does need to explain what the current project will need from the sub-component, and why the sub-component is useful and generic enough to merit a separate project.
			<br/><br/>
			</li>
			</ul>
		</li>
		<li><span class=bodySubtitle>5 Development</span>
			<br/><br/>
			<ul>
			<li><span class=bodySubtitle>5.1 Scoping</span><br/>
			If a submitter adds helper methods or classes, they should scope them as narrowly as possible while maintaining their useability.  For example, if a helper class absolutely has to be public (to span across packages), then it is fine to make it public.
			<br/><br/>
			</li>
			<li><span class=bodySubtitle>5.2 Helpers</span><br/>
			It is generally a good idea for the developer to add helper classes and methods in order to reuse code.  When reviewing these, take into account their elegance and suitability.  A method that checks for null arguments makes very little sense and probably detracts from the readability of the code since it forces a reader to look up yet another method, and it only saves one line of code.  Common sense is the best way to approach this.
			<br/><br/>
			</li>
			<li><span class=bodySubtitle>5.3 Resource management</span><br/>
			Components should manage their resources wisely.  Just because Java and .NET use garbage collection doesn't mean that resource deallocation can be ignored.  For example, a component that uses JDBC should close it's Statement and ResultSet objects when they are no longer needed.  If these references are allowed to leak, they might stick around in the VM until it's restarted.  Reviewers should keep this in mind when examining submissions (and designing stress tests).
			<br/><br/>
			</li>
			<li><span class=bodySubtitle>5.4 Tests</span>
			<br/><br/>
				<ul>
				<li><span class=bodySubtitle>5.4.1 Purpose</span><br/>
				Reviewer tests should address the specific area that they are intended to handle.  In general, they should address the API functionality rather than individual methods.
				<br/><br/>
				Stress reviewers should try to find the kinds of problems that only appear under heavy load.  If a program leaks resources, the stress tests should find this.  Similarly, if a component is supposed to be thread safe then the stress tests should try to find deadlocks and race conditions.  Stress tests should also try to find inefficient implementations by timing them out.
				<br/><br/>
				Failure reviewers should concern themselves with whether the component handles error conditions as the design specifies.  Trigger every kind of error the component should handle, and verify that the component handles it properly (throws the proper exception, doesn't leak resources, etc.)
				<br/><br/>
				Accuracy reviewers should find out whether the component produces the right results for any valid input.  Find and test the boundary cases, just like you would in an algorithm competition's challenge phase.
				<br/><br/>
				</li>
				<li><span class=bodySubtitle>5.4.2 Validity</span><br/>
				Tests should be valid for an indefinitely long period of time, as clients may wish to run the tests every time they deploy the component.  Do not assume that temporary conditions (such as the existence of an external email address) will hold when the tests are run.
				<br/><br/>
				Moreover, tests should be valid on any environment.  Assuming that a certain file or directory is read-only, for example, makes a possibly invalid assumption about the environment the tests will be run on.  A much better approach would be to first find out if the conditions to run the test are met, and then decide whether to run it or not.  Other common (and troublesome) assumptions include assuming that the directory separator character is either '/' or '\', and any other type of hardcoding.
				<br/><br/>
				A last comment about environment setup.  When writing tests for a component, it is always better to replicate a real environment than to simulate it with mockup classes.  For example, a component that uses database persistence should be tested using a real database whenever possible.
				<br/><br/>
				</li>
				<li><span class=bodySubtitle>5.4.3 Configuration</span><br/>
				To address the above hardcoding problem, tests that need configurable information can use Java resource bundles, the Configuration Manager, etc. to specify it.  You can use whichever is most appropriate for the situation, but try to minimize the dependencies you add to the component.  For example, if it doesn't use Configuration Manager already then it's probably best not to use it for test configuration since that would add a component dependency.  Common items to configure can be server addresses, file paths, database connection strings, etc.  Test configuration files should reside under the test_files directory.
				<br/><br/>
				</li>
				<li><span class=bodySubtitle>5.4.4 Code origin</span><br/>
				Tests should never utilize a submitter's code.  All code should be your own.  The only exception to this is the following:  when reviewing an upgrade component, you may choose to reuse the existing tests from the previous version (provided that they are still valid).
				<br/><br/>
				</li>
				</ul>
			</li>
			</ul>
		</li>
		<li><span class=bodySubtitle>6 Upgrade projects</span><br/>
		Certain projects involve upgrading a previous component.  When reviewing these projects, you should only concern yourself with the modifications (and not the pre-existing component).  The submitter is only responsible for fixing any parts of the old component that needed to be changed to fit the new requirements.  For example, if a sequence diagram that the submitter modified contained problems, those problems should be fixed as well.  Sequence diagrams the submitter did not need to modify can be left as they were.  The same applies to previous documentation on changed methods, etc.
		<br/><br/>
		If a submitter chooses to improve aspects of the old component that are not addressed by the requirements, the best place to reward that extra work is the overall comments review item.  We encourage submitters to overachieve, but the bulk of the scoresheet is concerned with how the requirements are met and exceeded.
		<br/><br/>
		</li>
		<li><span class=bodySubtitle>7 Feedback</span><br/>
		If there's anything you don't agree with in the component process, please let us know.  Many aspects of the process have already been fine tuned thanks to feedback from our members, and we are always looking to improve.
		<br/><br/>
		</li>
		<li><span class=bodySubtitle>8 Common sense</span><br/>
		Sometimes you'll encounter a submission for which a scorecard item or maybe even one of these guidelines doesn't make sense.  Perhaps a submission allocates no resources, making setup/teardown methods unnecessary.  If your better judgment tells you that they are indeed unnecessary, a review answer like "None were needed." will do just fine.  In general, apply common sense to all aspects of a review:  if there is no good reason for something, then perhaps it shouldn't be done.  And this brings us to the last point in these guidelines...
		<br/><br/>
		</li>
		<li><span class=bodySubtitle>9 When in doubt</span><br/>
		If you have any doubts during a review, please contact the PM for your project.
		</li>
		</ul>
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

<jsp:include page="../../foot.jsp" />

</body>

</html>
