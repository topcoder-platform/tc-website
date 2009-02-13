<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<div align="center">
<p><span class="bodyTitle">TopCoder Teams with Telecom Leaders in OSS through Java(TM) Initiative</span><br />
<span class="bodySubTitle"><em>Competitive Software Development Methodology Will Be a Part of Standards Development for Operational Support Systems</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., November 3, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development today announced
that the company has joined the OSS through Java(TM) Initiative (OSS/J) as a Focus Member.  OSS/J is a working group of industry leaders,
including Motorola, NEC and Nortel, who have joined resources to define and implement an open, standard set of Java technology-based APIs
that help jumpstart the implementation of services for next-generation networks by easing the integration of OSS/BSS (Operational and
Business Support System) applications. </p>

<p>TopCoder Software will be responsible for two critical projects for the OSS/J Program.  The first is a Test Proxy for OSS/J's Technology
Compatibility Kits (TCKs) that  provides a mechanism for testing OSS/J implementations over multiple underlying integration profiles such
as Java Messaging Services (JMS) and Web Services.  The second is to enable devices and embedded systems implementing lightweight
instrumentation with JMX(TM) (Java Management eXtensions) that directly map into OSS/J APIs for easy integration with OSS/BSS solutions.
JMX is part of the Java 2 Platform, Standard Edition (J2SE(TM)), and therefore available in any Java Virtual Machine.  These initial components
directly contribute to functional areas such as OSS Quality of Service, OSS Billing and OSS Trouble Ticket.</p>

<p>"The OSS/J Initiative is a perfect vehicle to exploit the strengths of TopCoder Software," said Dave Tanacea, President of TopCoder Software.
"We are excited to be a part of this valuable program.  By leveraging our no-shore competition-based development methodology and tapping into
a team of the best technologists in the world, we can execute on the development of these components with complete confidence.  Confidence and
dedication to programming excellence are critical when establishing standards that will be utilized in major enterprise systems around the world,
and this is what TopCoder Software can best provide."</p>

<p>"TopCoder is in many ways an ideal member of the OSS through Java Initiative," says Philippe Lalande, Sun Microsystems, OSS/J's program
manager.  "The company has years of development experience in a wide range of industries, a strong commitment to standards, a keen understanding
of the value of component-based solutions, and a willingness to contribute resources in critical areas.  Java software developers and OSS application
developers worldwide will greatly benefit from TopCoder's contributions to OSS/J, which will enhance our TCK process and further the adoption of
our APIs."</p>

<p><span class="bodySubTitle">About TopCoder Software</span><br />
TopCoder Software harnesses the talent of the internationally ranked TopCoder member base to design, develop and implement cost-effective, high
quality software.  Through a unique competition-based development methodology, TopCoder Software leverages its catalogs of re-usable components
to develop and deliver commercial applications and services.  For more information regarding TopCoder Software, please visit
<A href="http://www.topcodersoftware.com">www.topcodersoftware.com</A> or call toll free 866-TopCode.</p>

<p><span class="bodySubTitle">About the OSS through Java Initiative</span><br />
Building on the success of Java 2 Enterprise Edition (J2EE(TM)) technology in enterprise applications and e-commerce, the OSS through Java
Initiative is chartered to develop APIs that accelerate the development of innovative OSS/BSS solutions where all applications function together. The
Initiative's APIs are standardized under the latest Java Community ProcessSM (JCP) program. JCP deliverables for each application area consist of
a specification, a reference implementation, and a technology compatibility kit - all of which, including source code, are made available to the industry
free of charge. The Initiative's APIs help Service Providers jumpstart the deployment of end-to-end services on next-generation wireless networks
and leverage the convergence of telecommunications and Internet-based solutions. For more information on the OSS through Java initiative, visit:
<A href="http://java.sun.com/products/oss/" target="_blank">java.sun.com/products/oss.</A></p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>
<p>Sun, Sun Microsystems, the Sun logo, Java, J2EE, J2SE, JMX, Java Community Process and The Network Is The Computer are trademarks or
registered trademarks of Sun Microsystems, Inc. in the United States and other countries.</p>

<p>###</p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
