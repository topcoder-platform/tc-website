<%@ page import="com.topcoder.web.tc.controller.legacy.stat.bean.CoderRatingStyleBean,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="ratingInfo" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="../script.jsp" />
</head>
<body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Rank
                </td>
                <td>
                    Handle
                </td>
                <td>
                    Highest Rating
                </td>
            </tr>
            <rsc:iterator list="<%=ratingInfo%>" id="info">
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="rank"/>
                </td>
                <td>
                    <a href="/stat?c=member_profile&cr=<rsc:item row="<%=info%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=info.getIntItem("rating")%>'/>"><rsc:item row="<%=info%>" name="handle"/></a>
                </td>
                <td>
                    <rsc:item row="<%=info%>" name="highest_rating"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
</body>
</html>
