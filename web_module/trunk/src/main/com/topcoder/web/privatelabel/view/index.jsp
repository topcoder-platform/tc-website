<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Events - Private Label</title>

<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="private_label"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
               <jsp:include page="body_top.jsp" >
                  <jsp:param name="image" value="events"/>
                  <jsp:param name="image1" value="white"/>
                  <jsp:param name="title" value="Private Label"/>
               </jsp:include>

            <img src="/i/clear.gif" alt="" width="1" height="15" border="0"/><br/>

<!-- Upcoming Tournaments begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Upcoming Private Label Events</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google&d2=google_overview"><img src="/i/events/google2003/index_google.gif" alt="2003 GECC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2003 Google&#153; Extreme Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 14<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google&d2=google_overview">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><img src="/i/clear.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></td>
                </tr>
            </table>
<%--                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google&d2=google_overview"><img src="/i/events/verizon2003/index_verizon.gif" alt="2003 VCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2003 Verizon&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        August 29<br />
                        Verizon Chennai Facility<br/>
                        Chennai, India<br />
                        <A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><img src="/i/clear.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></td>
                </tr>
            </table>
--%>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<!-- Past Tournaments begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Past Private Label Events</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&c=javaone2003"><img src="/i/events/index_2003javaone.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2003 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 10-12<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&c=javaone2003">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><img src="/i/clear.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&c=2002sunnetwork"><img src="/i/events/index_2002sunnetwork.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2002 SunNetwork&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        Sept 18-20<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&c=2002sunnetwork">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><img src="/i/clear.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="review_board"/>
               <jsp:param name="level2" value="competition"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
