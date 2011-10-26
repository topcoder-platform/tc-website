<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
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
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>Reviewing Software for Fun and Profit</strong></font><br />
                        Tuesday, August 3, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=156859"><strong>ivern</strong></a><br />
                        <span class="smallText"><em>TopCoder Staff</em></span></p>

                        
						<p><b>Introduction</b><br/>
						About one year and a half ago, I started reviewing components for TopCoder Software.  Since then, I've learned a lot about a number of previously unfamiliar technologies, earned over four thousand dollars in a month, and visited Boston for the 2004 TCCC...all working less than 20 hours a week on average!  During this time, my "real" job was being a college student, and my "real" decisions generally involved choosing between going to class or playing EverQuest.
						<br/><br/>	
						After about a year as a reviewer, I was so comfortable with the process that I would go on month long streaks where I just signed up for every single project that came up.  Being in school at the time, this essentially gave me a part time job that I could do from home whenever I felt like it.
						<br/><br/>	
						In this article, I will share some of my experience to help would-be software reviewers to maximize both their profits and their free time.
						<br/><br/>	
						<span class="bodySubtitle">Picking Projects</span>
						<br/><br/>	
						The first thing is picking what projects to work on.  When trying to decide what to review, it's best to calculate how many hours of work each project will require.  Once you become used to the process, a quick read of a component's requirements or design (both available on the TCS site) should be enough for you to gauge the complexity of each individual review.  You should consider how much material you will have to cover, and how familiar you are with the technologies involved.
						<br/><br/>	
						Another factor to consider is the number of submissions a project has.  Evaluating this is not as simple as it may seem:  more submissions means more work for the screener and potentially more work for the reviewers, but it also means that the pay will be greater.
						<br/><br/>	
						<span class="bodySubtitle">Tips and Tricks</span>
						<br/><br/>	
						The TopCoder Software process tries to provide a metric for how tough a project will be.  However, if you want to maximize profits and minimize hours of work you will have to learn how to gauge a project's difficulty yourself.  Once you master this art, you will find that reviews present you with less surprises and that you are able to budget your time much more efficiently.
						<br/><br/>	
						TopCoder does not care when or where you do your reviews, as long as they are done on time.  Pick the most comfortable time and place to work, and you will find that you get done much faster.  I did a good amount of my work at a coffee shop that had a wireless connection.  No matter who I talk to, I've never heard of anybody's office having a staff of waitresses to keep their tea cup full.  They had fantastic chicken Caesar wraps, too...
						<br/><br/>	
						If a project gets reposted and you have previously reviewed it, you should always try to sign up for it.  You are already very familiar with what is involved, and in the case of a development review you even have your test cases written.  In terms of payment per hours worked, it's hard to beat this situation.  Moreover, reposts mean a higher probability that the project will be completed-and that means another project for your royalty pool.
						<br/><br/>	
						For the same reason, it is a good idea to sign up for projects that you already know for any other reason.  For example, sometimes you sign up to submit a design or a development but are unable to finish the project in time.  If you sign up to review the project, you recover the time you spent understanding the requirements since you can use that knowledge in your reviews.
						<br/><br/>	
						Last, but not least, application projects can be the best source of review money.  Once you are familiar enough with the component process, try your hand at an application.  The process is very similar, but if you budget your time properly (by doing adequate research beforehand and knowing what to look for and where) these projects pay extremely well for the equivalent of a couple of evenings' worth of work.  My battle plan used to be to always have one application review active, and to fill the rest of my work time with component reviews.
						<br/><br/>	
						<span class="bodySubtitle">Caveats</span>
						<br/><br/>	
						Every now and then, a project will not go according to plan.  Sometimes, a lack of reviewers will delay the start of the review phase-forcing you to do your work at a different time than you originally planned.   Other times, the winning submitter will fail to address all issues during final fixes-forcing the primary reviewer to do a second final review.
						<br/><br/>	
						However, not all is bad news.  TopCoder understands that these delays are not the fault of the reviewer.  If the start of a review phase gets delayed, it's deadline is extended to make up for the lost time.  Therefore, you will be fine as long as your schedule is flexible enough to adapt to possible changes.
						<br/><br/>	
						<span class="bodySubtitle">Conclusions</span>
						<br/><br/>	
						Reviewing software for TopCoder can be a great source of money for people that do not want to spent large amounts of time working.  Whether you are looking for a part time job, or just want to make some extra cash on the side, if you are interested in software development then this job might be for you.
						<br/><br/>	
						</p>
                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
