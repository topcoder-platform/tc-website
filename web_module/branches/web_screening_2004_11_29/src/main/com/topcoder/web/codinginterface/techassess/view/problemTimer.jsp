<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 java.util.ArrayList,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo,
                 com.topcoder.web.codinginterface.techassess.model.ProblemInfo"%>
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

                var endTimes= new Array(<%=problems.size()%>);
                var times = new Array(<%=problems.size()%>);
                var ids = new Array(<%=problems.size()%>);
                var types = new Array(<%=problems.size()%>);
                var startTimes = new Array(<%=problems.size()%>);

        <%
                for (int i=0; i<problems.size(); i++) {
                    %> endTimes[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getTime()+((ProblemInfo)problems.get(i)).getStartTime()%>; <%
                    %> times[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getTime()%>; <%
                    %> ids[<%=i%>] = 'problemTimer<%=((ProblemInfo)problems.get(i)).getComponentId()%>'; <%
                    %> types[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getProblemTypeId()%>; <%
                    %> startTimes[<%=i%>] = <%=((ProblemInfo)problems.get(i)).getStartTime()%>; <%
                }
        %>
        var EXAMPLE_SET = <%=Constants.EXAMPLE_ID%>;
        var countDown = <%=request.getParameter("countDown")%>;

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

        for (i=0;i<endTimes.length; i++) {
          endTimes[i]=endTimes[i] - ((problemServerOffset - problemOffset) * 60 * 60 * 1000);
        }


        function problemUpdate() {
            var d = new Date();
            var correctedLocalTime = new Date(d.getTime() - problemSyncedOffset);

            for (i=0; i<startTimes.length;i++) {
                if (types[i]==EXAMPLE_SET) {
                    text = "N/A";
                } else  {
                    var time=0;
                    if (startTimes[i]==0) {
                      time = 0;
                    } else {
                      if (countDown=='true')
                        time = correctedLocalTime.getTime()-startTimes[i];
                        if (time>times[i]) time = times[i];
                      else {
                        time = endTimes[i] - correctedLocalTime.getTime();
                        if (time <= 0) time = 0;
                      }
                    }
                    text = convertToTimeString(time);
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
