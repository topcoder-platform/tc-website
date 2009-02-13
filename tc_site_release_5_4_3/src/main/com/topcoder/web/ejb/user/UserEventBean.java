/*
 * UserEventBean.java
 *
 * Created on August 9, 2004, 2:56 PM
 */

package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;

/**
 *
 * @author  rfairfax
 */
public class UserEventBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(UserEventBean.class);

    public void createUserEvent(long userId, long eventId, String dataSource) {
        int ret = insert("user_event_xref",
                new String[]{"user_id", "event_id"},
                new String[]{String.valueOf(userId), String.valueOf(eventId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'user_event_xref'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

}
