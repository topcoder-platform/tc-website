<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="505903" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Software Component Libraries Selected as <br>Finalist for the 16th Annual Jolt Awards</span><br />
<span class="bodySubTitle"><em>Software Development Magazine Recognizes CBD Best Practices and Engineering <br>Discipline in TopCoder's Reusable .NET and Java Component Catalogs<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, January 26, 2006 &#151;</strong>TopCoder&#174;, Inc.,  the leader in online programming competition, skills assessment and competitive software development, today announced that its TopCoder Software libraries of .NET and Java components have been selected as finalists for this year's Jolt Product Excellence and Productivity awards. For the past 15 years CMP Media's Software Development magazine has presented the awards to showcase products that have "jolted" the industry with their significance and made the task of creating software faster, easier, and more efficient. The TopCoder Software libraries of reusable generic components have been recognized in the Libraries, Frameworks, and Components category. TopCoder Software component catalogs and custom applications are used by leading companies including ABB; ING; Talbots; Ferguson; Stage Stores; and VeriSign. For more information on TopCoder Software catalogs, visit <a href="http://software.topcoder.com/catalog/c_showroom.jsp">http://software.topcoder.com/catalog/c_showroom.jsp</a>.
<br><br>
"These products represent a cross section of the most ground-breaking tools for every phase of the software development lifecycle &mdash; a testament that the spirit of innovation is alive and well in the software development sector," said Software Development Technical Editor Rosalyn Lum. "In the next phase, we'll be 'looking under the hood' at these select products, not only examining the standard criteria of audience suitability, productivity, innovation, quality, ROI, risk, and flexibility, but also seeking products that are: ahead of the curve; universally useful; simple, yet rich in functionality; redefine their product space; or solve a nagging problem that has consistently eluded other products and books."
<br><br>

<span class="bodySubtitle">About TopCoder Software Components</span><br>


TopCoder Software components are developed using industry frameworks such as J2EE(TM) and .NET with more than 400 components in those frameworks covering a wide range of functional categories including analysis, application management, communication, data management, date/time management, developer tools, document management, foundation, imaging, security, financial, web, reporting and work flow. TopCoder Software components can be extended and customized for additional functionality and can be bundled together to form more complex components and full-blown applications. 
<br><br>
Re-usable software components in the TopCoder Software catalogs drive down development cost while providing easy integration with existing services and applications. By introducing re-usable components to the development life cycle, which reduces the amount of software that must be built by an average of over 50 percent per application, developers can focus on customizing and integrating these components into a business solution. TopCoder utilizes a member base of over 70,000 talented individuals as a distributed development resource.
<br><br>
More information on the Jolt Product Excellence and Productivity Awards is available at <a href="http://www.sdmagazine.com">http://www.sdmagazine.com</a>.
<br><br>

<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="http://www.topcoder.com">www.topcoder.com</a>.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
</p>
                                                
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
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
