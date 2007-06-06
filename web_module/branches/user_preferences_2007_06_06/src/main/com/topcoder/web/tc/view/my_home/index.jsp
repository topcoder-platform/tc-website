<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">
            
                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

                <a href="/tc?module=Static&amp;d1=my_home&amp;d2=submitPhoto"><img src="/i/m/nophoto_login.gif" alt="" class="memberPhoto" style="float: left; margin: 0px 10px 10px 0px;" /></a>
                <tc-webtag:handle coderId="8436401" />
                <div>
                    <div style="float: right;">05.09.2002</div>
                    <strong>Member Since:</strong>
                </div>
                <div>
                    <div style="float: right;">Canada</div>
                    <strong>Country:</strong>
                </div>
                <div>
                    <div style="float: right;">Queen's University</div>
                    <strong>School:</strong>
                </div>
                <div>
                    <div style="float: right;">$650.00</div>
                    <strong>Total Earnings:</strong>
                </div>

                <div style="clear: both;">
                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <tr>
                        <td class="header">
                            My Account
                        </td>
                        <td class="header">
                            Preferences
                        </td>
                        <td class="header">
                            Documentation
                        </td>
                        <td class="header">
                            Other
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="value">
                            <p><a href="/reg/?nrg=false">Add registrations</a></p>
                            <p><a href="/reg/?nrg=false">Update my profile</a></p>
                            <p><a href="/tc?module=Static&amp;d1=my_home&amp;d2=submitPhoto">Submit a photo</a></p>
                        </td>
                        <td class="value">
                            <p><a href="/tc?module=Static&d1=my_home&d2=privacy">Privacy</a></p>
                            <p><a href="/tc?module=Static&d1=my_home&d2=emailNotification">Email notification</a></p>
                            <p><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Settings">Forums preferences</a></p>
                        </td>
                        <td class="value">
                            <p><a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits</a></p>
                            <p><a href="/PactsMemberServlet?module=PaymentHistory">Payments</a></p>
                            <p><a href="/PactsMemberServlet?module=AssignmentDocumentHistory">Assignment documents</a></p>
                            <p><a href="/tc?module=VisaSelection">Visa letter status</a></p>
                        </td>
                        <td class="value">
                            <p><a href="/tc?module=ViewReferrals">Referrals</a></p>
                            <p><a href="/tc?module=Static&amp;d1=card&amp;d2=description">Cards/Badges</a></p>
                        </td>
                    </tr>
                </tbody>
                </table>
                </div>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>