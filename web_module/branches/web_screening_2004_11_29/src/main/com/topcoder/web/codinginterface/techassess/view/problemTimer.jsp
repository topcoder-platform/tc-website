<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 java.util.ArrayList"%>
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


        //perform clock sync, time below is in milliseconds after epoch
        var problemServerTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var problemLocalTime = new Date();

        var problemServerOffset = -5; //hours from GMT
        var problemOffset = problemLocalTime.getTimezoneOffset();
        problemOffset = problemOffset / 60;
        problemOffset = problemOffset * -1

        problemServerTime = new Date(problemServerTime.getTime() - ((problemServerOffset - problemOffset) * 60 * 60 * 1000));
        var problemSyncedOffset = problemLocalTime.getTime() - problemServerTime.getTime();

        <% if (o!=null) { %>
        for (i=0;i<times.length; i++) {
          times[i]=new Date(times[i].getTime() - ((problemServerOffset - problemOffset) * 60 * 60 * 1000));
        }
        <% } %>

        function problemUpdate() {
            var d = new Date();
            d = new Date(d.getTime() - problemSyncedOffset);

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

            setTimeout("update()", 1000);
        }

        function convertToTimeString(time) {
            time = (time - (time % 1000)) / 1000;
            var secs = time % 60;
            time = time - secs;
            var minutes = (time % 3600) / 60;
            time = time - (minutes * 60);
            var hours = time / 3600;

            return padWithZeroes(hours) + ":" + padWithZeroes(minutes) + ":" + padWithZeroes(secs);
        }

        function updateDivOrSpan(root, name, text) {
            if(root.getElementById) {
                root.getElementById(name).innerHTML = text;
            } else {
                alert("FIX ME");
            }
        }

        function padWithZeroes(val) {
            var newVal = "00" + val;
            newVal = newVal.substring(newVal.length - 2, newVal.length);
            return newVal;
        }



        setTimeout("update()", 1000);
    </script>
