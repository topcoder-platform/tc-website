<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="nocache.jsp"/>
<html>
<head>
<title>TopCoder Placement Registration</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="..//includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="employmentOpps"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="registration"/>
        </jsp:include>

<!-- Breadcrumb-->
<script language="javascript">
        function goToPage(s)
        {
            document.frmSuccess.module.value = s;
            document.frmSuccess.submit();
        }
    </script>

		<FORM ACTION="/tc" METHOD=POST onSubmit="" name="frmSuccess">
		<input type="hidden" name="module" value="ContractingLanguages"/>
		<input type="hidden" name="previouspage" value="success" />
		</form>
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Registration done</span>
				<br/><br/>
				Thank you for registering!
				<br/><br/>
				We will contact you should an opportunity come up that we feel you are qualified for.
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="success"/>
				</jsp:include>
				</td>
			</tr>
		</table>


        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
