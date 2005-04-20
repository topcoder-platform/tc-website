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
                    %> psIds[<%=i%>] = 'problemSetTimer<%=((ProblemSetInfo)problems.get(i)).getProblems()[0].getComponentID()%>'; <%
                    %> psTypes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getTypeId()%>; <%
                    %> psStartTimes[<%=i%>] = <%=((ProblemSetInfo)problems.get(i)).getStartTime()%>; <%
                }
        %>
        var PS_EXAMPLE_SET = <%=Constants.EXAMPLE_ID%>;

        //perform clock sync, time below is in milliseconds after epoch
        var psProblemServerTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var psProblemLocalTime = new Date();

        var psProblemServerOffset = <%=TimeZone.getDefault().getOffset(new Date().getTime())/(60*60*1000)%>
        var psProblemOffset = psProblemLocalTime.getTimezoneOffset();
        psProblemOffset = psProblemOffset / 60;
        psProblemOffset = psProblemOffset * -1

        psProblemServerTime = new Date(psProblemServerTime.getTime() - ((psProblemServerOffset - psProblemOffset) * 60 * 60 * 1000));

        var psProblemSyncedOffset = psProblemLocalTime.getTime() - psProblemServerTime.getTime();

        for (i=0;i<psEndTimes.length; i++) {
          psEndTimes[i]=psEndTimes[i] - ((psProblemServerOffset - psProblemOffset) * 60 * 60 * 1000);
        }

        function problemSetupUpdate() {
            var d = new Date();
            var correctedLocalTime = new Date(d.getTime() - psProblemSyncedOffset);

            for (i=0; i<psEndTimes.length;i++) {
                if (psTypes[i]==PS_EXAMPLE_SET) {
                    text = "N/A";
                } else  {
                    var timeLeft
                    if (psStartTimes[i]==0) {
                      timeLeft = psEndTimes[i];
                    } else {
                      timeLeft = psEndTimes[i] - correctedLocalTime.getTime();
                    }
                    if(timeLeft > 0 ) {
                        text = convertToTimeString(timeLeft);
                    } else {
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
