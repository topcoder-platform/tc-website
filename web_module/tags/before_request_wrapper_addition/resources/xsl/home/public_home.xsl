<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="public_body.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>
<head>

<title>Computer Programming Competitions, Software Development, and Employment Services at TopCoder</title>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>

<xsl:call-template name="Preload"/>      

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<xsl:call-template name="PublicBody"/>

<!-- Footer Include Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Include Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

