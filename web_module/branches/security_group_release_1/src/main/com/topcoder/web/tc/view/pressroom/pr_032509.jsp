<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="526935" message="Discuss this press release" /></div> 
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Named 2009 "Cool Vendor" for Application Development by Leading Analyst Firm</span><br />
<span class="bodySubTitle"><em>Vendors selected for the "Cool Vendor" report are innovative, impactful and intriguing</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. - March 25, 2009</strong> - <a href="http://www.topcoder.com" target="_blank">TopCoder, Inc.</a>, the leader in online programming competition, skills assessment and competitive software development, today announced it has been included in the 2009 "Cool Vendors for Application Development" report issued by Gartner, Inc.</p>

<p>Companies included in the report are characterized as being representative of the innovative vendors aimed at raising the IT organization's ability to deliver high-quality, low-cost application development through novel approaches to sourcing, methods and tools. TopCoder's delivery-based engagement model is designed to remove much of the frustration of bottlenecks and single points of failure from the entire software development process. The TopCoder 'multi-sided' platform brings together companies and individuals with members of a professional technical and design community that understand how to take advantage of its full power.</p>

<p>"We see inclusion in this report as great validation from a highly regarded research industry powerhouse and further affirms the decisions of forward-looking companies who are clients" said Rob Hughes, president and COO at TopCoder, Inc. "Above all, we believe it is tremendous recognition for the members who make up the community and constantly drive the innovation and excellence which has become a TopCoder hallmark."</p>

<p>For more information on TopCoder Software and competitions visit <a href="http://www.topcoder.com" target="_blank">www.topcoder.com</a>.</p>

<p><strong>The TopCoder Software Factory</strong><br />
For TopCoder member clients, TopCoder is a full service software factory building professional grade applications ranging in size from small business solutions to Enterprise systems for the Fortune 500. Applications include everything from simple widgets and iPhone mobile apps to web development to large scale enterprise applications. The TopCoder process adheres to a rigorous standards-based methodology that uses deep metrics and analysis in all aspects of the project work to ensure high quality solutions are produced very quickly. Because assets created are homogenous for various environments, the TopCoder process includes a high percentage of re-use Ð accelerating application development. At the core of TopCoder is competition, which drives results and performance. TopCoder's delivery-based engagement model is designed to remove much of the frustration of bottlenecks and single points of failure from the software development process. The TopCoder 'multi-sided' platform brings together companies and individuals with members of a professional technical and design community that understand how to take advantage of its full power.</p>

<p><strong>About the Gartner Cool Vendor report</strong><br />
Gartner's listing does not constitute an exhaustive list of vendors in any given technology area, but rather is designed to highlight interesting, new and innovative vendors, products and services. Gartner disclaims all warranties, expressed or implied, with respect to this research, including any warranties of merchantability or fitness of a particular purpose. Gartner defines a cool vendor as a company that offers technologies or solutions that are: Innovative, enable users to do things they couldn't do before; Impactful, have, or will have, business impact (not just technology for the sake of technology); Intriguing, have caught Gartner's interest or curiosity in approximately the past six months.</p>

<p><strong>About TopCoder, Inc.</strong><br /> 
TopCoder is the world's largest competitive software development community with more than 187,000 developers representing over 200 countries. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/" target="_blank">http://www.topcoder.com/</a>.</p>

<p>1) Gartner, Inc. "Cool Vendors in Application Development" by Jim Duggan et al, March 23, 2009</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>

                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
