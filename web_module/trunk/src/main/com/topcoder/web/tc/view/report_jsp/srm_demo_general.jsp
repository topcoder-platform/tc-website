<jsp:include page="css.jsp" />
<jsp:include page="../script.jsp" />
<html>
  <head>
    <script language="JavaScript">
  <!--
    function goTo(selection){
      sel = selection.options[selection.selectedIndex].value;
      if (sel && sel != '#'){
        window.location=sel;
      }
    }
  // -->
  </script> 
    <title>TopCoder SRM Reports</title>
  </head>
  <body>
<table>
  <tr valign="top">
    <td width="10%"><jsp:include page="srm_nav.jsp" /></td>
    <td>
	  <table>
        <tr>
		  <td colspan=2><jsp:include page="srm_info.jsp" /></td>
		</tr>
        <tr>
          <td colspan=2><jsp:include page="srm_chooser.jsp" ><jsp:param name="link" value="srm_demo_general"/></jsp:include></td>
        </tr>
        <tr valign="top">
		  <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_part_by_country.jsp" /></td>
		  <td rowspan=6>&nbsp;</td>
          <td rowspan=6><jsp:include page="srm_demo_total_part.jsp" /></td>
		</tr>
		<tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_last_match.jsp" /></td>
	    </tr>
        <tr valign="top">
          <td>&nbsp;</td>
          <td>New Participation Aging (days between registration and this match for new participants)</td>
	    </tr>
		<tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_new_part_aging_stud.jsp" /></td>
	    </tr>
		<tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_new_part_aging_pro.jsp" /></td>
	    </tr>
	   	<tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_new_part_aging_all.jsp" /></td>
	    </tr>


      </table>
    </td>
  </tr>
</table>
 



  </body>
</html>
