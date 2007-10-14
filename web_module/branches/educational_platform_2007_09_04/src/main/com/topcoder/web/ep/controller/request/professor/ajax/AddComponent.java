package com.topcoder.web.ep.controller.request.professor.ajax;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 *          
 */
public class AddComponent extends LongBase {
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ea_";

        Long componentId = getComponentParam();;
        if (componentId == null) {
            addError("actionError", "Invalid problem selected for addition");
        }

        log.debug("Trying to add problem: " + componentId);
        
        AssignmentDTO adto = getAssignment();
        
        if (adto.getComponents().contains(new ComponentDTO(componentId))) {
            addError("actionError", "Problem already added");
        }

        Component cm = DAOUtil.getFactory().getComponentDAO().find(componentId);

//        if (!cm.getAdmitAssignment()) {
//            addError("actionError", "This problem cannot be added");
//        }
        
        if (!hasErrors()) {
    
            adto.addComponent(new ComponentDTO(
                    componentId,
                    cm.getProblem().getProposedDifficulty().getPointValue(),
                    cm.getProblem().getName()));
        }
        
        setNextPage("/professor/ajax/addComponents.jsp");
        setIsNextPageInContext(true);

    }
    
    private Long getComponentParam() throws TCWebException {
        String componentId = StringUtils.checkNull(getRequest().getParameter(Constants.COMPONENT_ID));
        
        if (componentId.equals("")) {
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