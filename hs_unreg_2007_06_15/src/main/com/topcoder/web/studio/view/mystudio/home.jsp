<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="myStudio"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>My Studio</h1>

                <h3>Documents:</h3>

                <p style="margin-bottom: 80px;">
                    <A href="/?module=AssignmentDocumentHistory">Assignment Documents</A>
                </p>


            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
    
        <jsp:include page="../foot.jsp"/>
    
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>