package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class MajorSelect
        extends Select {
    String getOptionValue(Object o) {
        return o.toString();
    }

    String getOptionText(Object o) {
        return o.toString();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList majors = new ArrayList();
        majors.add("CS");
        majors.add("MIS");
        majors.add("EE");
        majors.add("GED");
        return majors;
    }
}
