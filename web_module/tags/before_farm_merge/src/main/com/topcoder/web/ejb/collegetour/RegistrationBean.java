package com.topcoder.web.ejb.collegetour;

import com.topcoder.web.ejb.BaseEJB;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class RegistrationBean extends BaseEJB {
    public void create(long eventId, long coderId, String dataSource) {
        insert("college_tour_registration", new String[] {"event_id", "coder_id"},
                new String[] {String.valueOf(eventId), String.valueOf(coderId)}, dataSource);
    }

    public boolean exists(long eventId, long coderId, String dataSource) {
        return !selectSet("college_tour_registration", new String[]{"'1'"}, new String[]{"event_id", "coder_id"},
                new String[] {String.valueOf(eventId), String.valueOf(coderId)}, dataSource).isEmpty();
    }


}
