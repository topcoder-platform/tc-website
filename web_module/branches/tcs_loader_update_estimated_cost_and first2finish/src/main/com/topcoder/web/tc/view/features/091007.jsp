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
    <tc-webtag:forumLink forumID="517279" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Spotlight: The Arab Academy for Science &amp; Technology</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/AbdelRahman_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21777558" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">


<p>Egypt's <a href="/tc?module=AlgoRank&cc=818">algorithm contingent</a> has 118 current active members and a <a href="/stat?c=country_avg_rating">country rank</a> of 31, along with one (relatively recent) red coder, <tc-webtag:handle coderId="7400531" context="algorithm"/>. Not very impressive compared to Russia's <a href="/tc?module=AlgoRank&cc=643">41 reds</a>, perhaps, but given the very recent development of programming education and competition in our country I think we're on our way up. In this article, I'll introduce some of the coders from our community, primarily from my school: the Arab Academy for Science and Technology.</p>

<p>The Arab Academy for Science and Technology (AAST), one of the biggest universities in Egypt and in the Arab world, is the primary home of Egypt's TopCoder community. Originally founded in 1972, AAST has evolved from its roots as a regional maritime academy into a highly competitive school, particularly in regard to programming, and the second most expensive university in the country after the American University in Cairo (AUC).</p>

<p>If you encounter a good programmer from Egypt, odds are that at least one of these four statements is true:</p>
    <ol>
        <li>He is a student in the American University in Cairo (AUC).</li>
        <li>He is a student in the AAST.</li>
        <li>He is a student in the Faculty of Computers and Information (FCI).</li>
        <li>He learned programming at the AAST.</li>
    </ol>
    
<p>While the AUC and FCI are both very strong (with FCI ranked highest among the Egyptian schools on <a href="/stat?c=school_avg_rating">TopCoder's list</a>), one thing that distinguishes the AAST is the Regional Informatics Center (RIC). Here, talented students from all over the country - including other universities - come together to train and compete, for free.</p><br />

<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature091007/feature091007_1.jpg" alt="The AAST's Regional Informatics Center" /><br /><em>The AAST's Regional Informatics Center</em></div><br />

<p>Let's meet some more of the Egyptian coders.</p>

<p><tc-webtag:handle coderId="7400531" context="algorithm"/>, Egypt's sole red coder, is a coach at the American University in Cairo. <tc-webtag:handle coderId="15898205" context="algorithm"/>, currently ranked #5 in country, is one of his students. In addition to his TopCoder success, <tc-webtag:handle coderId="7400531" context="algorithm"/> went to the ACM world finals in 2006 and received his undergraduate degree in electronics engineering through the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.aucegypt.edu/support/development/gifts_at_work/pssf.html' refer='feature_091007' />">Citibank Public School Scholarship</a>.</p>

<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature091007/feature091007_2.jpg" alt="mafattah and his team from American University" /><br /><em><tc-webtag:handle coderId="7400531" context="algorithm"/> and his team from American University</em></div><br />

<p><tc-webtag:handle coderId="2057853" context="algorithm"/>, currently #3 in the country, is one of the best of all, and certainly one of the most influential. A coach in the Informatics Center at the AAST, he never spares an effort to help you, regardless of whether it's a holiday or weekend. He's also an assistant instructor at the AAST -- he teaches algorithms, Java and discrete mathematics, and he taught algorithms to most of the computer science students at the AAST. He's also the coach of the Egyptian IOI (the International Olympiad in Informatics) team and he organized the EOI, which is the Egyptian version of the IOI.</p>

<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature091007/feature091007_3.jpg" alt="moh_taha_eg monitors the action at AAST's Informatics Center" /><br /><em><tc-webtag:handle coderId="2057853" context="algorithm"/> monitors the action at AAST's Informatics Center</em></div><br />

<p><tc-webtag:handle coderId="16067947" context="algorithm"/>, <tc-webtag:handle coderId="10190099" context="algorithm"/> and <tc-webtag:handle coderId="11970025" context="algorithm"/> are the first team at the AAST now (shown below, with <tc-webtag:handle coderId="2057853" context="algorithm"/>); they got the first place in the ACM Regional 2006 and went to the finals in Japan. <tc-webtag:handle coderId="16067947" context="algorithm"/> and <tc-webtag:handle coderId="10190099" context="algorithm"/>, both named Mostafa, are in the same class in the computer engineering department in the AAST, while <tc-webtag:handle coderId="11970025" context="algorithm"/> is an assistant at the school.</p><br />

<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature091007/feature091007_4.jpg" alt="ACM Final 2007 Japan moh_taha_eg &amp; Patriot &amp; da_brain_damage &amp; need4speed.jpg" /></div><br />

<p><tc-webtag:handle coderId="19841837" context="algorithm"/>, currently #6 in the country, is one of the more active TopCoder members from the FCI, and was another participant at the ACM world finals in 2006. <tc-webtag:handle coderId="15155743" context="algorithm"/>, <tc-webtag:handle coderId="22630224" context="algorithm"/>, and <tc-webtag:handle coderId="20538097" context="algorithm"/> are other members from that school.</p>

<p>Some other AAST coders also include <tc-webtag:handle coderId="10144656" context="algorithm"/>, <tc-webtag:handle coderId="21777558" context="algorithm"/>, <tc-webtag:handle coderId="21467899" context="algorithm"/>, <tc-webtag:handle coderId="21795173" context="algorithm"/> and <tc-webtag:handle coderId="22663539" context="algorithm"/>.</p>

<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature091007/feature091007_5.jpg" alt="HOKSHA during a presentation on Python… or perhaps doing "the robot"" /><br /><em><tc-webtag:handle coderId="21795173" context="algorithm"/> during a presentation on Python… or perhaps doing "the robot"</em></div><br />

<p>These are just a fraction of the coders at the AAST, and our country in general. With recent successes by our team, along with other Egyptian university teams, more and more students are getting interested in algorithms and coding competitions, so look for more members to appear on TopCoder soon.</p>

<br /><br />
<p><em>Would you like to spotlight your school - or city, or country - in a TopCoder feature article? Email your suggestions to <a href="mailto:editorial@topcoder.com?subject=Write For TopCoder">editorial@topcoder.com</a>.</em></p>

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
