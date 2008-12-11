<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="aol"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <br>
            <map name="aol">
                <area shape="rect" alt="" coords="436,442,530,455" href="<tc-webtag:linkTracking link="http://developer.aol.com"/>" target="_blank"/>
                <area shape="rect" alt="" coords="489,515,595,527" href="<tc-webtag:linkTracking link="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_recruiting"/>"/>
                <area shape="rect" alt="" coords="386,544,446,559" href="<tc-webtag:linkTracking link="/tc?module=AOLAlertsDescription"/>"/>
<%-- old link tracking
                <area shape="rect" alt="" coords="436,442,530,455" href="/?t=sponsor&c=link&link=http://developer.aol.com" target="_blank"/>
                <area shape="rect" alt="" coords="489,515,595,527" href="/?t=sponsor&c=link&link=/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_recruiting"/>
--%>
            </map>

            <div align="center">
                <IMG SRC="/i/tournament/tccc06/aol_landing.gif" border="0" ALT="Wanna Be an All-Star Coder" usemap="#aol"/>
            </div>
            <br><br>

            <div class="bodySpacer">
               <div align="center">
               <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_072206">SRM 312 Chat Transcript</A>
               | <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_080906">SRM 315 Chat Transcript</A>
               | <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_100906">SRM 322 Chat Transcript</A>
               | <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_110206">SRM 325 Chat Transcript</A>
               </div>
               <br><br>
                <span class="smallText">* The TopCoder Collegiate Challenge is sponsored by TopCoder, Inc. AOL LLC is not responsible for any aspect of the Challenge.</span>
            </div>
            <br><br>
        </td>

        <!-- Right Column-->
        <td>&#160;</td>
        <%--
                <td width="170" align="right">
                    <jsp:include page="right.jsp">
                    <jsp:param name="level1" value="aol"/>
                    </jsp:include>
                 </td>
        --%>
    </tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>