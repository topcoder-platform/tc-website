<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:include page="../../script.jsp" />
<jsp:useBean id="info" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />

<title>TopCoder Info</title>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr valign="top" align="center">
         <td colspan="3"><br><img src="/i/tc_logo_help.gif" width="217" height="44" border="0"></td>
      </tr>

    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><br>
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td>
            <rsc:iterator list="<%=info%>" id="row">
                <p class="bodyText">
                    <rsc:item row="<%=row%>" name="question_desc"/>
                </p>
            </rsc:iterator>
         </td>
      </tr>
      <br/>
      <tr>
         <td align="center">
           <p><br /></p>
           <p align="center"><a href="javascript:window.close();" class="button" align="center">close</a></p>
           <p><br /></p>
         </td>
      </tr>
  </table>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>

</table>

</body>

</html>