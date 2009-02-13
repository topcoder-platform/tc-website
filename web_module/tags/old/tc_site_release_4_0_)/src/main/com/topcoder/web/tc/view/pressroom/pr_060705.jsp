<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

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
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
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
                        <div align="center">
                        <p><span class="bodyTitle">Caliper Hires TopCoder Software&#153; to Enhance Organizational Development Platform &amp; Services</span><br />
                        <span class="bodySubTitle"><em>Leading Personality Assessment Firm Employs TopCoder's Reusable Component-Based Methodology to Support IT Functions Across the Enterprise</em></span></p>
                        </p>
                        </div>
                        
<p><strong>GLASTONBURY, CT, June 7, 2005&#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Caliper Corp has selected the company to design and deliver a suite of component-based development projects.  The applications will be developed using TopCoder Software's rigorous specification and architecture process, competitive development methodology and distributed member base of over 55,000 developers worldwide. The TopCoder-built projects will allow Caliper to scale out their delivery capabilities by providing tools to customize and publish new products as well as calculate and present the results in a more flexible and dynamic manner. 
<br><br>
"TopCoder Software's innovative methodology and talented team of developers combine to deliver a higher level of performance," said Jason Guarracino, Chief Software Architect of Caliper Corp. "Working with TopCoder, Caliper has realized a fast, efficient and cost effective way to enhance our online offerings while not sacrificing functionality or the ability to expand with the business."
<br><br>
<span class="bodySubtitle">Benefits</span><br>
TopCoder Software architects designed the solutions using a combination of components from their .NET Component Catalog and custom components developed specifically for both applications, showing an estimated 80% re-use within the application. The web-based delivery mechanism will help display products by providing dynamic functionality such as multiple language support. The application effectively decreases the resources needed to introduce new product types, language translations and custom surveys allowing Caliper to better customize, manage, and create new products.   
<br><br>
"TopCoder Software components are built with reuse in mind, and we are already repurposing and integrating many of the custom components from the initial project into the next round of enterprise projects for Caliper," said Michael Morris, VP of Software Development at TopCoder Software. "With over 300 .NET and Java components available in our generic catalogs, TopCoder's reuse strategy provides fast and effective ROI for the enterprise." 
<br><br>
<span class="bodySubtitle">About TopCoder Software Components</span><br>
TopCoder Software components are developed using industry frameworks such as J2EE&#153;, J2ME and .NET with more than 300 components in those frameworks covering a wide range of functional categories including analysis, application management, communication, data management, date/time management, developer tools, document management , foundation, imaging, security, financial, web, reporting and work flow. TopCoder Software components can be extended and customized for additional functionality and can be bundled together to form more complex components and full-blown applications. 
<br><br>
Re-usable software components in the TopCoder Software catalogs drive down development cost and increase the overall quality while providing easy integration with existing services and applications. By introducing generic re-usable components to the development life cycle, which reduces the amount of software that must be built by an average of over 50 percent per application, developers can focus on customizing and integrating these components into a business solution. TopCoder utilizes a member base of over 55,000 talented individuals as a distributed development resource.
<br><br>
<span class="bodySubtitle">About Caliper Corp</span><br>
For over four decades, Caliper has advised more than 25,000 companies throughout the world on employee selection, employee development, team building and organizational development. Caliper's approach provides executives with the information and insights they need to assess and develop the potential of their key people. Caliper is available on the World Wide Web at http://www.calipercorp.com
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
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
