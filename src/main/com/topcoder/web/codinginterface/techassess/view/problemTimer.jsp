<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 java.util.ArrayList,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo,
                 com.topcoder.web.codinginterface.techassess.model.ProblemInfo,
                 java.util.TimeZone,
                 java.util.Date"%>
<script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEMS);
            if (o==null) {
                Object temp = request.getAttribute(Constants.PROBLEM);
                if (temp!=null) {
                    o = new ArrayList(1);
                    ((ArrayList)o).add(temp);
                }
            }
if (o!=null) {
    List problems = (List)o;
        %>

                var endTimes = new Array(<%=problems.size()%>);
                var times = new Array(<%=problems.size()%>);
                var ids = new Array(<%=problems.size()%>);
                var types = new Array(<%=problems.size()%>);
                var startTimes = new Array(<%=problems.size()%>);
                var submitTimes = new Array(<%=problems.size()%>);

        <%
                for (int i=0; i<problems.size(); i++) {
                    %> endTimes[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getTime()+((ProblemInfo)problems.get(i)).getStartTime()%>; <%
                    %> times[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getTime()%>; <%
                    %> ids[<%=i%>] = 'problemTimer<%=((ProblemInfo)problems.get(i)).getComponentId()%>'; <%
                    %> types[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getProblemTypeId()%>; <%
                    %> startTimes[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getStartTime()%>; <%
                    %> submitTimes[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getSubmitTime()%>; <%
                }
        %>
        
        var EXAMPLE_SET = <%=Constants.EXAMPLE_ID%>;
        var countDown = <%=request.getParameter("countDown")%>;
        
        var pServerTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var pLocalTime = new Date();
        var pAdjustment = pServerTime.getTime() - pLocalTime.getTime();
        
        function problemUpdate() {
			pLocalTime = (new Date()).getTime() + pAdjustment;
			
			for (i = 0; i < startTimes.length; i++) {
				if (countDown && types[i] == EXAMPLE_SET) {
					text = "N/A";
				}
				else {
					time = 0;
					
					if (countDown) {
						time = endTimes[i] - pLocalTime;
						if (time < 0) time = 0;
					}
					else {
						if (submitTimes[i] > 0) {
							time = submitTimes[i] - startTimes[i];
						}
						else {
							if (startTimes[i] > 0) {
								time = pLocalTime - startTimes[i];
								if (time > times[i] && types[i] != EXAMPLE_SET) time = times[i];
							}
							else {
								time = 0;
							}
						}
					}
					
					if ((countDown && time == 0) || (!countDown && time == times[i])) {
						text = "Expired";
					}
					else {
						text = convertToTimeString(time);
					}
				}
				
				if (top.mainFrame) {
					updateDivOrSpan(top.mainFrame.document, ids[i], text);
				}
			}
			
			setTimeout("problemUpdate()", 1000);
        }
        
        setTimeout("problemUpdate()", 100);
<% } %>
    </script>
