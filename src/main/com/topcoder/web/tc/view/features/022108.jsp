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
    <tc-webtag:forumLink forumID="519158" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Computerworld's "Rock star coders" profile: Pops</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/marutib_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22685759" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>
--%>

<br clear="all">

<p><em>On January 22, 2008, Computerworld ran an <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='feature_022108' />">article</a> about various TopCoders and how programming has affected their lives.  The following is the full Computerworld interview with <tc-webtag:handle coderId="119676" context="design"/>, from which portions were used in the article.</em></p>

<br />
<p><strong>Q: How did you become a coder?</strong><br />
A: Largely in part to my Dad.  He was a professor at Purdue University and introduced me to the Dec/VAX system they had running (and in particular - a computer game!).  After that, I saved up my money and was able to buy one of the first TRS-80s from Radio Shack.  I found I had a knack for programming by learning assembler and writing a few computer games myself - one of which actually was sold by a local game shop.  Later on, I enjoyed one of the first computer labs in a high school and continued one from there (from college directly into the industry).</p>
<p><strong>Q: How many hours per day do you code or practice?</strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/Pops_big.jpg" /><br /><span style="padding-left:55px"><tc-webtag:handle coderId="119676" context="design"/></span></span><br />
A: In addition to my regular job, I've spent up to 20 hours a week doing other 'things' (after my kids and wife go to sleep!).  Either I spend the time doing independent contracts for clients or spending time on competitions (mainly design competitions now and days).</p>
<p><strong>Q: Challenges/successes you've had finding ways to get paid for your talents.</strong><br />
A: I've always stayed focused on my main goal - how I can make as much money as possible on an hourly basis and live by my two rules:  never burn a bridge and always explore opportunities.  I started out from college with a chip on my shoulder and quickly found out that the things you thought were important (tight coding, being quick and clever) simply aren't (at least back when I started out).  I finally clued into what companies were looking for (someone good but who needs to communicate and listen well) and did a few years at a large corporation.  While at that corporation, I aimed to achieve as many internal 'awards' as possible because I knew those would be line items on my resume going forward.   My next employer was impressed by that. I got a really good jump in salary and responsibilities.  It's around this point that I realized that I don't make a good employee - I didn't like someone on the other side of the desk telling me what I would be making next year (contradictory to my main goal) nor did I like the whole 'career path' thing.  I made the jump to consulting and eventually independent consulting - both of which had much higher salaries and by not burning bridges - I eventually had a large network of people to look for jobs with (plus since they knew both how I work and my skills - I got premium rates even through the tech bubble burst). Currently, I'm back to being an employee for a Wall Street startup working on some financial systems - which really gives me the best of both worlds, a good salary and a lot of independence.</p>
<p><strong>Q: Toughest job or coding challenge you've met.</strong><br />
A: From a coding standpoint, I'd say that nothing was very challenging but I've had a lot of interesting jobs - integrating mainframe systems and pc systems, updating legacy systems, creating commodity/currency trading systems, etc.  However, the toughest challenge I've always found was interaction with the client community. I've had jobs where the client community didn't even know what they wanted to do, where I've had to help define common business practices, where I had to work with people (and teams) that I knew would be fired once the system came online, where clients' communication was bad, the clients themselves were difficult or unreceptive and where various stakeholders had different ideas or, sometimes opposite, goals for the system - all of which needs to be considered and affects the system that eventually gets built.</p>
<p><strong>Q: What do you love about coding?</strong><br />
A: Creating - it's as simple as that.  I absolutely love starting with a blank page, going through an iterative build process and seeing the end product run.  I still find it surprising when something runs the way I wanted it to and still get joy from what can be done on computers.</p>
<p><strong>Q: What do you hate about coding?</strong><br />
A: Computers - can't stand them actually.  What other profession is there that you interact with a mindless box for 8 hours having it tell you that you did something wrong but not tell you what!  How frustrating is that!</p>
<p><strong>Q: What hobbies/interests do you have other than coding?</strong><br />
A: I love working on my house (similar to coding - I'm creating something!).  If I ever quit the computer industry - I'd easily enter the building industry. I've gutted bathrooms, moved windows/doors, done electrical, plumbing (which I confess I'm not good at!), framing - you name it.  My current project is finishing off my walk-up attic and is easily the largest job that I've done yet.</p>
<p><strong>Q: We'd also like to talk about benchmarks that the industry uses (either officially or not) to determine the "who's who" among coders. Do you have any parameters in your own mind by which you measure "star coders," as well as thoughts on the characteristics of this 'culture' of developers?</strong><br />
A: Here's where I think there is a bit of disconnect with contests and the industry in general.  While names are certainly known in the competitive and academic communities - I think it's rare for company X to know about those names (unless that company has been involved in sponsorships - and even then I doubt HR personnel are involved).  I think the "who's who" still comes down to local networking and local contacts.  The contests make good line items on resumes and certainly are talking points to recruiters - but name recognition is usually not part of it.  I think the industry still heavily weighs on local 'chatter' to determine who is considered good or not.</p>
<p><strong>Q: Also, if you have any parameters in your own mind by which you measure "star coders," we'd love to hear them, as well as thoughts on the characteristics of this 'culture' of developers.</strong><br />
A: When I look around for someone - I apply look for the following things:
<ol>
    <li>Not attached to technology.  There are those that think language X should always be used or have very strong feelings towards something.  I see this as trouble because the person is single minded and not flexible</li>
    <li>Sees the forest, the trees, the bark, the ants.  A great coder can grasp the big picture, understand the structure and implement it with a detailed vision.</li>
    <li>Willing to share.  Really great coders also make great mentors because they like discussing - what they did, why they did it and alternative ways of doing it.</li>
