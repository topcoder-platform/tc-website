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

 <title>TopCoder &#160;|&#160; Theater</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

    <style type="text/css">
    
ol {
    margin-left: 10px;
    padding-left: 10px;
    }
    
ul {
    margin-left: 10px;
    padding-left: 10px;
    }
    
li {
    margin-left: 0px;
    padding-top: 2px;
    padding-bottom: 2px;
    }
    
.topPage {
    text-align: right;
    }
    
.methNav {
    font-family:Tahoma; 
    color:#FC3; 
    font-size:11px; 
    font-weight:normal; 
    }
A.methNav:link { 
    color:#FC3; 
    text-decoration:none 
    }
A.methNav:visited { 
    color:#FC3; 
    text-decoration:none 
    }
A.methNav:hover { 
    color:#666; 
    text-decoration:none 
    }
A.methNav:active { 
    color:#666; 
    text-decoration:none 
    }
    
    </style>

</head>

<body bgcolor="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
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
            <xsl:with-param name="title">&#160;Movies</xsl:with-param>
            </xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td class="statText">
                        <strong>Experience a TopCoder Tournament for yourself.</strong>

                        <p>Below is a clip from the 2002 TopCoder Invitational. It is a standard .mov file. You need QuickTime 5.0 or better to view the file.</p>
                        
                        <p>Later this week, we're going to try broadcasting a streaming MPEG-4 file. If our test proves successful we're going to broadcast this 
                        year's TopCoder Collegiate Challenge LIVE!</p>
                        
                        <p><div align="center">
                            <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" WIDTH="160"HEIGHT="144" 
                            codebase="http://www.apple.com/qtactivex/qtplugin.cab"> 
                            <param name="src" VALUE="sample.mov" /> 
                            <param name="autoplay" VALUE="false" /> 
                            <param name="controller" VALUE="true" /> 
                            <embed src="/i/movies/tc_cnn_test.mov" width="240" height="196" autoplay="false" controlloer="true" pluginspage="http://www.apple.com/quicktime/download/"></embed>
                            </object><br />
                             2002 TopCoder Invitational
                         </div></p>   
                    </td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
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

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

