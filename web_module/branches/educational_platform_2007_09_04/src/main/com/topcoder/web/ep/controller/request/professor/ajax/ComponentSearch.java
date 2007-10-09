package com.topcoder.web.ep.controller.request.professor.ajax;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.Constants;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 *          
 */
public class ComponentSearch extends LongBase {
    protected void dbProcessing() throws Exception {

        String componentName = getTrimmedParameter(Constants.COMPONENT_NAME);
        if (componentName == null) {
            addError(Constants.COMPONENT_NAME, "Please enter some criteria to search on.");
        } else if (StringUtils.containsOnly(componentName, "*", true)) {
            addError(Constants.COMPONENT_NAME, "Please enter some criteria to search on.");
        } else {
            String s = StringUtils.replace(componentName, "*", "%");
            if (!s.startsWith("%")) {
                s = "%"+s;
            }
            if (!s.endsWith("%")) {
                s=s+"%";
            }
            getRequest().setAttribute("results",
                    getFactory().getComponentDAO().searchAssignmentProblemsByProblemName(s, Constants.MAX_COMPONENT_RESULTS));
            setDefault(Constants.COMPONENT_NAME, componentName);
        }
        setNextPage("/professor/ajax/searchComponents.jsp");
        setIsNextPageInContext(true);

    }
}