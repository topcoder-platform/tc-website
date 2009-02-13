<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="../script.jsp" />
<style type="text/css">
    .code
{
	width: 500;
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">
            
            <h2>The Design Process - Section 4: the wrap up...</h2>

			<p>
			<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
			By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a><br />
			<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
			</p>

<A href="/tc?module=Static&d1=features&d2=041905">...read Section 3</A>
<br/><br/>
<a name="introduction"></a>
<span class="bodySubtitle">Introduction</span><br/>
In this final part of the design process series, we explore what should be done on a loss and what to expect after a win!
<br><br>
<span class="bodySubtitle">So you lost...</span><br/>
The process can feel very frustrating if you lose, especially given the amount of time spent creating and arguing the design.  Although I agree it's frustrating, the process also gives you plenty of opportunities to learn where the weaknesses were and how to prepare for the next design.  
<br><br>
The first opportunity is to study the text of the design reviews and appeal responses.  Pay attention to all responses - both the good and the bad.  The reviewers should give plenty of feedback in what was wrong, what weaknesses the design had, what strengths the design had and potentially what could be improved.  Write down the top 3 things that were done correctly and incorrectly - then use that as a cheat sheet during the next design.
<br><br>
The second opportunity (and probably the best one) is to wait until the winning design goes into development.  Download the development distribution and study how the design differs from the one you submitted.  Review the aggregated scorecard of the winning design to understand the winning designs weaknesses.  Particularly, compare and contrast against your design to see how the winning designer addressed the various issues and specifications.
<br><br>
Both those opportunities should provide a lot to think about and give you insights on your future designs - hopefully pushing you into the win column!
<br><br>
<span class="bodySubtitle">Final Fixes</span><br/>
If you have won and after the reviewers aggregate their comments, you must fix the required items and hopefully the recommended items.  First, review the aggregation results and post (in the design forum) any further clarifications of those items.  You should title the forum post "To xxx", where "xxx" is the reviewer who made the comment, and ask your question in the post.  As you are fixing the items, keep a log of the items that were fixed in a free-form text file called "FinalFix.txt".  Each fix should include what elements in the design were changed.  A typical file would look like:
<div class="sideNote">
> Missing Use Case for Widget Usage<br>
Added UC "Use Widget" and associated SD
<br><br>
> Rename Foobar to FooBar<br>
Changed name in CD, updated associated SDs and component spec.
<br><br>
> Implement a command pattern rather than a strategy pattern<br>
Successfully appealed and is no longer required
</div>
This file should appear in the docs directory and greatly helps guide the primary reviewer in approving your changes. 
<br><br>
While technically, the primary reviewer should be ensuring the thoroughness of the fixes - in reality, it's up to the designer to ensure the fix is fully integrated into the design.  Final fix changes are generally the cause of many issues in the development phase.  The designer is better off taking the extra time to ensure that final fixes are fully complete during this phase as opposed to the mess that will occur during development.
<br><br>
<span class="bodySubtitle">Development Phase</span><br/>
The objective of this phase is to provide the necessary support to allow the developer(s) to create a working implementation of the design.  The foremost thing to keep in mind is that it is a collaborative effort and not a "me versus them".  The process may appear a bit on the abusive side because all that is posted are bugs or weaknesses in the design.  Remember, the developers are in a competition and are simply trying to create the best implementation of the design.
<br><br>
<span class="bodySubtitle">Bugs</span><br/>
"Blasted developers!" - Pops.  No matter how good you believe the design is, the developer(s) will always find errors in the design.  Let me repeat, no design will be error free.  As designer, you will need to address those bugs in the forum in a timely manner.
<br><br>
When a developer posts a bug, the designer needs to fully understand what the developer is asking about (possibly through multiple follow-up's in the forum) and determine if the bug is truly a bug.  The designer needs to be careful here, some 'bugs' or 'flaws' pointed out by the developer will not actually be bugs but will be weaknesses of the design and/or the specifications.  These 'bugs' should be considered enhancement requests instead and are addressed in the next section below.
<br><br>
If the designer agrees that a true bug exists in the design, they should post a new forum message in the form of "IMPORTANT - xxx" where "xxx" is the title of the bug and the forum body describes both the bug and the fix (including what elements changed in the design).  By doing this, the bug and it's fix will have proper visibility to all developers and reviewers (versus being buried in a reply somewhere).   If the fix requires multiple items to change or has a fairly large scope, the designer should consider creating a new distribution for posting.
<br><br>
<span class="bodySubtitle">Enhancements</span><br/>
Feel free to discuss and debate enhancements with the developers - but in the end, deny the enhancement and ask the developer to suggest the enhancement in the customer forum instead.  This includes all enhancement requests regardless of how easy to implement or how much sense they make.  The reason for this is simple - the enhancement was likely not part of the original specifications and certainly not part of the design.  
<br><br>
If the enhancement was outside of the specifications, the enhancement must go through a PM to determine whether it's valid, whether the PM wants to follow that direction and what it's full scope should be.  If the enhancement is within scope of the specification but not addressed by the design, then the enhancement would not go through the formal review process that would determine if it's implemented properly or if it's even a good approach.  More importantly, enhancements (even the simple ones) tend to have a snowball effect on the design.  They tend to introduce inconsistencies or subtleties that the designer doesn't consider until the developers run into them - causing much larger problems for all parties involved.
<br><br>
Likewise, it's a bit unfair to the other developers to suddenly expand the scope of the project after they have signed up for the project.  Introducing something new could potentially be outside of the other developer's personal knowledge (and thus they would not have initially signed up for the component) or put the developer in a time crunch (if they had signed up for more than this component.  Either way, approving enhancements could potentially be unfair to all other developers and should generally be considered out of scope.  The proper way of handling these enhancements would be through a request in the customer forum and a future version of the component.
<br><br>
<span class="bodySubtitle">Implementation questions</span><br/>
Developers will occasionally ask questions that are part of their private implementation or within the scope of development (not design).  These questions generally revolve around a "how would you do it?" or "can this I do it this way?" context.  The designer can certainly respond to these types of messages with their opinion but should make it absolutely clear that their response is strictly a suggestion and is in no way a specification or requirement.
<br><br>
<span class="bodySubtitle">Wrapping it up</span><br/>
On the day before the development deadline (at least 12 hours before), you should post a summary of all the changes that occurred in the design.  The post should be labeled "CHANGE SUMMARY" and contain a line by line list of each item that was corrected and it's impact on the design.  If any changes occur after the post, simply reply to it with the new information.  This post will help the developers by giving them a quick checklist to ensure they didn't miss any of the fixes.  Likewise, it helps the development board understand how to review the development submissions reviewed.
<br><br>
<span class="bodySubtitle">Summarization</span><br/>
Hopefully this series of articles has given you a good insight into the whole design process and have provided good pointers to improve your handling of the process itself.  Good luck with your future designs.
        </div>
        <p><br/></p>
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
