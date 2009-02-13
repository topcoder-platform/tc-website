<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>

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

                <a href="<%=coderInfo.getIntItem(0, "has_image")==0?"/tc?module=Static&amp;d1=my_home&amp;d2=submitPhoto":"/tc?module=MemberProfile&cr="+coderInfo.getIntItem(0, "coder_id")%>">
                    <img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" class="memberPhoto" style="float: left; margin: 0px 10px 10px 0px;" /></a>
                <tc-webtag:handle coderId='<%=coderInfo.getLongItem(0, "coder_id")%>' />
                <div>
                    <div style="float: right;"><rsc:item name="member_since" set="<%=coderInfo%>" format="MM.dd.yyyy"/></div>
                    <strong>Member Since:</strong>
                </div>
                 <% if (coderInfo.getItem(0, "country_name").getResultData()!=null) { %>
                    <div>
                        <div style="float: right;"><rsc:item name="country_name" set="<%=coderInfo%>"/></div>
                        <strong>Country:</strong>
                    </div>
                <% }%>
                <% if (coderInfo.getStringItem(0,"school_name")!=null) { %>
                    <div>
                        <div style="float: right;"><rsc:item name="school_name" set="<%=coderInfo%>"/></div>
                        <strong>School:</strong>
                    </div>
                <% }%>
                <div>
                    <div style="float: right;">
                        <% if (coderInfo.getItem(0, "overall_earnings").getResultData() == null || coderInfo.getDoubleItem(0, "overall_earnings") > 0) { %>
                            <rsc:item set="<%=coderInfo%>" name="overall_earnings" format="$#,##0.00" ifNull="$0.00"/>
                        <% } else { %>
                            $0.00
                        <% } %>
                    </div>
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
                            <p><a href="/tc?module=EditPreferences&group=10">Privacy</a></p>
                            <p><a href="/tc?module=EditNotifications">Email notification</a></p>
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