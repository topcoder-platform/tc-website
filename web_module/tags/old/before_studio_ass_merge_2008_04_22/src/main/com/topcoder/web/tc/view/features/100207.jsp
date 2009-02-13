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
    <tc-webtag:forumLink forumID="517635" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">TCCC07: By the numbers</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/jakubr_big2.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160; <%--<tc-webtag:handle coderId="8472826" context="algorithm"/><br />--%>
      <em>TopCoder Staff</em>
</div>

<br clear="all">

<p>With the addition of four alternates to the Component Design and Development finals, this year's TopCoder Collegiate Challenge gives us that many more numbers to play with. A total of 3,426 competitors registered for this year's TCCC, a slight up-tick from last year's 3,317. Here's how the TCCC07 crop of competitors<sup>1</sup> breaks down, based on some different comparisons:</p>

<h3>Community</h3>
<p>Who spends the most time on TopCoder? Let's look at it by the number of total competitions.</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header">Track</td>
            <td class="header">Handle</td>
            <td class="headerC"># of Competitions</td>
        </tr>
    </thead>
    <tr class="light">
        <td>Design</td><%-- AleaActaEst --%>
        <td><tc-webtag:handle coderId="252022" context="design"/></td>
        <td align="center">639</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- nicka81 --%>
        <td><tc-webtag:handle coderId="293874" context="design"/></td>
        <td align="center">269</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- AdrianKuegel --%>
        <td><tc-webtag:handle coderId="307060" context="algorithm"/></td>
        <td align="center">183</td>
    </tr>
    <tr class="dark">
        <td>Marathon Match</td><%-- Maris --%>
        <td><tc-webtag:handle coderId="269788" context="marathon_match"/></td>
        <td align="center">161</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- kalinov --%>
        <td><tc-webtag:handle coderId="310333" context="algorithm"/></td>
        <td align="center">161</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- sql_lall --%>
        <td><tc-webtag:handle coderId="275640" context="design"/></td>
        <td align="center">155</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- marek.cygan --%>
        <td><tc-webtag:handle coderId="7442498" context="algorithm"/></td>
        <td align="center">154</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- Luca --%>
        <td><tc-webtag:handle coderId="10348862" context="design"/></td>
        <td align="center">153</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- Im2Good --%>
        <td><tc-webtag:handle coderId="7452866" context="algorithm"/></td>
        <td align="center">153</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- Savior --%>
        <td><tc-webtag:handle coderId="347569" context="algorithm"/></td>
        <td align="center">148</td>
    </tr>
</table>
<p>As he did among TCO competitors, <tc-webtag:handle coderId="252022" context="design"/> stands head and shoulders above the rest of the field in this category. Perhaps most impressive is the fact that this number is 90 competitions above where he stood before the TCO, when <a href="/tc?module=Static&d1=features&d2=062107">this article</a> was written, just a few months back.</p>
<p>In terms of competition types, the Algorithm SRM is clearly the "gateway drug" of TopCoder participation. A total of 80 TCCC finalists are rated in Algorithm competitions, while just 15 are rated in Design. Marathon Matches seems to be the second competition of choice, with 48 members rated. A respectable 27 members have tried Development competitions, with the 5th-highest rated developer (<tc-webtag:handle coderId="347569" context="algorithm"/>) coming on-site in the Algorithm competition.</p>
<p>Competition is one thing, but it's not the only element of the TopCoder community. A lot of the most valuable interaction in the TopCoder community doesn't happen in the Arena or Online Review, it happens in the Forums. Who has hit the "Post" button the most? Again, it's everybody's favorite <a href="/tc?module=Static&d1=media&d2=tcchannel&clip=ep02">Paweska brother</a> (or at least one of their top two favorite, at least):</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header">Track</td>
            <td class="header">Handle</td>
            <td class="headerC"># of Forum Posts</td>
        </tr>
    </thead>
    <tr class="light">
        <td>Design</td><%-- AleaActaEst --%>
        <td><tc-webtag:handle coderId="252022" context="design"/></td>
        <td align="center">5859</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- Luca --%>
        <td><tc-webtag:handle coderId="10348862" context="design"/></td>
        <td align="center">3801</td>
    </tr>
    <tr class="light">
        <td>Design</td><%-- sql_lall --%>
        <td><tc-webtag:handle coderId="275640" context="design"/></td>
        <td align="center">2533</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- nicka81 --%>
        <td><tc-webtag:handle coderId="293874" context="design"/></td>
        <td align="center">2442</td>
    </tr>
    <tr class="light">
        <td>Development</td><%-- PE --%>
        <td><tc-webtag:handle coderId="9998760" context="development"/></td>
        <td align="center">1033</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- tushak --%>
        <td><tc-webtag:handle coderId="19930287" context="design"/></td>
        <td align="center">1011</td>
    </tr>
    <tr class="light">
        <td>Design</td><%-- kakarotto --%>
        <td><tc-webtag:handle coderId="20256177" context="design"/></td>
        <td align="center">986</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- Petr --%>
        <td><tc-webtag:handle coderId="10574855" context="algorithm"/></td>
        <td align="center">971</td>
    </tr>
    <tr class="light">
        <td>Development</td><%-- enefem21 --%>
        <td><tc-webtag:handle coderId="20092786" context="algorithm"/></td>
        <td align="center">655</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- Vovka --%>
        <td><tc-webtag:handle coderId="8518361" context="design"/></td>
        <td align="center">646</td>
    </tr>
