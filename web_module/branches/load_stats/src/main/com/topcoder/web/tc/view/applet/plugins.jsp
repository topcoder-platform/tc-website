<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>About TopCoder - Overview</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_support"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
         <jsp:include page="../page_title.jsp" >
         <jsp:param name="image" value="alg_support_faqs"/>
         <jsp:param name="title" value="Plugins"/>
         </jsp:include>

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
                        Plugin Name: <strong>KawigiEdit</strong><br />
                        Description: A feature-rich editor plugin.<br />
                        Author: Kawigi<br />
                        Date: 07/12/2006<br />
                        <a href="/contest/classes/KawigiEdit/KawigiEdit.html" class="statText">Documentation</a><br />
                        <a href="http://topcoder.yajags.com" class="statText">Plugin homepage</a><br />
                        Version: 2.0<br />
                        EntryPoint: kawigi.KawigiEdit<br />
                        ClassPath: KawigiEdit.jar<br />
                        <a href="/contest/classes/KawigiEdit/KawigiEdit.jar" class="statText">KawigiEdit.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />

                        <p class="statText">
                        Plugin Name: <strong>ExampleBuilder</strong><br />
                        Description: A plugin to parse the problem statement.<br />
                        Author: kyky<br />
                        Date: 04/02/2004<br />
                        <a href="/contest/classes/ExampleBuilder/ExampleBuilder.html" class="statText">Documentation</a><br />
                        <a href="/contest/classes/ExampleBuilder/ExampleBuilderSrc.zip" class="statText">Source Code</a><br />
                        <a href="/contest/classes/ExampleBuilder/ReleaseNotes_v2_01.txt" class="statText">Release Notes</a><br />
                        Version: 2.01<br />
                        EntryPoint: tc_plugin.ExampleBuilder<br />
                        ClassPath: CodeProcessor.jar; FileEdit.jar; ExampleBuilder.jar<br />
                        <a href="/contest/classes/ExampleBuilder/ExampleBuilder.jar" class="statText">ExampleBuilder.jar Plugin</a></p>

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
                        Plugin Name: <strong>CodeProcessor</strong><br />
                        Description: Plugin that will allow you to write pre/post processing source code scripts for use with other editor plugins<br />
                        Author: Pops<br />
                        Date: 1/10/2003<br />
                        <a href="/contest/classes/CodeProcessor/How%20to%20use%20CodeProcessor%20v2.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/CodeProcessor/CodeProcessor%20v1.20%20release%20notes.htm" class="statText">Release Notes</a><br />
                        Version: 1.2<br />
                        EntryPoint: codeprocessor.EntryPoint (case sensitive)<br />
                        ClassPath: CodeProcessor.jar<br />
                        <a href="/contest/classes/CodeProcessor/CodeProcessor.jar" class="statText">CodeProcessor.jar Plugin</a></p>

                        <hr width="100%" noshade="noshade" color="#666666" />
                    
                        <p class="statText">
                        Plugin Name: <strong>CodeProcessor v2.0</strong><br />
                        Description: Plugin that will allow you to write pre/post processing source code scripts for use with other editor plugins<br />
                        Author: Pops<br />
                        Date: 1/10/2003<br />
                        <a href="/contest/classes/CodeProcessorV2/How%20to%20use%20CodeProcessor%20v2.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/CodeProcessorV2/CodeProcessor%20v2.00%20release%20notes.htm" class="statText">Release Notes</a><br />
                        Version: 2.0<br />
                        EntryPoint: codeprocessor.EntryPoint (case sensitive)<br />
                        ClassPath: CodeProcessor.jar<br />
                        <a href="/contest/classes/CodeProcessorV2/CodeProcessor.jar" class="statText">CodeProcessor.jar Plugin</a></br>
                        <b>Note:  This plug-in has not been tested or verified by TopCoder staff. TopCoder will only distribute it as-is and will not guarantee its function or efficiency. Sources are included in the JAR distribution to facilitate verification and enhancement.</b>
                        </p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p class="statText">
                        Plugin Name: <strong>PopsEdit</strong><br />
                        Description: Feature rich editor that has all the features Pops needs<br />
                        Author: Pops<br />
                        Date: 07/06/2005<br />
                        <a href="/contest/classes/PopsEdit/PopsEdit.htm" class="statText">Documentation</a><br />
                        <a href="/contest/classes/PopsEdit/PopsEdit_release_notes.htm" class="statText">Release Notes</a><br />
                        Version: 2.90<br />
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
                        <a href="/contest/classes/FileEdit/FileEdit%20v2.70%20Release%20Notes.htm" class="statText">Release Notes</a><br />
                        Version: 2.70<br />
                        Plugin Entry Point: fileedit.EntryPoint<br />
                        Plugin ClassPath: FileEdit.jar<br />
                        <a href="/contest/classes/FileEdit/FileEdit.jar" class="statText">FileEdit.jar Plugin</a></p>

                        <p><br /></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
