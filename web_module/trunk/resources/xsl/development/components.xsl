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
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Featured Winner</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td class="formHandleEven" colspan="4"><strong>Coder: </strong><A class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><font size="3"><strong>zimmy</strong></font></A></td></tr>

                <tr valign="top"><td class="formTextOdd" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>

                <tr valign="top">
<!--            <td class="formTextOdd" rowspan="7" width="55"><a href="/stat?c=member_profile&amp;cr=264803" class="coderTextRed"><img src="/i/m/mishagam_big.jpg" alt="None" width="62" height="70" border="0" hspace="5" vspace="5" /></a></td>-->
                    <td class="formTextOdd" rowspan="7" width="1"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                    <td class="formTextOdd" width="50%">Developer Level:</td>
                    <td class="formTextOdd" align="right" width="40%"><strong>II</strong></td>
                    <td class="formTextOdd" width="1"></td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd">Rating:</td>
                    <td class="formTextOdd" align="right"><A href="/stat?c=ratings_history&amp;cr=264803"><strong>1373</strong></A></td>
                    <td class="formTextOdd"></td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd">Total Earnings for All Component Projects*:</td>
                    <td class="formTextOdd" align="right"><strong>$72.00</strong></td>
                    <td class="formTextOdd"></td>
                </tr>

                 <tr valign="top">
                    <td class="formTextOdd">Project Name:</td>
                    <td class="formTextOdd" align="right"><A href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290"><strong>Data Validation</strong></A></td>
                    <td class="formTextOdd"></td>
                </tr>

               <tr valign="top">
                    <td class="formTextOdd">Review Board Score for this Project:</td>
                    <td class="formTextOdd" align="right"><strong>95.22</strong></td>
                    <td class="formTextOdd"></td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd">Total Submissions for this Project:</td>
                    <td class="formTextOdd" align="right"><strong>2</strong></td>
                    <td class="formTextOdd"></td>
                </tr>

                <tr valign="top">
                    <td class="formTextOdd" colspan="3">
                        <p><strong>Review Board Comments</strong><br />
                        "All classes are implemented properly. Good implementation ..."&#151;<A href="/stat?c=member_profile&amp;cr=278342">adic</A></p></td>
                </tr>
                
                <tr valign="top"><td class="formTextOdd" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>
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
                    <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7338647" class="bodyText" target="parent">Bar Graph</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261390"><strong>Sharakan</strong></a></td>
                    <td class="formTextOdd" align="center">89.25</td>
                    <td class="formTextOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5711016" class="bodyText" target="parent">SQL Parser</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a></td>
                    <td class="formTextEven" align="center">83.70</td>
                    <td class="formTextEven" align="right">$634.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextEven"></td>
                    <td class="formTextEven" align="center">&#160;</td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="formTextEven" align="center">83.64</td>
                    <td class="formTextEven" align="right">$1,209.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7361823" class="bodyText" target="parent">Type Safe Enum</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="formTextOdd" align="center">88.80</td>
                    <td class="formTextOdd" align="right">$4,601.60&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextOdd"></td>
                    <td class="formTextOdd" align="center">&#160;</td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261390"><strong>Sharakan</strong></a></td>
                    <td class="formTextOdd" align="center">81.35</td>
                    <td class="formTextOdd" align="right">$0.00&#160;&#160;</td>
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
                    <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7220290" class="bodyText" target="parent">Data Validation</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>zimmy</strong></a></td>
                    <td class="formTextOdd" align="center">95.22</td>
                    <td class="formTextOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextOdd"></td>
                    <td class="formTextOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288429"><strong>jfjiang</strong></a></td>
                    <td class="formTextOdd" align="center">90.44</td>
                    <td class="formTextOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextOdd"></td>
                    <td class="formTextOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=343613"><strong>phark4evr</strong></a></td>
                    <td class="formTextOdd" align="center">80.70</td>
                    <td class="formTextOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=2810520" class="bodyText" target="parent">Encryption</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=153089"><strong>preben</strong></a></td>
                    <td class="formTextEven" align="center">90.74</td>
                    <td class="formTextEven" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextEven"></td>
                    <td class="formTextEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786"><strong>Yi_Zhang</strong></a></td>
                    <td class="formTextEven" align="center">86.69</td>
                    <td class="formTextEven" align="right">$0.00&#160;&#160;</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7297246" class="bodyText" target="parent">Phonetic Spell Check</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=301504"><strong>opi</strong></a></td>
                    <td class="formTextOdd" align="center">98.96</td>
                    <td class="formTextOdd" align="right">$144.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formTextOdd"></td>
                    <td class="formTextOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264803"><strong>zimmy</strong></a></td>
                    <td class="formTextOdd" align="center">92.53</td>
                    <td class="formTextOdd" align="right">$72.00&#160;&#160;</td>
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

