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
                        <p><span class=testHead>Position List</span><br/>
                        Company Name: <A href="/corp/testing/results/campaignList.jsp">Brooks</A><br/>
                        Campaign Name: <A href="/corp/testing/results/campaignList.jsp">Operation FindGeek</A><br/>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>
            
            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="33%">Position Name</td>
                    <td class="screeningHeader" width="33%" align=center>Most Recent Activity</td>
                    <td class="screeningHeader" width="33%" align=right>Candidates</td>
                </tr>

<script type="text/javascript">
for (i = 1; i <= 10; i++)
{
    document.write("<tr>")
    if(i%2==1)
    {
                    document.write("<td class='screeningCellOdd' nowrap=nowrap><A href='/corp/testing/results/positionResults.jsp'>position"+i+"</A></td> ")
                    document.write("<td class='screeningCellOdd' align=center>06.21.2004 04:34</td>")
                    document.write("<td class='screeningCellOdd' align=right>"+i+"</td>")
    } else {
                    document.write("<td class='screeningCellEven' nowrap=nowrap><A href='/corp/testing/results/positionResults.jsp'>position"+i+"</A></td> ")
                    document.write("<td class='screeningCellEven' align=center>06.21.2004 04:34</td>")
                    document.write("<td class='screeningCellEven' align=right>"+i+"</td>")
    }
    document.write("</tr>")
}
</script>

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
