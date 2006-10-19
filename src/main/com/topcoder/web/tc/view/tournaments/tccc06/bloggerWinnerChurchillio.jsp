<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="pickme"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float:right;">
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogger_winners">back</A><br>
</div>
<span class="bigTitle">Churchillio's Submission</span>
<br><br>
<div class="authorPhoto">
    <img src="/i/m/Churchillio_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="21181561" darkBG="true" /><br />
    <em>TopCoder Member</em>
</div>
I'm from Newfoundland, Canada. Our local programming competitions are few and far between, so my excitement when they roll around is unmatched. I love the thrill of live competition, as I have been part of 3 regional apics competitions in the past, and have had to write departmental reports for our local university about each one (to be eligible for funding).
<br><br>
I'm outgoing, speak fluent English, and have a great sense of humor... so blogging about the competition would be as much fun to read as it would be for me to write (I provide a 60 day moneyback guarantee* on all claims of humor related writings). I think I would be able to put a spin on the competition that provides people with a real feel of the spirit, tension and atmosphere of the live programming competition experience, and probably get a few people who weren't interested in TopCoder / live competition to be more interested in it.
<br><br>
I would also put a nice geek-twist on the blog, something like "Real life algorithms", where I would describe aspects of the competition in pseudocode, or something similar. Contextual humor, combined with seriously informative writing would be my angle, one I believe would be the best for such an event. If it was totally insane with no actual reporting it would be useless, but if it was totally serious to the point of boring, nobody would read. I have multiple years experience with digital photography and image editing, so the blog would also be full of photos for people to enjoy.
<br><br>
So pick me, I love competition, I love writing, I'd make it worth your while, and you wouldn't be sorry.
<br><br>
* P.S. - guarantee may or may not exist
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
