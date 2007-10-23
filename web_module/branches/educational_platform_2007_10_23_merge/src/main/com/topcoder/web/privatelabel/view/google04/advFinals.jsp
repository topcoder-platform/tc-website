<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="advancers"/>
			</jsp:include>
			</div>

			<br/><br/>

			<span class=bigTitle>Advancers</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br/><br/>

			<table class=tableFrame cellpadding=5 cellspacing=2 border=0 width="400">
			<tr>
			<td class=advancersTitle colspan=2>Final Results</td>
			</tr>
			<tr>
			<td class=advancersRound width="50%">Handle</td>
			<td class=advancersRound width="50%" align="right">Score</td>
			</tr>
<tr class=sidebarText><td><b>ssancho2</b></td><td align="right"><b>639.07</b></td></tr>
<tr class=sidebarText><td>ploh</td><td align="right">637.26</td></tr>
<tr class=sidebarText><td>reid</td><td align="right">627.38</td></tr>
<tr class=sidebarText><td>tomek</td><td align="right">625.16</td></tr>
<tr class=sidebarText><td>pparys</td><td align="right">613.80</td></tr>
<tr class=sidebarText><td>tmyklebu</td><td align="right">610.76</td></tr>
<tr class=sidebarText><td>daveagp</td><td align="right">584.65</td></tr>
<tr class=sidebarText><td>bladerunner</td><td align="right">581.47</td></tr>
<tr class=sidebarText><td>Eryx</td><td align="right">566.38</td></tr>
<tr class=sidebarText><td>LunaticFringe</td><td align="right">548.09</td></tr>
<tr class=sidebarText><td>qixin99</td><td align="right">536.02</td></tr>
<tr class=sidebarText><td>monsoon</td><td align="right">535.74</td></tr>
<tr class=sidebarText><td>BjarkeDahlEbert</td><td align="right">526.85</td></tr>
<tr class=sidebarText><td>mathijs</td><td align="right">508.46</td></tr>
<tr class=sidebarText><td>krijgertje</td><td align="right">506.48</td></tr>
<tr class=sidebarText><td>bstanescu</td><td align="right">488.23</td></tr>
<tr class=sidebarText><td>John_Dethridge</td><td align="right">482.21</td></tr>
<tr class=sidebarText><td>tjq</td><td align="right">474.44</td></tr>
<tr class=sidebarText><td>texel</td><td align="right">445.08</td></tr>
<tr class=sidebarText><td>RunningWild</td><td align="right">432.09</td></tr>
<tr class=sidebarText><td>JongMan</td><td align="right">424.75</td></tr>
<tr class=sidebarText><td>Jan_Kuipers</td><td align="right">422.42</td></tr>
<tr class=sidebarText><td>timmac</td><td align="right">393.60</td></tr>
<tr class=sidebarText><td>jorisvr</td><td align="right">377.85</td></tr>
<tr class=sidebarText><td>snewman</td><td align="right">371.74</td></tr>
<tr class=sidebarText><td>m00tz</td><td align="right">367.12</td></tr>
<tr class=sidebarText><td>antimatter</td><td align="right">359.79</td></tr>
<tr class=sidebarText><td>ambrose</td><td align="right">356.77</td></tr>
<tr class=sidebarText><td>bolu</td><td align="right">332.11</td></tr>
<tr class=sidebarText><td>BEHiker57W</td><td align="right">329.71</td></tr>
<tr class=sidebarText><td>martinp534</td><td align="right">325.98</td></tr>
<tr class=sidebarText><td>Yarin</td><td align="right">318.69</td></tr>
<tr class=sidebarText><td>gilbert</td><td align="right">317.92</td></tr>
<tr class=sidebarText><td>lars</td><td align="right">310.97</td></tr>
<tr class=sidebarText><td>overwise</td><td align="right">294.20</td></tr>
<tr class=sidebarText><td>lovro</td><td align="right">292.87</td></tr>
<tr class=sidebarText><td>doeth</td><td align="right">275.66</td></tr>
<tr class=sidebarText><td>kalmakka</td><td align="right">257.69</td></tr>
<tr class=sidebarText><td>legakis</td><td align="right">255.66</td></tr>
<tr class=sidebarText><td>nullspace</td><td align="right">252.73</td></tr>
<tr class=sidebarText><td>jdmetz</td><td align="right">245.61</td></tr>
<tr class=sidebarText><td>haha</td><td align="right">233.68</td></tr>
<tr class=sidebarText><td>Ruberik</td><td align="right">232.43</td></tr>
<tr class=sidebarText><td>dzetkulict</td><td align="right">181.02</td></tr>
<tr class=sidebarText><td>tph</td><td align="right">160.57</td></tr>
<tr class=sidebarText><td>asaveljevs</td><td align="right">120.00</td></tr>
<tr class=sidebarText><td>grotmol</td><td align="right">0.00</td></tr>
<tr class=sidebarText><td>wisdompoet</td><td align="right">0.00</td></tr>
<tr class=sidebarText><td>Parchandri</td><td align="right">0.00</td></tr>
<tr class=sidebarText><td>jshute</td><td align="right">0.00</td></tr>
			</table>


			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>