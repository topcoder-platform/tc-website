<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.StringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Test Results</title>
   <link type="text/css" rel="stylesheet" href="/css/screening.css" >
  </head>
  <body>
      <table border=0 width="100%">
               <tr><td class="testWinTitle">Test Results</td></tr>
          <tr>
              <td align="left">
<pre>
<%=StringUtils.htmlEncode(StringUtils.checkNull((String)request.getAttribute(Constants.MESSAGE)))%>
</pre>
              </td>
          </tr>
          <tr>
              <td>
                  <a href="Javascript:window.close();"><img src="/i/corp/screening/buttonOK.gif" alt="OK"/></a>
              </td>
          </tr>
      </table>
  </body>
</html>
