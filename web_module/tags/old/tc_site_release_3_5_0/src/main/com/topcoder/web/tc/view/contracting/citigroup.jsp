<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="openings"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

		<div align="center">
      <img src="/i/contracting/citigroup_logo.gif" border=0/>
		</div>

<p>
<span class="bodySubtitle">Join Our Team</span>
<br><br>
Citigroup's Equity Derivative division is looking to hire top talent to solve some of the most computationally and mathematically challenging problems around.
<ul>
<li>Automated proprietary trading algorithms require real time statistical analysis of 500,000 securities with 100,000 updates of input data per second.  To excel in this high frequency environment, one needs to implement cutting edge grid computing, artificial intelligence, and advanced numerical optimization techniques.</li>
<li>Risk management systems require sophisticated distributed computing to price complex exotic derivative securities in real-time.</li>
<li>Trading System design requires minimal latency, high throughput, and mind boggling uptime.</li>
</ul> 

Our proprietary trading and risk analysis software is the lifeblood of our business.  Knowledge of finance is not important - a sharp mind and a love of complex problems is what matters. Nestled inside the world's largest financial company - we are a tight knit and dedicated group.  We want to find like minded candidates at all levels of experience to join our team.
<br><br>
Citigroup recently chatted with the members about Employment Opportunities before several SRMs. Take a look:<br>
<A href="/tc?module=Static&d1=contracting&d2=citigroup_chat">06.21.05</A><br>
<A href="/tc?module=Static&d1=contracting&d2=citigroup_chat_071905">07.19.05</A>
<br/><br/>
      <a href="/tc?module=JobHit&jid=297&jt=4">Apply now to be contacted by Citigroup!</a>
		<br/><br/>
        <p><br></p>
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
