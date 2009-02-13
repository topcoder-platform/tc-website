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
        
        <br />
        <h1>British Telecommunications (BT) is hiring!</h1>
        <p>We are aiming to create high-performance teams of talented, passionate software engineers who can see the potential in tomorrow's voice and data networks, who are ready to make their mark in helping to drive the global transformation to a digital economy and who are excited to develop the next generation of Web 2.0 services and applications leveraging the power of BT's IP enabled 21Century next-generation network!</p>
        <p>BT is one of the world's leading providers of communications solutions and services operating in 170 countries.  Our vision is to be dedicated to helping customers thrive in a changing world and our mission is to be the leader in delivering converged networked software services.</p>
        <p>Content providers, emerging as a serious rival to network operators in the next-generation services arena, are working to develop competitive services using completely different approaches than those slowly making inroads in the telecom sector.</p>
        <p>Increasingly, the Internet world is becoming a source of digital content services at an alarming rate using so-called Web 2.0 technologies that have nothing to do with telco standards such as IMS and SIP, presenting a range of new and emerging rivals to network operators.</p>
        <p>Unlike other telcos, BT is becoming a software driven, networked IT services.  In the next-generation services arena, BT is working to develop competitive services using completely different approaches than those slowly making inroads in the telecom sector (e.g. <A href="<tc-webtag:linkTracking link='http://www.sdk.bt.com/' refer='bt' />">www.sdk.bt.com</a>) and is universally acknowledged to be moving farther and faster than any other operator with Web 2.0 service development and business models.</p>
        <p>In order to beat the Internet companies at their own game, BT needs YOU to find innovative ways to harness the service creation potential of Web 2.0.!</p>
        <p>You, our APIs, a $2,000 PC and a $10bn network to play with...</p>
        <p>Become part of our exciting future at BT.  You will be on the forefront in the creation of new and exciting products in a number of areas, and play a key role in the development of compelling and useful software in a swiftly changing industry.</p>
        <p>There are positions for extraordinary coders with BT, offering competitive pay and benefits, in the United Kingdom (London), the United States (Denver), China (Dalian) and India (Bangalore).</p>
        <p><a href="/tc?module=JobHit&jid=401&jt=1" class="button" style="width: 70px;">Apply Now</a></p>
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