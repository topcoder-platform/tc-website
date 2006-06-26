<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>TopCoder Internal Error</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <xsl:call-template name="Preload"/>
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>


        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0" ALT=""/></TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->
            <TD class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top">
              <IMG src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
              <DIV CLASS="header">Invalid Profile Information</DIV><br/><br/>
              <DIV CLASS="bodyText">
                Unable to generate Affidavit.  The <b>demographic information</b> in your profile is incomplete.
                Please go to the Registration -- 
                General Information screen, complete and update the demographic information at the bottom of the form.<br/><br/>
                <A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute><b>Registration &gt;&gt;</b></a>
              </DIV>
            </TD>
            <!-- Center Column Ends -->
            <!-- Body Area Ends -->
       
            <!-- Gutter -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/></TD>
      
            <!-- Right Column Include Begins -->
            <!-- Gutter -->
              <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"/></TD>
              <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1"/><BR/></TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->

        
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>




  <xsl:template name="Demog">

    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" valign="top" colspan="3">
        <b>General Information</b>
      </td>
    </tr>

    <tr>
      <td class="bodyText" valign="top" colspan="3">
        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
          <tr>
            <td class="bodyText" valign="top">
              First Name:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/FirstName"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Middle Name:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/MiddleName"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Last Name:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/LastName"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              EMail Address:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/Email"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Handle:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/Handle"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Street Address:
            </td>
            <td class="bodyText" valign="top" colspan="3">
              
                <xsl:value-of select="/TC/Affidavit/HomeAddress1"/><br/>
                <xsl:if test="/TC/Affidavit/HomeAddress2!=''">
                  <xsl:value-of select="/TC/Affidavit/HomeAddress2"/><br/>
                </xsl:if>
                <xsl:value-of select="/TC/Affidavit/HomeCity"/>,
                <xsl:if test="/TC/Affidavit/HomeState!=''">
                  &#160;<xsl:value-of select="/TC/Affidavit/HomeState"/>
                </xsl:if>
                &#160;<xsl:value-of select="/TC/Affidavit/HomeZip"/><br/>
                <xsl:value-of select="/TC/Affidavit/HomeCountry"/>
              
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Home Phone:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/HomePhone"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Work Phone:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/WorkPhone"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" valign="top">
              Student or Professional:
            </td>
            <td class="bodyText" valign="top">
              <xsl:value-of select="/TC/Affidavit/CoderTypeDesc"/>
            </td>
          </tr>
          <xsl:if test="/TC/Affidavit/CoderTypeDesc='Student'">
            <tr>
              <td class="bodyText" valign="top">
                School:
              </td>
              <td class="bodyText" valign="top">
                <xsl:value-of select="/TC/Affidavit/CurrentSchool"/>
              </td>
            </tr>
          </xsl:if>
        </table>
      </td>
    </tr>
    <tr>
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3"><hr/></td>
    </tr>

    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" valign="top" colspan="3">
        <b>Demographics</b>
      </td>
    </tr>
    <tr>
      <td class="bodyText" valign="top" colspan="3">
        <table width="552" cellspacing="0" cellpadding="1" border="0" align="center">
          <xsl:choose>
            <xsl:when test="/TC/Affidavit/DemographicAssignments/DemographicAssignment">
              <xsl:for-each select="/TC/Affidavit/DemographicAssignments/DemographicAssignment">
                <tr>
                  <td class="bodyText" align="left">
                      <xsl:value-of select="DemographicQuestion/DemographicQuestionText"/>:&#160;
                  </td>
                  <td class="bodyText" align="left">
                      <xsl:variable name="aId"> 
                        <xsl:value-of select="DemographicQuestion/DemographicResponse/DemographicAnswerId"/>
                      </xsl:variable> 
                      <xsl:for-each select="DemographicQuestion/DemographicAnswers/DemographicAnswer[DemographicAnswerId=$aId]">
                        <xsl:value-of select="DemographicAnswerText"/>
                      </xsl:for-each>
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise><tr><td class="bodyText">* None *</td></tr></xsl:otherwise>
          </xsl:choose>
        </table>
      </td>
    </tr>

    <tr>
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
<!--
    <tr>
      <td class="bodyText" colspan="3"><hr/></td>
    </tr>

    <tr bgcolor="#ffffff">
      <td class="bodyText" width="1" colspan="3"><br/></td>
    </tr>
    <tr>
      <td class="bodyText" valign="top" colspan="3">
        <b>Education</b>
      </td>
    </tr>
    <xsl:choose>
      <xsl:when test="/TC/Affidavit/Educations/Education">
        <xsl:for-each select="/TC/Affidavit/Educations/Education">
          <xsl:sort select="GraduationYear" order="descending"/>
          <xsl:sort select="GraduationMonth" order="descending"/>
          <tr>
            <td class="bodyText" valign="top">
                <xsl:value-of select="GraduationYear"/>
            </td>
            <td class="bodyText"></td>
            <td class="bodyText" valign="top">
                <xsl:value-of select="School/Name"/>,
                <xsl:choose>
                  <xsl:when test="School/State/StateCode=''">
                    <xsl:value-of select="School/Country/CountryName"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="School/State/StateName"/>
                  </xsl:otherwise>
                </xsl:choose>
                <br />
                <xsl:value-of select="Degree/DegreeDesc"/>,
                <xsl:value-of select="Major"/>
            </td>
          </tr>
          <tr>
            <td class="bodyText" colspan="3"><br /></td>
          </tr>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <tr><td class="bodyText">* None *</td></tr>
      </xsl:otherwise>
    </xsl:choose>
    <tr>
      <td class="bodyText" colspan="3"><hr/></td>
    </tr>
    <tr>
      <td class="bodyText" colspan="3"><br /></td>
    </tr>
    <tr>
      <td class="bodyText" valign="top" colspan="3"><b>Experience</b></td>
    </tr>
    <xsl:choose>
      <xsl:when test="/TC/Affidavit/Experiences/Experience">
        <xsl:for-each select="/TC/Affidavit/Experiences/Experience">
          <xsl:sort select="StartYear" order="descending"/>
          <xsl:sort select="StartMonth" order="descending"/>
          <tr>
            <td class="bodyText" valign="top">
                <xsl:value-of select="StartMonth"/>/<xsl:value-of select="StartYear"/> -
                <xsl:choose>
                  <xsl:when test="EndYear='0'">
                    Present
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="EndMonth"/>/<xsl:value-of select="EndYear"/>
                  </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="bodyText"></td>
            <td class="bodyText" valign="top">
                <xsl:value-of select="Company"/>,
                <xsl:value-of select="City"/>,
                <xsl:choose>
                  <xsl:when test="State/StateCode=''">
                    <xsl:value-of select="Country/CountryName"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="State/StateName"/>
                  </xsl:otherwise>
                </xsl:choose>
                <br />
                <xsl:value-of select="TitleDesc"/>
                <br />
                <xsl:value-of select="Description"/>
              
            </td>
          </tr>
          <tr>
            <td class="bodyText" colspan="3"><br /></td>
          </tr>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <tr><td class="bodyText">* None *</td></tr>
      </xsl:otherwise>
    </xsl:choose>
-->
</xsl:template>


</xsl:stylesheet>
