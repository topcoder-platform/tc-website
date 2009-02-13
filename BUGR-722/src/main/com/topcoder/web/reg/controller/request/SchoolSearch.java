package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SchoolType;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision: 55237 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class SchoolSearch extends Base {
    protected void registrationProcessing() throws Exception {

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
            if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                getRequest().setAttribute("results",
                        getFactory().getSchoolDAO().searchByNameAndType(s,
                                getFactory().getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL),
                                Constants.MAX_SCHOOL_RESULTS));
            } else {
                getRequest().setAttribute("results",
                        getFactory().getSchoolDAO().searchByName(s, Constants.MAX_SCHOOL_RESULTS));
            }
            setDefault(Constants.SCHOOL_NAME, schoolName);
        }
        setNextPage("/school.jsp");
        setIsNextPageInContext(true);

    }
}