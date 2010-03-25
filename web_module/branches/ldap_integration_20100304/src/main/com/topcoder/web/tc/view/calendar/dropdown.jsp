<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

   <option value="thisMonth">-------- 2009 --------</option>
   <option value="aug_09"<% if (currMonth.equals("aug_09")) { %> selected<% } %>>August</option>
   <option value="sep_09"<% if (currMonth.equals("sep_09")) { %> selected<% } %>>September</option>
   <option value="oct_09"<% if (currMonth.equals("oct_09")) { %> selected<% } %>>October</option>
   <option value="nov_09"<% if (currMonth.equals("nov_09")) { %> selected<% } %>>November</option>
   <option value="dec_09"<% if (currMonth.equals("dec_09")) { %> selected<% } %>>December</option>
   
   <option value="thisMonth">-------- 2010 --------</option>
   <option value="jan_10"<% if (currMonth.equals("jan_10")) { %> selected<% } %>>January</option>
   <option value="feb_10"<% if (currMonth.equals("feb_10")) { %> selected<% } %>>February</option>
   <option value="mar_10"<% if (currMonth.equals("mar_10")) { %> selected<% } %>>March</option>
   <option value="apr_10"<% if (currMonth.equals("apr_10")) { %> selected<% } %>>April</option>
   <option value="may_10"<% if (currMonth.equals("may_10")) { %> selected<% } %>>May</option>
   <option value="jun_10"<% if (currMonth.equals("jun_10")) { %> selected<% } %>>June</option>
   <option value="jul_10"<% if (currMonth.equals("jul_10")) { %> selected<% } %>>July</option>
   <option value="aug_10"<% if (currMonth.equals("aug_10")) { %> selected<% } %>>August</option>
   <option value="sep_10"<% if (currMonth.equals("sep_10")) { %> selected<% } %>>September</option>
   <option value="oct_10"<% if (currMonth.equals("oct_10")) { %> selected<% } %>>October</option>
   <option value="nov_10"<% if (currMonth.equals("nov_10")) { %> selected<% } %>>November</option>
   <option value="dec_10"<% if (currMonth.equals("dec_10")) { %> selected<% } %>>December</option>
  
</select></form>
