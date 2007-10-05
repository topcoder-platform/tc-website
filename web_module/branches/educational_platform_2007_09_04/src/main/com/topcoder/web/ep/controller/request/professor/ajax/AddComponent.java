package com.topcoder.web.ep.controller.request.professor.ajax;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.dto.AssignmentDTO;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 *          
 */
public class AddComponent extends Base {
    protected void dbProcessing() throws Exception {

        Long componentId = getComponentParam();;
        if (componentId == null) {
            addError("actionError", "Invalid component selected for addition");
        }

        AssignmentDTO adto = getAssignment();
        
        if (adto.getComponents().contains(componentId)) {
            addError("actionError", "Component already added");
        }

        // TODO: check if we can add this component (problem_set_component_xref)
        
        adto.addComponent(componentId);

        setNextPage("/professor/ajax/addComponents.jsp");
        setIsNextPageInContext(true);

    }
    
    private Long getComponentParam() throws TCWebException {
        String componentId = StringUtils.checkNull(getRequest().getParameter(Constants.COMPONENT_ID));
        
        if (componentId == "") {
            return null;
        }

        Long id;
        try {
            id = Long.parseLong(componentId);
        } catch (NumberFormatException e) {
            return null;
        }
        
        return id;
    }
}