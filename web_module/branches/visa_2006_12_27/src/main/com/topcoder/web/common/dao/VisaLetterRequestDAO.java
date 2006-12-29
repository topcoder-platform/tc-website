package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.VisaLetterRequest;


/**
 * @author cucu
 */
public interface VisaLetterRequestDAO {
	public VisaLetterRequest find(Long eventId);
	
	VisaLetterRequest find(Long userId, Long eventId);
    
    void saveOrUpdate(VisaLetterRequest req);
}
