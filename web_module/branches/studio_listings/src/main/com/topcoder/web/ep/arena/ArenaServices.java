package com.topcoder.web.ep.arena;

import java.util.List;

import com.topcoder.web.ep.dto.AssignmentDTO;

/**
 * Interface for the Arena services provider
 * 
 * @author Pablo
 * @version $Id: 
*/
public interface ArenaServices {

    public void addNewAssignment(AssignmentDTO adto);

    public void editAssignment(AssignmentDTO adto);

    public void updateRoundRegistration(Long roundId, List<Long> coderIds);

    public boolean isSendEvent();
    
    public void setSendEvent(boolean sendEvent);
    
}