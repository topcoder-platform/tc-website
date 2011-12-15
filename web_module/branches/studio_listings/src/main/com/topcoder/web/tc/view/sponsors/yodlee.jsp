<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsor</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value=""/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%" align="center">

        <div style="padding: 15px; text-align: left; width: 540px;">

      <div align="center"><img src="/i/sponsor/Yodlee_logo.gif" border=0 alt="Yodlee Logo" /></div>
      <br /><br />
      <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
        <strong>
        <A style="text-decoration:none;" href="/tc?module=Static&d1=sponsors&d2=yodleeChat20070614">SRM 354</A>
        </strong>
      </div>
      <br /><br />

      <br />
<p>We're here because <span style="font-size:18px; font-weight: bold; color: #B34444; ">we love our jobs.</span> Yodlee is a growing, thriving environment that values <span style="font-size:18px; font-weight: bold; color: #7C9CBA;">smart, hard-working people</span> working together to solve problems.  Our people work in both Redwood Shores, California,
    and Bangalore, India to drive innovation in online banking from both the technology and user experience sides.</p>
  <p>Strong collaboration, cross-departmental communication, and a fast-moving <span style="font-size:18px; font-weight: bold; color: #023C59;">iterative process</span> allow us to build successful products that people love. </p>
  <p>We have an extremely active beta user community who provide us with a rich source of research and suggestions, and we release features early and iterate rapidly based on <span style="font-size:18px; color: #B34444; font-weight: bold;">real user feedback.</span> We work closely with all of the leaders in the financial industry so we're in tune with the trends that they are seeing
    as well as the direct consumer feedback that we see.</p>
  <p>Yodlee has the best qualities of a startup -- <span style="font-size:18px; font-weight: bold; color: #7C9CBA;">individual contributions</span> making a huge impact, focused priorities on "what's really important", ability to 
    wear many hats, incredible <span style="font-size:18px; color: #B34444; font-weight: bold;">energy</span> and enthusiasm.  Yet we have the strong foundation of technology, expertise, and an impressive <span style="font-size:18px; font-weight: bold; color: #023C59;">client list</span> that we've built up over the last 7 years.</p>

  <p><span style="font-size:18px; font-weight: bold; color: #B34444;">Yodlee is hiring! Check out these great opportunities with a great company:</span></p>

  <p>We're looking for:</p>

  <ul class="pagebullet">
    <li>QA</li>
    <li>Software Engineers</li>
    <li>Architects</li>
    <li>Sustaining Engineers</li>
    <li>Project Managers</li>
    <li>Product Managers</li>
    <li>Business Analysts</li>
    <li>And much more...</li>
</ul> 

<p>Read up on us in the Feature <a href="/tc?module=Static&d1=features&d2=052407">"Introducing Yodlee"</a> or check out our website <A href="<tc-webtag:linkTracking link='http://www.yodlee.com/' refer='yodlee' />">www.yodlee.com</A> for more information.</p>
<p><a href="/tc?module=JobHit&jid=391&jt=1" class="button" style="width: 70px;">Apply Now</a></p>
<p>&nbsp;</p>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>