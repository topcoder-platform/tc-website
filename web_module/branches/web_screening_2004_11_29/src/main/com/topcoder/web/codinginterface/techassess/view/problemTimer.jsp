<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 java.util.ArrayList,
                 java.util.List"%>

<script language="javascript">

        <%
            Object o = request.getAttribute(Constants.PROBLEM_SETS);
            List problems = null;
            if (o!=null) {
                if (o instanceof ScreeningProblemSet) {
                    problems = new ArrayList();
                    problems.add(o);
                } else {
                    problems = (List)o;
                }
        %>
        var times= new Array(<%=problems.size()%>);
        var ids = new Array(<%=problems.size()%>);
        <%
                for (int i=0; i<problems.size(); i++) {
                    %> times(<%=i%>) = new Date(<%=((ScreeningProblemSet)problems.get(i)).getCompletionTime().intValue()%>); <%
                    %> ids(<%=i%>) = 'problemTimer<%=((ScreeningProblemSet)problems.get(i)).getProblemLabels()[0].getComponentID()%>'; <%
                }
            }

        %>
        var problemLocalTime = new Date();

        var problemServerOffset = -5; //hours from GMT
        var problemOffset = localTime.getTimezoneOffset();
        problemOffset = problemOffset / 60;
        problemOffset = problemOffset * -1

        <% if (o!=null) { %>
        for (i=0;i<times.length; i++) {
          times[i]=new Date(times[i].getTime() - ((problemServerOffset - problemOffset) * 60 * 60 * 1000));
        }
        <% } %>

        function updateProblemTime() {
            <% if (o!=null) { %>
            for (i=0; i<times.length;i++) {
                var timeLeft = times[i].getTime() - d.getTime();
                if(timeLeft > 0 ) {
                    text = convertToTimeString(timeLeft);
                } else {
                    text = "Expired";
                }
                updateDivOrSpan(top.mainFrame.document, ids[i], text);
            }
            <% } %>

            setTimeout("updateProblemTime()", 1000);
        }
        setTimeout("updateProblemTime()", 1000);
    </script>
