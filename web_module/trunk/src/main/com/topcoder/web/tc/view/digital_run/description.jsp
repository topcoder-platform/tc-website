<%@ page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="digitalrun"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<script language="javascript" type="text/javascript">
<!--
function menu_goto( menuform )
{
    selecteditem = menuform.newurl.selectedIndex ;
    newurl = menuform.newurl.options[ selecteditem ].value ;
    if (newurl.length != 0) {
      location.href = newurl ;
    }
}
//-->
</script>
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- centerer -->
<div align="center">

    <!-- spacer -->
    <div id="pageSpacer">

            <p align="center">
                The Digital Run has moved here.<br />You will be redirected momentarily.
            </p>            

    </div>

</div>




<jsp:include page="../foot.jsp" />

</body>

</html>