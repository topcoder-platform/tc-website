<html>
  <form method="POST" name="CcTx" action="<%=request.getAttribute("cctx-payflow-url")%>">
    <input type="hidden" name="LOGIN" value="<%=request.getAttribute("cctx-login")%>"/>
    <input type="hidden" name="PARTNER" value="<%=request.getAttribute("cctx-partner")%>"/>
    <input type="hidden" name="AMOUNT" value="<%=request.getAttribute("cctx-sum")%>"/>
    <input type="hidden" name="TYPE" value="<%=request.getAttribute("cctx-type")%>"/>
    <input type="hidden" name="SHOWCONFIRM" value="<%=request.getAttribute("cctx-showconfirm")%>"/>
    <input type="hidden" name="USER1" value="<%=request.getSession(true).toString()%>"/>
  </form>
  <body onload="document.CcTx.submit();" />
</html>