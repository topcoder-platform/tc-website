<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div style="margin-bottom: 10px;">
                    <img src="/i/development/umltool/banner.jpg" alt="TopCoder UML Tool" />
                </div>

                <p align="center">
                    <strong>
                    <a href="/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=description" class="bcLink">Introduction</a>
                    | Download
                    | <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=5674" class="bcLink">Discuss the UML Tool</a>
                    | <a href="/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=credits" class="bcLink">Credits</a>
                    </strong>
                </p>


                <h2>Installing the UML tool</h2>
                
                <ol>
                <li>Make sure the machine you are installing on has the proper version of Java (1.5)</li>
                <li><a href="">Download</a> and execute installer jar. The OS may support doing this in the GUI, or you can use the command line: java -jar UML_Tool_Frontend_installer-1.0.jar</li>
                <li>Follow instructions on installer screen</li>
                </ol>
                
                <div align="center">
                    <a href="" class="bigButton" style="width: 140px; margin: 40px;">Download Now</a>
                </div>
                
                <h2>Uninstalling the UML tool</h2>
                
                <ol>
                <li>An icon should be created for the uninstaller (if you selected to install icons, and if the izPack installer supports icons for your OS).</li>
                <li>If there is no icon, or for some reason you wish to uninstall manually, go to wherever you installed the app and run the Uninstaller\uninstaller.jar file. This can be done in the GUI if your OS supports it, or else run java -jar uninstaller.jar from the Uninstaller directory.</li>
                </ol>
                
                <h2>Installer issues</h2>
                
                <p>
                Some operating systems supposedly don't support creating shortcuts (icons) according to izPack documentation.
                </p>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>