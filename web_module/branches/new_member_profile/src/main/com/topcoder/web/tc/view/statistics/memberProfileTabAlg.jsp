
<% ResultSetContainer rscAlgData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Alg_Data"); %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" rowspan="3">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="2">Algorithm Competitions</td></tr>
            <tr><td class="ratingBox" colspan="2">Rating:<br>
            <%if(rscAlgData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscAlgData.getIntItem(0, "rating")%>'><rsc:item name="rating" set="<%=rscAlgData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="tableCatNW" colspan="2"><A href="/history">[rating history]</A><br><br></td></tr>
            <tr><td class="tableCatNW">Ranking:</td><td class="tableStatRNW">not ranked</td></tr>
            <tr><td class="tableCatNW">Volatility:</td><td class="tableStatRNW">391</td></tr>
            <tr><td class="tableCatNW">Maximum Rating:</td><td class="tableStatRNW">1580</td></tr>
            <tr><td class="tableCatNW">Minimum Rating:</td><td class="tableStatRNW">713</td></tr>
            <tr><td class="tableCatNW">Default Language:</td><td class="tableStatRNW">Java</td></tr>
            <tr><td class="tableCatNW">Competitions:</td><td class="tableStatRNW">29</td></tr>
            <tr><td class="tableCatNW">Most Recent Event:</td><td class="tableStatRNW">SRM 240<br>04.30.05</td></tr>
            <tr><td class="tableCatNW">Earnings:</td><td class="tableStatRNW">$0.00</td></tr>
            <tr><td class="tableCatNW" colspan="2"><A href="/history">[earnings history]</A></td></tr>
         </table>
      </td>
      <td width="75%" valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Division I Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%">Submitted</td>
               <td class="tableHeader" align="right" width="25%">Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%">Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level One</td>
               <td class="tableStatR">23</td>
               <td class="tableStatR">4</td>
               <td class="tableStatR">1</td>
               <td class="tableStatR">78.26%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Two</td>
               <td class="tableStatR">15</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">8</td>
               <td class="tableStatR">33.33%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Three</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0.00%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR">40</td>
               <td class="tableStatR">6</td>
               <td class="tableStatR">11</td>
               <td class="tableStatR">57.50%</td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Division II Submissions</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="25%"># Failed Challenge</td>
               <td class="tableHeader" align="right" width="25%"># Failed Sys. Test</td>
               <td class="tableHeader" align="right" width="25%"># Submitted</td>
               <td class="tableHeader" align="right" width="25%">Success %</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level One</td>
               <td class="tableStatR">4</td>
               <td class="tableStatR">1</td>
               <td class="tableStatR">23</td>
               <td class="tableStatR">78.26%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Two</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">8</td>
               <td class="tableStatR">15</td>
               <td class="tableStatR">33.33%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Three</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0.00%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR">6</td>
               <td class="tableStatR">11</td>
               <td class="tableStatR">40</td>
               <td class="tableStatR">57.50%</td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="5">Challenges</td></tr>
            <tr>
               <td class="tableHeader">Problem</td>
               <td class="tableHeader" align="right" width="33%"># Failed Challenges</td>
               <td class="tableHeader" align="right" width="33%"># Challenges</td>
               <td class="tableHeader" align="right" width="33%">Success %  	</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level One</td>
               <td class="tableStatR">4</td>
               <td class="tableStatR">1</td>
               <td class="tableStatR">78.26%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Two</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">8</td>
               <td class="tableStatR">33.33%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Level Three</td>
               <td class="tableStatR">0</td>
               <td class="tableStatR">2</td>
               <td class="tableStatR">0.00%</td>
            </tr>
            <tr>
               <td class="tableCat" nowrap="nowrap">Total</td>
               <td class="tableStatR">6</td>
               <td class="tableStatR">11</td>
               <td class="tableStatR">57.50%</td>
            </tr>
         </table>
      </td>
   </tr>
</table>