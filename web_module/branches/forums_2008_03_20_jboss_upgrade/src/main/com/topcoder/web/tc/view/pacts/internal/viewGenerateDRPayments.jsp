<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>


<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        
<script>
function viewList() {
  var idx = document.f.period.selectedIndex;
  var ref = document.f.period.options[idx].value;
  
  window.location="PactsInternalServlet?module=ListDRPayments&" + ref;
  
}

</script>

        
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Digital Run Payments</h2>
        <center>

<br>
<br>
<form name="f" action="#" method="get">

<br>
            <tc-webtag:rscSelect name="period" list="${periods}" fieldText="name" fieldValue="value" useTopValue="false" />

<br>
<br>
<input type="button" value="View Payments List" onclick="viewList()">
<br>
</form>   



        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
