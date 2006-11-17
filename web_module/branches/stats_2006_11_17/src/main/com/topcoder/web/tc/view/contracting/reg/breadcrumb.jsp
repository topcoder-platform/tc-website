<%!
    final String[] phases = new String[] {"preferences", "languages", "technologies", "os", "databases", "industries", "confirm", "success"};
    String phase;
    boolean isEdit;

    void setUp(String s, boolean b) {
        phase = s;
        isEdit = b;
    }

    boolean showLink(String ph) {
        if(isEdit) {
           return true;
        }

        if(getOrder(ph) < getOrder(phase))
            return true;

        return false;
    }

    int getOrder(String ph) {
        for(int i = 0; i < phases.length; i++) {
            if(phases[i].equals(ph))
                return i;
        }

        return 999;
    }
%>
<%
    String phase = request.getParameter("phase")==null?"":request.getParameter("phase");
    boolean isEdit = ((String)request.getAttribute("isEdit")).equals("true");

    setUp(phase, isEdit);
%>
<table width=100% border=0 cellspacing=0 cellpadding=0 align=right valign=top class=bodyText>
	<tr>
	<% if (phase.equals("preferences")) {%><td class=vbcON>Preferences 1</td>
	<% } else { %><td class=vbcOFF><%if(showLink("preferences")) {%><A href="javascript:goToPage('ContractingPreferences');" class=vbcLINK><%}%>Preferences 1<%if(showLink("preferences")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("languages")) {%><td class=vbcON>Languages 2</td>
	<% } else { %><td class=vbcOFF><%if(showLink("languages")) {%><A href="javascript:goToPage('ContractingLanguages');" class=vbcLINK><%}%>Languages 2<%if(showLink("preferences")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("technologies")) {%><td class=vbcON>Technologies 3</td>
	<% } else { %><td class=vbcOFF><%if(showLink("technologies")) {%><A href="javascript:goToPage('ContractingTechnologies');" class=vbcLINK><%}%>Technologies 3<%if(showLink("technologies")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("os")) {%><td class=vbcON>Operating Systems 4</td>
	<% } else { %><td class=vbcOFF><%if(showLink("os")) {%><A href="javascript:goToPage('ContractingOS');" class=vbcLINK><%}%>Operating Systems 4<%if(showLink("os")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("databases")) {%><td class=vbcON>Databases 5</td>
	<% } else { %><td class=vbcOFF><%if(showLink("databases")) {%><A href="javascript:goToPage('ContractingDatabases');" class=vbcLINK><%}%>Databases 5<%if(showLink("databases")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("industries")) {%><td class=vbcON>Industries 6</td>
	<% } else { %><td class=vbcOFF><%if(showLink("industries")) {%><A href="javascript:goToPage('ContractingIndustries');" class=vbcLINK><%}%>Industries 6<%if(showLink("industries")) {%></A><%}%></td><% } %>
	</tr>
	<tr>
	<% if (phase.equals("confirm")) {%><td class=vbcON>Confirm 7</td>
	<% } else { %><td class=vbcOFF><%if(showLink("confirm")) {%><A href="javascript:goToPage('ContractingConfirm');" class=vbcLINK><%}%>Confirmation 7<%if(showLink("confirm")) {%></A><%}%></td><% } %>
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