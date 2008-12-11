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
<p><span class="bodyTitle">LOGICLIBRARY TEAMS WITH TOPCODER TO ACCELERATE SERVICE-ORIENTED ARCHITECTURE (SOA) DEPLOYMENTS</span><br />
<span class="bodySubTitle"><em>Leading Software Development Asset Management Provider Joins Forces with Pioneer of Competitive Component Development Methodology to Enable More Effective Software Reuse</em></span></p>
</div>

<p><strong>PITTSBURGH, PA, March 14, 2005&#151;</strong>
LogicLibrary&#174;, the leading provider of software development asset management tools, today announced a strategic partnership with TopCoder Software(TM), the leader in identifying, evaluating and mobilizing effective software development resources, to deliver cutting-edge software components for organizations building and managing reusable components and services, service-oriented architectures (SOAs) and other application development projects. This strategic partnership is intended to bolster the already impressive collection of "out-of-the box" content preinstalled with Logidex, driving a faster return on investment for LogicLibrary customers, while improving the market reach of TopCoder's competitively developed component catalogs.
<br /><br />
LogicLibrary's Logidex is a collaborative software development asset (SDA) management solution that simplifies the creation, integration, governance and security of enterprise applications throughout the complete application lifecycle, in both .NET and J2EE environments. The integration of Logidex with TopCoder's software component catalogs will give application developers and architects unparalleled resources for delivering custom applications built from existing assets. In addition to being able to discover and manage internal software assets, Logidex users will be able to search the TopCoder .NET and J2EE component catalogs for software assets that align with a company's business needs.
<br /><br />
"As developers turn to SOA, reusable components are becoming the building blocks of applications because of their ability to reduce costs, streamline projects and improve productivity," said Scott Crawford, senior analyst at Enterprise Management Associates. "This combination of high-quality software components and a proven SDA management solution should foster great results for organizations involved with SOAs."
<br /><br />
TopCoder offers more than 300 software components that are developed using industry frameworks such as J2EE and .NET and cover a wide range of functional categories including analysis, application management, data management, developer tools, foundation, security, financial and Web. These components can be extended and customized for additional functionality and can be combined to form more complex components and even complete applications. By using the results of its acclaimed programming competitions, TopCoder is able to deliver application components created by the best programmers in the industry.
<br /><br />
"Introducing reusable components into the software development lifecycle is one of the most effective ways organizations can drive down development costs and jumpstart their SOA projects," said Mike Morris, VP Software Development at TopCoder. "Our unique competitive Component Development Methodology combines the best of traditional software development with the power of community-based development, allowing customers to create flexible, easily customizable software assets. And LogicLibrary's ability to manage these assets and map them to specific business processes is unrivaled. The TopCoder-LogicLibrary partnership will deliver enormous value to joint customers as they build and manage SOAs."
<br /><br />
Logidex serves as an SOA governance platform across the application development lifecycle from functional requirements through design and development to operations and deployment. It gives businesses and government organizations the ability to manage and control the design, development and consumption of services throughout the distributed enterprise. Logidex features tight integration with all major development environments, including Eclipse, IBM Rational Application Developer, IBM Rational Software Architect, IBM Rational Software Modeler, Microsoft Visual Studio .NET and SAP NetWeaver.
<br /><br />
"Component-based development offers significant advantages over pre-packaged applications and custom-built programs," said Alan Himler, VP of Marketing and Product Management at LogicLibrary. "With component-based development, organizations can use pieces of applications that can be customized and tied together to form a unique solution that suits their exact needs. With over 50,000 talented coders from across the globe contributing to their component catalogs, TopCoder's software assets offer Logidex users an incredible resource for building high-quality applications quickly and efficiently. Teaming with TopCoder is indicative of LogicLibrary's dedication to provide the most comprehensive software development asset management solution on the market."
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">http://www.topcoder.com</A>.
<br /><br />
<span class="bodySubtitle">About LogicLibrary</span><br />
LogicLibrary is the leading provider of software and services that make it possible for enterprises to manage and reuse software development assets (SDAs). The company's patent-pending technology provides a comprehensive and collaborative approach for creating, migrating and integrating enterprise applications for use in service-oriented architecture, Web services and other software development initiatives. Additionally, LogicLibrary's BugScan provides powerful, easy-to-use application-scanning technology that helps architects and developers ensure the highest levels of security at the onset of the design and development process.
<br /><br />
LogicLibrary has been positioned in the "Leader" quadrant in Gartner Inc.'s Magic Quadrant for Metadata Repositories, 2004* and maintains strategic partnerships with Microsoft, as a Premier member of the Visual Studio Industry Partner (VSIP) program, IBM, as an Advanced PartnerWorld Partner, and Serena. LogicLibrary has been recognized the past two years on the SD Times 100 list of leaders and innovators in the software development industry and has integration partnerships that include Microsoft, IBM, Eclipse and Borland. LogicLibrary is headquartered in Pittsburgh, with additional offices in Rochester, MN and Sunnyvale, CA. For more information, visit <A href="http://www.logiclibrary.com">www.logiclibrary.com</A>.
<br /><br />
* Magic Quadrant for Metadata Repositories, 2004; Michael Blechar; March 5, 2004.
<br /><br />
LogicLibrary and Logidex are trademarks of LogicLibrary, Inc.
<br /><br />
All other brands and product names are trademarks or registered trademarks of their respective companies.
</p>
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
