<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils"
%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="refresh" content="60">
<title>2004 TopCoder Open - Computer Programming Tournament</title>

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

.headerBar
{
	color: #FFF;
	background-color: #FFFFFF;
	background-image: url(/i/tournament/tco04/bv_lite_bg.gif);
}

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
    border: 1px solid #7A7A89; 
}

.leaderParentR
{ 
    border-top: 1px solid #7A7A89; 
    border-bottom: 1px solid #7A7A89; 
    border-right: 1px solid #7A7A89; 
}

.leaderTitle
{ 
    background-color: #7A7A89;	
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
dataRequest.setContentHandle("showdown_scoreboard");
DataAccessInt dai = new DataAccess("OLTP");
Map dataMap = null;
dataMap = dai.getData(dataRequest);
ResultSetContainer rscTopA = (ResultSetContainer)dataMap.get("showdown_top_set_a");
ResultSetContainer rscRecentA = (ResultSetContainer)dataMap.get("showdown_recent_set_a");
ResultSetContainer rscTopB = (ResultSetContainer)dataMap.get("showdown_top_set_b");
ResultSetContainer rscRecentB = (ResultSetContainer)dataMap.get("showdown_recent_set_b");



%>

    <body>
            <table border=0 cellspacing=0 width="100%" align="center">
                <tr>
                    <td align="left" valign="middle" width="50%"><img src="/i/tournament/tco04/showdownTCOLogo.gif" border="0"/></td>
                    <td align="center" valign="middle"><img src="/i/tournament/tccc05/ss_logo.gif" border=0 /></td>
                    <td align="right" valign="middle" width="50%"><img src="/i/tournament/tco04/showdownMSLogo.gif" border="0"/></td>
                </tr>
            </table>

            <table class="leaderTable" cellspacing=0 cellpadding=0 align=center width="95%">
                <tr>
                    <td class="problem" align=center colspan=2>Problem Set 1</td>
                    <td class="problem" ></td>
                    <td class="problem" align=center colspan=2>Problem Set 2</td>
                </tr>
                <tr>
                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">

<%-- Problem A Leaders --%>
                            
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2" nowrap=nowrap>Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Handle</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                            <% int i=1;%>
                            <rsc:iterator list="<%=rscTopA%>" id="Row" >
                                <tr>
                                    <td class="leaderCell"><%=i+". "+JSPUtils.htmlEncode(Row.getStringItem("handle"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='points' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            <% i++; %>
                            </rsc:iterator>
                        </table>
                    </td>

<%-- Problem A Recent Submissions --%>
                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">

                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2" nowrap=nowrap>Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Handle</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                             <rsc:iterator list="<%=rscRecentA%>" id="Row" > 
                                <tr>
                                    <td class="leaderCell"><%=JSPUtils.htmlEncode(Row.getStringItem("handle"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='points' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            </rsc:iterator>
                        </table>
                    </td>
                    <td class="spacer">&#160;</td>
<%-- Problem B Leaders --%>

                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2" nowrap=nowrap>Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Handle</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                            <% int j=1;%>
                            <rsc:iterator list="<%=rscTopB%>" id="Row" >
                                <tr>
                                    <td class="leaderCell"><%=j+". "+JSPUtils.htmlEncode(Row.getStringItem("handle"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='points' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            <% j++;%>
                            </rsc:iterator>
                        </table>
                    </td>

<%-- Problem B Recent Submissions --%>

                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2" nowrap=nowrap>Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Handle</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                            <rsc:iterator list="<%=rscRecentB%>" id="Row" >
                                <tr>
                                    <td class="leaderCell"><%=JSPUtils.htmlEncode(Row.getStringItem("handle"))%></td>
                                    <td class="leaderCell" align="right"><rsc:item name='points' row='<%=Row%>' format="0.00"/></td>
                                </tr>
                            </rsc:iterator>
                        </table>
                    </td>
                </tr>
            </table>

    </body>
</html>