</table>
<br /><br />

<h3>Longevity</h3>
<p>Five thousand forum posts is a lot, but that's probably due to the fact that <tc-webtag:handle coderId="252022" context="design"/> has been a TopCoder member longer than everybody else, right? Not exactly:</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header">Track</td>
            <td class="header">Handle</td>
            <td class="headerC">Years Since Registration</td>
        </tr>
    </thead>
    <tr class="light">
        <td>Marathon Match</td><%-- paisa --%>
        <td><tc-webtag:handle coderId="150796" context="marathon_match"/></td>
        <td align="center">6.24</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- bmerry --%>
        <td><tc-webtag:handle coderId="251074" context="algorithm"/></td>
        <td align="center">5.82</td>
    </tr>
    <tr class="light">
        <td>Design</td><%-- AleaActaEst --%>
        <td><tc-webtag:handle coderId="252022" context="design"/></td>
        <td align="center">5.78</td>
    </tr>
    <tr class="dark">
        <td>Marathon Match</td><%-- Maris --%>
        <td><tc-webtag:handle coderId="269788" context="marathon_match"/></td>
        <td align="center">5.58</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- yiuyuho --%>
        <td><tc-webtag:handle coderId="272408" context="algorithm"/></td>
        <td align="center">5.53</td>
    </tr>
    <tr class="dark">
        <td>Design</td><%-- sql_lall --%>
        <td><tc-webtag:handle coderId="275640" context="design"/></td>
        <td align="center">5.47</td>
    </tr>
    <tr class="light">
        <td>Design</td><%-- nicka81 --%>
        <td><tc-webtag:handle coderId="293874" context="design"/></td>
        <td align="center">5.18</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- AdrianKuegel --%>
        <td><tc-webtag:handle coderId="307060" context="algorithm"/></td>
        <td align="center">4.80</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- overwise --%>
        <td><tc-webtag:handle coderId="308453" context="algorithm"/></td>
        <td align="center">4.78</td>
    </tr>
    <tr class="dark">
        <td>Marathon Match</td><%-- Jan_Kuipers --%>
        <td><tc-webtag:handle coderId="309453" context="marathon_match"/></td>
        <td align="center">4.74</td>
    </tr>
</table>
<p>Experience seems to help, with the average TCCC finalist registering 2.86 years ago. There are a few noteworthy newbies in the mix, however. <tc-webtag:handle coderId="22653739" context="algorithm"/>, for example, has participated in 51 total competitions in the year since he joined, and qualified for his second on-site tournament slot exactly one year and one day after he registered for TopCoder.</p>

