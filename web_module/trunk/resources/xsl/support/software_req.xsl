<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Software Requirements to compete in TopCoder computer programming contests</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR VALIGN="top">
    <!-- Left Column Begins -->
        <TD WIDTH="180">
<!-- Left Column Include Begins -->    
    <!-- Global Seconday Nav Begins -->    
        <xsl:call-template name="global_left"/>
    <!-- Global Seconday Nav Ends -->        
<!-- Left Column Include Ends -->                            
          </TD>
    <!-- Left Column Ends -->
    <!-- Gutter Begins -->
        <TD WIDTH="4" ><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
    <!-- Center Column Begins -->    
        <TD CLASS="bodyText" WIDTH="100%">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Software Requirements</xsl:with-param>
</xsl:call-template>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
                    <TD CLASS="bodyText" WIDTH="100%">
                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                        <p class="bodyTextBold">What do I need to install to run the TopCoder Competition Arena?</p>

                        <p>The online tournament rounds run in a Java applet. We have designed our utilities to utilize some of the features of Sun's 
                        1.3 version of the JDK. This means that in order to run the applet, you will need to install a web browser plug-in that allows 
                        the browser to run 1.3 applications. You can <a href="http://java.sun.com/getjava/install.html">get information</a> on which 
                        browser and operating systems are compatible with the plug-in. Even if you already have a JRE 1.1.X plug-in installed, you 
                        will need to re-install a newer version of the plug-in. The latest version of the plug-in can be downloaded from Sun's 
                        <a href="http://java.sun.com/products/plugin/">web site.</a> If you have the Sun 1.3 or 1.4 JRE or JDK installed on your 
                        machine, you already have the plug-in software installed. Remember, you must install a plug-in that at least supports the 
                        Java 1.3 runtime environment. We recommend installing the 1.4 environment, which is the most current version available. 
                        Once the plug-in (or the 1.3/1.4 environment) has been downloaded and installed, you will not need to perform these steps 
                        in the future. The download for the JRE (Java Runtime Environment) version 1.3, which includes the plug-in software, is 
                        around 10MB. This means the download may take some time to complete. Remember, this download only needs to be completed 
                        once. Completing the previous steps will also satisfy all prerequisites in order to run the Competition Arena from within your 
                        browser. Installing the 1.3/1.4 Java Runtime will also allow you to run the TopCoder competition Arena from within Java 
                        Web Start (although Java Web Start will need to be installed separately).</p>

                        <p>If you have the necessary software loaded, 

                        <script type="text/javascript"><![CDATA[
                        function arena() {
                          w=window.open("","Launch","top=2,left=2,width=300,height=225,status=1");
                          d = w.document;
                          d.write ( "<HTML><HEAD><TITLE>Loading</TITLE>" );
                          d.write ( "</HEAD><BODY bgcolor=\"#CCCCCC\">" );
                          d.write ( "<font color=\"#000000\" size=\"2\" face=\"arial,verdana,helvetica,sans-serif\">" );
                          d.write ( "<b>Loading...</b>" );
                          d.write ( "</font>" );
                          d.write ( "<SCRIPT type=\"text/javascript\">" );
                          d.write ( "window.location='/?t=arena&amp;c=arena'" );
                          d.write ( "\<\/SCRIPT\>" );
                          d.write ( "</BODY></HTML>" );
                        }
                        ]]></script>

                        <a href="Javascript:arena()" CLASS="bodyText">load the arena &gt;</a></p>

                        <p>Check <a href="http://www.javasoft.com/products/plugin/1.3/troubleshooting.faq.html">java.sun.com</a> for FAQs regarding 
                        plug-in installation problems.</p>

                        <P><br/></P>
                    </TD>
                    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                
                <TR><TD COLSPAN="4" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>       
            </TABLE>
        </TD>
    <!-- Center Column Ends -->
<!-- Body Area Ends -->

    <!-- Gutter -->
        <TD WIDTH="4"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
    <!-- Right Column Begins -->
        <TD WIDTH="170"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
    <!-- Right Column Ends -->
    <!-- Gutter -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
    </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

