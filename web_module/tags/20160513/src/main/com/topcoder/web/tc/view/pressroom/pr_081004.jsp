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
<p><span class="bodyTitle">TopCoder Software Wins New Customer Contracts</span><br />
<span class="bodySubTitle"><em>Thomson Prometric and Burlington Coat Factory Select TopCoder Software for Enterprise Solutions</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 10, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that TopCoder Software has won several new accounts including Thomson Prometric and Burlington Coat Factory. The projects will utilize TopCoder Software's competitive application development model which harnesses the talent of software developers from around the world to design, develop and deploy software. TopCoder Software components and applications are proven solutions that deliver cost savings of up to 40 percent and time savings of up to 50 percent over traditional development models.
<br/><br/>
"TopCoder has turned a novel approach into a unique business model that delivers high quality software components for its corporate customers," said Lawrence Wilkes, technical director and principal analyst at CBDi. "TopCoder's process ensures consistency and quality by being involved in the whole manufacturing and QA process, not just the distribution." 
<br/><br/>
TopCoder Software Methodology        
Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of more than 40,000 developers to design, develop and deploy software through its revolutionary competitive development methodology which emphasizes thorough specification and design, distributed development using reusable components and a rigorous quality assurance review process. The five phases of the methodology (Specification, Design, Development, Integration and Certification) make up one release of a component. Submissions are subjected to rigorous QA standards and the best one is selected for advancement to the next phase. The result is higher quality, lower cost software solutions than traditional software development methodologies. TopCoder Software's unique development methodology and catalog of more than 175 reusable components allows custom applications to be delivered for a fraction of the cost of traditional approaches. For full details click <A href="http://software.topcoder.com/components/methodology.jsp">here</A>. 
<br/><br/>
"We're pleased that leading companies such as Thomson Prometric and Burlington Coat Factory are joining the list of clients who see the value in TopCoder Software's Component-Based Methodology," said Dave Tanacea, President of TopCoder Software.  "TopCoder Software solutions are cost-effective, fast on the turnaround and are subjected to a comprehensive quality control process that delivers a new level of application reliability and customer satisfaction." 
<br/><br/>
<span class="bodySubtitle">About The Thomson Corporation and Thomson Prometric</span><br/>
The Thomson Corporation (http://www.thomson.com/), with 2003 revenues of $7.6 billion, is a global leader in providing integrated information solutions to business and professional customers.  Thomson provides value-added information, software tools and applications to more than 20 million users in the fields of law, tax, accounting, financial services, higher education, reference information, corporate training and assessment, scientific research and healthcare.  With operational headquarters in Stamford, Conn., Thomson has approximately 39,000 employees and provides services in approximately 130 countries.  The Corporation's common shares are listed on the New York and Toronto stock exchanges (NYSE: TOC; TSX: TOC). Its learning businesses and brands serve the needs of individuals, learning institutions, corporations and government agencies with products and services for both traditional and distributed learning. Thomson Prometric (www.prometric.com) is the global leader in technology-enabled testing and assessment services for academic, professional, government, corporate and information technology markets.   Thomson Prometric delivers standardized tests for 300 clients, in 26 languages, over the Web or through a global network of testing centers in 134 countries. Based in Baltimore, Md., Thomson Prometric employs 3,000 employees worldwide. 
<br/><br/>
<span class="bodySubtitle">About Burlington Coat Factory</span><br/>
Burlington Coat Factory is a national retailer offering apparel and accessories for the entire family, baby products and furniture, and home decor items. The company, founded and incorporated in 1972, owns and operates over 330 stores, including subsidiaries, nationwide. The company has been publicly traded since 1983, and is presently traded on the New York Stock Exchange under the symbol "BCF." Burlington Coat Factory can be found online at www.coat.com.
<br/><br/>
<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries.
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
