<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">



<xsl:import href="../menu.xsl"/>

<xsl:import href="../top.xsl"/>

<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>



<xsl:template match="/">

  <html>

    <head>

      <title>Choose a problem</title>

    </head>

    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

      <xsl:call-template name="Top"/>

      <xsl:call-template name="Menu"/>

      <center>

        <tr>

          <td>

            <center>

              <b><font size="6"><xsl:value-of select="/TC/COMPILATION/Compilation/Handle"/></font></b><br/>

                <small><xsl:value-of select="/TC/COMPILATION/Compilation/CoderId"/></small>

            </center>

          </td>

        </tr>

        <br/>

        <table border="1">

          <tr>

            <td><b><small>Round Id</small></b></td>

            <td><b><small>Problem id</small></b></td>

            <td><b><small>Class</small></b></td>

            <td><b><small>Method</small></b></td>

            <td><b><small>Difficulty</small></b></td>

            <td><b><small>Point Val.</small></b></td>

            <td><b><small>Language</small></b></td>

            <td><b><small>Status</small></b></td>

            <td><b><small>Open Time</small></b></td>

            <td><b><small>Submit Time</small></b></td>

            <td><b><small>Coding Time</small></b></td>

            <td><b><small>Points</small></b></td>

          </tr>

          <xsl:for-each select="/TC/COMPILATION/Compilation">

            <tr>

              <td><xsl:value-of select="RoundId"/></td>

              <td>

                <a>

                  <xsl:attribute name="href">/admin/?Task=compilation&amp;Command=get_problems&amp;RoundId=<xsl:value-of select="../RoundId"/>&amp;CoderId=<xsl:value-of select="CoderId"/>&amp;ProblemId=<xsl:value-of select="ProblemId"/></xsl:attribute>

                  <xsl:value-of select="ProblemId"/>

                </a>

              </td>

            

              <td><xsl:value-of select="ClassName"/></td>

              <td><xsl:value-of select="MethodName"/></td>

              <td><xsl:value-of select="DifficultyDesc"/></td>

              <td><xsl:value-of select="PointValue"/></td>

              <td><xsl:value-of select="LanguageName"/></td>

              <td><xsl:value-of select="Status"/></td>

              <td><xsl:value-of select="OpenTime"/></td>

              <td><xsl:value-of select="SubmitTime"/></td>

              <xsl:variable name="codingTime"><xsl:value-of select="CodingTime"/></xsl:variable>

              <td>

                <xsl:if test="number($codingTime)>0">

                  <xsl:value-of select="CodingTime"/>

                </xsl:if>

              </td>

              <td><xsl:value-of select="Points"/></td>

              <td><xsl:value-of select="PointsEarned"/></td>

            </tr>

          </xsl:for-each>

          <xsl:for-each select="/TC/COMPILATION/Compilation">

            <xsl:if test="ProblemId=../ProblemId">

              <table> 

                <tr><td><br/><b>ProblemId: <xsl:value-of select="../ProblemId"/></b><br/><br/></td></tr>

                <tr> 

                  <td> 

                    <pre>

                      <xsl:choose>

                        <xsl:when test="SubmissionText!=''"><xsl:value-of select="SubmissionText"/></xsl:when> 

                        <xsl:otherwise><xsl:value-of select="CompilationText"/></xsl:otherwise>

                      </xsl:choose>

                    </pre>

                  </td>

                </tr>

              </table>

            </xsl:if>

          </xsl:for-each>

        </table>

      </center>

    </body>

  </html>

</xsl:template>





</xsl:stylesheet>

