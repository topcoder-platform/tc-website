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
    <tc-webtag:forumLink forumID="517553" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Introducing TopCoder's &quot;Iron Man&quot;</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" /><br />
      <em>TopCoder Member</em>
</div>
--%>
<br clear="all">


<p><em>What were you doing on September 9, 2005? Back then, 546 TopCoder members turned out for <a href="/stat?c=round_overview&er=5&rd=7996">SRM 262</a>. The match was won by <tc-webtag:handle coderId="310333" context="algorithm"/> [about whom you can read more <a href="/tc?module=Static&d1=features&d2=080607">here</a>], with <tc-webtag:handle coderId="7479769" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/> rounding out the top three. SRM 262 turned out to be a particularly significant match for a young Bulgarian coder named Svetoslav Kolev &ndash; aka <tc-webtag:handle coderId="8511003" context="algorithm"/> &ndash; as well. With that match, <tc-webtag:handle coderId="8511003" context="algorithm"/> began a streak of consecutive appearances in rated SRMs. The streak grew slowly, but as he competed in more and more SRMs he became more and more committed to keeping it alive. With <a href="/stat?c=round_overview&er=5&rd=10781">SRM 366</a>, his streak broke into the triple digits, and he now leads TopCoder with a record of <a href="/stat?&c=consecutive_srm_appearances">100 consecutive SRM appearances</a>. He's got a few thousand matches to go before his numbers approach <a target="_blank" href="<tc-webtag:linkTracking link='http://mlb.mlb.com/mlb/components/news/tributes/ripken/gallery/8.html' refer='feature_092407' />">Cal Ripken, Jr.</a>'s, but for our intents and purposes we can call <tc-webtag:handle coderId="8511003" context="algorithm"/> TopCoder's &quot;Iron Man.&quot;</em></p>
<br />
<p><em>In this article, we ask <tc-webtag:handle coderId="8511003" context="algorithm"/> &ndash; now a sophomore at the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.berkeley.edu/' refer='feature_092407' />">University of California-Berkeley</a> &ndash; just what it took to keep his streak alive. </em></p>
<p><strong>Q: How old were you when you started competing at TopCoder? </strong></p>
<p>A: I was 17 years old. I first started competing in TopCoder in 11th grade, in high school, in the spring of 2004.</p>
<p><strong>Q: What first brought you to the site? </strong></p>
<p>A: You have probably heard of IOI? I started programming in grades 4-7, learning only Logo, but then in 8th grade (high school) I started learning more seriously, and started going to national competitions. Then in 10th grade I qualified for the IOI, and that's where I first heard about TopCoder. That was the summer of 2003. Then many of my friends (from the national programming competitions) started competing in TopCoder and I decided to give it a try. I started in April 2004, then important national competitions started up and I stopped competing. I resumed competing in the beginning of 2005, together with the TCCC, and decided to be more serious.</p>
<p><strong>Q: You made yellow pretty quickly after that, right? </strong><span><img style="float:right; height:178px; width:200px; padding:10px;" src="/i/education/swetko_pic.jpg" /></span></p>
<p>A: Yeah, I already had a lot of programming experience, and I tried not to miss competitions, which I more or less did throughout the year.</p>
<p><strong>Q: It's been basically two straight years at this point without missing an SRM, right? </strong></p>
<p>A: Well, I missed some SRMs in 2005, but after I got back from IOI 2005 on 9/9 I started my streak, and I haven't missed so far since.</p>
<p><strong>Q: Have you been aiming to take place in every one of them since then, or did the streak happen by accident? </strong></p>
<p>A: In the beginning it wasn't that big a deal. But when I reached 30-40, I started getting more and more reluctant to miss an SRM, so it's really hard for me to miss one now.</p>
<p><strong>Q: Do you have a set goal? Or do you just plan to keep going as long as you can? </strong></p>
<p>A: Well, I was red for some months, but then I was just too tired and wasn't very motivated at times. But I didn't want to stop, so my goal is to keep competing, to keep my streak alive, but to get as high a rating as possible. I also pay attention to my success rate -- my goal so far is to make it to 80%.</p>
<p><strong>Q: What were your favorite experiences during the streak? </strong></p>
<p>A: I've had some good SRMs that I can remember: SRM <a href="/stat?c=round_overview&er=5&rd=9989">309</a> and <a href="/stat?c=round_overview&amp;er=5&amp;rd=9990">310</a>, plus <a href="/stat?c=round_overview&amp;er=5&amp;rd=9992">312</a> and <a href="/stat?c=round_overview&amp;er=5&amp;rd=10010">330</a>. SRM 309 could have been my lucky one. It was at the time of the Google Code Jam Europe, where I made it onsite, so most of the good competitors from Europe were not competing. I was in Ireland, in Dublin, doing the SRM from the hotel room. I started 20 minutes late, and I had to install Visual Studio before I could start competing. Then I solved <a href="/stat?c=problem_statement&pm=6241&rd=9989">the first one</a>, and opened <a href="/stat?c=problem_statement&pm=6516&rd=9989">the second one</a>. I couldn't see the solution at first, so opened <a href="/stat?c=problem_statement&pm=6239&rd=9989">the hard one</a>, and it turned out to be of my favorite type (nim games). I was lucky to be able to see the solution, so I coded it real quick and had the fastest time [under 16 minutes]. Then I came up with a complicated solution for the medium but couldn't finish it, so I ended up 2nd in the SRM.</p>
<p>I also remember the next SRM, because after Ireland I didn't go back to Bulgaria. I flew to Cyprus, because I was in the technical committee of the Balkan Olympiad in Informatics 2006, and I did SRM 310 from there. It was the night after the award ceremony and, well, I didn't go to bed until 3:00 AM and the SRM was at 4:00. So I slept 30 minutes, but still managed to solve the 3 problems correctly. Then after SRM 312 I reached my maximal rating, so that was a highlight.</p>
<p><strong>Q: Hypothetical question: Would you be willing to give up your streak to make it to an onsite tournament? </strong></p>
<p>A: Yeah, I would, but that's just not how things work, unfortunately. :-)</p>
<p><em>Watch for a video interview tomorrow, in the next edition of the <a href="/tc?module=Static&d1=media&d2=tcchannel">TC Channel</a>. </em></p>
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
