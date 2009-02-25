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
 
<span class="bigTitle">Computerworld's "Rock star coders" profile: Petr</span>
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

<p><em>On January 22, 2008, Computerworld ran an <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='feature_031308' />">article</a> about various TopCoders and how programming has affected their lives.  The following is the full Computerworld interview with <tc-webtag:handle coderId="10574855" context="algorithm"/>, our final member in this series, from which portions were used in the article.</em></p>

<br />
<p><tc-webtag:handle coderId="10574855" context="algorithm"/>: It's always difficult to answer such questions, as they are either too vague, or specific not in the area I expect them to. However, I'll try :)</p>
<p><strong>Q: Who do you think rates among the best coders in the world? The full list of TopCoder members we're contacting includes <tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="272072" context="algorithm"/>, <tc-webtag:handle coderId="119676" context="design"/>, <tc-webtag:handle coderId="8357090" context="algorithm"/>, <tc-webtag:handle coderId="286907" context="algorithm"/>.</strong><br />
A: This list is pretty decent, although it may be a little biased in the following sense: I believe all these people (at least those on algorithm side) became successful in programming contests way before they started topcoding, so their career on TC has started with a jump to the top. I suggest <tc-webtag:handle coderId="7442498" context="algorithm"/> as an example of a person who has constantly improved for the past several years, and is now #3. His rating graph speaks for himself: <a href="/tc?module=MemberProfile&amp;cr=7442498&amp;tab=alg">http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7442498&amp;tab=alg</a></p>
<p><strong>Q: How did you become a coder?</strong><br />
A: I can't say for certain, but the traditional version is that my brother started reading a book on Pascal when I was 11, and I couldn't resist to read the same book after him, just because he's an older brother. Or, if you mean coder as in "top coder", i.e., someone who solves algorithmic problems, then a year later, when I was invited to the Moscow Northwestern District Olympiad in informatics as a representative for my secondary school.</p>
<p><strong>Q: How many hours per day do you code or practice?</strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/Petr_big.jpg" /><br /><span style="padding-left:55px"><tc-webtag:handle coderId="10574855" context="algorithm"/></span></span><br />
A: I'm currently employed as a software engineer, so the answer is about 8 :) Although this is more about industrial programming. I've not been practicing specifically for contests (as opposed to just coding) for a long time, probably several years, as most of my practice happened to be in the high school. Nowadays the contests themselves bring me enough practice to keep my current form.</p>
<p><strong>Q: Challenges/successes you've had finding ways to get paid for your talents.</strong><br />
A: I've been participating in TC competitions for less than 2 years, and still the TC prizes are much bigger than any other prizes I managed to win beforehand. i.e., TC is probably the only competition with monetary incentive being important (although probably still not the most important, though). However, TC tournament winnings are of course not enough to quit the job, so I still have to work as a software engineer, and it's very challenging to get paid reasonably for it in Russia, despite the market demand exceeding the market supply. I'm still looking for a way to organize my life in such a way that I don't bother about the money.</p>
<p><strong>Q: Toughest job or coding challenge you've met.</strong><br />
A: As for coding challenges, there were many. Setting the problems for algorithmic contests certainly involves keeping up with the current research in Computer Science, at least in certain areas. From time to time, someone's PhD thesis may be posted as a contest problem, so no wonder some of them are almost impossible to solve.</p>
<p><strong>Q: What do you love about coding?</strong><br />
A: The thing I love about coding, is that you can feel the results of your work. You create a program, then run it, and see it actually solve a problem for you, help you in some non-computer issue, or make your life more convenient. It's like manufacturing something useful, only it happens much faster and you have much more opportunities.</p>
<p><strong>Q: What do you hate about coding?</strong><br />
A: "Hate" is too strong of a word. Sometimes it seems bad that coding takes such big part of my life :)</p>
<p><strong>Q: What hobbies/interests do you have other than coding?</strong><br />
A: Sports, a lot of them, from volleyball to cross-country skiing. Reading arises as a hobby from time to time, although currently it's not on a peak.</p>
<p><strong>Q: Would you rate as the very best those coders who are fast and brilliant only, or would you say they also need to be equally adept at working with people (to understand the needs of the program)?</strong><br />
A: It's a tough call for a non-native speaker, as I'm not sure I understand precise meaning of 'coder', and its differences with 'programmer', 'developer', 'architect', etc. Speaking of all those people in general, I say these days you can't enjoy coding much if you're not able to share your results and make them useful for other people. The coolest things done in the area of coding are apps that make our life easier and more interesting, not those that rigorously solve complex mathematical tasks :) And if you don't enjoy coding, then how can you be the very best?<br /><br />
However, algorithmic contests are a little different story. They have become a real competitive sport, and like in any sport, you have to be the best either by yourself, or in your team. In programming contests, it's speed and brilliance that matters, not the ability to work with people. And I think it's very cool that we've managed to make an interesting sport out of programming. It's almost the same in other areas: hundreds of millions of cars are being made for consumer use, and people making that cars are trying to make them more convenient, more eco-friendly, more fashionable - that is, to understand what the demand is. However, some of those make Formula 1 cars, that are virtually unusable when outside the racing track (they consume a very specific fuel, they have very low clearance, they may fall apart after several thousands miles, they have very limited visibility from inside the cabin, they are very inconvenient to seat in), but are still the fastest and most full-of-high-tech cars in the world. Algorithmic contests do the same in the area of coding - we don't write serious industry code, instead we look for the fastest and most elegant solutions for concrete problems.</p>
<p><strong>Q: Are there certain coders who grow nearly famous, for instance by winning lots of contests?</strong><br />
A: I don't know of any (I mean, I've heard that <tc-webtag:handle coderId="144400" context="algorithm"/> is nearly famous in Poland, but I don't know for sure) coders becoming famous because of contests. However, many coders have become famous by creating apps used by lots of people throughout the world. You can't say that Linus Torvalds isn't known at all. So, we have a lot of things to do, if we want to make the programming contest winners as popular :)</p>
<p><strong>Q: Is the world of 'star coders' small enough that certain names are very recognizable by all?</strong><br />
A: I assume you're talking about 'starness' in terms of programming contests. Then yes, most of the top programming contest winners know each other and their names are known pretty much by everyone in the programming contest community. I doubt some of us are known to the entire coder world.</p>
<p><strong>Q: Is it true that some coders enter contests simply because they know another coder is in the contest, and they want to be evaluated by competing with that person?</strong><br />
A: Probably, although I'd say most coders enter contests not trying to compare with a specific person, but looking for the spirit of the competition itself.</p>


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
