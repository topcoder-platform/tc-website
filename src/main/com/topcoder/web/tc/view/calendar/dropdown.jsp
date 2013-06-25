<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2013 --------</option>
   <option value="jun_13"<% if (currMonth.equals("jun_13")) { %> selected<% } %>>June</option>
   <option value="jun_13"<% if (currMonth.equals("jul_13")) { %> selected<% } %>>July</option>
   <option value="jun_13"<% if (currMonth.equals("aug_13")) { %> selected<% } %>>August</option>
   <option value="jun_13"<% if (currMonth.equals("sep_13")) { %> selected<% } %>>September</option>
   <option value="jun_13"<% if (currMonth.equals("oct_13")) { %> selected<% } %>>October</option>
   <option value="jun_13"<% if (currMonth.equals("nov_13")) { %> selected<% } %>>November</option>
   <option value="jun_13"<% if (currMonth.equals("dec_13")) { %> selected<% } %>>December</option>

  
</select></form>
