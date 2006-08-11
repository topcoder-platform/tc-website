<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">
      <jsp:include page="top.jsp" />
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="home"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <p>
                    1.0.0 - 2006.08.xx
                    <ul>
                        <li>Launch!</li>
                    </ul>
                </p>

            </div>
            <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>