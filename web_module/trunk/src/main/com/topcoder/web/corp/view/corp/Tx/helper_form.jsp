<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <form method="POST" name="CcTx" action="<%=Constants.CCTX_URL%>">
    <input type="hidden" name="LOGIN" value="<%=Constants.CCTX_LOGIN%>"/>
    <input type="hidden" name="PARTNER" value="<%=Constants.CCTX_PARTNER%>"/>
    <input type="hidden" name="AMOUNT" value="<%=request.getAttribute(Constants.KEY_CCTX_SUM)%>"/>
    <input type="hidden" name="TYPE" value="<%=Constants.CCTX_TYPE%>"/>
    <input type="hidden" name="SHOWCONFIRM" value="<%=Constants.CCTX_CONFIRM%>"/>
    <input type="hidden" name="USER1" value="<%=request.getSession(true).getId()%>"/>
  </form>
  <body onload="document.CcTx.submit();" />
</html>