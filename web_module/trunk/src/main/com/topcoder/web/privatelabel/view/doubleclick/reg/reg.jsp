<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>DoubleClick</title>
<jsp:include page="../../script.jsp" />
<link rel="stylesheet" href="http://www.doubleclick.com/includes/home.css" type="text/css">
<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
    <body bgcolor="ffffff" leftmargin="5" topmargin="5" bottommargin="5" marginheight="0" marginwidth="5">

        <table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
           <tr><td align="left" valign="top"><a href="http://www.doubleclick.com/us/"><img src="http://www.doubleclick.com/images/dc_home.gif" width="179" height="38" alt="DoubleClick" border="0"></a></td></tr>
        </table>

        <jsp:include page="../links.jsp" >
           <jsp:param name="tabLev1" value="reg"/>
        </jsp:include>

        <table width="750" cellpadding="0" cellspacing="0" border="0" align="center">
           <tr>
              <td  valign="top" align="left" class="dc_bodytable" width="200">

                 <table border="0" cellpadding="0" cellspacing="0" width="160">
                    <tr>
                <img src="http://www.doubleclick.com/images/random/11.jpg">
                    </tr>
                 </table>

              </td>
              <td valign="top" align="left" class="dc_bodytable" width="550">



                </td>
            </tr>
        </table>

        <jsp:include page="../foot.jsp" />

    </body>
</html>