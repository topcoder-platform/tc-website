<%@ page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="digitalrun"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<script language="javascript" type="text/javascript">
<!--
function menu_goto( menuform )
{
    selecteditem = menuform.newurl.selectedIndex ;
    newurl = menuform.newurl.options[ selecteditem ].value ;
    if (newurl.length != 0) {
      location.href = newurl ;
    }
}
//-->
</script>
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- centerer -->
<div align="center">

    <!-- spacer -->
    <div id="pageSpacer">

        <div id="eventLogo">
            <img src="/i/digital_run/digitalrunlogo20080625.png" alt="The Digital Run" />
        </div>

        <div id="eventBannerBox">
            <img src="/i/digital_run/ban20080625.png" alt="." />
        </div>

        <div id="eventDescBox">
            <div class="spacer">
                <div>Now is your chance to be the driving force in the growth of TopCoder and reap the benefits in the form of monthly cash bonuses in the Digital Run. The DR is now tied directly to TopCoder's revenue, so the more you compete, the more contests we run, the more cash we pay out at the end of each month.</div>
                <div>>> <a href="http://forums.topcoder.com/?module=Thread&amp;threadID=617309">how it works...</a></div>
            </div>
        </div>

        <ul id="navBox">
            <li>
                <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desOverview">Software Design</a>
            </li>
            <li>
                <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devOverview">Software Development</a>
            </li>
            <li>
                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Studio</a>
            </li>
            <li>
                <a href="http://forums.topcoder.com/?module=Thread&amp;threadID=617309">Forums</a>
            </li>
            <li>
                <a href="/tc">Home</a>
            </li>
        </ul>

        <div id="contestTypes">

            <div class="designColumn">
                <div>
                    <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desOverview"><img src="/i/digital_run/trophyDes.png" alt="" /></a>
                </div>
                <div>
                    <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desRules">Rules</a>
                </div>
                <div>
                    <a href="/tc?module=ViewActiveContests&amp;ph=112">Active contests</a>
                </div>
                <div>
                    <a href="/dr?module=ViewLeaderBoard&amp;tid=2120">Leaderboards</a>
                </div>
                <div class="prizeLine">
                    <span class="money">
                        <fmt:formatNumber value="${designPrize.total}" type="currency" currencySymbol="$"/>
                    </span> 
                    <span class="month">bonus pool in ${monthName}</span>
                    <span class="month">(+<fmt:formatNumber value="${designPrize.today}" type="currency" currencySymbol="$"/> in the past ${pastNDays} days)</span>
                </div>
                <div class="prizeGuarantee">
                    <span class="money">$10,000</span> <span class="month">Guaranteed Monthly Bonus</span>
                </div>
            </div>

            <div class="developmentColumn">
                <div>
                    <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devOverview"><img src="/i/digital_run/trophyDev.png" alt="" /></a>
                </div>
                <div>
                    <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devRules">Rules</a>
                </div>
                <div>
                    <a href="/tc?module=ViewActiveContests&amp;ph=113">Active contests</a>
                </div>
                <div>
                    <a href="/dr?module=ViewLeaderBoard&amp;tid=2121">Leaderboards</a>
                </div>
                <div class="prizeLine">
                    <span class="money">
                        <fmt:formatNumber value="${developmentPrize.total}" type="currency" currencySymbol="$"/>
                    </span>
                    <span class="month">bonus pool in ${monthName}</span>
                    <span class="month">(+<fmt:formatNumber value="${developmentPrize.today}" type="currency" currencySymbol="$"/> in the past ${pastNDays} days)</span>
                </div>
                <div class="prizeGuarantee">
                    <span class="money">$10,000</span> <span class="month">Guaranteed Monthly Bonus</span>
                </div>
            </div>

            <div class="studioColumn">
                <div>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home"><img src="/i/digital_run/trophyStudio.png" alt="" /></a>
                </div>
                <div>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=rules">Rules</a>
                </div>
                <div>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Active contests</a>
                </div>
                <div>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/dr?module=ViewLeaderBoard&amp;tid=2122">Leaderboards</a>
                </div>
                <div class="prizeLine">
                    <span class="money">
                        <fmt:formatNumber value="${studioPrize.total}" type="currency" currencySymbol="$"/>
                    </span>
                    <span class="month">bonus pool in ${monthName}</span>
                    <span class="month">(+<fmt:formatNumber value="${studioPrize.today}" type="currency" currencySymbol="$"/> in the past ${pastNDays} days)</span>
                </div>
                <div class="prizeGuarantee">
                    <span class="money">$5,000</span> <span class="month">Guaranteed Monthly Bonus</span>
                </div>
            </div>

        </div>

<%--
        <div id="tallyBox">
            tallyBox
        </div>

        <div id="leaderboards">
            <h2 align="center">Current leaderboards</h2>

            <div class="designColumn">
                <table class="drStat" cellpadding="0" cellspacing="0" width="100%">
                <colgroup>
                    <col />
                    <col width="100%" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th class="title c" colspan="3">Design</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                </tbody>
                </table>
                <p align="right">
                    <a href="#">See all >></a>
                </p>
            </div>

            <div class="developmentColumn">
                <table class="drStat" cellpadding="0" cellspacing="0" width="100%">
                <colgroup>
                    <col />
                    <col width="100%" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th class="title c" colspan="3">Development</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                </tbody>
                </table>
                <p align="right">
                    <a href="#">See all >></a>
                </p>
            </div>

            <div class="studioColumn">
                <table class="drStat" cellpadding="0" cellspacing="0" width="100%">
                <colgroup>
                    <col />
                    <col width="100%" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th class="title c" colspan="3">Studio</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="even">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                    <tr class="odd">
                        <td class="c">td</td>
                        <td>td</td>
                        <td class="r">td</td>
                    </tr>
                </tbody>
                </table>
                <p align="right">
                    <a href="#">See all >></a>
                </p>
            </div>
--%>

            <p align="center">Looking for a past Digital Run stage?</p>
            <div align="center">
                <form action="dummyvalue">
                <select name="newurl" onchange="menu_goto(this.form)">
                  <option value="/tc?module=Static&amp;d1=digital_run&amp;d2=2006description">2007 Season</option>
                  <option value="/tc?module=Static&amp;d1=digital_run&amp;d2=2007dot5&amp;d3=description">2007.5 Season</option>
                  <option value="/tc?module=Static&amp;d1=digital_run&amp;d2=2008&amp;d3=description">2008 Season</option>
                  <option value="/dr" selected="selected">2008v2 Season</option>
                </select>
                </form>
            </div>

    </div>

</div>




<jsp:include page="../foot.jsp" />

</body>

</html>
