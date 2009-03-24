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


<%------CONTENT-------%>
<div align="center">
<p><span class="bodyTitle">TopCoder Software(TM) Delivers Web-Based Interactive Platform for International Consortium of Spinal Cord Injury Researchers</span><br />
<span class="bodySubTitle"><em>Enhances Collaboration Amongst Gene Expression Laboratory at Salk Institute, Christopher Reeve Paralysis Foundation and Leading Neuroscientists Worldwide</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, January 25, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it has successfully deployed a high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community including the state-of-the-art gene expression laboratory at the world renowned Salk Institute for Biological Studies in La Jolla, CA.
<br /><br />
This custom interactive platform, which allows users to see how thousands of genes behave after injury, is available at http://genechip.salk.edu/ and makes data easily accessible to all scientists including those unfamiliar with GeneChip technology. CRPF believes that the database information is highly relevant to researchers investigating many different aspects of spinal cord injury. Access to the study's raw data and analyzed files is available now at: <A href="http://genechip.salk.edu/">http://genechip.salk.edu/</A>.
<br /><br />
"The information provided by gene expression microarray technology has long been of interest to scientists throughout the spinal cord research community," said Dr. Fred H. "Rusty" Gage of the Salk Institute. "What has been lacking, and what TopCoder's tool provides, is a mechanism for scientists around the world to effectively retrieve the data that interests them."
<br /><br />
<span class="bodySubtitle">Project Detail</span><br />
The Salk Institute has an extremely large amount of gene data resulting from years of research on the topic of spinal cord injury.  Scientists across the globe need to access this data to further their own related research.
<br /><br />
Because of the large amount of information resulting from the research, it is extremely difficult to distribute the data to interested scientists.  Additionally, as most researchers only require a subset of the information produced by Salk, it is important that they have the ability to quickly access the data they need without having to sort through excess information.
<br /><br />
The TopCoder GeneChip Data Interface provides this scientific community with an HTML-based interface to access project data, which allows them to intuitively navigate and search through the data easily using well known HTML interface tools.  This application deploys an initial set of research, and provides a straightforward way for administrators to add new data as needed.
<br /><br />
The TopCoder solution substantially eases the searching process for any user, allowing them to retrieve the information they need with a minimum of confusion and effort. The TopCoder Application Development Methodology was employed to design and develop the application.
<br /><br />
"The researchers who will benefit from this application are experts in neuroprotection, growth inhibition, promotion of axon growth, axon guidance, synapse formation and neurotransmission, cellular replacement and artificial substrates and rehabilitation strategies," said Susan P. Howley, CRPF Executive Vice President and Director of Research. "TopCoder has provided this tapestry of approaches with an improved means of collaboration and a better way to transfer the knowledge and expertise these scientists bring to the task of repairing the damaged spinal cord."
<br /><br />
The CRPF Research Consortium on Spinal Cord Injury is an international network of neuroscientists focused on repair and recovery of function in the chronically injured spinal cord. Through collaborative research, Consortium investigators are studying how to optimize the intrinsic capacity of the adult nervous system to repair and remodel itself as well as how to elicit robust regenerative responses after injury.
<br /><br />
"We are very pleased to have been able to help out on this important project.  Vehicles such as this web site help speed the process of discovery by allowing the research community at large to benefit from the work of others," said Jack Hughes, Chairman of TopCoder, Inc., and Vice Chairman of the CRPF Executive Committee. "We applaud the Consortium on their willingness to open up discovery to the broader research community."
<br /><br />
<span class="bodySubtitle">About the Salk Institute</span><br />
The Salk Institute for Biological Studies in La Jolla, California, is an independent nonprofit organization dedicated to fundamental discoveries in the life sciences, the improvement of human health and the training of future generations of researchers. Jonas Salk, M.D., whose polio vaccine all but eradicated the crippling disease poliomyelitis in 1955, opened the Institute in 1965 with a gift of land from the City of San Diego and the financial support of the March of Dimes. For more information please visit <A href="http://www.salk.edu">http://www.salk.edu</A>.
<br /><br />
<span class="bodySubtitle">About the Christopher Reeve Paralysis Foundation</span><br />
The Christopher Reeve Paralysis Foundation (CRPF) is committed to funding research that develops treatments and cures for paralysis caused by spinal cord injury and other central nervous system disorders. The Foundation also vigorously works to improve the quality of life for people living with disabilities through its grants program, Paralysis Resource Center, and advocacy efforts. For more information on CRPF's Research Consortium visit: <A href="http://www.ChristopherReeve.org">http://www.ChristopherReeve.org</A> or contact Susan P. Howley at 800-225-0292, ext. 113.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit http://www.topcoder.com.
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
