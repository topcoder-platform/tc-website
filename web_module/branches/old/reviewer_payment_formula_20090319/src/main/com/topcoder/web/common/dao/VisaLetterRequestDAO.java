package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.VisaLetterRequest;


/**
 * @author cucu
 */
public interface VisaLetterRequestDAO {

    VisaLetterRequest find(Long reqId);

    VisaLetterRequest find(Long userId, Long eventId);

    List find(Long eventId, boolean pending, boolean sent, boolean denied);

    void saveOrUpdate(VisaLetterRequest req);
}
