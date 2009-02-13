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
            
            <h2>The Design Process - Section 2: appeals phase don'ts</h2>

			<p>
			<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
			By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a><br />
			<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
			</p>

<A href="/tc?module=Static&d1=features&d2=040405">...read Section 1</A>
<br/><br/>
<a name="introduction"></a>
<span class=bodySubtitle>Introduction</span><br/>
<A href="/tc?module=Static&d1=features&d2=040405">Last week</A> we explored how to select and submit a design.  Over the next two weeks we'll explain the phase I believe most designers have trouble with - the appeals phase.  I'll be splitting this discussion up into an overview with a list of don'ts (this week) and finish the discussion next week with a list of do's to help improve your appealing and avoiding the situations presented this week.
<br><br>
<span class=bodySubtitle>Overview</span><br/>
Since the online review process started, I've been on both sides of the appeals phase.  I've appealed 162 times in 37 components as the designer and have had my decisions appealed 59 times over 34 component as a reviewer.  I have noticed quite a few methods that designers take in an effort to either correct the reviewer's mistakes.
<br><br>
The thing I think most designers miss is that the reviewer is a human being with a distinct personality that usually has experience both in designing and in reviewing.  Because of that, the reviewer will certainly have their own, possibly opposing, design philosophy and outlook on what a 'proper' design should be.  You need to read the full review prior to appealing to gain an understanding of what the reviewer thinks.  Once you understand that, you can 'frame' your appeal (ie the language used, the context given, etc) to have the reviewer react more positively to your appeal.  
<br><br>
<span class=bodySubtitle>Don't use an aggressive tone</span><br/>
I see this often and it usually comes with wording like '... you are wrong …' or '… your reasoning is flawed …'.  These type of appeals point right to the heart of why they are universally wrong and why you must treat the reviewer as a regular person with emotions.  
<br><br>
This type of appeal is really not an appeal but more of an accusation.  You're accusing the appealer of some lack of knowledge or lack of experience and immediately put them into a defensive mindset. By putting the reviewer into a position where they will actively defend their score, you pretty much reduce your chances of a better score to zero.  Secondly, the reviewer will likely take offense at the accusation and tend more towards rejecting not only the specific appeal but also other appeals.
<br><br>
Often time than not, the reviewer does have the knowledge with the area and/or real life experience and does have perfectly valid reasons for their score and comments.  For those non-native English-speaking designers, I (and believe other reviewers also) personally try to understand that it may simply be a translation issue and try not to react to it strongly - however, I still strongly recommend trying to stay away from wording like that because it probably still will negatively impact what you are trying to appeal.
<br><br>
<span class=bodySubtitle>Don't challenge everything</span><br/>
"Since there is a lot of appeals, looking for a better score here" - anonymous designer.  While I know the designer was jesting with this statement (and it did give me a good chuckle), it illustrates well the thinking behind some appeals.  There are some designers that simply challenge everything that isn't a 4 - using any possible explanation.  The idea here is that if you challenge a lot, you're bound to get some reversals.  There appears to be no downside to this strategy because, unlike the algorithm challenge phase, there is no point loss if you lose.
<br><br>
I think this strategy is not only ineffectual, but I believe it's very detrimental to any 'real' appeals.  A reviewer, like the designer, has only a limited amount of time they are able to put into the review process.  Each appeal takes time for the designer to understand the appeal, go back to evaluate their original decision and then issue a final decision with appropriate reasoning.  With a large number of appeals, the reviewer is more likely to put in less time on each appeal and the designer generally uses weaker arguments.  I think that these reasons combine to reinforce the reviewer's belief that they (the reviewer) was originally correct, that the designer is simply trying to grasp for any point score and will be of the mindset to more readily reject the appeals without giving them serious consideration.
<br><br>
The same anonymous designer who made the comment above also illustrated another risk in this method.  In appealing so many aspects of the design, it forces the reviewer to go back and take a look at the particular area in more depth.  In this case, the appealer ended up lowering their overall score coming out of the appeals phase because the area they pointed out (in proving out their point) happened to have an error that I had originally overlooked.  That error happened to deal with the same exact question they appealed and fell squarely into a lower rating's category (as defined by the guidelines).  The result was definitely not the intent of the designer.
<br><br>
<span class=bodySubtitle>Don't try delaying tactics</span><br/>
A delaying tactic is in the form of 'this is easy to fix in final fixes and I should not be marked down for it'.  The hope is that the reviewer will see that the item is really inconsequential and reevaluate their assigned rating.  There are a few review questions that this seems common on - the component specifications having spelling errors, the associations not being labeled right, diagram colors not being correct and on the final overall question (in the form of 'everything is easy, why not bump the score up').  
<br><br>
While I agree that most of these simply errors that are easily correctable, they are still errors in what was submitted.  These appeals get rejected for two reasons.  The most obvious is that the reviewer guidelines pretty well state that these types of errors fall into specific rating categories and aren't really subject to debate.  Reviewers should not ignore these guidelines and should be consistent in their application of them.  But more importantly, the assigned rating by the reviewer is not on based on what the design can become given more time, but on what was submitted.  The reviewer would be unfair to other competing designers if they were to give you a better score if you were given 'more time' (in the form of final fixes).
<br><br>
I try to universally deny these types of appeals and have noticed (during aggregation phase) that other reviewers do the same.  You'd be better off concentrating on the real appeals than trying any sort of delay action.
<br><br>
<span class="bodySubtitle">Next Week</span><br/>
We'll explore the proper way to frame the appeals to avoid the above situations and how to successfully appeal mistakes.
<br/><br/>
<A href="/tc?module=Static&d1=features&d2=041905">...continue to Section 3</A>
            

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
