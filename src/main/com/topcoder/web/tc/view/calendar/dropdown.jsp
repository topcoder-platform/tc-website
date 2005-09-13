<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>

<form>
<select name="month" size="1" class="dropdown" onchange="window.location='/tc?module=Static&d1=calendar&d2='+this.options[this.selectedIndex].value">
   <option value="home" <% if (currMonth.equals("home")) { %>selected<% } %> >-------- 2006 --------</option>
   <option value="aug_05" <% if (currMonth.equals("jan_06")) { %>selected<% } %> >January</option>
   <option value="home" <% if (currMonth.equals("home")) { %>selected<% } %> >-------- 2005 --------</option>
   <option value="dec_05" <% if (currMonth.equals("dec_05")) { %>selected<% } %> >December</option>
   <option value="nov_05" <% if (currMonth.equals("nov_05")) { %>selected<% } %> >November</option>
   <option value="oct_05" <% if (currMonth.equals("oct_05")) { %>selected<% } %> >October</option>
   <option value="sep_05" <% if (currMonth.equals("sep_05")) { %>selected<% } %> >September</option>
   <option value="aug_05" <% if (currMonth.equals("aug_05")) { %>selected<% } %> >August</option>
   <option value="jul_05" <% if (currMonth.equals("jul_05")) { %>selected<% } %> >July</option>
   <option value="jun_05" <% if (currMonth.equals("jun_05")) { %>selected<% } %> >June</option>
   <option value="may_05" <% if (currMonth.equals("may_05")) { %>selected<% } %> >May</option>
   <option value="apr_05" <% if (currMonth.equals("apr_05")) { %>selected<% } %> >April</option>
   <option value="mar_05" <% if (currMonth.equals("mar_05")) { %>selected<% } %> >March</option>
   <option value="feb_05" <% if (currMonth.equals("feb_05")) { %>selected<% } %> >February</option>
</select>
</form>