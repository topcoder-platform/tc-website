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
						<p>Currently open projects total <span id="totalMoney">$5843.00*</span> in payments to the winning designers and developers. Send us 
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
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

<!--				<tr valign="top">
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
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=code_formatter-design">Code Formatter</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_system_search-design">File System Search</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=financial_calc-design">Financial Calculator</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=image_resizing-design">Image Resizing</a></td>
					<td background="" class="statText" align="center">$175.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=jar_compressor-design">Jar Compressor</a></td>
					<td background="" class="statText" align="center">$245.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=magic_numbers-design">Magic Numbers</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=matrix-design">Math Matrix</a></td>
					<td background="" class="statText" align="center">$315.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=string-design">String Class</a></td>
					<td background="" class="statText" align="center">$140.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=thesaurus-design">Thesaurus</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=xml_search-design">XML Search</a></td>
					<td background="" class="statText" align="center">$245.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=currency">Currency</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=file_distributor-design">File Distributor</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=generic_mapping-design">Generic Mapping</a></td>
					<td background="" class="statText" align="center">$245.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=global_dist_calc-design">Global Distance Calculator</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=java_compiler">Java Compiler</a></td>
					<td background="" class="statText" align="center">$300.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=job_scheduling-design">Job Scheduling</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=xml_parser-design">Lightweight XML Parser</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=object_selector-design">Object Selector</a></td>
					<td background="" class="statText" align="center">$210.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
<<<<<<< comp_projects.xsl
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=random_string-design">Random String Generator</a></td>
					<td background="" class="statText" align="center">$140.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
=======
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=serial_num">Serial Number Generator</a></td>
					<td background="" class="statText" align="center">$168.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
>>>>>>> 1.12
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=socket_server_mgr-design">Socket Server Manager</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=url_loader-design">URL Loader</a></td>
					<td background="" class="statText" align="center">$280.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
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

<!--				<tr valign="top">
					<td class="statText">
						<p>There are no Open Component Development postings.</p></td>
				</tr>  -->
				
				<tr>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Open Component Development Projects</h1></td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

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
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=api_comparator-dev">API Comparator</a></td>
					<td background="" class="statText" align="center">$192.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=unique_key-dev">Unique Key</a></td>
					<td background="" class="statText" align="center">$192.00</td>
					<td background="" class="statText" align="center">1.3.2003</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=ip_filter-dev">IP Filter</a></td>
					<td background="" class="statText" align="center">$144.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=object_formatter-dev">Object Formatter</a></td>
					<td background="" class="statText" align="center">$240.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
				
				<tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

				<tr valign="top">
					<td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=resourcebundle-dev">ResourceBundle</a></td>
					<td background="" class="statText" align="center">$120.00</td>
					<td background="" class="statText" align="center">12.27.2002</td>
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

