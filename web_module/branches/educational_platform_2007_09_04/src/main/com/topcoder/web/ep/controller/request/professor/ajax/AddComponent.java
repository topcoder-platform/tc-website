package com.topcoder.web.ep.controller.request.professor.ajax;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

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

        log.debug("Trying to add component: " + componentId);
        
        AssignmentDTO adto = getAssignment();
        
        if (adto.getComponents().contains(new ComponentDTO(componentId))) {
            addError("actionError", "Component already added");
        }

        // TODO: check if we can add this component (problem_set_component_xref)

        if (!hasErrors()) {
            Component cm = DAOUtil.getFactory().getComponentDAO().find(componentId);
    
            adto.addComponent(new ComponentDTO(
                    componentId,
                    null,
                    cm.getProblem().getName()));
        }
        
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