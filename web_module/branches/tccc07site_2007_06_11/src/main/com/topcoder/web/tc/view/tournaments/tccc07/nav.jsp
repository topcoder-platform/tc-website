<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div style="margin-bottom:-60px; position:relative;">
    <div id="sponsorNtclogo">
        <div align="left" style="padding-left:30px; padding-top:10px; width:313px; height:162px;">
            <a href="/"><img src="/i/tournament/tccc07/sponsorlogo.png" alt="Sponsor Logo" /></a>
        </div>
        <div id="tclogo">
            <a href="/"><img src="/i/tournament/tccc07/topcoderlogo.png" alt="TopCoder&#174;" /></a>
        </div>
    </div>
    
    <div style="margin-top:0px;">

<%--------------PRIMARY NAV---------------%>
        <div align="center">
            <div id="navButtons">

                <div style="float:left;">
                <% if (tabLev1.equals("overview")) {%>
                    <a href=""><img src="/i/tournament/tccc07/tournie_on.png" alt="Tournament Overview" /></a>
                <% } else { %>
                    <a href=""><img src="/i/tournament/tccc07/tournie.png" alt="Tournament Overview" /></a>
                <% } %>
                </div>

                <div style="float:left;">
                <% if (tabLev1.equals("algorithm")) {%>
                    <a href=""><img src="/i/tournament/tccc07/alg_on.png" alt="Algorithm Competition" /></a>
                <% } else { %>
                    <a href=""><img src="/i/tournament/tccc07/alg.png" alt="Algorithm Competition" /></a>
                <% } %>
                </div>
            
                <div style="float:left;">
                <% if (tabLev1.equals("component")) {%>
                    <a href=""><img src="/i/tournament/tccc07/comp_on.png" alt="Component Competition" /></a>
                <% } else { %>
                    <a href=""><img src="/i/tournament/tccc07/comp.png" alt="Component Competition" /></a>
                <% } %>
                </div>
                
                <div style="float:left;">
                <% if (tabLev1.equals("marathon")) {%>
                    <a href=""><img src="/i/tournament/tccc07/mara_on.png" alt="Marathon Competition" /></a>
                <% } else { %>
                    <a href=""><img src="/i/tournament/tccc07/mara.png" alt="Marathon Competition" /></a>
                <% } %>
                </div>
                
                <div style="float:left;">
                <% if (tabLev1.equals("studio")) {%>
                    <a href=""><img src="/i/tournament/tccc07/studio_on.png" alt="Studio Overview" /></a>
                <% } else { %>
                    <a href=""><img src="/i/tournament/tccc07/studio.png" alt="Studio Overview" /></a>
                <% } %>
                </div>
        
            </div>
            
<%--------------SECONDARY NAV---------------%>
            <div id="navText">
            <% if (tabLev1.equals("overview")) {%>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"<% if (tabLev2.equals("overview")) {%> class="on"<% } %>>Details</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule"<% if (tabLev2.equals("joinus")) {%> class="on"<% } %>>Join us onsite</a>
                    | <a href=""<% if (tabLev2.equals("onsiteevents")) {%> class="on"<% } %>>Onsite events</a>
                    | <a href=""<% if (tabLev2.equals("sponsors")) {%> class="on"<% } %>>Sponsors</a>
                </p>
            <% } else if (tabLev1.equals("algorithm")) { %>
            <% } else if (tabLev1.equals("component")) { %>
            <% } else if (tabLev1.equals("marathon")) { %>
            <% } else if (tabLev1.equals("studio")) { %>
            <% } %>

<%--------------TERTIARY NAV---------------%>
            <% if (tabLev1.equals("overview")) {%>
                <% if (tabLev2.equals("joinus")) {%>
                    <p id="tertiaryNav">
                        <a href=""<% if (tabLev3.equals("onsiteschedule")) {%> class="on"<% } %>>Onsite schedule</a>
                        | <a href=""<% if (tabLev3.equals("devforums")) {%> class="on"<% } %>>Developer forums</a>
                        | <a href=""<% if (tabLev3.equals("getvisa")) {%> class="on"<% } %>>Getting a visa</a>
                        | <a href=""<% if (tabLev3.equals("transportation")) {%> class="on"<% } %>>Transportation</a>
                        | <a href=""<% if (tabLev3.equals("hotels")) {%> class="on"<% } %>>Hotels</a>
                        | <a href=""<% if (tabLev3.equals("whattodo")) {%> class="on"<% } %>>What to do</a>
                    </p>
                <% } else if (tabLev2.equals("onsiteevents")) { %>
                <% } %>
            <% } else if (tabLev1.equals("algorithm")) { %>
            <% } else if (tabLev1.equals("component")) { %>
            <% } else if (tabLev1.equals("marathon")) { %>
            <% } else if (tabLev1.equals("studio")) { %>
            <% } %>
            </div>
            
            <div style="position:absolute; top:375px; right:30px;">
                <img src="/i/tournament/tccc07/stylebar.png" alt="stylebar" />
            </div>
        </div>

    </div>
    
    <div style="position:absolute; top:400px; right:7%;">
        <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        <div id="sponsors">
            <jsp:include page="sponsors.jsp" />
        </div>
    </div>

</div>