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
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">

      <div align="center">
      <img src="/i/sponsor/sap_logo.gif" border=0/>
      </div>

<p>
<b>Connect, Collaborate, Contribute</b><br>
The SAP Developer Network (SDN) is proud to sponsor TopCoder and contribute to the ongoing pursuit of technical excellence.  Our strong commitment to community engagement, as evidenced by the active participation in the SDN site by our own engineers and product managers, makes us the perfect match for you, the competitor seeking to connect with your peers.  Join SDN and tap into the passionate community of technologists and innovators sharing their experience to strengthen the collective knowledge around SAP solutions.
<br><br>
<b>Helping IT Drive Innovation and Change</b><br>
Can your company adapt quickly enough to respond to new challenges or seize new opportunities? With SAP NetWeaver, it can.
<br><br>
A comprehensive integration and application platform, SAP NetWeaver works with your existing IT infrastructure to enable and manage change. With SAP NetWeaver, you can flexibly and rapidly design, build, implement, and execute new business strategies and processes. The platform enables you to drive innovation throughout your organization by recomposing existing systems while maintaining a sustainable cost structure. You can also add innovative, industry-specific business processes with reduced risk to existing systems and a strong return on investment.
<br><br>
SAP NetWeaver unifies integration technologies into a single platform and is preintegrated with business applications, reducing the need for custom integration. The platform is based on industry standards and can be extended with commonly used development tools such as Java 2 Platform, Enterprise Edition (J2EE); Microsoft .NET; and IBM WebSphere. 
<br><br>
To learn more about SDN and SAP NetWeaver at <A href="http://sdn.sap.com" target="_blank">http://sdn.sap.com</A>.
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
