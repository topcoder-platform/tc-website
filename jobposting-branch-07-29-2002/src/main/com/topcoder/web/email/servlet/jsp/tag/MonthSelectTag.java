package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

/**
 * Custom tag to display a combobox containing
 * the twelve months of the year.
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class MonthSelectTag
	extends Select
{
	ArrayList months;

	public MonthSelectTag()
	{
		months = new ArrayList(Arrays.asList(DateTagUtilities.monthArray));	
	}

	String getOptionValue(Object o)
	{
		return String.valueOf(months.indexOf(o));
	}

	String getOptionText(Object o)
	{
		return String.valueOf(o);
	}

	ArrayList getSelectOptions()
		throws JspException
	{
		return months;
	}
}