<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel"%>
<script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEMS);
if (o!=null) {
    List problems = (List)o;
        %>

                var ids = new Array(<%=problems.size()%>);
                var startTimes = new Array(<%=problems.size()%>);
        <%
                for (int i=0; i<problems.size(); i++) {
                    %> ids[<%=i%>] = 'problemTimer<%=((ScreeningProblemLabel)problems.get(i)).getComponentID()%>'; <%
                    %> startTimes[<%=i%>] = <%=((ScreeningProblemLabel)problems.get(i)).getStartTime()%>; <%
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

        function problemUpdate() {
            var d = new Date();
            var correctedLocalTime = new Date(d.getTime() - problemSyncedOffset);

            for (i=0; i<times.length;i++) {
                var time=0;
                if (startTimes[i]==0) {
                  time = 0;
                } else {
                  time = correctedLocalTime.getTime()-startTimes[i];
                }
                text = convertToTimeString(time);
                if (top.mainFrame) {
                    updateDivOrSpan(top.mainFrame.document, ids[i], text);
                }
            }
            setTimeout("problemUpdate()", 1000);
        }

        setTimeout("problemUpdate()", 1000);
<% } %>
    </script>
