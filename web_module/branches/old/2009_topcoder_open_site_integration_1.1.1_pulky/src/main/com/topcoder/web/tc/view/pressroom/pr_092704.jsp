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
<p><span class="bodyTitle">TopCoder Developing Web- Based Application for CRPF Spinal Cord Injury Research Group</span><br />
<span class="bodySubTitle"><em>Consortium of Scientists Benefits from Interactive Platform Enabling Dissemination of Information and Easy Access to Miccroarray Data</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., September 27, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it has begun developing a  high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. 
<br/><br/>
"Microarray technology gives us an unbiased 'snapshot' of gene expression in many animals, including the mouse and rat, and humans. The approach enables biologists not only to explore gene changes after injury but also to look at genes that are changed by any experimental therapy. It is a powerful research tool," said Susan P. Howley, CRPF Executive Vice President and Director of Research. 
<br/><br/>
This interactive platform, which will allow users to see how thousands of genes behave after injury, will be available at http://genechip.salk.edu/ shortly and will make data easily accessible to all scientists including those unfamiliar with GeneChip technology. CRPF believes that the database information will be highly relevant to researchers investigating many different aspects of spinal cord injury. Since the web application is still under development, temporary access to the study's raw data and analyzed files is available now at: http://genechip.salk.edu/.  
<br/><br/>
The CRPF Research Consortium on Spinal Cord Injury is an international network of neuroscientists focused on repair and recovery of function in the chronically injured spinal cord. Through collaborative research, Consortium investigators are studying how to optimize the intrinsic capacity of the adult nervous system to repair and remodel itself as well as how to elicit robust regenerative responses after injury. 
<br/><br/>
"TopCoder is proud to work with an organization such as the CRPF," said Jack Hughes, Chairman and Founder of TopCoder, Inc. "We see the creative application of existing technologies as a powerful tool for researchers in this and other fields of medical science." 
<br/><br/>
<span class="bodySubtitle">About the Christopher Reeve Paralysis Foundation</span><br/>
The Christopher Reeve Paralysis Foundation (CRPF) is committed to funding research that develops treatments and cures for paralysis caused by spinal cord injury and other central nervous system disorders. The Foundation also vigorously works to improve the quality of life for people living with disabilities through its grants program, Paralysis Resource Center, and advocacy efforts. For more information on CRPF's Research Consortium visit: http://www.ChristopherReeve.org or contact Susan P. Howley at 800-225-0292, ext. 113.
<br/><br/>
<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
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
