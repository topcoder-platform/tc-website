    <div id="leftContainer">
    <!-- #leftContainer -->
    
   	    <div id="tchsLogo">
          <a href="#"><img src="<%= request.getContextPath() %>/i/tchs09/tchs-logo.png" alt="TopCoder High School 2009" /></a></div>
          
          <div id="mainNav">
          <!-- #mainNav -->
          	<%
          		String overview = "module=Static&d1=tchs09&d2=index";
          		String schedule = "module=Static&d1=tchs09&d2=pages&d3=online_schedule";
          		String rules = "module=Static&d1=tchs09&d2=pages&d3=rules";
          		String purdue = "module=Static&d1=tchs09&d2=pages&d3=purdue";
				String results ="module=Static&d1=tchs09&d2=pages&d3=results";
          		String queryString = request.getQueryString(); 
          	%>
			<ul>
				<li <% if (overview.equals(queryString)) { out.println("class=\"selected\""); } %>>
			    	<a href="/tc?<% out.println(overview); %>" title="Overview">Overview</a>
			    </li>
				<li <% if (schedule.equals(queryString)) { out.println("class=\"selected\""); } %>>
					<a href="/tc?<% out.println(schedule); %>" title="Online Schedule">Online Schedule</a>
				</li>
                <li <% if (rules.equals(queryString)) { out.println("class=\"selected\""); } %>>
                	<a href="/tc?<% out.println(rules); %>" title="Rules">Rules</a>
                </li>
				<li <% if (results.equals(queryString)) { out.println("class=\"selected\""); } %>>
                <a href="/tc?<% out.println(results); %>" title="Results">Results</a></li>
                
                <li <% if (purdue.equals(queryString)) { out.println("class=\"selected\""); } %>>
                	<a href="/tc?<% out.println(purdue); %>" title="Purdue">Purdue</a>
                </li>
				<li><a href="javascript:arena();" title="Launch Arena">Launch Arena</a></li>
			</ul>
            <!-- End #mainNav -->
	  </div>
        
          <div id="sponsors">
          <!-- #sponsors -->
			<ul>
				<li><a href="/tc?<% out.println(purdue); %>"><img src="<%= request.getContextPath() %>/i/tchs09/purdue-logo.png" alt="PURDUE LOGO" /></a></li>
			</ul>
            <!-- End #sponsors -->
		</div>
          
    <!-- End #leftContainer -->
    </div>