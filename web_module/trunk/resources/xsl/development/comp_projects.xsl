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
				
			<table border="0" cellspacing="5" cellpadding="5" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr><td class="statText">Component Projects are classified as <a class="statText" href="#design">Design</a> or <a class="statText" href="#development">Development</a> projects. There are also <a class="statText" href="/index?t=development&amp;c=app_projects">Application</a> projects available.</td></tr>

				<tr><td class="statText"><a name="design"><h1 class="devSubhead">Open Component Design Projects</h1></a></td></tr>
				
<!--				<tr valign="top">
					<td class="statText">
						<p>
						There are no Open Component Design postings.<br/>
						</p>   
					</td>
				</tr>  -->
							
				<tr valign="top">
					<td> 
						<table width="100%" cellspacing="0" cellpadding="0" border="0">                
							<tr valign="middle">
								<td background="/i/bluebv_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
								<td background="/i/bluebv_bg.gif" width="60%" class="statText">Design Projects</td>
								<td background="/i/bluebv_bg.gif" width="18%" class="statText" align="right">Payment*</td>
								<td background="/i/bluebv_bg.gif" width="18%" class="statText" align="center">Submit by</td>
								<td background="/i/bluebv_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=code_formatter-design">Code Formatter</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_system_search-design">File System Search</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=financial_calc-design">Financial Calculator</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=image_resizing-design">Image Resizing</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
							
							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=jar_compressor-design">JAR Compressor</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=magic_numbers-design">Magic Numbers</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=matrix-design">Matrix</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
							
							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=string-design">String</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=thesaurus-design">Thesaurus</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=xml_search-design">XML Search</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_distributor-design">File Distributor: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=generic_mapping-design">Generic Mapping: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=global_dist_calc-design">Global Distance Calculator: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=job_scheduling-design">Job Scheduling: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=xml_parser-design">Lightweight XML Parser: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=random_string-design">Random String Generator: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=socket_server_mgr-design">Socket Server Manager: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=url_loader-design">URL Loader: Design</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>

							<tr>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="statText" colspan="3">*Total Payment (before royalties)</td></tr>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
						</table>
					</td>
				</tr>
				
				<tr><td height="1" colspan="2"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td></tr>

				<tr><td class="statText" colspan="2"><a name="development"><h1 class="devSubhead">Open Component Development Projects</h1></a></td></tr>
				
<!--				<tr valign="top">
					<td class="statText">
						<p>There are no Open Component Development postings.</p></td>
				</tr>  -->
							
				<tr valign="top">
					<td> 
						<table width="100%" cellspacing="0" cellpadding="0" border="0">                
							<tr valign="middle">
								<td background="/i/bluebv_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
								<td background="/i/bluebv_bg.gif" class="statText">Development Projects</td>
								<td background="/i/bluebv_bg.gif" class="statText" align="right">Payment*</td>
								<td background="/i/bluebv_bg.gif" class="statText" align="center">Submit by</td>
								<td background="/i/bluebv_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=api_comparator-dev">API Comparator</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
							
							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=unique_key-dev">Unique Key</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">1.3.2003</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
							
							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=ip_filter-dev">IP Filter: Development</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=object_formatter-dev">Object Formatter: Development</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
							
							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

							<tr valign="top">
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=resourcebundle-dev">ResourceBundle: Development</a></td>
								<td background="" class="statText" align="right">$xxx.xx</td>
								<td background="" class="statText" align="center">12.27.2002</td>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>

							<tr>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="statText" colspan="3">*Total Payment (before royalties)</td></tr>
								<td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
						</table>
					</td>
				</tr>
			</table>
				
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

