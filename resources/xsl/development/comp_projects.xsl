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

 <title>TopCoder :: Development</title>

    <xsl:call-template name="CSS" />

<style type="text/css">

#totalMoney {
    font: bold 130%;
    color: #FFF;
    }

</style>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY BGCOLOR="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%" bgcolor="#CCCCCC">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr valign="top">
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">
                        <p>Currently open projects total <span id="totalMoney">$7,070.00*</span> in payments to the winning designers and developers. Send us
                        your solutions today so you can start collecting your share.</p>

                        <p>*And that's before royalty payments. The more <a class="statText" href="http://www.topcodersoftware.com/pages/s_subscriptions.jsp">Component Subscriptions</a> we sell, the more royalties we pay out to our winners!</p></td>
                        <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Open Component Design Projects</h1></td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

<!--                <tr valign="top">
                    <td class="statText">
                        <p>There are no Open Component Design postings.</p>
                    </td>
                </tr>  -->

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="50%" class="statText">Design Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Payment*</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Submit by</td>
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=email_engine-NET-design">.NET Email Engine</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=.net_logging_wrapper-design">.NET Logging Wrapper</a></td>
                    <td background="" class="statText" align="center">$105.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                    <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=api_version_compatibility-design">API Version Compatibility</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=bulk_email-design">Bulk Email</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=code_formatter-design">Code Formatter</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=config_manager-design">Configuration Manager Enhancement</a></td>
                    <td background="" class="statText" align="center">$105.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=data_access_object_generator-design">Data Access Object Generator</a></td>
                    <td background="" class="statText" align="center">$245.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=distributed_simple_cache-design">Distributed Simple Cache</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_conversion-1.1-ejb-design">File Conversion Enhancement - EJB</a></td>
                    <td background="" class="statText" align="center">$105.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_diff-design">File Diff</a></td>
                    <td background="" class="statText" align="center">$140.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_distributor-design">File Distributor</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=financial_calc-design">Financial Calculator</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>



                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=parser_factory-design">Generic Parser</a></td>
                    <td background="" class="statText" align="center">$175.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=heartbeat-design">Heartbeat (RMI/HTTP)</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=HTTP_utility-design">HTTP Utility</a></td>
                    <td background="" class="statText" align="center">$140.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=image_converter-design">Image Converter</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=jar_compressor-design">Jar Compressor</a></td>
                    <td background="" class="statText" align="center">$245.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=java_compiler">Java Compiler</a></td>
                    <td background="" class="statText" align="center">$300.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=java_decompiler-design">Java Decompiler</a></td>
                    <td background="" class="statText" align="center">$245.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                
                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=java_ftp-design">Java FTP</a></td>
                    <td background="" class="statText" align="center">$245.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=java_stress_tester-design">Java Stress Tester</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=javadoc_verification-design">Javadoc Verification</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=job_scheduling-design">Job Scheduling</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>


                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=list_manipulation-design">List Manipulation</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=magic_numbers-design">Magic Numbers</a></td>
                    <td background="" class="statText" align="center">$210.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=multicaster-design">Multicaster</a></td>
                    <td background="" class="statText" align="center">$140.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=object_factory-design">Object Factory</a></td>
                    <td background="" class="statText" align="center">$175.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>



               <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=universal_time-design">Universal Time</a></td>
                    <td background="" class="statText" align="center">$175.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

               <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=url_loader-design">URL Loader</a></td>
                    <td background="" class="statText" align="center">$280.00</td>
                    <td background="" class="statText" align="center">2.5.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">*Total Payment (before royalties) </td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
<!-- Open Component Design Projects ends -->

<!-- Open Component Development Projects begins -->

<!--                <tr valign="top">
                    <td class="statText">
                        <p>There are no Open Component Development postings.</p></td>
                </tr>  -->

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Open Component Development Projects</h1></td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText">Development Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" align="center">Payment*</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" align="center">Submit by</td>
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=db_abstract-dev">Database Abstraction</a></td>
                    <td background="" class="statText" align="center">$168.00</td>
                    <td background="" class="statText" align="center">2.13.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_splitter-dev">File Splitter</a></td>
                    <td background="" class="statText" align="center">$168.00</td>
                    <td background="" class="statText" align="center">2.13.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_system_search-dev">Math Matrix</a></td>
                    <td background="" class="statText" align="center">$216.00</td>
                    <td background="" class="statText" align="center">2.13.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_system_search-dev">File System Search</a></td>
                    <td background="" class="statText" align="center">$168.00</td>
                    <td background="" class="statText" align="center">2.6.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=image_resizing-dev">Image Resizing</a></td>
                    <td background="" class="statText" align="center">$120.00</td>
                    <td background="" class="statText" align="center">2.6.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=string-dev">String Class</a></td>
                    <td background="" class="statText" align="center">$120.00</td>
                    <td background="" class="statText" align="center">2.6.2003</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">*Total Payment (before royalties)</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
            </table>
<!-- Open Component Development Projects ends -->

            <table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br/>
            <xsl:call-template name="public_dev_right" />
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>

