package com.topcoder.web.ep.controller.request.student.ajax;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.Constants;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 *          
 */
public class SchoolSearch extends LongBase {
    protected void dbProcessing() throws Exception {

        String schoolName = getTrimmedParameter(Constants.SCHOOL_NAME);
        if (schoolName == null) {
            addError(Constants.SCHOOL_NAME, "Please enter some criteria to search on.");
        } else if (StringUtils.containsOnly(schoolName, "*", true)) {
            addError(Constants.SCHOOL_NAME, "Please enter some criteria to search on.");
        } else {
            String s = StringUtils.replace(schoolName, "*", "%");
            if (!s.startsWith("%")) {
                s = "%"+s;
            }
            if (!s.endsWith("%")) {
                s=s+"%";
            }
            getRequest().setAttribute("results",
                    getFactory().getSchoolDAO().searchByName(s, Constants.MAX_SCHOOL_RESULTS));
            setDefault(Constants.SCHOOL_NAME, schoolName);
        }
        setNextPage("/student/ajax/searchSchool.jsp");
        setIsNextPageInContext(true);

    }
}