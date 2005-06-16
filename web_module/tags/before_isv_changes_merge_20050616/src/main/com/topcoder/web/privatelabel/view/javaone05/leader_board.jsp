<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils"
%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<META HTTP-EQUIV="refresh" content="10">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<html>
<head>

<title>2005 JavaOne Coding Challenge</title>

 <STYLE TYPE="text/css">
 <!--
html, body
{
   font-family: Arial, Helvetica, Verdana, sans-serif;
   background-color: #FFF;
   padding: 0px;
   margin: 0px;
}

H1, H2, H3
{
   font-family: Arial, Helvetica, Verdana, sans-serif;
   font-size: 200%;
   text-decoration: none;
}

H2 { font-size: 150%; }
H3 { font-size: 125%; }

.problem
{ 
   font-size: 20px;
   font-weight: bold;
   text-decoration: none;
    padding: 10px;
    background-color: #FFFFFF;
}

.spacer
{ 
    padding: 10px;
    background-color: #FFFFFF;
}

.leaderTable
{ 
    background-color: #EEEEEE;   
    vertical-align: top;
}

.leaderParentL
{ 
    border: 1px solid #594FBF; 
}

.leaderParentR
{ 
    border-top: 1px solid #594FBF; 
    border-bottom: 1px solid #594FBF; 
    border-right: 1px solid #594FBF; 
}

.leaderTitle
{ 
    background-color: #594FBF;   
   color: #FFFFFF;
   font-size: 17px;
   font-weight: bold;
   text-decoration: none;
    margin: 0px;
   padding-top: 3px;
   padding-bottom: 3px;
   padding-left: 5px;
   padding-right: 5px;
}

.leaderHeader 
{ 
    background-color: #CCCCCC;   
   color: #333333;
   font-size: 17px;
   font-weight: bold;
   text-decoration: none;
   padding-top: 3px;
   padding-bottom: 3px;
   padding-left: 5px;
   padding-right: 5px;
}

.leaderCell
{
   color: #333333;
   font-size: 17px;
   font-weight: normal;
   text-decoration: none;
   padding-top: 5px;
   padding-bottom: 5px;
   padding-left: 5px;
   padding-right: 5px;
    vertical-align: top;
}

.winners
{
   color: #000000;
   font-size: 17px;
   font-weight: bold;
   text-decoration: none;
   padding-top: 5px;
   padding-bottom: 5px;
   padding-left: 5px;
   padding-right: 5px;
    vertical-align: top;
}

-->
 </STYLE>

</head>

<%

com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
dataRequest.setContentHandle("javaone_scoreboard");
DataAccessInt dai = new DataAccess("OLTP");
Map dataMap = null;
dataMap = dai.getData(dataRequest);
ResultSetContainer rscTopA = (ResultSetContainer)dataMap.get("top_set_a");
ResultSetContainer rscRecentA = (ResultSetContainer)dataMap.get("recent_set_a");
ResultSetContainer rscTopB = (ResultSetContainer)dataMap.get("top_set_b");
ResultSetContainer rscRecentB = (ResultSetContainer)dataMap.get("recent_set_b");



%>





    <body>
            <table border=0 cellspacing=0 width="100%" align=center>
                <tr>
                    <td align="left" valign="middle"><img src="/i/events/javaone05/javaone05_logo.gif" width="166" height="80" border="0"/></td>
                    <td align="center" valign="middle"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0"/></td>
                    <td align="right" valign="middle"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0"/></td>
                </tr>
                <tr>
                    <td align="left" valign="middle" colspan="3"><img src="/i/events/javaone05/purple_dot.gif" width="100%" height="25" border="0"></td>
                </tr>
            </table>

            <table class="leaderTable" cellspacing=0 cellpadding=0 align=center width="95%">
                <tr>
                    <td class="problem" align=center colspan=2>Problem 1</td>
                    <td class="problem" ></td>
                    <td class="problem" align=center colspan=2>Problem 2</td>
                </tr>
                <tr>
                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">

<%-- Problem A Leaders --%>
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                            <% int i=1;%>
                            <rsc:iterator list="<%=rscTopA%>" id="Row" >
                                <tr>
                                    <td class="<%=i<3?"winners":"leaderCell"%>"><rsc:item name="rank" row="<%=Row%>"/><%=". "+JSPUtils.htmlEncode(Row.getStringItem("name"))%></td>
                                    <td class="<%=i<3?"winners":"leaderCell"%>" align="right"><rsc:item name='score' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            <% i++; %>
                            </rsc:iterator>
                        </table>
                    </td>

<%-- Problem A Recent Submissions --%>
                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">

                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                            <rsc:iterator list="<%=rscRecentA%>" id="Row" >
                                <tr>
                                    <td class="leaderCell"><%=JSPUtils.htmlEncode(Row.getStringItem("name"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='status' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            </rsc:iterator>
                        </table>
                    </td>
                    <td class="spacer">&#160;</td>
<%-- Problem B Leaders --%>

                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                            <% int j=1;%>
                            <rsc:iterator list="<%=rscTopB%>" id="Row" >
                                <tr>
                                    <td class="<%=j<3?"winners":"leaderCell"%>"><rsc:item name="rank" row="<%=Row%>"/><%=". "+JSPUtils.htmlEncode(Row.getStringItem("name"))%></td>
                                    <td class="<%=j<3?"winners":"leaderCell"%>" align="right"><rsc:item name='score' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            <% j++;%>
                            </rsc:iterator>
                        </table>
                    </td>

<%-- Problem B Recent Submissions --%>

                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                            <rsc:iterator list="<%=rscRecentB%>" id="Row" >
                                <tr>
                                    <td class="leaderCell"><%=JSPUtils.htmlEncode(Row.getStringItem("name"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='status' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            </rsc:iterator>
                        </table>
                    </td>
                </tr>
            </table>

    </body>
</html>