</ol>
</p>
<p><strong>Q: Would you rate as the very best those coders who are fast and brilliant only, or would you say they also need to be equally adept at working with people (to understand the needs of the program)?</strong><br />
A: I really say it depends on the position and employer.  Fast and brilliant people simply die away at large corporations because they will be part of a larger team that cannot move as quickly as the individual person and that person is less likely to have the want to conform to the corporate standards (on languages, writing styles, documentation, etc).  For smaller corporations, this is less of an issue.  However, unless they are a single individual team - I think 'people skills' are an absolute must.  I'd much rather have a less fast or brilliant person if that person is willing to work with others, listen to alternative ideas and basically - don't think the way it should be done is the only way.  Regardless of how bright you are - there is always room for learning.  Sometimes doing things you think are absolutely wrong provide the best learning.</p>
<p><strong>Q: Are there certain coders who grow nearly famous, for instance by winning lots of contests?</strong><br />
A: Absolutely - <tc-webtag:handle coderId="144400" context="algorithm"/> is a great example.  He is well known by a large community of people for his accomplishments in contests and even had a local song written about him!  I've personally met him and have to admit he's got a great personality to boot!</p>
<p><strong>Q: Is the world of 'star coders' small enough that certain names are very recognizable by all?</strong><br />
A: Another absolutely.  <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/> and even Nathan Bronson [<tc-webtag:handle coderId="152073" context="algorithm"/>](who's largely been absent for a number of years) are certainly recognizable.  However, the real question is how recognizable are they outside the competition/academic circles.  While I think some companies certainly are aware of names like those (especially those that sponsor the tourneys) - I really think that the name recognition is a lot less.</p>
<p><strong>Q: Is it true that some coders enter contests simply because they know another coder is in the contest, and they want to be evaluated by competing with that person?</strong><br />
A: I think that there are a few reasons why - you know someone that is competing and they convince you to try it, you have people that do it for the pure pleasure of it, you have people that do it because it's a wonderful learning experience (both in discussing and trying out new ideas), you have people (like me) who tried it because there was money involved.  I think that if university placement centers would become creative and understand the value of it - it would be a wonderful way for them to get students involved so they have proof of skills to put on their initial resumes.</p>



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
