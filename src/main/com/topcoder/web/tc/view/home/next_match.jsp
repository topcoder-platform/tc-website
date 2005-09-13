            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Schedule</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&d1=calendar&d2=thisMonth" class="bodyText"><strong>View All</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="530">
                <tr><td colspan="5"><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td></tr>

                <tr valign="middle"> 
                    <td>&#160;</td>

                    <td class="bodyText" width="170" align="right"> 
                        <jsp:include page="../calendar.jsp" />
                    </td>

                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>

                    <td align="left" width="170"> 
                        <table border="0" cellspacing="0" cellpadding="5" class="surveyFrame">
                            <tr valign="middle">
                                <td class="bodyText" width="100%" nowrap = nowrap>
                                    <h3>Next Match:</h3>
                                    <jsp:include page="srm_dates.jsp" />
                                </td>

                                <td class="bodyText"> 
                                    <jsp:include page="srm_sponsor.jsp" />
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td>&#160;</td>
                </tr>
            </table>