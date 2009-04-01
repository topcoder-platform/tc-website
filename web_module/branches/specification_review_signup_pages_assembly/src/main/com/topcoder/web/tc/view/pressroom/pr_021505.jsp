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
<p><span class="bodyTitle">TopCoder Software(TM) Opens Access to Reusable Java(TM) and .NET(TM) Component Catalogs</span><br />
<span class="bodySubTitle"><em>Competitive Software Development Leader Offers Free Subscriptions to Individual Developers for Non-Commercial Software Projects</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, February 15, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced TopCoder Software is providing individual member developers free subscriptions to its full catalog of software components. TopCoder Software's free subscription permits non-commercial use of the entire catalog including over 200 Java and nearly 100 .NET components from any computer at any time. Eligible users will also be given unlimited access to TopCoder Software Customer Forums. For full details on free membership and registration, please visit http://software.topcoder.com/components/subscriptions.jsp.
<br /><br />
"Making our components available at no cost helps eliminate the economic barrier that has previously prevented some individual developers from using and benefiting from our catalogs," said Mike Morris, VP of Software Development at TopCoder Software. "We are giving developers a highly tested and thoroughly documented toolbox with an array of powerful tools they can use to build high quality software applications."
<br /><br />
This program will allow TopCoder Software components to be used in a personal, educational, or corporate development (pre-commercial) capacity. The components may not be used in a commercial post-development capacity or in any widely distributed application without first obtaining an enterprise level subscription agreement with TopCoder, Inc.  Additional benefits from an Enterprise Subscription include full product support including online forums, phone and onsite technical resources.
<br /><br />
<span class="bodySubtitle">About TopCoder Software Components</span><br />
TopCoder Software components are developed using industry frameworks such as J2EE(TM) and .NET with more than 300 components in those frameworks covering a wide range of functional categories including analysis, application management, communication, data management, date/time management, developer tools, document management , foundation, imaging, security, financial, web, reporting and work flow. TopCoder Software components can be extended and customized for additional functionality and can be bundled together to form more complex components and full-blown applications.
<br /><br />
Re-usable software components in the TopCoder Software catalogs drive down development cost while providing easy integration with existing services and applications. By introducing re-usable components to the development life cycle, which reduces the amount of software that must be built by an average of over 50 percent per application, developers can focus on customizing and integrating these components into a business solution. TopCoder utilizes a member base of over 50,000 talented individuals as a distributed development resource.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder Software is a trademark of TopCoder, Inc. in the United States and other countries.
<br /><br />
Java and J2EE are trademarks of Sun Microsystems, Inc. in the United States and other countries.
<br /><br />
.NET is a trademark of Microsoft Corp. in the United States and/or other countries.
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
