<%
    String phase = request.getParameter("phase")==null?"":request.getParameter("phase");
%>

<table width=100% border=0 cellspacing=0 cellpadding=0 align=right valign=top class=bodyText>
	<tr><td class="<%=phase.equals("preferences")?"vbcON":"vbcOFF"%>">Preferences</td></tr>
	<tr><td class="<%=phase.equals("languages")?"vbcON":"vbcOFF"%>">Languages</td></tr>
	<tr><td class="<%=phase.equals("technologies")?"vbcON":"vbcOFF"%>">Technologies</td></tr>
	<tr><td class="<%=phase.equals("os")?"vbcON":"vbcOFF"%>">Operating Systems</td></tr>
	<tr><td class="<%=phase.equals("databases")?"vbcON":"vbcOFF"%>">Databases</td></tr>
</table>