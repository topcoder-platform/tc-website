<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 java.util.ArrayList,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo"%>
<script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEM_SETS);
if (o!=null) {
            List problems = null;
                if (o instanceof ScreeningProblemSet) {
                    problems = new ArrayList();
                    problems.add(o);
                } else {
                    problems = (List)o;
                }
        %>
                var times= new Array(<%=problems.size()%>);
                var ids = new Array(<%=problems.size()%>);
                var types = new Array(<%=problems.size()%>);
                var startTimes = new Array(<%=problems.size()%>);
        <%
                for (int i=0; i<problems.size(); i++) {
                    %> times[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTimeRemaining()%>; <%
                    %> ids[<%=i%>] = 'problemTimer<%=((ProblemSetInfo)problems.get(i)).getProblems()[0].getComponentID()%>'; <%
                    %> types[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTypeId()%>; <%
                    %> startTimes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getStartTime()%>; <%
                }
        %>
        var EXAMPLE_SET = <%=Constants.EXAMPLE_ID%>;

        //perform clock sync, time below is in milliseconds after epoch
        var problemServerTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var problemLocalTime = new Date();

        var problemServerOffset = -5; //hours from GMT
        var problemOffset = problemLocalTime.getTimezoneOffset();
        problemOffset = problemOffset / 60;
        problemOffset = problemOffset * -1

        //make problemServerTime UTC
        problemServerTime = new Date(problemServerTime.getTime() - ((problemServerOffset - problemOffset) * 60 * 60 * 1000));

        var problemSyncedOffset = problemLocalTime.getTime() - problemServerTime.getTime();

        for (i=0;i<times.length; i++) {
          times[i]=times[i] - ((problemServerOffset - problemOffset) * 60 * 60 * 1000);
        }

        function problemUpdate() {
            var d = new Date();
            var correctedLocalTime = new Date(d.getTime() - problemSyncedOffset);

            for (i=0; i<times.length;i++) {
                var timeLeft
                if (startTimes[i]==0) {
                  timeLeft = times[i];
                } else {
                  timeLeft = times[i] - correctedLocalTime.getTime();
                }
                if (types[i]==EXAMPLE_SET) {
                    text = "N/A";
                } else  {
                    if(timeLeft > 0 ) {
                        text = convertToTimeString(timeLeft);
                    } else {
                        text = "Expired";
                    }
                }
                if (top.mainFrame) {
                    updateDivOrSpan(top.mainFrame.document, ids[i], text);
                }

            }

            setTimeout("problemUpdate()", 1000);
        }

        setTimeout("problemUpdate()", 1000);
<% } %>
    </script>