<h3>Success Rates</h3>
<p>Let's look at the competitive factors for a minute. It's easy to get to ratings and seeding, so we won't bother with that, but we wanted to try and find a new way to understand how <tc-webtag:handle coderId="10574855" context="algorithm"/> stands out. Accordingly, we plotted his Division 1 success rate against the next most successful 24 coders in the TCCC finals, and the results are pretty striking. While most hover in the high 70s or low 80s, <tc-webtag:handle coderId="10574855" context="algorithm"/> is the only one above 90%.</p>
<div align="center"><img src="/i/education/feature100207_01.png" /></div>
<p>The Algorithm challenge success metrics are less open-and-shut, however, with the top 10 hovering in the 60s and 70s.</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header">Track</td>
            <td class="header">Handle</td>
            <td class="headerC">Challenge Success Rate</td>
        </tr>
    </thead>
    <tr class="light">
        <td>Algorithm</td><%-- gawry --%>
        <td><tc-webtag:handle coderId="7390224" context="algorithm"/></td>
        <td align="center">75%</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- kia --%>
        <td><tc-webtag:handle coderId="20286298" context="algorithm"/></td>
        <td align="center">75%</td>
    </tr>
    <tr class="light">
        <td>Marathon Match</td><%-- Maris --%>
        <td><tc-webtag:handle coderId="269788" context="marathon_match"/></td>
        <td align="center">71%</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- rlp --%>
        <td><tc-webtag:handle coderId="11884173" context="algorithm"/></td>
        <td align="center">71%</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- krijgertje --%>
        <td><tc-webtag:handle coderId="9906197" context="algorithm"/></td>
        <td align="center">71%</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- Petr --%>
        <td><tc-webtag:handle coderId="10574855" context="algorithm"/></td>
        <td align="center">68%</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- Per --%>
        <td><tc-webtag:handle coderId="7421158" context="algorithm"/></td>
        <td align="center">68%</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- sghao126 --%>
        <td><tc-webtag:handle coderId="7563318" context="algorithm"/></td>
        <td align="center">67%</td>
    </tr>
    <tr class="light">
        <td>Algorithm</td><%-- gevak --%>
        <td><tc-webtag:handle coderId="7340263" context="algorithm"/></td>
        <td align="center">66%</td>
    </tr>
    <tr class="dark">
        <td>Algorithm</td><%-- domino --%>
        <td><tc-webtag:handle coderId="8362207" context="algorithm"/></td>
        <td align="center">63%</td>
    </tr>
</table>
<br /><br />

<h3>Creativity</h3>
<p>Let's set quantitative analysis aside for a moment to consider a realm in which every member has the chance to be creative: their member profile quote. Sixty-two of the TCCC finalists have quotes on their homepages. Some of the more famous entries include <tc-webtag:handle coderId="307060" context="algorithm"/>'s "Topcoder Competitions are more important than sleep ;-)" and <tc-webtag:handle coderId="7452866" context="algorithm"/>'s "There's no place like 127.0.0.1."</p>
<p>Others look beyond themselves, to cite the wisdom of the greats. <tc-webtag:handle coderId="21691199" context="algorithm"/> quotes Albert Einstein -- "Imagination is more important than knowledge" - while <tc-webtag:handle coderId="7581406" context="algorithm"/> goes in a slightly different direction: "'Pressure is a Messerschmitt up your arse, playing cricket is not.' - Keith Miller."</p>
<p>There's conflict brewing, too. <tc-webtag:handle coderId="22627586" context="algorithm"/> believes that "Impossible is possible," but <tc-webtag:handle coderId="7442498" context="algorithm"/> is having none of that: "Impossible is nothing!!!," he insists. Let's hope these two don't encounter each other and some sort of impossibility in Orlando - things could get ugly.</p>
<p>Optional homework assignment: How many TCCC finalists use a famous line by Julius Caesar (or at least a variant thereof) as their quotes? And how many use "Hello world?"</p>

