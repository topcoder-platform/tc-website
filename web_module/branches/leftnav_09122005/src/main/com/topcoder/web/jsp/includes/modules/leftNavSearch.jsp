<%@ page import="com.topcoder.web.common.WebConstants, com.topcoder.shared.util.ApplicationServer" %>
<b>Member Search:</b>
<form name="simpleSearchForm" method="get" action="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="noSpace">
   <input class="noSpace" type="hidden" name="module" value="SimpleSearch" />
   <input class="noSpace" type="text" name="<%=WebConstants.HANDLE%>" value="Handle:" size="12" maxlength="15"
      onFocus="javascript:
         if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value=='Handle:')
            document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = '';"
      onBlur="javascript:
         if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value == '')
            document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = 'Handle:';" />
   <A href="javascript:void document.simpleSearchForm.submit();">Go</A><br>
   <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAdvanced">Advanced Search</A>
</form>