            <table border="0" cellspacing="0" cellpadding="3" width="530">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Match Dates</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/?t=schedule&c=index" class="bodyText"><strong>View Schedule</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="530">
                <tr><td><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td></tr>

                <tr valign="middle"> 
                    <td class="bodyText" width="170"> 
                        <jsp:include page="calendar.jsp" />
                    </td>

                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>

                    <td width="350"> 
                        <table border="0" cellspacing="0" cellpadding="5" class="surveyFrame">
                            <tr valign="middle">
                                <td class="bodyText" width="170">
                                    <h3>Next Match:</h3>
                                    <jsp:include page="srm_dates.jsp" />
                                </td>

                                <td class="bodyText" width="170"> 
                                    <jsp:include page="srm_sponsor.jsp" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>