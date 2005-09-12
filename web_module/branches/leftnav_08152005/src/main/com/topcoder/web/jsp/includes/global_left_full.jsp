<%@  page
  language="java"
  errorPage="../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          java.text.SimpleDateFormat,
          java.util.HashMap,
          java.util.Iterator,
          com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.model.CoderSessionInfo,
          com.topcoder.web.common.BaseServlet"
%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%
    String L1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String L2 = request.getParameter("level2")==null?"":request.getParameter("level2");
    String L3 = request.getParameter("level3")==null?"":request.getParameter("level3");
    String L4 = request.getParameter("level4")==null?"":request.getParameter("level4");
    CoderSessionInfo info = (CoderSessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    //bleh, gott do this for registration cuz it does a redirect to a jsp
    if (info==null) info = new Navigation(request, response).getSessionInfo();
%>

<script language="javascript" type="text/javascript">
<!--
function toggleClamShellMenu(objectID){
   var object = document.getElementById(objectID);
   if(object.style.display == 'block') object.style.display = 'none';
   else if(object.className == 'OPEN' && object.style.display != 'none') object.style.display = 'none';
   else object.style.display = 'block';
   return;
}
// -->
</script>

<div id="navbar">
<ul>
<li><a href="javascript:toggleClamShellMenu('m_competitors')" class="exp">Competitions</a>
   <ul id="m_competitors" <% if (L1.equals("competitors")) { %>class="OPEN"<% } %>>
   <li><a href="">Home</a></li>
   <li><a href="javascript:toggleClamShellMenu('m_my_tc')" class="exp">My TopCoder</a>
      <ul id="m_my_tc" <% if (L2.equals("my_tc")) { %>class="OPEN"<% } %>>
      <li><a href="">Update My Profile</a></li>
      <li><a href="">Members I've Referred</a></li>
      <li><a href="">Affidavits</a></li>
      <li><a href="">Card/Badges</a></li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_alg_comp')" class="exp">Algorithm Competitions</a>
      <ul id="m_alg_comp" <% if (L2.equals("alg_comp")) { %>class="OPEN"<% } %>>
      <li><a href="">Launch Arena Applet</a></li>
      <li><a href="">Calendar</a></li>
      <li><a href="javascript:toggleClamShellMenu('m_alg_stats')" class="exp">Statistics</a>
         <ul id="m_alg_stats" <% if (L3.equals("alg_stats")) { %>class="OPEN"<% } %>>
         <li><a href="">Match Results</a></li>
         <li><a href="">Match Editorials</a></li>
         <li><a href="">Problem Archive</a></li>
         <li><a href="">Achievements</a></li>
         </ul>
      </li>
      <li><a href="javascript:toggleClamShellMenu('m_alg_support')" class="exp">Support/FAQs</a>
         <ul id="m_alg_support" <% if (L3.equals("alg_support")) { %>class="OPEN"<% } %>>
         <li><a href="">Competition Guide</a></li>
         <li><a href="">FAQs</a></li>
         <li><a href="">Sample Problem Statements</a></li>
         <li><a href="">Rating System</a></li>
         <li><a href="">Forms W-9 & W-8BEN</a></li>
         <li><a href="">Charity Donations</a></li>
         </ul>
      </li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_comp_comp')" class="exp">Component Competitions</a>
      <ul id="m_comp_comp" <% if (L2.equals("comp_comp")) { %>class="OPEN"<% } %>>
      <li><a href="">Design/Develop Components</a></li>
      <li><a href="">Review Competitors' Submissions</a></li>
      <li><a href="javascript:toggleClamShellMenu('m_comp_stats')" class="exp">Statistics</a>
         <ul id="m_comp_stats" <% if (L3.equals("comp_stats")) { %>class="OPEN"<% } %>>
         <li><a href="">Contest List</a></li>
         <li><a href="">Achievements</a></li>
         </ul>
      </li>
      <li><a href="">Meet the Review Boards</a></li>
      <li><a href="">Development Methodology</a></li>
      <li><a href="javascript:toggleClamShellMenu('m_comp_support')" class="exp">Support/FAQs</a>
         <ul id="m_comp_support" <% if (L3.equals("comp_support")) { %>class="OPEN"<% } %>>
         <li><a href="">Getting Started</a></li>
         <li><a href="">Component Help Docs</a></li>
         <li><a href="">Rating System</a></li>
         <li><a href="">Reliability Rating System</a></li>
         <li><a href="">How to Get Paid</a></li>
         </ul>
      </li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_emp_opps')" class="exp">Employment Opportunities</a>
      <ul id="m_emp_opps" <% if (L2.equals("emp_opps")) { %>class="OPEN"<% } %>>
      <li><a href="">Job Openings</a></li>
      <li><a href="">Registration</a></li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_education')" class="exp">Educational Content</a>
      <ul id="m_education" <% if (L2.equals("education")) { %>class="OPEN"<% } %>>
      <li><a href="">Algorithm Tutorials</a></li>
      <li><a href="">Component Tutorials</a></li>
      <li><a href="">Features</a></li>
      <li><a href="">Tutor Transcripts</a></li>
      </ul>
   </li>
   <li><a href="">Coder of the Month</a></li>
   <li><a href="">Member Surveys</a></li>
   <li><a href="javascript:toggleClamShellMenu('m_events')" class="exp">Events</a>
      <ul id="m_events" <% if (L2.equals("events")) { %>class="OPEN"<% } %>>
      <li><a href="">TopCoder Events</a></li>
      <li><a href="">Private Label</a></li>
      <li><a href="">Charity</a></li>
      </ul>
   </ul>
</li>
<li><a href="javascript:toggleClamShellMenu('m_corp_services')" class="exp">Corporate Services</a>
   <ul id="m_corp_services" <% if (L1.equals("forums")) { %>class="OPEN"<% } %>>
   <li><a href="javascript:toggleClamShellMenu('m_software')" class="exp">Software</a>
      <ul id="m_software" <% if (L2.equals("software")) { %>class="OPEN"<% } %>>
      <li><a href="javascript:toggleClamShellMenu('m_components')" class="exp">Components</a>
         <ul id="m_components" <% if (L3.equals("components")) { %>class="OPEN"<% } %>>
         <li><a href="">What Are Software Components?</a></li>
         <li><a href="">Methodology</a></li>
         <li><a href="">Find Components</a></li>
         <li><a href="">Purchase Components</a></li>
         <li><a href="">Suggest a Component</a></li>
         </ul>
      </li>
      <li><a href="javascript:toggleClamShellMenu('m_applications')" class="exp">Applications</a>
         <ul id="m_applications" <% if (L3.equals("applications")) { %>class="OPEN"<% } %>>
         <li><a href="">Overview</a></li>
         <li><a href="">Methodology</a></li>
         </ul>
      </li>
      <li><a href="">Current Customers</a></li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_emp_services')" class="exp">Employment Services</a>
      <ul id="m_emp_services" <% if (L2.equals("emp_services")) { %>class="OPEN"<% } %>>
      <li><a href="">Event Sponsorship</a></li>
      <li><a href="javascript:toggleClamShellMenu('m_sourcing')" class="exp">Sourcing</a>
         <ul id="m_sourcing" <% if (L3.equals("sourcing")) { %>class="OPEN"<% } %>>
         <li><a href="">Overview</a></li>
         <li><a href="">Reports</a></li>
         </ul>
      </li>
      <li><a href="javascript:toggleClamShellMenu('m_skills_ass')" class="exp">Skills Assessment</a>
         <ul id="m_skills_ass" <% if (L3.equals("skills_ass")) { %>class="OPEN"<% } %>>
         <li><a href="">Process</a></li>
         <li><a href="">Attributes</a></li>
         <li><a href="">Demo</a></li>
         <li><a href="">Launch Technical Assessment</a></li>
         </ul>
      </li>
      <li><a href="">Placement</a></li>
      </ul>
   </li>
   <li><a href="javascript:toggleClamShellMenu('m_mark_services')" class="exp">Marketing Services</a>
      <ul id="m_mark_services" <% if (L2.equals("mark_services")) { %>class="OPEN"<% } %>>
      <li><a href="javascript:toggleClamShellMenu('m_tournaments')" class="exp">Tournaments</a>
         <ul id="m_tournaments" <% if (L3.equals("sourcing")) { %>class="OPEN"<% } %>>
         <li><a href="">Overview</a></li>
         <li><a href="">Reports</a></li>
         </ul>
      </li>
      </ul>
   </li>
   </ul>
</li>
<li><a href="javascript:toggleClamShellMenu('m_forums')" class="exp">Forums</a>
   <ul id="m_forums" <% if (L1.equals("forums")) { %>class="OPEN"<% } %>>
   <li><a href="">Round Tables</a></li>
   <li><a href="">News Discussions</a></li>
   <li><a href="">Sponsor Discussions</a></li>
   </ul>
</li>
<li><a href="">Press Room</a></li>
<li><a href="">Contact Us</a></li>
<li><a href="javascript:toggleClamShellMenu('m_about_tc')" class="exp">About TopCoder</a>
   <ul id="m_about_tc" <% if (L1.equals("about_tc")) { %>class="OPEN"<% } %>>
   <li><a href="">Overview</a></li>
   <li><a href="">Why Join TopCoder?</a></li>
   <li><a href="">Working at TopCoder</a></li>
   <li><a href="">Terms</a></li>
   <li><a href="">Privacy Policy</a></li>
   <li><a href="">Management Team</a></li>
   </ul>
</li>
<li><a href="javascript:toggleClamShellMenu('m_statistics')">Member Search</a></li>
</ul>
</div>
<br><br>