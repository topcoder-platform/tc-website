<%--
  - Author: TCSDEVELOPER, pulky, TCSASSEMBLER
  - Version: 1.2
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays member profile tabs¡£
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
  - Version 1.2 (Release Assembly - TopCoder Software Profile Update v1.0) changes: Update to match new prototype.
--%>
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
   boolean isRatedTestScenarios = ((Boolean)request.getAttribute("hasTestScenarios")).booleanValue();
   boolean isRatedUIPrototype = ((Boolean)request.getAttribute("hasUIPrototype")).booleanValue();
   boolean isRatedRIABuild = ((Boolean)request.getAttribute("hasRIABuild")).booleanValue();
   boolean isRatedContentCreation = ((Boolean)request.getAttribute("hasContentCreation")).booleanValue();
   boolean isRatedReporting = ((Boolean)request.getAttribute("hasReporting")).booleanValue();
   String selectedTab = (String) request.getAttribute("tab");
   String coderId = request.getParameter("cr");
%>

<table class="contestMenu">
    <tr>        
        <% if (isRatedAlg) {%>
            <% if (selectedTab.equals("alg")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=alg&cr=<%=coderId%>"><div>Algorithm</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Algorithm</strong></div>
            </td>
        <% } %>
        
        <% if (isRegHS) {%>
            <% if (isRatedHS) {%>
                <% if (selectedTab.equals("hs")) {%>
                    <td class="current">
                <% } else { %>
                    <td>
                <% } %>    
                    <A class="tablineone" href="/tc?module=MemberProfile&tab=hs&cr=<%=coderId%>"><div>High<br/>School</div></A>
                </td>            
            <% } else { %>
                <td class="unrated">
                    <div><strong>High<br/>School</strong></div>
                </td>
            <% } %>
        <% } %>
        
        <% if (isRatedConcept) {%>
            <% if (selectedTab.equals("concept")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=concept&cr=<%=coderId%>"><div>Concept</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Concept</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedSpec) {%>
            <% if (selectedTab.equals("spec")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=spec&cr=<%=coderId%>"><div>Spec</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Spec</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedArch) {%>
            <% if (selectedTab.equals("arch")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=arch&cr=<%=coderId%>"><div>Arch</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Arch</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedDes) {%>
            <% if (selectedTab.equals("des")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=des&cr=<%=coderId%>"><div>Design</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Design</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedDev) {%>
            <% if (selectedTab.equals("dev")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=dev&cr=<%=coderId%>"><div>Develop</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Develop</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedAssembly) {%>
            <% if (selectedTab.equals("assembly")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=assembly&cr=<%=coderId%>"><div>Assembly</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Assembly</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedTest) {%>
            <% if (selectedTab.equals("test")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=test&cr=<%=coderId%>"><div>Test<br/>Suites</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Test<br/>Suites</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedTestScenarios) {%>
            <% if (selectedTab.equals("test_scenarios")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=test_scenarios&cr=<%=coderId%>"><div>Test<br/>Scenarios</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Test<br/>Scenarios</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedUIPrototype) {%>
            <% if (selectedTab.equals("ui_prototype")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=ui_prototype&cr=<%=coderId%>"><div>UI<br/>Prototype</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>UI<br/>Prototype</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedRIABuild) {%>
            <% if (selectedTab.equals("ria_build")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=ria_build&cr=<%=coderId%>"><div>RIA<br/>Build</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>RIA<br/>Build</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedContentCreation) {%>
            <% if (selectedTab.equals("content_creation")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=content_creation&cr=<%=coderId%>"><div>Content<br/>Creation</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Content<br/>Creation</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedReporting) {%>
            <% if (selectedTab.equals("reporting")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=reporting&cr=<%=coderId%>"><div>Reporting</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Reporting</strong></div>
            </td>
        <% } %>
        
        <% if (isRatedLong) {%>
            <% if (selectedTab.equals("long")) {%>
                <td class="current">
            <% } else { %>
                <td>
            <% } %>    
                <A class="tablineone" href="/tc?module=MemberProfile&tab=long&cr=<%=coderId%>"><div>Marathon<br/>Matches</div></A>
            </td>            
        <% } else { %>
            <td class="unrated">
                <div><strong>Marathon<br/>Matches</strong></div>
            </td>
        <% } %>
    </tr>
</table> 

