package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class MajorSelect
    extends Select  
{
    String getOptionValue(Object o)
    {
        return o.toString();
    } 

    String getOptionText(Object o)
    {
        return o.toString();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList majors = new ArrayList();
        majors.add("CS");
        majors.add("MIS");
        majors.add("EE");
        majors.add("GED");
        return majors;
    }
}
