<%@ page import="com.topcoder.web.corp.common.Constants,
    com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<jsp:include page="../includes/script.jsp"/>
</HEAD>
<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Center Column Begins -->
 <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="10"border="0"><br>
                     <screen:form name='searchForm' method='get' action='<%=sessionInfo.getServletPath()%>'>
                        <INPUT type="hidden" name='<%=Constants.MODULE_KEY%>' value='SearchResults'/>
                        <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
                        <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>

                          <jsp:include page="searchForm.jsp"/>
                          <br/>
                          <jsp:include page="resultsForm.jsp"/>
                      </screen:form>
<P><BR/></P>
</td>


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
