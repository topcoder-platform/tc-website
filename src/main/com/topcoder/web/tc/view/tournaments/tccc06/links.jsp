  1 <%
  2     String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
  3     String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
  4     String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
  5 %>
  6 
  7 <map name="L1_tabs">
  8 <area shape="poly" alt="" coords="1,29, 1,1, 178,1, 204,29" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about" />
  9 <area shape="poly" alt="" coords="210,29, 184,1, 356,1, 384,29" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_description" />
 10 <area shape="poly" alt="" coords="392,29, 364,1, 536,1, 564,29" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_description" />
 11 <%--<area shape="poly" alt="" coords="570,29, 542,1, 795,1, 823,29" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description" />--%>
 12 </map>
 13 <%--
 14 <map name="headline">
 15 <area shape="rect" alt="" coords="1,1, 116,20" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos" />
 16 <area shape="rect" alt="" coords="139,1, 250,20" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies" />
 17 <area shape="rect" alt="" coords="273,1, 366,20" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogs&d4=overview" />
 18 </map>
 19 --%>
 20 <table width="100%" border="0" cellpadding="0" cellspacing="0">
 21 <!-- LEVEL 1 TABS -->
 22 <% if (tabLev1.equals("overview")) {%>
 23    <tr>
 24       <td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tccc06_logo_aol.gif" border="0"/></A></td>
 25       <%--<td valign="middle" align="center"><img src="/i/tournament/tccc06/headline_onsite.gif" border="0" alt="" usemap="#headline" /></td>--%>
 26       <td valign="top" align="right" width="50%"><a href="/"><img src="/i/tournament/tccc06/tc_logo.gif" border="0" /></a></td>
 27    </tr>
 28    <tr><td class="topNavBox" colspan="3"><img src="/i/tournament/tccc06/tabs/L1_overviewOn.gif" alt="" border="0" usemap="#L1_tabs"/></td></tr>
 29 <% } else if (tabLev1.equals("algorithm")) { %>
 30    <tr>
 31       <td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tccc06_logo_aol.gif" border="0"/></A></td>
 32       <td valign="middle" align="center"><A href="/tc?module=TCCC06ViewAlgoReg"><img src="/i/tournament/tccc06/bnr_register_now.gif" border="0" alt="" /></A></td>
 33       <td valign="top" align="right" width="50%"><a href="/"><img src="/i/tournament/tccc06/tc_logo.gif" border="0"/></a></td>
 34    </tr>
 35    <tr><td class="topNavBox" colspan="3"><img src="/i/tournament/tccc06/tabs/L1_algOn.gif" alt="" border="0" usemap="#L1_tabs"/></td></tr>
 36 <% } else if (tabLev1.equals("component")) { %>
 37    <tr>
 38       <td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tccc06_logo_aol.gif" border="0"/></A></td>
 39       <td valign="middle" align="center"><A href="/tc?module=TCCC06ComponentTerms"><img src="/i/tournament/tccc06/bnr_register_now.gif" border="0" alt="" /></A></td>
 40       <td valign="top" align="right" width="50%"><a href="/"><img src="/i/tournament/tccc06/tc_logo.gif" border="0"/></a></td>
 41    </tr>
 42    <tr><td class="topNavBox" colspan="3"><img src="/i/tournament/tccc06/tabs/L1_compOn.gif" alt="" border="0" usemap="#L1_tabs"/></td></tr>
 43 <% } else if (tabLev1.equals("ccip")) { %>
 44    <tr>
 45       <td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tccc06_logo_aol.gif" border="0"/></A></td>
 46       <%--<td valign="middle" align="center"><img src="/i/tournament/tccc06/headline_onsite.gif" border="0" alt="" usemap="#headline" /></td>--%>
 47       <td valign="top" align="right" width="50%"><a href="/"><img src="/i/tournament/tccc06/tc_logo.gif" border="0"/></a></td>
 48    </tr>
 49    <%--<tr><td class="topNavBox" colspan="3"><img src="/i/tournament/tccc06/tabs/L1_ccipOn.gif" alt="" border="0" usemap="#L1_tabs"/></td></tr>--%>
 50 <% } %>
 51 
 52 <!-- LEVEL 2 TABS  -->
 53    <tr>
 54       <td colspan="3">
 55       <table border="0" cellspacing="0" cellpadding="0" width="100%">
 56           <tr>
 57               <td class="nav">&#160;&#160;&#160;</td>
 58               <td class=nav align=right><img src="/i/tournament/tccc06/tabs/L2_sideDK.gif" border="0" /></td>
 59 
 60          <% if (tabLev1.equals("overview")) { %>
 61             <% if (tabLev2.equals("details")) {%>
 62                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tabs/L2_detailsOn.gif" alt="" border="0" /></A></td>
 63             <% } else { %>
 64                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/tccc06/tabs/L2_detailsOff.gif" alt="" border="0" /></A></td>
 65             <% } %>
 66             <% if (tabLev2.equals("join_us")) {%>
 67                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=onsite_schedule"><img src="/i/tournament/tccc06/tabs/L2_joinusOn.gif" alt="" border="0" /></A></td>
 68             <% } else { %>
 69                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=onsite_schedule"><img src="/i/tournament/tccc06/tabs/L2_joinusOff.gif" alt="" border="0" /></A></td>
 70             <% } %>
 71             <%--
 72             <% if (tabLev2.equals("onsite_events")) {%>
 73                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos"><img src="/i/tournament/tccc06/tabs/L2_onsiteeventsOn.gif" alt="" border="0" /></A></td>
 74             <% } else { %>
 75                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos"><img src="/i/tournament/tccc06/tabs/L2_onsiteeventsOff.gif" alt="" border="0" /></A></td>
 76             <% } %>
 77             --%>
 78 <%--
 79 --%>
 80             <% if (tabLev2.equals("student_reps")) {%>
 81                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=student_reps"><img src="/i/tournament/tccc06/tabs/L2_studentRepsOn.gif" alt="" border="0" /></A></td>
 82             <% } else { %>
 83                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=student_reps"><img src="/i/tournament/tccc06/tabs/L2_studentRepsOff.gif" alt="" border="0" /></A></td>
 84             <% } %>
 85             <% if (tabLev2.equals("sponsors")) {%>
 86                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol"><img src="/i/tournament/tccc06/tabs/L2_sponsorsOn.gif" alt="" border="0" /></A></td>
 87             <% } else { %>
 88                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol"><img src="/i/tournament/tccc06/tabs/L2_sponsorsOff.gif" alt="" border="0" /></A></td>
 89             <% } %>
 90             <% if (tabLev2.equals("eventPatrons")) {%>
 91                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa"><img src="/i/tournament/tccc06/tabs/L2_eventpatronsOn.gif" alt="" border="0" /></A></td>
 92             <% } else { %>
 93                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa"><img src="/i/tournament/tccc06/tabs/L2_eventpatronsOff.gif" alt="" border="0" /></A></td>
 94             <% } %>
 95          <% } else if (tabLev1.equals("algorithm")) { %>
 96             <% if (tabLev2.equals("details")) {%>
 97                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOn.gif" alt="" border="0" /></A></td>
 98             <% } else { %>
 99                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOff.gif" alt="" border="0" /></A></td>
100             <% } %>
102             <% if (tabLev2.equals("registrants")) {%>
103                <td class="nav"><A href="/tc?module=TCCC06AlgRegistrants"><img src="/i/tournament/tccc06/tabs/L2_registrantsOn.gif" alt="" border="0" /></A></td>
104             <% } else { %>
105                <td class="nav"><A href="/tc?module=TCCC06AlgRegistrants"><img src="/i/tournament/tccc06/tabs/L2_registrantsOff.gif" alt="" border="0" /></A></td>
106             <% } %>
101             <%--
107             <% if (tabLev2.equals("advancers")) {%>
108                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_bracket"><img src="/i/tournament/tccc06/tabs/L2_advancersOn.gif" alt="" border="0" /></A></td>
109             <% } else { %>
110                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_bracket"><img src="/i/tournament/tccc06/tabs/L2_advancersOff.gif" alt="" border="0" /></A></td>
111             <% } %>
112             <% if (tabLev2.equals("summary")) {%>
113                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_finals_analysis"><img src="/i/tournament/tccc06/tabs/L2_summaryOn.gif" alt="" border="0" /></A></td>
114             <% } else { %>
115                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_finals_analysis"><img src="/i/tournament/tccc06/tabs/L2_summaryOff.gif" alt="" border="0" /></A></td>
116             <% } %>
117             --%>
118          <% } else if (tabLev1.equals("component")) { %>
119             <% if (tabLev2.equals("details")) {%>
120                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOn.gif" alt="" border="0" /></A></td>
121             <% } else { %>
122                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOff.gif" alt="" border="0" /></A></td>
123             <% } %>
124 <%--
125             <% if (tabLev2.equals("registrants")) {%>
126                <td class="nav"><A href="/tc?module=TCCC06CompRegistrants"><img src="/i/tournament/tccc06/tabs/L2_registrantsOn.gif" alt="" border="0" /></A></td>
127             <% } else { %>
128                <td class="nav"><A href="/tc?module=TCCC06CompRegistrants"><img src="/i/tournament/tccc06/tabs/L2_registrantsOff.gif" alt="" border="0" /></A></td>
129             <% } %>
130 --%>            
131             <%--
132             <% if (tabLev2.equals("design")) {%>
133                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_bracket"><img src="/i/tournament/tccc06/tabs/L2_designOn.gif" alt="" border="0" /></A></td>
134             <% } else { %>
135                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_bracket"><img src="/i/tournament/tccc06/tabs/L2_designOff.gif" alt="" border="0" /></A></td>
136             <% } %>
137             <% if (tabLev2.equals("development")) {%>
138                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_bracket"><img src="/i/tournament/tccc06/tabs/L2_developmentOn.gif" alt="" border="0" /></A></td>
139             <% } else { %>
140                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_bracket"><img src="/i/tournament/tccc06/tabs/L2_developmentOff.gif" alt="" border="0" /></A></td>
141             <% } %>
142          <% } else if (tabLev1.equals("ccip")) { %>
143             <% if (tabLev2.equals("details")) {%>
144                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOn.gif" alt="" border="0" /></A></td>
145             <% } else { %>
146                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description"><img src="/i/tournament/tccc06/tabs/L2_detailsOff.gif" alt="" border="0" /></A></td>
147             <% } %>
148             <% if (tabLev2.equals("results")) {%>
149                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_results"><img src="/i/tournament/tccc06/tabs/L2_resultsOn.gif" alt="" border="0" /></A></td>
150             <% } else { %>
151                <td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_results"><img src="/i/tournament/tccc06/tabs/L2_resultsOff.gif" alt="" border="0" /></A></td>
152             <% } %>
153             --%>
154 
155          <% } %>
156               <td class=nav align=left><img src="/i/tournament/tccc06/tabs/L2_sideLT.gif" border="0" /></td>
157               <td class=nav width="100%">&#160;</td>
158          </tr>
159       </table>
160       </td>
161    </tr>
162 
163 <!-- LEVEL 3 TABS -->
164    <tr><td class=tabL3Top colspan=3><img src="/i/clear.gif" width=1 height=7 border="0"/></td></tr>
165    <tr>
166       <td colspan=3>
167       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="subNav">
168          <tr>
169             <td class="subNavBG">&#160;&#160;&#160;</td>
170             <% if (tabLev1.equals("overview")) { %>
171                <% if (tabLev2.equals("join_us")) {%>
172                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=onsite_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc06/tabs/L3_scheduleOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_scheduleOff.gif" border="0" /><% } %></a></td>
173                   <%--
174                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=dev_forums"><% if (tabLev3.equals("dev_forums")) {%><img src="/i/tournament/tccc06/tabs/L3_devforumsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_devforumsOff.gif" border="0" /><% } %></a></td>
175                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=pickme_contest"><% if (tabLev3.equals("pickme")) {%><img src="/i/tournament/tccc06/tabs/L3_pickmeOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_pickmeOff.gif" border="0" /><% } %></a></td>
176                   --%>
177                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=transportation"><% if (tabLev3.equals("transportation")) {%><img src="/i/tournament/tccc06/tabs/L3_transportationOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_transportationOff.gif" border="0" /><% } %></a></td>
178                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=hotels"><% if (tabLev3.equals("hotels")) {%><img src="/i/tournament/tccc06/tabs/L3_hotelsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_hotelsOff.gif" border="0" /><% } %></a></td>
179                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=what_to_do"><% if (tabLev3.equals("to_do")) {%><img src="/i/tournament/tccc06/tabs/L3_whatToDoOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_whatToDoOff.gif" border="0" /><% } %></a></td>
180                <%--
181                <% } else if (tabLev2.equals("onsite_events")) {%>
182                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos"><% if (tabLev3.equals("photos")) {%><img src="/i/tournament/tccc06/tabs/L3_photosOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_photosOff.gif" border="0" /><% } %></a></td>
183                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies"><% if (tabLev3.equals("movies")) {%><img src="/i/tournament/tccc06/tabs/L3_moviesOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_moviesOff.gif" border="0" /><% } %></a></td>
184                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogger_winners"><% if (tabLev3.equals("blogs")) {%><img src="/i/tournament/tccc06/tabs/L3_blogsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_blogsOff.gif" border="0" /><% } %></a></td>
185                --%>
186                <% } else if (tabLev2.equals("student_reps")) {%>
187                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=student_reps"><% if (tabLev3.equals("details")) {%><img src="/i/tournament/tccc06/tabs/L3_detailsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_detailsOff.gif" border="0" /><% } %></a></td>
188                   <td class="subnav"><a href="/tc?module=TCCC06StudentReps"><% if (tabLev3.equals("results")) {%><img src="/i/tournament/tccc06/tabs/L3_resultsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_resultsOff.gif" border="0" /><% } %></a></td>
189                <% } else if (tabLev2.equals("sponsors")) {%>
190                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol"><% if (tabLev3.equals("aol")) {%><img src="/i/tournament/tccc06/tabs/L3_aolOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_aolOff.gif" border="0" /><% } %></a></td>
191                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg"><% if (tabLev3.equals("bloomberg")) {%><img src="/i/tournament/tccc06/tabs/L3_bloombergOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_bloombergOff.gif" border="0" /><% } %></a></td>
192                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ubs"><% if (tabLev3.equals("ubs")) {%><img src="/i/tournament/tccc06/tabs/L3_ubsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_ubsOff.gif" border="0" /><% } %></a></td>
193                <% } else if (tabLev2.equals("eventPatrons")) {%>
194                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa"><% if (tabLev3.equals("nsa")) {%><img src="/i/tournament/tccc06/tabs/L3_nsaOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_nsaOff.gif" border="0" /><% } %></a></td>
195                <% } else {%>
196                   <td class="subNavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
197 
198                <% } %>
199             <% } else if (tabLev1.equals("algorithm")) { %>
200                <% if (tabLev2.equals("details")) {%>
201                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc06/tabs/L3_descriptionOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_descriptionOff.gif" border="0" /><% } %></a></td>
202                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc06/tabs/L3_scheduleOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_scheduleOff.gif" border="0" /><% } %></a></td>
203                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tccc06/tabs/L3_rulesOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_rulesOff.gif" border="0" /><% } %></a></td>
204                <% } else if (tabLev2.equals("registrants")) {%>
205                   <td class="subNavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
206 
207                <%--
208                <% } else if (tabLev2.equals("advancers")) {%>
209                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_qualification"><% if (tabLev3.equals("qualification")) {%><img src="/i/tournament/tccc06/tabs/L3_qualificationOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_qualificationOff.gif" border="0" /><% } %></a></td>
210                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_adv_overview"><% if (tabLev3.equals("overview")) {%><img src="/i/tournament/tccc06/tabs/L3_overviewOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_overviewOff.gif" border="0" /><% } %></a></td>
211                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc06/tabs/L3_bracketOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_bracketOff.gif" border="0" /><% } %></a></td>
212                --%>   
213 
214 <%--
215                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=odds_semi" target="_blank"><% if (tabLev3.equals("odds")) {%><img src="/i/tournament/tccc06/tabs/L3_oddsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_oddsOff.gif" border="0" /><% } %></a></td>
216 --%>
217                <%--
218                <% } else if (tabLev2.equals("summary")) {%>
219                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sum_onlinerounds"><% if (tabLev3.equals("online")) {%><img src="/i/tournament/tccc06/tabs/L3_onlineroundsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_onlineroundsOff.gif" border="0" /><% } %></a></td>
220                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room1_analysis"><% if (tabLev3.equals("room1")) {%><img src="/i/tournament/tccc06/tabs/L3_room1On.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_room1Off.gif" border="0" /><% } %></a></td>
221                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room2_analysis"><% if (tabLev3.equals("room2")) {%><img src="/i/tournament/tccc06/tabs/L3_room2On.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_room2Off.gif" border="0" /><% } %></a></td>
222                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room3_analysis"><% if (tabLev3.equals("room3")) {%><img src="/i/tournament/tccc06/tabs/L3_room3On.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_room3Off.gif" border="0" /><% } %></a></td>
223                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_wildcard_analysis"><% if (tabLev3.equals("wildcard")) {%><img src="/i/tournament/tccc06/tabs/L3_wildcardOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_wildcardOff.gif" border="0" /><% } %></a></td>
224                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_finals_analysis"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc06/tabs/L3_finalsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_finalsOff.gif" border="0" /><% } %></a></td>
225                --%>   
226 
227                <% } %>
228             <% } else if (tabLev1.equals("component")) { %>
229                <% if (tabLev2.equals("details")) {%>
230                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc06/tabs/L3_descriptionOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_descriptionOff.gif" border="0" /><% } %></a></td>
231                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc06/tabs/L3_scheduleOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_scheduleOff.gif" border="0" /><% } %></a></td>
232                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tccc06/tabs/L3_rulesOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_rulesOff.gif" border="0" /><% } %></a></td>
233                <% } else if (tabLev2.equals("registrants")) {%>
234                   <td class="subNavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
235 
236                <%--
237                <% } else if (tabLev2.equals("design")) {%>
238                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_results"><% if (tabLev3.equals("results")) {%><img src="/i/tournament/tccc06/tabs/L3_resultsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_resultsOff.gif" border="0" /><% } %></a></td>
239                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_finals"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc06/tabs/L3_finalsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_finalsOff.gif" border="0" /><% } %></a></td>
240                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary"><% if (tabLev3.equals("summary")) {%><img src="/i/tournament/tccc06/tabs/L3_summaryOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_summaryOff.gif" border="0" /><% } %></a></td>
241                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc06/tabs/L3_bracketOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_bracketOff.gif" border="0" /><% } %></a></td>
242                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_prizes"><% if (tabLev3.equals("prizes")) {%><img src="/i/tournament/tccc06/tabs/L3_prizeWinnersOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_prizeWinnersOff.gif" border="0" /><% } %></a></td>
243                <% } else if (tabLev2.equals("development")) {%>
244                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_results"><% if (tabLev3.equals("results")) {%><img src="/i/tournament/tccc06/tabs/L3_resultsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_resultsOff.gif" border="0" /><% } %></a></td>
245                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_finals"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc06/tabs/L3_finalsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_finalsOff.gif" border="0" /><% } %></a></td>
246                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary"><% if (tabLev3.equals("summary")) {%><img src="/i/tournament/tccc06/tabs/L3_summaryOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_summaryOff.gif" border="0" /><% } %></a></td>
247                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc06/tabs/L3_bracketOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_bracketOff.gif" border="0" /><% } %></a></td>
248                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_prizes"><% if (tabLev3.equals("prizes")) {%><img src="/i/tournament/tccc06/tabs/L3_prizeWinnersOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_prizeWinnersOff.gif" border="0" /><% } %></a></td>
249                --%>   
250                <% } %>
251             <% } else if (tabLev1.equals("ccip")) { %>
252                <% if (tabLev2.equals("details")) {%>
253                   <td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=ccip_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc06/tabs/L3_descriptionOn.gif" border="0" /><% } else { %><img src="/i/tournament/tccc06/tabs/L3_descriptionOff.gif" border="0" /><% } %></a></td>
254                <% } else {%>
255                   <td class="subNavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
256                <% } %>
257             <% } %>
258             <td class=subNavBG width="100%">&#160;</td>
259          </tr>
260       </table>
261       </td>
262    </tr>
263 <%--
264    <tr><td class=tabL3Bottom colspan=3><img src="/i/clear.gif" width=1 height=7 border="0"/></td></tr>
265 --%>
266 
267 </table>