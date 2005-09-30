<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel,
                 java.util.ArrayList,
                 java.util.TimeZone,
                 java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
  <head>
    <title></title>
    <META HTTP-EQUIV=Refresh CONTENT="600; URL=<jsp:getProperty name="sessionInfo" property="absoluteServletPath"/>?module=Static&d1=clockFrame">
    <script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
  </head>
  <body>
    <script language="javascript">
    
		function pad(number) {
			if (number < 10) return "0" + number;
			return "" + number;
		}
		
		function toString(date) {
			offset = date.getTimezoneOffset() / -60;
			hour = date.getHours();
			min = date.getMinutes();
			sec = date.getSeconds();
			offsetString = " GMT";
			if (offset >= 0) offsetString += "+";
			offsetString += offset;
			return pad(hour) + ":" + pad(min) + ":" + pad(sec) + offsetString;
		}
    
    	var serverTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
    	var localTime = new Date();
    	var adjustment = serverTime.getTime() - localTime.getTime();

        function update() {
			localTime = (new Date()).getTime() + adjustment;
			currentTime = new Date(localTime);
			text = toString(currentTime);

            if (top.mainFrame) {
                updateDivOrSpan(top.mainFrame.document, "currentTime", text);
            }

            setTimeout("update()", 1000);
        }

        setTimeout("update()", 1000);
    </script>
  </body>
</html>
