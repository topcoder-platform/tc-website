package com.topcoder.web.ep.controller.request;

import com.topcoder.web.ep.dto.AssignmentDTO;

public interface ArenaServices {

    public void addNewAssignment(AssignmentDTO adto);

    public void editAssignment(AssignmentDTO adto);

}