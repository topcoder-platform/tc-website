<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Vertex jobs at TopCoder Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%" bgcolor="#FFFFFF" valign="top">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" height="18" bgcolor="#43515E" class="statText"><strong>Great Jobs at Vertex</strong></td></tr>
                            <tr><td valign="middle" height="18" class="bodyText"><A class="bodyText" href="/?t=tces&amp;c=vertex_struct_prog&amp;a=secure" target="_top">Jobs</A></td></tr>
                        </table>
                        
<!-- Client Message Begins -->
                        <p><img src="/i/es/vertex/vertex_logo.gif" width="76" height="52" border="0"/></p> 
                        
<p><b>Overview</b><br/>
Vertex Pharmaceuticals Incorporated is a global biotechnology company focused on the discovery, development 
and commercialization of breakthrough drugs for a range of serious diseases. Our business strategy is to commercialize 
major new drugs both independently and with pharmaceutical partners. Vertex co-promotes with GlaxoSmithKline the 
new HIV protease inhibitor, Lexiva&#153; in the United States and Agenerase&#174; in Europe. Vertex and Aventis are collaborating 
on the development of the oral cytokine inhibitor pralnacasan, which is being developed in parallel for rheumatoid arthritis, 
osteoarthritis, and other inflammatory diseases. In addition, Vertex is independently driving forward the development of 
several first-in-class drugs targeting psoriasis, inflammation, hepatitis C virus, and acute coronary syndromes.</p>

<p>Vertex's product pipeline is principally focused on viral diseases, inflammation, autoimmune diseases, and cancer. 
The Company has more than $600 million in cash and cash equivalents to fund the discovery and development of its drug 
candidates, and the Company has significant collaborations with a number of pharmaceutical companies including Aventis, 
GlaxoSmithKline, Novartis and Serono. Vertex is headquartered in Cambridge, Massachusetts and has major research sites 
in San Diego, California and Oxford, U.K. The company employs more than 700 people worldwide.</p>

<p><b>Mission</b><br/>
Our vision is to be a major drug company, setting the standard for pharmaceutical research and development productivity 
in the 21st century. A vision as great as this can only be achieved in an environment where creative and talented people can 
thrive. Our progress toward that goal reflects the collective efforts of talented employees around the world.</p>

<p><b>Environment</b><br/>
Vertex has developed an integrated team environment where employees set high goals and work together to accomplish them. 
We provide our employees with tools that enable them to achieve, and we provide opportunities for professional development. 
We encourage employees' participation in educational seminar series, and our scientists regularly publish their research in 
peer-reviewed journals. Our extensive collaborations bring our employees together with their colleagues from leading research 
centers and companies based in Cambridge, MA, San Diego, CA and Oxford, U.K., as well as throughout the world.</p>

<p><b>Employee Development</b><br/>
We encourage our employees to further their knowledge and skill base, and we support these efforts through trainings and tuition 
reimbursement. In addition, Vertex is committed to supporting employee health and wellness. Our employee assistance program 
provides diverse resources on parenting, elder care as well as financial planning and wellness programs.</p>

                        <p><a href="/?t=tces&amp;c=vertex_struct_prog&amp;a=secure" target="_top" class="bodyText">Click here</a> for jobs.</p>
<!-- Client Message Ends -->

                        <p><br/></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

