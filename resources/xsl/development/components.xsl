<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
    <xsl:import href="../includes/dev/public_dev_right.xsl" />     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

 <title>This Week's TopCoder Software Development Project Winners</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">components</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="10" border="0" />
            
<!-- Featured Winner Begins -->

            <div align="center">
            
            <img src="/i/development/title_thisweekswinners.gif" alt="This Week's Component Project Winners" width="510" height="55" border="0" />
            
            </div>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Featured Winner</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td class="formHandleEven" colspan="4"><strong>Coder: </strong><A class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309381"><font size="3"><strong>esessoms</strong></font></A></td></tr>

                <tr valign="top"><td class="bodyText" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>

                <tr valign="top">
<!--            <td class="bodyText" rowspan="7" width="55"><a href="/stat?c=member_profile&amp;cr=264803" class="coderTextRed"><img src="/i/m/mishagam_big.jpg" alt="None" width="62" height="70" border="0" hspace="5" vspace="5" /></a></td>-->
                    <td class="bodyText" rowspan="7" width="1"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                    <td class="bodyText" width="50%">Developer Level:</td>
                    <td class="bodyText" align="right" width="40%"><strong>I</strong></td>
                    <td class="bodyText" width="1"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Rating:</td>
                    <td class="bodyText" align="right"><A href="/stat?c=ratings_history&amp;cr=309381"><strong>1664</strong></A></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Total Earnings for All Component Projects*:</td>
                    <td class="bodyText" align="right"><strong>$0.00</strong></td>
                    <td class="bodyText"></td>
                </tr>

                 <tr valign="top">
                    <td class="bodyText">Project Name:</td>
                    <td class="bodyText" align="right"><A href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989"><strong>Priority Queue</strong></A></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Total Submissions for this Project:</td>
                    <td class="bodyText" align="right"><strong>3</strong></td>
                    <td class="bodyText"></td>
                </tr>

               <tr valign="top">
                    <td class="bodyText">Review Board Score for this Project:</td>
                    <td class="bodyText" align="right"><strong>89.88</strong></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" colspan="3">
                        <p><strong>Review Board Comment:</strong><br />
                        "Excellent submission that improves upon the original design, by abstracting common algorithms between queue implementations."&#151;<A href="/stat?c=member_profile&amp;cr=157582">msuhocki</A></p></td>
                </tr>
                
                <tr valign="top"><td class="bodyText" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>
            </table>
    <!-- Featured Winner Ends -->
    
            <br/>

    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Winners</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="27%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5%" align="right">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Board&#160;Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="right">Total&#160;&#160;<br/>Earnings*</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7338805" class="statText">Chart Rendering</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261390"><strong>Sharakan</strong></a></td>
                    <td class="formHandleOdd" align="center">79.23</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

            </table>
            
            <br/>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Winners</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="27%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5%" align="right">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Board&#160;Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="right">Total&#160;&#160;<br/>Earnings*</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6529097" class="statText">Exif Image Utility</a></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=301504"><strong>opi</strong></a></td>
                    <td class="formHandleOdd" align="center">83.72</td>
                    <td class="formHandleOdd" align="right">$240.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=000000"><strong>Tomson</strong></a></td>
                    <td class="formHandleEven" align="center">82.98</td>
                    <td class="formHandleEven" align="right">$571.50&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5501537" class="statText">Java FTP</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7218889"><strong>dbeutner</strong></a></td>
                    <td class="formHandleOdd" align="center">86.49</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5904397" class="statText">Spreadsheet Engine</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a></td>
                    <td class="formHandleEven" align="center">88.98</td>
                    <td class="formHandleEven" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7311989" class="statText">Priority Queue</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309381"><strong>esessoms</strong></a></td>
                    <td class="formHandleOdd" align="center">89.88</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=4313168" class="statText">Data Access Object Generator</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="formHandleEven" align="center">84.79</td>
                    <td class="formHandleEven" align="right">$1282.50&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323105" class="statText">Asynchronous Processing Wrapper</a></td>
                    <td class="formHandleOdd" align="center">9</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=112438"><strong>PabloGilberto</strong></a></td>
                    <td class="formHandleOdd" align="center">99.06</td>
                    <td class="formHandleOdd" align="right">$60.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>Zimmy</strong></a></td>
                    <td class="formHandleEven" align="center">93.60</td>
                    <td class="formHandleEven" align="right">$120.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154307"><strong>holmana</strong></a></td>
                    <td class="formHandleOdd" align="center">92.01</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>


            </table>
<!-- Development Winners Ends -->

        <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" /> 
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

