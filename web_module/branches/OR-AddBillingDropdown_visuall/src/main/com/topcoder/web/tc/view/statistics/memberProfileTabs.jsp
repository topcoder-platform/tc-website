<%
   boolean isRegHS = ((Boolean)request.getAttribute("registeredHS")).booleanValue();
   boolean isRatedAlg = ((Boolean)request.getAttribute("hasAlg")).booleanValue();
   boolean isRatedHS = ((Boolean)request.getAttribute("hasHS")).booleanValue();
   boolean isRatedDes = ((Boolean)request.getAttribute("hasDes")).booleanValue();
   boolean isRatedDev = ((Boolean)request.getAttribute("hasDev")).booleanValue();
   boolean isRatedLong = ((Boolean)request.getAttribute("hasLong")).booleanValue();
   boolean isRatedConcept = ((Boolean)request.getAttribute("hasConcept")).booleanValue();
   boolean isRatedSpec = ((Boolean)request.getAttribute("hasSpec")).booleanValue();
   boolean isRatedArch = ((Boolean)request.getAttribute("hasArch")).booleanValue();
   boolean isRatedAssembly = ((Boolean)request.getAttribute("hasAssembly")).booleanValue();
   boolean isRatedTest = ((Boolean)request.getAttribute("hasTest")).booleanValue();
   String selectedTab = (String) request.getAttribute("tab");
   String coderId = request.getParameter("cr");
%>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tabTable">
   <col width="10%"/>
   <% if (isRegHS) {%>
   <col width="10%"/>
   <% } %>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <tr>
      <td>
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
         <td>
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

      <!-- Member Profile Enhancement  -->
      <td>
      <% if (isRatedConcept) {%>
         <% if (selectedTab.equals("concept")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=concept&cr=<%=coderId%>"><div>Conceptualization</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=concept&cr=<%=coderId%>"><div>Conceptualization</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Conceptualization</div>
      <% } %>
      </td>
      
      <!-- Member Profile Enhancement  -->
      <td>
      <% if (isRatedSpec) {%>
         <% if (selectedTab.equals("spec")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=spec&cr=<%=coderId%>"><div>Specification</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=spec&cr=<%=coderId%>"><div>Specification</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Specification</div>
      <% } %>
      </td>
      
      <!-- Member Profile Enhancement  -->
      <td>
      <% if (isRatedArch) {%>
         <% if (selectedTab.equals("arch")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=arch&cr=<%=coderId%>"><div>Architecture</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=arch&cr=<%=coderId%>"><div>Architecture</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Architecture</div>
      <% } %>
      </td>
      
      <td>
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
      <td>
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
      
      <!-- Member Profile Enhancement  -->
      <td>
      <% if (isRatedAssembly) {%>
         <% if (selectedTab.equals("assembly")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=assembly&cr=<%=coderId%>"><div>Assembly</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=assembly&cr=<%=coderId%>"><div>Assembly</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Assembly</div>
      <% } %>
      </td>
      
      <!-- Member Profile Enhancement  -->
      <td>
      <% if (isRatedTest) {%>
         <% if (selectedTab.equals("test")) {%>
         <A class="tabLinkOn" href="/tc?module=MemberProfile&tab=test&cr=<%=coderId%>"><div>Application Testing</div></A>
         <% } else { %>
         <A class="tabLinkOff" href="/tc?module=MemberProfile&tab=test&cr=<%=coderId%>"><div>Application Testing</div></A>
         <% } %>
      <% } else { %>
      <div class="tabLinkNA">Application Testing</div>
      <% } %>
      </td>
      
      <td>
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
