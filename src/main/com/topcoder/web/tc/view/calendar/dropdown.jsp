<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&d1=calendar&d2='+this.options[this.selectedIndex].value">
   <option value="thisMonth">-------- 2006 --------</option>
   <option value="jan_06"<% if (currMonth.equals("jan_06")) { %> selected<% } %>>January</option>
   <option value="feb_06"<% if (currMonth.equals("feb_06")) { %> selected<% } %>>February</option>
   <option value="mar_06"<% if (currMonth.equals("mar_06")) { %> selected<% } %>>March</option>
   <option value="apr_06"<% if (currMonth.equals("apr_06")) { %> selected<% } %>>April</option>
   <option value="may_06"<% if (currMonth.equals("may_06")) { %> selected<% } %>>May</option>
   <option value="jun_06"<% if (currMonth.equals("jun_06")) { %> selected<% } %>>June</option>
   <option value="jul_06"<% if (currMonth.equals("jul_06")) { %> selected<% } %>>July</option>
   <option value="aug_06"<% if (currMonth.equals("aug_06")) { %> selected<% } %>>August</option>
   <option value="sep_06"<% if (currMonth.equals("sep_06")) { %> selected<% } %>>September</option>
   <option value="oct_06"<% if (currMonth.equals("oct_06")) { %> selected<% } %>>October</option>
   <option value="nov_06"<% if (currMonth.equals("nov_06")) { %> selected<% } %>>November</option>
   <option value="dec_06"<% if (currMonth.equals("dec_06")) { %> selected<% } %>>December</option>
   

</select></form>
