package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.VisaLetterEvent;


/**
 * @author cucu
 */
public interface VisaLetterEventDAO {
	
	VisaLetterEvent find(Long eventId);

	VisaLetterEvent findCurrent();

    void saveOrUpdate(VisaLetterEvent req);
}
