<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/topTemp.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="200" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText"> 
                        <p><span class=testHead>Campaign Results</span><br/>
                        Company Name: Brooks<br/>
                        Campaign Name: Operation FindGeek<br/>
                        Total Candidates: 73
                        </p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText" align=right>Showing 1-50:&#160;&#160;&#160;<A href="/">Prev 50</A> | <A href="/">Next 50</a></td>
                </tr>
            </table>
            
            <br/>
            
            <table cellspacing="0" cellpadding="0" width="600" class="screenFrame">
                <tr>
                    <td class="screeningHeader" width="10%"><A href="/">Name</A></td>
                    <td class="screeningHeader" width="10%"><A href="/">State/<br/>Province</A></td>
                    <td class="screeningHeader" width="10%"><A href="/">Country</A></td>
                    <td class="screeningHeader" width="10%" align=center><A href="/">Type</A></td>
                    <td class="screeningHeader" width="10%"><A href="/">Position</A></td>
                    <td class="screeningHeader" width="10%"><A href="/">Problem</A></td>
                    <td class="screeningHeader" width="10%" align=center><A href="/">Time</A></td>
                    <td class="screeningHeader" width="10%" align=center><A href="/">Results</A></td>
                    <td class="screeningHeader" width="10%" align=center><A href="/">Preference<br/>Level</A></td>
                    <td class="screeningHeader" width="10%" align=center><A href="/">Notes</A></td>
                </tr>

<script type="text/javascript">
for (i = 0; i <= 50; i++)
{
                document.write("<tr>")
                    document.write("<td class='screeningCell' nowrap=nowrap>Johnny Doe"+i+"</td> ")
                    document.write("<td class='screeningCell'>CT</td>")
                    document.write("<td class='screeningCell' nowrap=nowrap>United States</td>")
                    document.write("<td class='screeningCell' align=center>student</td>")
                    document.write("<td class='screeningCell'>architect</td>")
                    document.write("<td class='screeningCell'><A href='/'>Rain</A></td>")
                    document.write("<td class='screeningCell' align=center>00:40.20</td>")
                    document.write("<td class='screeningCell' align=center><A href='/'>view</A></td>")
                    document.write("<td class='screeningCell' align=center>Flash</td>")
                    document.write("<td class='screeningCell' align=center><A href='/'>view</A></td>")
                document.write("</tr>")
}
</script>

            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText" align=right>Showing 1-50:&#160;&#160;&#160;<A href="/">Prev 50</A> | <A href="/">Next 50</a></td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
