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
                        
                        <p class=testHead><A href="/">Candidate List</A> - Candidate Info</p>

                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screenFrame">
                <tr>
                    <td class="screeningHeader" width="50%">Personal Info</td>
                    <td class="screeningHeader" width="50%">Demographic Info</td>
                </tr>
                <tr>
                <td valign=top class="screeningBG">
                
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>First Name:</td>
                            <td class="screeningCell" width="100%">Some</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Middle Initial:</td>
                            <td class="screeningCell">F</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Last Name:</td>
                            <td class="screeningCell">Dude</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Email Address:</td>
                            <td class="screeningCell">somedude@topcoder.com</td>
                            <td class="screeningCell"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Password:</td>
                            <td class="screeningCell">******</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 1:</td>
                            <td class="screeningCell">123 This St.</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 2:</td>
                            <td class="screeningCell"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 3:</td>
                            <td class="screeningCell"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>City:</td>
                            <td class="screeningCell">Middle</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>State:</td>
                            <td class="screeningCell">Nowhere</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Zip Code:</td>
                            <td class="screeningCell">012345</td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Country:</td>
                            <td class="screeningCell">United States</td>
                        </tr>
                    </table>
                    </td>
                    <td valign=top class="screeningBG">
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell" width="60%">This is where some question would go like "do you say 'nu-cle-ar' or 'nu-qu-lar'?</td>
                            <td class="screeningCell">Nu-cle-ar dumbass</td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Student or Professional?</td>
                            <td class="screeningCell">Professional</td>
                        </tr>
                        <tr>
                            <td class="screeningCell">David Lee Roth or Sammy Hagar?</td>
                            <td class="screeningCell">David Lee Roth</td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Coke or Pepsi?</td>
                            <td class="screeningCell">Pepsi</td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Skiing or Snowboarding?</td>
                            <td class="screeningCell">Snowboarding</td>
                        </tr>
                    </table>

                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screenFrame">
                <tr>
                    <td width="70%" class="screeningHeader">Notes</td>
                    <td width="15%" align="center" class="screeningHeader">Author</td>
                    <td width="15%" align="center" class="screeningHeader">Date Created</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCell><strong>Peter: HOLY CRAP! I'm communticating with nature! Uh, tree, if one of you falls and no one is around to hear you, do you make a noise?<br/>
Tree: Oh yeah, Scott fell over last week and hasn't shut up about it since.<br/>
Scott the Tree: Oh yeah, go ahead and bitch, but you don't see anyone trying to HELP ME!</strong></td>
                    <td valign=top width="15%"class=screeningCell align=center>PGriffin</td>
                    <td valign=top width="15%"class=screeningCell align=center>06/20/2004</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCell><strong>Snowboarding?! amateur...</strong></td>
                    <td valign=top width="15%"class=screeningCell align=center>GPaul</td>
                    <td valign=top width="15%"class=screeningCell align=center>06/01/2004</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCell><strong>Yeah, Hagar is a tool!</strong></td>
                    <td valign=top width="15%"class=screeningCell align=center>DLRoth</td>
                    <td valign=top width="15%"class=screeningCell align=center>06/01/1986</td>
                </tr>
                 <tr>
                    <td class="screeningCell" colspan="3" align=center><img src="/i/corp/addNoteButton.gif" border=0/></td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screenFrame">
                <tr>
                    <td width="30%" class="screeningHeader">Problem Name</td>
                    <td width="14%" align="center" class="screeningHeader">Language</td>
                    <td width="14%" align="center" class="screeningHeader">Status</td>
                    <td width="14%" align="center" class="screeningHeader">Time</td>
                    <td width="14%" align="center" class="screeningHeader">Percentile</td>
                    <td width="14%" align="center" class="screeningHeader">Results</td>
                </tr>
                <tr>
                    <td width="30%" class="screeningCell"><A href="/">Rain</A></td>
                    <td width="14%" align="center" class="screeningCell">Java</td>
                    <td width="14%" align="center" class="screeningCell">done</td>
                    <td width="14%" align="center" class="screeningCell">00:40.20</td>
                    <td width="14%" align="center" class="screeningCell">90.90</td>
                    <td width="14%" align="center" class="screeningCell"><A href="/">view</A></td>
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
