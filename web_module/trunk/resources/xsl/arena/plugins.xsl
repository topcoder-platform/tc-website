<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl" />
  <xsl:import href="../script.xsl" />
  <xsl:import href="../includes/body_top.xsl" />  
  <xsl:import href="../foot.xsl" />    
  <xsl:import href="../includes/contacts/public_contacts_left.xsl" /> 
  <xsl:import href="../includes/public_right_col.xsl" />     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload" />      

<title>TopCoder :: The Arena</title>

<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />
</head>

<body bgcolor="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<!-- Top begins -->
<xsl:call-template name="Top" />
<!-- Top ends -->

<!-- Body Begins -->
<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">

        <xsl:call-template name="public_contacts_left" />

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/clear.gif" width="4" height="8" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%"><img src="/i/clear.gif" width="240" height="1" vspace="5" border="0" /><br />

<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">arena</xsl:with-param>
  <xsl:with-param name="title">&#160;Arena Applet Plugins</xsl:with-param>
</xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top" >
                    <td bgcolor="#001B35" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0" /></td>
                    <td class="statTextBig" colspan="2" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />                    
                        <p class="statText">The TopCoder Arena plugin software that is listed on this page is not supported by TopCoder staff. The plugins are developed by 
                        existing members and distributed to allow other members to benefit from the work they provided.  TopCoder is NOT responsible for any impact 
                        the plug-ins may have during competition.</p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p class="statText"><a href="/contest/classes/How to create an Editor Plugin v3.htm" class="statText">Create your own plugins!</a></p>

                        <p class="statText"><a href="/contest/classes/javadoc/plugin-javadocs.jar" class="statText">Get the API</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />

                        <p class="statText">
                        Plugin Name: <strong>PopsPack</strong><br />
                        Description: Adding a new dimension to the applet.<br />
                        Author: Pops<br />
                        Date: 01/20/2004<br />
                        <a href="/contest/classes/PopsPack/PopsPack.html" class="statText">Documentation</a><br />
                        Version: 1.0<br />
                        EntryPoint: see documentation<br />
                        ClassPath: see documentation<br />
                        <a href="/contest/classes/PopsPack/PopsPack.jar" class="statText">PopsPack.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />

                        <p class="statText">
                        Plugin Name: <strong>TZTester</strong><br />
                        Description: TZTester is a CodeProcessor plug-in that automatically extracts the examples test cases given in the problem 
                        description and generates C++ code that runs the test cases. <br />
                        Author: TangentZ<br />
                        Date: 03/03/2003<br />
                        <a href="/contest/classes/TZTester/TZTester.html" class="statText">Documentation</a><br />
                        Version: 1.01<br />
                        <a href="/contest/classes/TZTester/TZTester.java" class="statText">Source code</a><br />
                        EntryPoint: codeprocessor.EntryPoint (case sensitive)<br />
                        ClassPath: CodeProcessor.jar; PopsEdit.jar; TZTester.jar<br />
                        <a href="/contest/classes/TZTester/TZTester.jar" class="statText">TZTester.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                    
                        <p class="statText">
                        Plugin Name: <strong>ProblemParser</strong><br />
                        Description: A plugin to parse the problem statement.<br />
                        Author: kyky<br />
                        Date: 09/10/2002<br />
                        <a href="/contest/classes/ProblemParser/ProblemParser.html" class="statText">Documentation</a><br />
                        <a href="/contest/classes/ProblemParser/ReleaseNotes.html" class="statText">Release Notes</a><br />
                        Version: 2.00<br />
                        <a href="/contest/classes/ProblemParser/ProblemParser.zip" class="statText">Source code</a><br />
                        EntryPoint: codeprocessor.EntryPoint (case sensitive)<br />
                        ClassPath: CodeProcessor.jar; FileEdit.jar; ProblemParser.jar<br />
                        <a href="/contest/classes/ProblemParser/ProblemParser.jar" class="statText">ProblemParser.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p class="statText">
                        Plugin Name: <strong>CodeProcessor</strong><br />
                        Description: Plugin that will allow you to write pre/post processing source code scripts for use with other editor plugins<br />
                        Author: Pops<br />
                        Date: 1/10/2003<br />
                        <a href="/contest/classes/CodeProcessor/How to use CodeProcessor v2.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/CodeProcessor/CodeProcessor v1.20 release notes.htm" class="statText">Release Notes</a><br />
                        Version: 1.2<br />
                        EntryPoint: codeprocessor.EntryPoint (case sensitive)<br />
                        ClassPath: CodeProcessor.jar<br />
                        <a href="/contest/classes/CodeProcessor/CodeProcessor.jar" class="statText">CodeProcessor.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p class="statText">
                        Plugin Name: <strong>PopsEdit</strong><br />
                        Description: Feature rich editor that has all the features Pops needs<br />
                        Author: Pops<br />
                        Date: 1/10/2003<br />
                        <a href="/contest/classes/PopsEdit/PopsEdit.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/PopsEdit/PopsEdit v2.80 release notes.htm" class="statText">Release Notes</a><br />
                        Version: 2.80<br />
                        EntryPoint: popsedit.EntryPoint (case sensitive)<br />
                        ClassPath: PopsEdit.jar<br />
                        <a href="/contest/classes/PopsEdit/PopsEdit.jar" class="statText">PopsEdit.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p class="statText">
                        Plugin Name: <strong>FileEdit</strong><br />
                        Description: Plugin that will read/write the problem information to an external file. This allows you to use your favorite editor/IDE to code the solutions to the problems.<br />
                        Author: Pops<br />
                        Date: 1/10/2003<br />
                        <a href="/contest/classes/FileEdit/FileEdit.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/FileEdit/FileEdit v2.70 Release Notes.htm" class="statText">Release Notes</a><br />
                        Version: 2.70<br />
                        Plugin Entry Point: fileedit.EntryPoint<br />
                        Plugin ClassPath: FileEdit.jar<br />
                        <a href="/contest/classes/FileEdit/FileEdit.jar" class="statText">FileEdit.jar Plugin</a></p>

                        <p><br /></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td colspan="4" valign="top" bgcolor="#001B35" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>       
                
                <tr valign="top">
                    <td bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
                    <td bgcolor="#001B35" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td bgcolor="#001B35" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                </tr>    
                
                <tr valign="top">
                    <td bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
                    <td bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0" /><br />

        <xsl:call-template name="public_right_col" />        

        </td>
<!-- Right Column Ends -->

<!-- Gutter begins-->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot" />
<!-- Footer ends -->

</body>
</html>
  </xsl:template>
</xsl:stylesheet>

