package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.VisaLetterEvent;


/**
 * @author cucu
 */
public interface VisaLetterEventDAO {

    VisaLetterEvent find(Long eventId);

    VisaLetterEvent findCurrent();

    List findShowStatus();

    List getAll();

    void saveOrUpdate(VisaLetterEvent req);
}
