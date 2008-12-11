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
                    
<div align="right"><tc-webtag:forumLink forumID="519749" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Software Component Catalog Surpasses 1,000 Reusable Java and .NET Components</span><br />
<span class="bodySubTitle"><em>Customers Leverage TopCoder Components to Increase Pre-Built Software an Average 50 Percent<br />for New Applications-Yielding Substantially Shorter Development Timelines and Decreased Costs</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., February 18, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that its catalog of member-built generic Java&trade; and Microsoft&reg; .NET Framework compatible components has surpassed the 1,000 component milestone, growing to more than 1,100 total units this month. TopCoder leverages its global member base of more than 140,000 highly skilled developers, and a unique competition-based methodology that ensures the highest quality software development, to continually grow the industry's most robust catalog of generic, reusable components. This manufacturing approach to software development yields unprecedented quality and cost saving benefits through the competitive advantage of a virtual software factory that can be turned on or off at any time.
</p>

<p>
"With our competition model driving up software quality in a way no one else can duplicate, customer demand is increasing as organizations seek to tap the TopCoder Software Component Catalog as an unmatched source of proven software building blocks," said Dave Messinger, chief architect, TopCoder. "Surpassing the 1,100 component milestone is significant, as a greater percentage of pre-built, fully tested components ready for new projects translates into faster, higher quality applications which are already up to 70 percent complete."
</p>

<p>
The current TopCoder Software catalog includes over 700 Java generic and custom components with more than 400 total .NET Framework compatible components. TopCoder software components have functionality across major categories including AJAX, persistence, UML and infrastructure. The TopCoder community can be leveraged to build custom applications as well, with competitions recently producing custom applications focusing on technologies such as the AIM XMPP gateway, a real-time energy pricing calculator and wireless solutions for industry leaders in the entertainment and financial services sectors.
</p>

<p>
<span class="bodySubtitle">About TopCoder Software Components</span><br />
TopCoder Software components are developed using industry frameworks such as J2EE(TM) and Microsoft .NET Framework with more than 1,100 components in those frameworks covering a wide range of functional categories including analysis, application management, communication, data management, date/time management, developer tools, document management , foundation, imaging, security, financial, web, reporting and work flow. TopCoder Software components can be extended and customized for additional functionality and can be bundled together to form more complex components and full-blown applications. Reusable software components in the TopCoder Software catalogs drive down development cost while providing easy integration with existing services and applications. By introducing reusable components to the development life cycle, which reduces the amount of software that must be built by an average of over 50 percent per application, developers can focus on customizing and integrating these components into a business solution. TopCoder utilizes a member base of over 140,000 talented individuals as a distributed development resource. The full TopCoder component catalog is available at: <a href="http://software.topcoder.com/catalog/c_showroom.jsp?a=all">http://software.topcoder.com/catalog/c_showroom.jsp?a=all</a>
</p>

<p>
<span class="bodySubtitle">About TopCoder Software Application Methodology</span><br />
The TopCoder Application Development Methodology is designed to deliver a repeatable and consistent solution to our customers. The TopCoder methodology is comprised of phases and deliverables. The six-step methodology is administered by a TopCoder Project Manager skilled in Component Based Development (CBD) techniques, requirements gathering, and project management.
</p>
<p>
During the specification phase, the Project Manager works hand-in-hand with the customer to develop specifications that satisfy all requirements. In the component architecture phase, the Project Manager and TopCoder Component Architect identify and design the components required to build the application. Next, the component production phase uses TopCoder's unique component methodology, to create all of the components.
</p>
<p>
During the application assembly phase, the Project Manager hand-selects only proven members to participate in the assembly of the application. During this phase, the components are linked together to build the application. Once assembled, the certification phase begins. Prior to deployment at the customer's site, the application is rigorously tested at TopCoder. After certification, the application is delivered to our customers and deployed to their quality assurance environment, as part of the deployment phase. For more information on the TopCoder Methodology visit: <a href="http://software.topcoder.com/components/methodology.jsp">http://software.topcoder.com/components/methodology.jsp</a>
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 140,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.   The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.   This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about utilizing TopCoder's software services or sponsoring TopCoder events, visit <a href="/">http://www.topcoder.com/</a>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
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
