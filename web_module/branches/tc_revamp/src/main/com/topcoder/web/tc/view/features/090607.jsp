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
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517256" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">College admissions and the "TopCoder edge"</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/einstein41389_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21931776" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">
<p><em>A TopCoder member since May 2006, <tc-webtag:handle coderId="21931776" context="algorithm"/> begins his college career at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.harvard.edu/' refer='090607'/>">Harvard University</a> this fall. Here he discusses how he used his TopCoder experience while applying for college, and why you may want to do the same.</em></p>

<p>The college admissions process today is becoming more and more cutthroat. Applicant numbers are at record highs and acceptance rates are at record lows for the most prestigious institutions. In 2007, for example, Harvard <a target="_blank" href="<tc-webtag:linkTracking link='http://colleges.usnews.rankingsandreviews.com/usnews/edu/college/rankings/brief/t1natudoc_brief.php' refer='090607'/>">accepted</a> just 9% of applicants, and MIT <a target="_blank" href="<tc-webtag:linkTracking link='http://web.mit.edu/newsoffice/2006/usnews-undergrad.html' refer='090607'/>">accepted</a> 14%. So, how do you distinguish yourself from the thousands and thousands of applicants you might encounter at such an institution? This is a tough question &ndash; and one that has as many answers as there are successful applicants &ndash; but one activity that can certainly give you an edge is TopCoder. In this article, I will cover using TopCoder in three specific areas of the process: the resume, the essay, and the interview.</p>

<p><span class="bodySubtitle">The Resume</span><br />
If you've looked at an application lately, you have probably found yourself looking at the half-page of space dedicated to your list of activities. How are you supposed to fill up all those lines if you can only think of a handful of things? You may be tempted to start fluffing up your sentences with words like &quot;implemented&quot; or &quot;utilized,&quot; or you might start listing &ldquo;stretch&rdquo; activities, implying things you did once (or maybe just thought about doing) were a significant part of your life. </p>

<p>Don&rsquo;t fret &ndash; by reading this article, and otherwise participating in the TopCoder community, you're already doing something that you can take credit for. </p>

<p>Why put TopCoder on your resume? Simple: Highlighting your participation in TopCoder shows that you are passionate about <em>something</em>. It shows that you will take free time and devote it to practice, or to helping others solve problems, or to competing in an SRM, and you actually find it fun. Colleges are impressed by this. Remember, they are looking for someone who is very well rounded and they are also looking for someone who sticks out in the sea of paper they have lying in their offices. Not many applicants will mention TopCoder, and if you capitalize on the passion and dedication you have to it, you will score major points. </p>

<p>Quick note: When typing out your college resume, which you will most likely attach to your applications, be sure to pick a format that will allow you to put in a sentence or two explaining what you did in that activity. Admissions officers may not know much about TopCoder or other coding activities, so a little explanation goes a long way. </p>

<p><span class="bodySubtitle">The Essay </span><br />
You could write a book about all the different ways one could write their college essay (and <a target="_blank" href="<tc-webtag:linkTracking link='http://www.amazon.com/Writing-College-Application-Essay-Acceptance/dp/0064637220' refer='090607'/>">people have</a>), and people have started all sorts of gray-area &quot;essay editing&quot; businesses on the Web. What's the big deal? If you've got good grades and scores, does it really matter?<strong></strong></p>

<blockquote>&quot;As for the relative importance of the essay, there's no exact answer, but in my opinion, we care a lot. MIT doesn't assign each component of the application a specific weight, and then calculate your 'grade.' Rather, we consider an entire application at once, which helps us evaluate you as a person and not just the sum of your parts. I personally feel the essay is the most important part of your application, since you have the chance to open up about something that matters to you.&quot; &ndash; Mitra L., <a target="_blank" href="<tc-webtag:linkTracking link='http://www.mitadmissions.org/topics/apply/the_freshman_application/you_cant_make_mit_love_you_if.shtml' refer='090607'/>">MIT Admissions</a></blockquote>

<p>Every year when applicants sit down to start writing their personal statements and college essays, many of them are at a loss as to what the heck to write about. If you're searching for some sort of novel experience that you can include, TopCoder could work beautifully. </p>

<p>What better to write about than that 2:00 AM SRM when you won your room, or the time your wireless connection died and you ran to a friend&rsquo;s house with your laptop? Experiences like these bring you to the front of the pack. </p>

<p>The key here is to emphasize your strengths. If you talk about that solution you didn&rsquo;t quite get, or that challenge that you failed, be sure to talk about what you learned from it, how it affected you in the future, and so forth. You could talk about the practice time you put in, or someone on TopCoder who has mentored you. Basically, just be positive. You already have quite a novel topic in mentioning TC, so be sure to give it a positive spin that shows how dedicated you really are. </p>

<p><span class="bodySubtitle">The Interview</span><br />
Expert opinions vary on just how important college interviews really are. For our purposes, let's set aside informational interviews, or alumni interviews &ndash; which are really more for recruiting purposes than a part of the admissions process &ndash; and focus on evaluative interviews in which the college actually cares how you perform. </p>

<p>If you have the chance to participate in an interview like this, don't pass it up. Doing an interview allows the admissions officers to put a face and a personality to the name and number on their sheet of paper. So, if the interview is optional at your school, I would strongly encourage you to schedule it anyway. </p>

<blockquote>&quot;Enthusiasm is crucial. Students at top colleges are excited, passionate, enthusiastic people (or at least the interviewers like to think so). They participate. They are engaged.&quot;- About.com <a target="_blank" href="<tc-webtag:linkTracking link='http://collegeapps.about.com/od/admissionsinterviews/a/readyinterview.htm' refer='090607'/>">College Admissions</a> guide</blockquote>

<p>How can you use TopCoder in an interview? Talk about it, of course! For some of my interviews, I had to submit a pre-interview resume that listed different activities, and TopCoder was always one of the first things on the resume I was asked about. Even if you don&rsquo;t have this option, if the interviewer ever brings up free time, that is your opportunity to go into your time on TopCoder. At almost every interview where I mentioned it, I was asked by the interviewer to go into greater depth about it.</p>

<p>When the topic comes up, don&rsquo;t be afraid to get technical with the interviewer. This is something that you're supposed to be passionate and knowledgeable &ndash; if you only talk about it in vague generalities, it may not seem that you really know it that well. There is a limit, of course, but you can get fairly detailed as to the format of the contest. If you're talking about an SRM, you can discuss the match structure: coding phase, challenge phase, system tests. Talk about the pressure to submit the three problems within time, the adrenaline rush you get from a passing submission, the satisfaction of finding a bug in another person&rsquo;s code. I was told by more than one interviewer, when I spoke with them after the whole process was done, that when I started talking about TopCoder and other science/math related topics I lit up with enthusiasm. They also told me that this was one of the main reasons they gave me highly positive reviews. So, again, if you are passionate and dedicated to TopCoder, be sure to mention it.</p>

<p>All of these techniques can give you an edge in the college admissions process. With college admissions, though, <em>nothing</em> is a sure thing. Do the best you can in every aspect of the process, and use every resource you can think of to your advantage (including consulting with current students and alumni on the TopCoder forums), and you will be that much further along in your quest for a great college education. </p>


<p><strong>Related:</strong><br />
<a href="/tc?module=Static&d1=features&d2=062606">So I see you're a member of TopCoder...</a></p>

<p>&nbsp;</p>
<p>&nbsp;</p>
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
