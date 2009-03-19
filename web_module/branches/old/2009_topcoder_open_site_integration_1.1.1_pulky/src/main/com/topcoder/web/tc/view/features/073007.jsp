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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="516782" message="Discuss this article" />
</div>

<span class="bigTitle">Visas: Think Positive and Be Prepared</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/jmpld40_big.jpg" alt="Author" />
</div>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="14999860" context="algorithm"/><br />
      <em>TopCoder Event Manager</em>
</div>
<br clear="all">

<p>At every TopCoder tournament, there is at least one person who misses out. One person (and sometimes many more) who does a great job of competing, advances all the way to the finals, and only then realizes that it's too late.  You guessed it -- I'm talking about the dreaded visa issue.</p>
<p>With a large event like a tournament, there is plenty of work to go around. From finding the venue and booking hotel rooms to identifying vegetarian options on the menu, it's a very detail-oriented process. The single most important part of a TopCoder tournament, though - and, really, the only reason they're worth having - is the competitors. If the most deserving competitors can't attend, what's the point?</p>
<p>With this article, I'd like to cover some of the basics on the travel and visa issues that have plagued recent events. With the 2007 TopCoder Collegiate Challenge just now underway, this is the perfect time to turn this situation around - starting in Orlando, we want every single competitor who has earned a spot in the finals to be there. We need your help, though.</p>

<h3>The basics</h3>
<p>TopCoder events that take place in the United States require specific travel documents for specific people.  Let's take the 2007 TopCoder Collegiate Challenge that is coming up for example.  The finals will take place in Orlando, Florida.  As soon as you register for this event, or any event, here is what you have to do.</p>
<p>In order to travel to the United States, one must have a valid passport and/or visa.  How do you know what you need to have?  If you are from one of the following countries, you only need a passport:</p>
<table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
    <tbody> 
        <tr class="light"> 
            <td class="value">Andorra</td> 
            <td class="value">Australia</td> 
            <td class="value">Austria</td>
            <td class="value">Belgium</td>
        </tr> 
        <tr class="dark"> 
            <td class="value">Brunei</td> 
            <td class="value">Denmark</td> 
            <td class="value">Finland</td>
            <td class="value">France</td>
        </tr> 
        <tr class="light"> 
            <td class="value">Germany</td> 
            <td class="value">Iceland</td>
            <td class="value">Ireland</td>
            <td class="value">Italy</td>
        </tr> 
        <tr class="dark"> 
            <td class="value">Japan</td> 
            <td class="value">Liechtenstein</td>
            <td class="value">Luxembourg</td>
            <td class="value">Monaco</td>
        </tr> 
        <tr class="light"> 
            <td class="value">The Netherlands</td> 
            <td class="value">New Zealand</td>
            <td class="value">Norway</td>
            <td class="value">Portugal</td>
        </tr> 
        <tr class="dark"> 
            <td class="value">San Marino</td> 
            <td class="value">Singapore</td>
            <td class="value">Slovenia</td>
            <td class="value">Spain</td>
        </tr> 
        <tr class="light"> 
            <td class="value">Sweden</td> 
            <td class="value">Switzerland</td>
            <td class="value">United Kingdom</td>
            <td class="value">&nbsp;</td>
        </tr> 
    </tbody> 
</table>
<br /><br />

<p>Passports can take a significant time to get so if you do not have one, I recommend you send away for one immediately.</p>
<p>You can read more about the Visa Waiver Program here:<br />
<a href="http://travel.state.gov/visa/temp/without/without_1990.html" alt="Visa Waiver Program" target="_blank">http://travel.state.gov/visa/temp/without/without_1990.html</a></p>
<p>If you are from a country other than those listed here, you must have both a valid passport and a visa to enter the United States.  The type of visa you need to get is called a "tourist visa."</p>
<p>In order to get a visa for the USA, you have to contact the US Embassy in your country for an appointment and information.  Here is where TopCoder can help.  To obtain a visa, in most cases, you are required to provide an invitation letter from someone in the United States that documents why you are visiting.  At certain stages of the tournament, TopCoder will give you the option to request a letter.  If you need a letter, we'll send it out to you as quickly as we can.</p>
<p>The problem, however, is that so many competitors wait until the last minute to request a letter from TopCoder and/or to make appointments at the embassy.  That is why I'm urging you to think positive, and prepare early.  If you call the embassy as soon as you register for the tournament and find out that the soonest available appointment is in one month from now - no problem! However, if you wait until just before you find out if you are a finalist and the appointments are a month away, it's too late.</p>
<p>Remember that we are here to help and will do as much as we possibly can.  If you feel that the visa letter requests are not early enough for you, contact me at any time.  If you want to request a letter earlier, I will most definitely send it to you earlier.  If you want me to fax the embassy, I will do so.  If you want me to email the embassy, I will.</p>
<p>It's worth repeating: you are the most important part of the tournament, and helping you get to the event is job #1 for me.  But it's a two-way street. If you wait until it's too late, there's not much I can do to help.  That is why I'm asking you to be responsible for getting your paperwork done early.</p>
<p>During our last event, I had to replace more than a dozen people because they did not get their visas on time.  It's really no fun to have to tell people that they can not come to the finals because they missed a deadline.  More importantly, it's not good for our competition if such a large number of finalists can't make it to the on-site finals.</p>
<p>Don't let this happen to you, and don't wait until it's too late.  Think positive and be prepared for the possibility that you could be a finalist (or a champion).  Start preparing to travel to the finals as soon as you register and get an appointment for a visa that day if you can!</p>

<br>

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
