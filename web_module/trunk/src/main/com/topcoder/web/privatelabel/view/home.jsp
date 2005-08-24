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

<%--
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="header">Upcoming Private Label Events</td></tr>
            </table>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank"><img src="/i/events/2005javaone_logo.gif" alt="2005 JavaOne" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2005 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 27-29, 2005<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
--%>

<!-- Past Tournaments begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="header">Past Private Label Events</td></tr>
            </table>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>


           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank"><img src="/i/events/2005javaone_logo.gif" alt="2005 JavaOne" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2005 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 27-29, 2005<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=gicj05&d2=overview" target="_blank"><img src="/i/events/gicj05/index_logo.gif" alt="GICJ05" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; India Code Jam 2005</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 26th, 2005<br />
                        Bangalore, India<br/>
                        <A href="/pl/?&module=Static&d1=gicj05&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=doubleclick05&d2=overview" target="_blank"><img src="/i/events/doubleclick05/index_dccc05.gif" alt="DCCC05" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>DoubleClick&#153; 2005 Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 2, 2005<br />
                        DoubleClick Headquarters<br/>
                        New York<br/>
                        <A href="/pl/?&module=Static&d1=doubleclick05&d2=overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google04&d2=overview" target="_blank"><img src="/i/events/google2004/indexLogo.gif" alt="2003 GECC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; Code Jam 2004 </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        October 15th, 2004<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google04&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=javaone04&d2=javaone_overview" target="_blank"><img src="/i/events/2004javaone_logo.gif" alt="2004 JavaOne" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2004 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 28-30, 2004<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?&module=Static&d1=javaone04&d2=javaone_overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" target="_blank"><img src="/i/events/doubleclick/index_dccc.gif" alt="DCCC" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>DoubleClick&#153; 2004 Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        February 27, 2004<br />
                        DoubleClick Headquarters<br/>
                        New York<br/>
                        <A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google&d2=google_overview" target="_blank"><img src="/i/events/google2003/index_google.gif" alt="2003 GECC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; Code Jam 2003 </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 14, 2003<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google&d2=google_overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" target="_blank"><img src="/i/events/verizon2003/index_verizon.gif" alt="Verizon" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Verizon&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 7, 2003<br />
                        Verizon Chennai Facility<br/>
                        Chennai, India<br />
                        <A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&c=javaone2003"><img src="/i/events/index_2003javaone.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2003 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 10-12, 2003<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&c=javaone2003">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&c=2002sunnetwork"><img src="/i/events/index_2002sunnetwork.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2002 SunNetwork&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        Sept 18-20, 2002<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&c=2002sunnetwork">Summary</A>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
