<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder Developing Application for CRPF Spinal Cord Injury Research Group</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
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
                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
