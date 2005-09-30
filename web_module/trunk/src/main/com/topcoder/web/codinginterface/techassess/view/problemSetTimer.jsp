<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo,
                 java.util.Date,
                 java.util.TimeZone"%>
<script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEM_SETS);
if (o!=null) {
            List problems = (List)o;
        %>

                var psEndTimes= new Array(<%=problems.size()%>);
                var psIds = new Array(<%=problems.size()%>);
                var psTypes = new Array(<%=problems.size()%>);
                var psStartTimes = new Array(<%=problems.size()%>);
        <%
                for (int i=0; i<problems.size(); i++) {
                    %> psEndTimes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTime()+((ProblemSetInfo)problems.get(i)).getStartTime()%>; <%
                    %> psIds[<%=i%>] = 'problemSetTimerCID<%=((ProblemSetInfo)problems.get(i)).getProblems()[0].getComponentID()%>PTID<%=((ProblemSetInfo)problems.get(i)).getTypeId()%>'; <%
                    %> psTypes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTypeId()%>; <%
                    %> psStartTimes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getStartTime()%>; <%
                }
        %>
        var PS_EXAMPLE_SET = <%=Constants.EXAMPLE_ID%>;
        
        var serverTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var localTime = new Date();
        var adjustment = serverTime.getTime() - localTime.getTime();

        function problemSetUpdate() {
        alert("problemSetUpdate()");
			localTime = (new Date()).getTime() + adjustment;
		alert("1");
			currentTime = new Date(localTime);
			alert("2");
			
			for (i = 0; i < psEndTimes.length; i++) {
			alert("3");
				if (psTypes[i] == PS_EXAMPLE_SET) {
					text = "N/A";
				}
				else {
					if (psStartTimes[i] == 0) {
						timeLeft = psEndTimes[i];
					}
					else {
						timeLeft = psEndTimes[i] - currentTime.getTime();
					}
					
					if (timeLeft > 0) {
						text = convertToTimeString(timeLeft);
					}
					else {
						text = "Expired";
					}
				}
				if (top.mainFrame) {
					updateDivOrSpan(top.mainFrame.document, psIds[i], text);
				}
			}
			
			setTimeout("problemSetUpdate()", 1000);
        }

        setTimeout("problemSetUpdate()", 1000);
<% } %>
    </script>
