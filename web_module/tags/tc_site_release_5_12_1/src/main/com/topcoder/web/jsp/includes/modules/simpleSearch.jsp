<%@ page import="com.topcoder.web.common.WebConstants, com.topcoder.shared.util.ApplicationServer" %>

<div id="navbarSearch">
<b>Member Search:</b>
<form action="http://<%=ApplicationServer.SERVER_NAME%>/tc" method="get" name="simpleSearchForm" class="noSpace" id="simpleSearchForm">
   <input class="noSpace" type="hidden" name="module" value="SimpleSearch" />
   <input class="noSpace" type="text" name="<%=WebConstants.HANDLE%>" value="Handle:" size="12" maxlength="15"
      onfocus="javascript:
         if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value=='Handle:')
            document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = '';"
      onblur="javascript:
         if (document.simpleSearchForm.<%=WebConstants.HANDLE%>.value == '')
            document.simpleSearchForm.<%=WebConstants.HANDLE%>.value = 'Handle:';" />
   <a class="gMetal" href="javascript:void document.simpleSearchForm.submit();">Go</a><br />
   <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAdvanced">Advanced Search</a>
</form>
</div>