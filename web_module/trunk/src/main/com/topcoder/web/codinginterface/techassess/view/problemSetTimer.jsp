<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo"%>
<script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEM_SETS);
if (o!=null) {
            List problems = (List)o;
        %>

                var endTimes= new Array(<%=problems.size()%>);
                var ids = new Array(<%=problems.size()%>);
                var types = new Array(<%=problems.size()%>);
                var startTimes = new Array(<%=problems.size()%>);
        <%
                for (int i=0; i<problems.size(); i++) {
                    %> endTimes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTime()+((ProblemSetInfo)problems.get(i)).getStartTime()%>; <%
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

        problemServerTime = new Date(problemServerTime.getTime() - ((problemServerOffset - problemOffset) * 60 * 60 * 1000));

        var problemSyncedOffset = problemLocalTime.getTime() - problemServerTime.getTime();

        for (i=0;i<endTimes.length; i++) {
          endTimes[i]=endTimes[i] - ((problemServerOffset - problemOffset) * 60 * 60 * 1000);
        }

        function problemUpdate() {
            var d = new Date();
            var correctedLocalTime = new Date(d.getTime() - problemSyncedOffset);

            for (i=0; i<endTimes.length;i++) {
                if (types[i]==EXAMPLE_SET) {
                    text = "N/A";
                } else  {
                    var timeLeft
                    if (startTimes[i]==0) {
                      timeLeft = endTimes[i];
                    } else {
                      timeLeft = endTimes[i] - correctedLocalTime.getTime();
                    }
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
