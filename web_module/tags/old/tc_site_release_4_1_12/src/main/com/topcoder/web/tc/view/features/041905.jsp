<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
                <jsp:param name="level2" value="comp_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="comp_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right;"><tc-webtag:forumLink forumID="505849" message="Discuss this article" /></div>
<span class="bodyTitle">The Design Process - Section 3: appeals phase do's</span>

			<p>
			<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
			By&#160;<a class="bodyText" href="/tc?module=MemberProfile&cr=119676"><strong>Pops</strong></a><br />
			<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
			</p>

<A href="/tc?module=Static&d1=features&d2=041105">...read Section 2</A>
<br/><br/>
<a name="introduction"></a>
<span class="bodySubtitle">Introduction</span><br/>
<A href="/tc?module=Static&d1=features&d2=041105">Last week's article</A> demonstrated the top things not to do during the appeals phase.  This week's article will explore the inverse - specific things to do that will make the appeals more effective.  If the points from the prior week have been successfully avoided, then the reviewer should be in a neutral or receptive mindset.  The purpose then turns to provide the reviewer with the proper reasoning and enough information to overturn their original objections.    
<br><br>
<span class="bodySubtitle">Explain fully!</span><br/>
I've seen too many appeals that are a simple one or two line appeal.  These types of appeals generally assume that the reviewer has full knowledge of the design and the intentions behind the decisions within the design.  Unfortunately, this assumption simply is not true and rarely do these types of appeals succeed.  
<br><br>
While the reviewer does have a good understanding of the design, they will not have a deep understanding of it.  A reviewer spends about a tenth of the time reviewing the design as the designer did creating the design.  The reviewer won't see the iterations the design went through nor the decisions made that caused the iterations.  Likewise, the reviewer is not privy to all the little decisions the designer makes as they are putting the design together.  The reviewer will only see the end result of all those decisions and will be making decisions based on that end result. 
<br><br>
When the reviewer questions some aspect of the design, the designer needs to fully explain that aspect, the original intention of that aspect and any of the decisions leading up to that aspect within the appeal response.  Even if something appears obvious, that something may have been missed, overlooked or simply misunderstood by the reviewer.  
<br><br>
<span class="bodySubtitle">Review the question and guidelines</span><br/>
When preparing for an appeal, carefully read the question and the guidelines the reviewer should be using.  If the reviewer's comments are out of scope for the question or they applied the ratings guidelines incorrectly, appeal based on that.  Use the actual text from the question or guideline in the appeal and state specifics within the design that apply directly to that wording.
<br><br>
To state an example of this, look at the wording for the first question from the scorecard - "The design addresses all the requirements as specified in the requirements documents and/or the forum."  Alternatively, the entire score card can be found at http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=desReviewSample).  The reviewer may have missed a forum clarification on some requirement and can be appealed by pointing out the wording "… and/or the forum".  Then provide a link to the exact forum message along with information summarizing the message.  
<br><br>
Likewise in the rating guidelines for the same question, the guidelines clarify what a 'core requirement' means -  "…the component either cannot fulfill its goal or cannot provide value added service to the customer without those requirements…" If the designer believes that some aspect is a core requirement (or not a core requirement), the designer should point out that specific wording and show the specific elements within the design that would support the arguments.  The arguments should specifically show how the design could function (or couldn't function) without those elements.  Specific examples can be shown to illustrate why. 
<br><br>
<span class="bodySubtitle">Target your appeals</span><br/>
A 'targeted' appeal is to make a few, well selected appeals (usually at most 5 items).  You should target the obviously wrong items or areas of opinion difference.  If the reviewer has 'spread' an opinion over several questions, put your appeal in the one with the highest weight and refer all the others to it.  
<br><br>
I believe this method is very effective because both the reviewer and designer can concentrate on the specific points.  The designer generally will spend more time on the fewer appeals which translates into better arguments that are generally well thought out and articulated.  Reviewers are more likely to spend the proper amount of time understanding the arguments and are more likely to agree with them.
<br><br>
Likewise, the designer should study the weights attached to the questions.  Some questions, even when successfully appealed from 1 to a 4, have very minimal impact on the overall score (especially over 3 reviewers).  It's generally better to ignore these lower weighted items (regardless of how easy they would be to win) in favor of higher weighted items to concentrate both the designers and reviewers time and efforts.
<br><br>
<span class="bodySubtitle">Be Honest</span><br/>
There are many times where a reviewer will make a valid point about the design that even the designer has to admit is correct.  Be honest with yourself and admit that the design does contain mistakes (nobody will create a 'perfect' design).  Even if some angle can be dreamt up, don't bother appealing the opinion because it's essentially correct.  
<br><br>
<span class="bodySubtitle">Not enough information</span><br/>
Unfortunately there are times when the reviewer simply does not provide enough information to understand their concerns (similar to the first point made in this article).  Trying to appeal this is fruitless because you only have a single shot in the appeals process.   There are only two ways to address this:
<ol>
<li>If the reviewer consistently provided too little information, contact the PM (via the contact PM button in the project review page) and raise your concerns.  If proven out, maybe the PM will ask the reviewer to provide additional information.  Do not do this unless it's obvious that the reviewer consistently didn't provide enough information across all questions.</li>
<li>Remember that the reviewer probably did the same thing to any competing designs and it probably equals out in the end.  I would send an email describing the situation to the PM.  If enough feedback about a specific reviewer is generated, I'm sure the PM would clarify the situation to the reviewer.</li>
</ol>
<span class="bodySubtitle">Differences in Opinion</span><br/>
Many times the reviewer may suggest a different approach to the design or suggest additional things to make the design more flexible or easier to use.  Although the designer may disagree with the reviewer's approach, the reviewer's comments about their approach are perfectly valid as a scoring deduction.  However, if the reviewer made that approach a requirement and the original approach still met the requirements, then an appeal of the requirement (not the score) should be made.
<br><br>
There is really no way to tell if either approach is better when both approaches meet the requirements.  Because of that, the reviewer's approach should really be a recommendation instead.  The appeal should state the reasoning why the original approach meets the requirements and why either approach is just as valid.  If the reasons stated are strong enough (at least enough to outweigh any perceived weaknesses the reviewer perceives in the current approach), the reviewer may drop the requirement to a recommended level.    
<br><br>
<span class="bodySubtitle">Final Week</span><br/>
Next week will end this four part series on the design process.  That article will examine what you should do if you didn't win the design, how to properly handle the final fix phase and some tips on how to handle the development phase (blasted developers, always finding problems!).
<br/><br/>
<A href="/tc?module=Static&d1=features&d2=042505">...continue to Section 4</A>
            

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
