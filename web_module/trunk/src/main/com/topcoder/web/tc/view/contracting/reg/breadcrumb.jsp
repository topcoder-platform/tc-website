<%
    String phase = request.getParameter("phase")==null?"":request.getParameter("phase");
%>

<table width=100% border=0 cellspacing=0 cellpadding=0 align=right valign=top class=bodyText>
	<tr>
	<% if (phase.equals("preferences")) {%><td class=vbcON>Preferences 1</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=ContractingPreferences" class=vbcLINK>Preferences 1</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("languages")) {%><td class=vbcON>Languages 2</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=Static&d1=contracting&d2=reg&d3=languages" class=vbcLINK>Languages 2</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("technologies")) {%><td class=vbcON>Technologies 3</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=Static&d1=contracting&d2=reg&d3=technologies" class=vbcLINK>Technologies 3</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("os")) {%><td class=vbcON>Operating Systems 4</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=Static&d1=contracting&d2=reg&d3=os" class=vbcLINK>Operating Systems 4</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("databases")) {%><td class=vbcON>Databases 5</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=Static&d1=contracting&d2=reg&d3=databases" class=vbcLINK>Databases 5</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("confirm")) {%><td class=vbcON>Confirm 6</td>
	<% } else { %><td class=vbcOFF><A href="/tc?module=Static&d1=contracting&d2=reg&d3=confirm" class=vbcLINK>Confirmation 6</A></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("success")) {%><td class=vbcON>Done 7</td>
	<% } else { %><td class=vbcOFF>Done 7</td><% } %>
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