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
<p><span class="bodyTitle">TopCoder Launches Application Development Services with Java and .NET Component Catalogs</span><br />
<span class="bodySubTitle"><em>Philip Morris, Borders, Detroit Edison and 1-800-FLOWERS Leverage TopCoder Software's Competition-Based Methodology for Higher Quality, Lower Cost and Faster Development of Software</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 11, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced a new business unit, 
TopCoder Software, the first company to combine elite programming talent, a unique competition-based development methodology 
and catalogs (J2EE and .NET) of re-usable software components to quickly deliver high quality software applications at a low cost.  
With customers, including Philip Morris USA Inc., 1-800-FLOWERS.COM, Borders Group Inc. and Detroit Edison, TopCoder 
Software provides a successful new model for application development that dramatically reduces costs while improving quality.</p>

<p>Through weekly competitions and annual tournaments, TopCoder has successfully identified some of the best software development 
talent in the world.  Currently, TopCoder boasts a membership of over 28,000 programmers residing in more than 150 countries.  
By qualifying these developers through competition, TopCoder has created and coined a "no-shore" development model to outsource 
software development.</p>

<p>"Quality of programming ability, not country of residence, is what matters to TopCoder," said David Tanacea, President of 
TopCoder Software.  "TopCoder Software manages the most elite developers via a competition-based development methodology to 
create commercial software applications quickly and at a low cost to the customer.  We offer an alternative to CIOs that can't be 
matched anywhere."</p>

<p><span class="bodySubTitle">Service Offering</span><br />
TopCoder Software Project Managers work on-site with TopCoder customers to understand their needs and create functional 
requirements for applications.  Requirements are then broken down into multiple design and development projects, and contracted 
out to select TopCoder members.    Throughout the development process, review boards, selected from TopCoder's qualified member 
base, score the submissions, with the best solution advancing to the development process.  Finally, the application is integrated by 
TopCoder Software and delivered to and implemented in the customer's environment.</p>

<p>"What makes TopCoder unique among component library vendors is their development strategy," said Rod Davenport, Enterprise 
Technology Strategist for DTE Energy (Detroit Edison).  "It harnesses the strength of the global development community that has been 
so effective in creating the GNU tools, Linux kernel, Apache and the rest of the components that have formed the backbone of the modern 
day Internet.  TopCoder's strategy ensures quality through rigorous peer review and testing while at the same time providing the 
contributors some additional incentive to participate in the process.</p>

<p><span class="bodySubTitle">Re-usable Components</span><br />
Throughout this entire development process, components are identified and utilized from the TopCoder Software Component Catalogs.  
These catalogs contain infrastructure components that are the building blocks of all software applications and are the most efficient 
method to drive costs out of the software development process.  Catalogs exist for both the J2EE and .NET frameworks.</p>

<p>Customers subscribe to the TopCoder Software Component Catalogs at <a href="http://www.topcodersoftware.com">www.topcodersoftware.com</a>.  
Subscriptions are available for individual developers and enterprises. "By harnessing the efforts of the best developers in the world, 
TopCoder Software has built a catalog of the most well designed and well written components available anywhere," said Tanacea.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder 
members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a 
powerful community of programmers.  Corporate partners access this member base for employment, software development and 
sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship 
of TopCoder Events, please visit <a href="/">www.topcoder.com.</a></p>

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
