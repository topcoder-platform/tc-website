<%
   boolean isRegHS = ((Boolean)request.getAttribute("registeredHS")).booleanValue();
   boolean isRatedAlg = ((Boolean)request.getAttribute("hasAlg")).booleanValue();
   boolean isRatedHS = ((Boolean)request.getAttribute("hasHS")).booleanValue();
   boolean isRatedDes = ((Boolean)request.getAttribute("hasDes")).booleanValue();
   boolean isRatedDev = ((Boolean)request.getAttribute("hasDev")).booleanValue();
   boolean isRatedLong = ((Boolean)request.getAttribute("hasLong")).booleanValue();
   String selectedTab = (String) request.getAttribute("tab");
   String coderId = request.getParameter("cr");
%>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tabTable">
   <tr>
      <td width="20%">
      <% if (isRatedAlg) {%>
         <% if (selectedTab.equals("alg")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>"><div>Algorithm</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>"><div>Algorithm</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Algorithm</div>
      <% } %>
      </td>

      <% if (isRegHS) {%>
         <td width="20%">
         <% if (isRatedHS) {%>
            <% if (selectedTab.equals("hs")) {%>
            <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=hs&cr=<%=coderId%>"><div>High School</div></A>
            <% } else { %>
            <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=hs&cr=<%=coderId%>"><div>High School</div></A>
            <% } %>
         <% } else { %>
         <div class="tabLinkNA">High School</div>
         <% } %>
         </td>
      <% } %>

      <td width="20%">
      <% if (isRatedDes) {%>
         <% if (selectedTab.equals("des")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>"><div>Design</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>"><div>Design</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Design</div>
      <% } %>
      </td>
      <td width="20%">
      <% if (isRatedDev) {%>
         <% if (selectedTab.equals("dev")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=dev&cr=<%=coderId%>"><div>Development</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=dev&cr=<%=coderId%>"><div>Development</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Development</div>
      <% } %>
      </td>
      <td width="20%">
      <% if (isRatedLong) {%>
         <% if (selectedTab.equals("long")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=long&cr=<%=coderId%>"><div>Marathon Matches</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=long&cr=<%=coderId%>"><div>Marathon Matches</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Marathon Matches</div>
      <% } %>
      </td>
   </tr>
</table>
