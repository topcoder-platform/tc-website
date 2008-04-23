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

        <div align="center"><img src="/i/sponsor/BT_logo.png" border="0px" alt="British Telecom Logo" /></div>
        <br /><br />
        <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
            <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=sponsors&amp;d2=btChat20080306">SRM 392</a></strong><br />
            <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=sponsors&amp;d2=btChat20070721">SRM 359</a></strong>
        </div>
        <br /><br />

        <br />
        <h1>BT</h1>
        <h2>Next-gen developers for next-gen applications</h2>
        <p>BT is excited to sponsor the world's top programming talent at the 2008 TopCoder Open.  Al-Noor Ramji, CIO, BT Group says: "At BT, we are harnessing the power of our software-driven innovation ecosystem.  Partnering with the world's leading programming minds is core to that strategy."</p>
        <p>BT is one of the world's leading providers of communications solutions and services operating in 170 countries. Our vision is to help our customers thrive in a changing world and our mission is to be the leader in delivering converged network software services.  Executing on this mission, we are building one of the world's most advanced next generation communications networks, BT's 21<sup>st</sup> Century Network (21CN), shifting our focus from narrowband to IP enabled broadband.  Our network is our platform and software applications on our network will become our key value creators.</p>
        <p>We are exposing our network as a platform for developers in simple and innovative ways.  We have built a set of core communications services and have made them fit naturally into development environments that developers are familiar with, such as Java, .Net, PHP and Python.  These services empower developers to easily create new and innovative communications-enabled applications and mashups.  For more information, please visit <a target="_blank" href="<tc-webtag:linkTracking link='http://web21c.bt.com' refer='tco08_bt' />">http://web21c.bt.com</a>.</p>
        <p>If you can see the potential in tomorrow's voice and data networks, then join an exciting future at BT and play a key role in the development of compelling and useful software. There are global positions for extraordinary developers within BT, offering competitive pay and benefits.  If you are interested, please contact us at <a href="mailto:bt.design.applications@bt.com">bt.design.applications@bt.com</a>.</p>
        <p><a href="/tc?module=JobHit&amp;jid=401&amp;jt=1" class="button" style="width: 70px;">Apply Now</a></p>
        <p>&nbsp;</p>
        
        </div>
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
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>