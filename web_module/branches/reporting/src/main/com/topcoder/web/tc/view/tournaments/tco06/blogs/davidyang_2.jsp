<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Your mission, if you choose to accept it</span><br>
05.03.06 5:40 PM
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
In addition to the intense algorithm matches (Round 1 was amazing by the way, check out <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco06&d3=blogs&d4=Kawigi_2">Kawigi’s writeup</a> for a summary) there is also a chance for competitors to interact with sponsors here at the TopCoder Open.  The first presentation was given by the National Security Agency, arguably home of some of the most intense and high-stakes computer science related work happening in the US today.  Three employees from the <A target="_blank" href="/?t=sponsor&c=link&link=http://www.nsa.gov/">NSA</a> -- Jim, Valerie, and Mike -- were on hand to answer questions. Here’s a snippet of the conversation: 
<blockquote><strong>Q:</strong> What are some of the benefits of working for the NSA?</blockquote>
<blockquote><strong>A:</strong> The IT market is in a major rebound and the NSA is about on par with other Fortune 500 companies in terms of salary.  For new hires, the NSA represents a better deal than many because we recognize the difficulty of hiring great people and understand the value of an employee once they have joined us. We like to turn the people that we bring in into the best employees possible, and invest very heavily in new hires to further education.  For example, the NSA will pay your education on the West coast if you’re interested in completing your degree.  Also, things like offshoring don’t affect people within the intelligence community as much.</blockquote>
<blockquote>The NSA also offers very good job security.  Because it is difficult to come onboard [due to security clearance] it’s unlikely you would ever be kicked to the curb.  In order to manage job satisfaction and in order to keep folks happy, we allow for a lot of internal movement.  You might come into the job doing development work, find another job you’re interested in and it’s relatively easy to move... For example, I came on 21 years ago to develop hardware digital systems, but I decided software was more fun, so I moved over. I like the development cycle in software better -- I can get feedback almost immediately and develop a solution (though perhaps not as fast as <tc-webtag:handle coderId="10574855" darkBG="true" /> would).</blockquote>
<blockquote><strong>Q:</strong> In lieu of financial performance metrics, how does the NSA measure performance on software projects? </blockquote>
<blockquote><strong>A:</strong> Many of our customers are internal, so customer satisfaction is a big metric for us.  With the problems we’re given sometimes it’s hard to define success; generally, if we are able to provide answers to folks who have questions then we’re doing our job well.  In terms of development projects, we measure success much the way other companies would measure success.</blockquote>
<blockquote><strong>Q:</strong> What's the average NSA employee like? </blockquote>
<blockquote>Right now we’re changing the demographics of the agency drastically, hiring a lot of people out of college, so the average age is on a downward trend.  Our experience working with TopCoder and with prestigious universities is that the new generation of programmers is very capable.</blockquote>
<blockquote>The NSA has lost the notion that promotion comes after certain number of years; if you are a top performer, you can be expected to be treated as a top performer at the Agency. We are very much a meritocracy.  We value very smart people and are in competition with companies like Google for the best talent.  They’re seeking the same type of people we’re seeking, but you’re here at the TCO competing -- and you're even competing in the SRMs, for no money -- so obviously you like to solve tough problems. We like to invite people to come to NSA, solve tough problems and get paid for it.</blockquote>
Afterwards, I spoke briefly with Mike, Jim and Valerie about what they personally find interesting about the TopCoder competition.  Having been involved with TopCoder since the previous July, they have had a chance to see a few Opens and get to know the playing field (Mike is a big fan of watching <tc-webtag:handle coderId="10574855" darkBG="true" /> and <tc-webtag:handle coderId="8357090" darkBG="true" />’s screens as they solve problems).  But Mike said that something about the TCO appeals to him on a larger scale: the friendly and diverse competition of mind and mathematics in the TopCoder Arena is a microcosm of the one played out on the world stage.
<br/><br/>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
