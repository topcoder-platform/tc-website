<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2013 --------</option>
   <option value="dec_13"<% if (currMonth.equals("dec_13")) { %> selected<% } %>>December</option>
   <option value="thisMonth">-------- 2014 --------</option>
   <option value="jan_14"<% if (currMonth.equals("jan_14")) { %> selected<% } %>>January</option>
   <option value="feb_14"<% if (currMonth.equals("feb_14")) { %> selected<% } %>>February</option>
   <option value="mar_14"<% if (currMonth.equals("mar_14")) { %> selected<% } %>>March</option>
   <option value="apr_14"<% if (currMonth.equals("apr_14")) { %> selected<% } %>>April</option>
   <option value="may_14"<% if (currMonth.equals("may_14")) { %> selected<% } %>>May</option>
   <option value="jun_14"<% if (currMonth.equals("jun_14")) { %> selected<% } %>>June</option>


  
</select></form>
