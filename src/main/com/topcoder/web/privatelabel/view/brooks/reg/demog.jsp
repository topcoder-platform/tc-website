<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Brooks Automation, Inc. - Screening</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/brooks.css"/>

</head>
<body>

<table width="770" align="left" valign="top" cellpadding=0 cellspacing=0 border=0>
	<tr><td><img src="/i/events/brooks/brooks_logo.gif" border="0" width="122" height="66"/><img src="/i/events/brooks/header.gif" border="0" width="409" height="66"/></td></tr>
	<tr><td><div class=brHead><img src="/i/clear.gif" height="23" width="1"></div></td></tr>
	<tr><td><div class=brHeadSpacer><img src="/i/clear.gif" height="4" width="1"></div></td></tr>
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" width="100%"> 
				<tr> 
					<td class=brLeftCol valign="top"><a href="/pl/?&module=Static&d1=brooks&d2=overview"><img src="/i/events/brooks/overview.gif" alt="" width="146" height="19" border="0"></a></td> 
					<td width="100%" valign="top">
					    <p class="brBody"><span class="brBodyTitle">Registration</span><br/><br/>
						Registration explanation goes here.
						</p>
						<form>
                        <table width="100%" cellpadding="0" cellspacing="3" border="0" >
                        <tr>
                            <td class="brErrorText" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion">Question</td>
                            <td class="brRegTableAnswer">Answer</td>
                        </tr>
                        <tr>
                            <td class="brRegTableQuestion"></td>
                            <td class="brRegTableAnswer" nowrap=nowrap>
                            <br/><a class="brRegTableAnswer" href="/pl/?&module=Static&d1=brooks&d2=reg&d3=confirm">Submit</a>
                            <br/><br/>

                            <span class="brErrorText"><b>OPTIONAL:</b></span> If you would like to upload a resume, click <a class="brRegTableAnswer" href="/">here</a></p>
                            </td>
                        </tr>
                        </table>
                        </form>
						
						<p><br/></p>
					</td> 

				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>