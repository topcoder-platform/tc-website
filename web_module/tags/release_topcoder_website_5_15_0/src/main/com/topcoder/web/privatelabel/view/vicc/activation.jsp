<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="registration"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Activation Successful!</span>
                <br/><br/>

                You may practice for the contest by clicking the Competition Arena link above.
                <br><br>
                If you encounter any problems, please contact us at <A href="mailto:verisign@topcoder.com">verisign@topcoder.com</A>.


                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                <br/><br/>
            </div>
        </td>


        <!-- Right Column-->
        <td width="180" align="right" style="padding: 0px 15px 0px 0px;">
            <jsp:include page="right.jsp"/>

        </td>

    </tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
