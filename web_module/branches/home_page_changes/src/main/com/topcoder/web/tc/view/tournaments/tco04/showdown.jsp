<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2004 JavaOne Coding Challenge</title>

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
    border: 1px solid #FF6600; 
}

.leaderParentR
{ 
    border-top: 1px solid #FF6600; 
    border-bottom: 1px solid #FF6600; 
    border-right: 1px solid #FF6600; 
}

.leaderTitle
{ 
    background-color: #FF6600;	
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
 


    <body>
            <table border=0 cellspacing=0 width="100%" align=center bgcolor="#EBEBEB">
                <tr>
                    <td align="left" valign="middle" width="50%"><img src="/i/tournament/tco04/showdownTCOLogo.gif" border="0"/></td>
                    <td align="center" valign="middle"><img src="/i/tournament/tco04/showdownTitle.gif" border="0"/></td>
                    <td align="right" valign="middle" width="50%"><img src="/i/tournament/tco04/showdownMSLogo.gif" border="0"/></td>
                </tr>
                <tr>
                    <td align="left" valign="middle" colspan="3" class=headerBar><img src="/i/clear.gif" width="100%" height="18" border="0"></td>
                </tr>
            </table>

            <table class="leaderTable" cellspacing=0 cellpadding=0 align=center width="95%">
                <tr>
                    <td class="problem" align=center colspan=2>Problem 1</td>
                    <td class="problem" ></td>
                    <td class="problem" align=center colspan=2>Problem 2</td>
                </tr>
                <tr>
                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">

<%-- Problem A Leaders --%>
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                                <tr>
                                    <td class="leaderCell">some dude</td>
                                    <td class="leaderCell" align=right>555.55</td>
                                </tr>
                        </table>
                    </td>

<%-- Problem A Recent Submissions --%>
                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">

                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                                <tr>
                                    <td class="leaderCell">some dude</td>
                                    <td class="leaderCell" align=right>555.55</td>
                                </tr>
                                <tr>
                                    <td class="leaderCell">some dude</td>
                                    <td class="leaderCell" align=right>555.55</td>
                                </tr>
                        </table>
                    </td>
                    <td class="spacer">&#160;</td>
<%-- Problem B Leaders --%>

                    <td valign=top class="leaderParentL" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Current Leaders</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Score</td>
                            </tr>
                                <tr>
                                    <td class="leaderCell">some dude</td>
                                    <td class="leaderCell" align=right>555.55</td>
                                </tr>
                        </table>
                    </td>

<%-- Problem B Recent Submissions --%>

                    <td valign=top class="leaderParentR" style="border-collapse: collapse" width="25%">
                        <table cellspacing=0 align=center width="100%">
                            <tr>
                                <td class="leaderTitle" colspan="2">Recent Submissions</td>
                            </tr>
                            <tr>
                                <td class="leaderHeader">Name</td>
                                <td class="leaderHeader" align="right">Status</td>
                            </tr>
                                <tr>
                                    <td class="leaderCell">some dude</td>
                                    <td class="leaderCell" align=right>555.55</td>
                                </tr>
                        </table>
                    </td>
                </tr>
            </table>

    </body>
</html>
