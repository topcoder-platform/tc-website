<%@  page language="java"  %>
<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils"
%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
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
dataRequest.setContentHandle("showdown_tccc05_scoreboard");
DataAccessInt dai = new DataAccess("OLTP");
Map dataMap = null;
dataMap = dai.getData(dataRequest);
ResultSetContainer rscTopA = (ResultSetContainer)dataMap.get("showdown_tccc05_top_set_a");
ResultSetContainer rscRecentA = (ResultSetContainer)dataMap.get("showdown_tccc05_recent_set_a");
ResultSetContainer rscTopB = (ResultSetContainer)dataMap.get("showdown_tccc05_top_set_b");
ResultSetContainer rscRecentB = (ResultSetContainer)dataMap.get("showdown_tccc05_recent_set_b");



%>


<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="showdown"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
            
            <table class="leaderTable" cellspacing=0 cellpadding=0 align=center width="95%">
                <tr><td class=problem colspan=5 align=right><p class=bodyText><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_description">back to the Spectator Showdown details</A>
				</p></td></tr>
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
                                <td class="leaderHeader" align="right">Score</td>
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
                                <td class="leaderHeader" align="right">Score</td>
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

      <p><br></p>

		</td>
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
