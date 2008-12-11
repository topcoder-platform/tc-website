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
 
<span class="bigTitle">Computerworld's "Rock star coders" profile: SnapDragon</span>
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

<p><em>On January 22, 2008, Computerworld ran an <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='feature_020708' />">article</a> about various TopCoders and how programming has affected their lives.  The following is the full Computerworld interview with <tc-webtag:handle coderId="272072" context="algorithm"/>, from which portions were used in the article.</em></p>

<br />
<p><strong>Q: How did you become a coder?</strong><br />
A: I've been coding since I was too young to remember, slowly making my way from BASIC on my TI 99/4A to Logo to Pascal to C++.  When I was young, I competed yearly in a Calgary programming competition where students got to show off programs they'd written that year.  I think I owe a lot of my skill to that early interest.</p>
<p><strong>Q: How many hours per day do you code or practice?</strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/SnapDragon_big.jpg" /><br /><span style="padding-left:30px"><tc-webtag:handle coderId="272072" context="algorithm"/></span></span><br />
A: These days, working at Google, I seldom have time to practice for coding competitions, though of course I'm always coding. :)  In my University days, when I was eligible for the ACM team (and afterwards, when I was helping to train the ACM team) I would often spend 5+ hours a day just practicing contest questions.  I think I owe all my success in competitions to that intensive training.</p>
<p><strong>Q: Challenges/successes you've had finding ways to get paid for your talents.</strong><br />
A: Honestly, as a contest veteran (with ACM and TopCoder victories under my belt) it's not hard at all getting a well-paying programming job.  Programming doesn't come naturally to humans, and there are a lot of bad programmers out there who are only in the field for the money.  Companies will pay very generously to identify and nab the proven good ones.  As TopCoder's well aware. :)</p>
<p><strong>Q: Toughest job or coding challenge you've met.</strong><br />
A: My real-life work is more tedious, and less challenging, than the difficult, but abstract, problems I see on programming contests.  So I'd say coming 3rd in the ACM World Finals is the result I'm most proud of.</p>
<p><strong>Q: What do you love about coding?</strong><br />
A: Coding competitions.  The satisfaction of getting a tough problem, thinking through the theory, implementing a program, and then learning you've solved it perfectly is fantastic.  Contests isolate the essence of what's fun in coding.</p>
<p><strong>Q: What do you hate about coding?</strong><br />
A: "Software engineering".  Most real-world programming doesn't involve any new algorithm, doesn't require any cleverness; it merely involves implementing some known solution and making sure it's robustly commented and tested.  It requires self-discipline simply because it's so boring!</p>
<p><strong>Q: What hobbies/interests do you have other than coding?</strong><br />
A: I play a lot of videogames, fiercely analyzing and dissecting their patterns.  I also like to solve puzzles (crossword puzzles, Sudoku-style logic puzzles, etc.), and I compete internationally in that, too.  Whatever my hobbies, I usually find a way to bring math in!</p>
<p><strong>Q: We'd also like to talk about benchmarks that the industry uses (either officially or not) to determine the "who's who" among coders. Do you have any parameters in your own mind by which you measure "star coders," as well as thoughts on the characteristics of this 'culture' of developers?</strong><br />
A: I think the star developers are mostly unsung; it's the people like me, who simply specialize in doing well at contests, who seem to get what glory there is to get in this field. :)  There's some correlation between contest and development skill, sure; but I don't consider myself a fantastic developer.  I've just specifically learned how to do well on toy contest problems.  The people who can churn out high-quality real-world code, or (say) do well in TopCoder's design/development contests, who really keep the computer world progressing.</p>
<p><strong>Q: Would you rate as the very best those coders who are fast and brilliant only, or would you say they also need to be equally adept at working with people (to understand the needs of the program)?</strong><br />
A: Like I said, the best developers need skills that don't necessarily overlap with contest skills.  But personally, I admire brilliance most of all.  For instance, Reid Barton is far smarter than any of us; he hasn't focused on TopCoder, though, which is why he's not as highly ranked.</p>
<p><strong>Q: Are there certain coders who grow nearly famous, for instance by winning lots of contests?</strong><br />
A: Well, I'm probably one.  I've been recognized before, in pretty unlikely places (like a restaurant, once).  I'm not exactly sure how that happened. :)  And, of course, <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/> have gotten a lot of publicity for their single-handed dominance of the TopCoder Opens.</p>
<p><strong>Q: Is the world of 'star coders' small enough that certain names are very recognizable by all?</strong><br />
A: On TopCoder, definitely.  I think a lot of programmers know the names of the top few.</p>
<p><strong>Q: Is it true that some coders enter contests simply because they know another coder is in the contest, and they want to be evaluated by competing with that person?</strong><br />
A: Hmm.  I couldn't say. :)  Personally, I often check the registration list to see if <tc-webtag:handle coderId="10574855" context="algorithm"/> or <tc-webtag:handle coderId="144400" context="algorithm"/> is competing... but that's more because I'm scared of them.  I haven't chickened out yet, though! :)</p>



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