<h3>Countries</h3>
<p>Where does everybody come from, anyway? There are 27 countries represented by the finalists. The best represented countries - in fact, the only countries that had more than 2 finalists each - are these five:</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="header">Country</td>
            <td class="header">Competitors</td>
        </tr>
    </thead>
    <tr class="light">
        <td>China</td>
        <td>20</td>
    </tr>
    <tr class="dark">
        <td>Russian Federation</td>
        <td>15</td>
    </tr>
    <tr class="light">
        <td>Poland</td>
        <td>12</td>
    </tr>
    <tr class="dark">
        <td>Ukraine</td>
        <td>8</td>
    </tr>
    <tr class="light">
        <td>Indonesia</td>
        <td>5</td>
    </tr>
</table>
<p>The graph seems to be getting steeper - there are two more countries represented among the TCCC07 finalists than there were for this year's TCO, but they're more concentrated in the top countries. The top 5 countries consisted of 57% of the TCO07 finalists, but they represent more than 68% of the current TCCC crop. The phenomenal growth in Chinese finalists accounts for much of this, but Team Russia has grown as well.</p>
<p>China is also the most populous of the 27 TCCC nations, followed by India, the United States, and Indonesia. The least populated country is Armenia, which has just 0.2% of China's population, followed by Croatia and Norway. Armenia is also the smallest country in area, with just 0.1% of the land mass of Russia, the largest country on the list.</p>

<h3>Finding TopCoderstan</h3>
<p>Based on the general latitude and longitude coordinates for the 27 countries, we see that Norway and Sweden are tied for the furthest North, South Africa is the furthest South, and Indonesia is closest to the Equator. Japan is the furthest East, while the US is furthest West.</p>
<p>So -- where exactly is TopCoderstan? No, it isn't a lost city of ancient myth - it's the hypothetical epicenter of where our Collegiate Challenge finalists come from. We can find it by averaging the latitude and longitudes of our finalist's home countries. With a lot of rounding down, we can plant the TopCoderstan flag at approximately 39 degrees North by 41 degrees East - somewhere in <a target="_blank" href="<tc-webtag:linkTracking link='http://maps.google.com/maps?f=q&hl=en&geocode=&q=39,41&ie=UTF8&ll=43.197167,40.957031&spn=29.934022,59.765625&z=4&iwloc=addr&om=1' refer='feature100207' />">Eastern Turkey</a>, not far from the city of Erzurum.</p>
<p>This is just the average of the 27 countries, however. If we weight this average, so that we factor in the latitude and longitude for every competitor, we find that we need to relocate our capital some 1,075 miles, somewhat North and a lot further East, thanks at least in part to those 20 coders from China. The new spot is at 43 degrees North, 61 degrees East - somewhere in <a target="_blank" href="<tc-webtag:linkTracking link='http://maps.google.com/maps?f=q&hl=en&geocode=&q=43,61&ie=UTF8&ll=43.992815,60.996094&spn=7.397652,14.941406&z=6&iwloc=addr&om=1' refer='feature100207' />">Northern Uzbekistan</a>, not too far from the Aral Sea. Your homework assignment: forgetting about latitude and longitude, figure out where the epicenter would be in three-dimensional space. Would it be somewhere in the Earth's crust, or deep in its molten core? (Or the forbidden lair of the <a target="_blank" href="<tc-webtag:linkTracking link='http://en.wikipedia.org/wiki/Hans_Moleman' refer='feature100207' />">Molemen</a>?)</p>
<p>And what's a republic without a flag? Just for kicks, we tallied the colors in our 27 home countries' flags. As with the TopCoder site, red was the most popular color, appearing in 22 of the 27 flags. Here's how the total color usage breaks down:</p>
<div align="center"><img src="/i/education/feature100207_02.png" /></div>
<p>It's a pretty ugly flag, granted, but once TopCoderstan's rich petroleum reserves are tapped we'll be able to afford something better.</p>

<h3>What are you counting on?</h3>
<p>What do you think this year's TCCC will hinge on - what numbers are you counting on to help you predict who might perform better than expected, or who might be vulnerable? And is it all numbers, or is there room for things like luck? <tc-webtag:forumLink forumID="517635" message="Let us know" /> what you think.</p>
<br /><br />

<p><em><sup>1</sup>The data in this article is based on the advancers as of 9/28/07. The actual on-site competitors may change, depending on visa, travel, or other matters.</em></p>
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
