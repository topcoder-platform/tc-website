<%--
  - Author: TCSASSEMBLIER
  - Version: 1.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Contains HTML elements and controls for date selector for contest filter.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored ="false"%>
<p>
	<label>${param.label} :</label>
	<select class="select dateSelect">
		<option>Select</option>
		<option value="BEFORE">Before</option>
		<option value="AFTER">After</option>
		<option value="ON">On</option>
		<option value="BETWEEN_DATES">Between</option>
		<option value="BEFORE_CURRENT_DATE">Before Today</option>
		<option value="AFTER_CURRENT_DATE">After Today</option>
	</select>
	<span class="dateContainer"> <span class="date"><input
				type="text" name="firstDate" class="text1 datepicker" readonly="readonly"
				value="MM/ DD/ YYYY" /> </span> <span class="between hide">and <span
			class="date"><input type="text" class="text1 datepicker" readonly="readonly"
					name="secondDate" value="MM/ DD/ YYYY" /> </span> </span> </span>
</p>