<%
    String phase = request.getParameter("phase")==null?"":request.getParameter("phase");
%>

<table width=100% border=0 cellspacing=0 cellpadding=0 align=right valign=top class=bodyText>
	<tr>
	<% if (phase.equals("preferences")) {%><td class=vbcON>Preferences 1</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingPreferences');" class=vbcLINK>Preferences 1</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("languages")) {%><td class=vbcON>Languages 2</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingLanguages');" class=vbcLINK>Languages 2</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("technologies")) {%><td class=vbcON>Technologies 3</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingTechnologies');" class=vbcLINK>Technologies 3</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("os")) {%><td class=vbcON>Operating Systems 4</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingOS');" class=vbcLINK>Operating Systems 4</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("databases")) {%><td class=vbcON>Databases 5</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingDatabases');" class=vbcLINK>Databases 5</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("industries")) {%><td class=vbcON>Industries 6</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingIndustries');" class=vbcLINK>Industries 6</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("confirm")) {%><td class=vbcON>Confirm 7</td>
	<% } else { %><td class=vbcOFF><A href="javascript:goToPage('ContractingIndustries');" class=vbcLINK>Confirmation 7</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("success")) {%><td class=vbcON>Done 8</td>
	<% } else { %><td class=vbcOFF>Done 8</td><% } %>
	</tr>

<%--
	<tr><td class="<%=phase.equals("preferences")?"vbcON":"vbcOFF"%>">Preferences</td></tr>
	<tr><td class="<%=phase.equals("languages")?"vbcON":"vbcOFF"%>">Languages</td></tr>
	<tr><td class="<%=phase.equals("technologies")?"vbcON":"vbcOFF"%>">Technologies</td></tr>
	<tr><td class="<%=phase.equals("os")?"vbcON":"vbcOFF"%>">Operating Systems</td></tr>
	<tr><td class="<%=phase.equals("databases")?"vbcON":"vbcOFF"%>">Databases</td></tr>
	<tr><td class="<%=phase.equals("confirm")?"vbcON":"vbcOFF"%>">Confirm</td></tr>
	<tr><td class="<%=phase.equals("success")?"vbcON":"vbcOFF"%>">Done</td></tr>
--%>
</table>