<%@ page import="com.topcoder.web.stat.bean.CoderRatingStyleBean"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
 <jsp:useBean id="donationInfo" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>
<head>
<title>TopCoder Donation Info</title>
<jsp:include page="../script.jsp" />
</head>
<body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <rsc:iterator list="<%=donationInfo%>" id="info">
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="rank"/>
                </td>
                <td>
                    <a href="/stat?c=member_profile&cr=<rsc:item row="<%=info%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=info.getIntItem("rating")%>'/>"><rsc:item row="<%=info%>" name="handle"/></a>
                </td>
                <td>
                    <rsc:item row="<%=info%>" name="rating"/>
                </td>
                <td>
                    $<rsc:item row="<%=info%>" name="amount" format="#.##"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
</body>
</html>
