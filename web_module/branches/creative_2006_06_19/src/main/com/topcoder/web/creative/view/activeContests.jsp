<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder FX</title>
    <link type="text/css" rel="stylesheet" href="/css/creative/main.css">
    <link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
    <link type="text/css" rel="stylesheet" href="/css/creative/coders.css">
</head>

<body>

<jsp:include page="creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="creativeLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="breadcrumb">
            Active Contests
        </div>

        <h1>Active Contests</h1>


        <h2 align="right">Need help? Learn how to <strong><A href="">get started</A></strong></h2>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="6">Active Contests</td>
                    </tr>
                    <tr>
                        <td class="header" colspan="2">Project</td>
                        <td class="headerC">Registration ends</td>
                        <td class="headerC">Submissions</td>
                        <td class="headerR">Payment</td>
                        <td class="headerC">Submit by</td>
                    </tr>
                    <tr class="light">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                    <tr class="dark">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                    <tr class="light">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                    <tr class="dark">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                    <tr class="light">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                    <tr class="dark">
                        <td class="value"><A href="/?module=Static&d1=projectDetails">Logo Design Project</A></td>
                        <td class="valueC"><button onClick="window.location='/?module=Static&d1=contestReg'">Register /
                            Submit</button></td>
                        <td class="valueC">07.14.2006 09:00 AM EDT</td>
                        <td class="valueC">0</td>
                        <td class="valueR">$1,600.00</td>
                        <td class="valueC">07.17.2006 09:00 AM EDT</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <jsp:include page="/creative_foot.jsp"/>
    </div>
</div>
</body>
</html>
