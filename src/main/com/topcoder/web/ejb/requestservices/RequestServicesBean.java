package com.topcoder.web.ejb.requestservices;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:18:50 AM
 */
public class RequestServicesBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(RequestServicesBean.class);

    public void createRequest(long userId, String url, String dataSource) {
        log.debug("createRequest called. url: " + url
                + " userId: " + userId);
        int ret = insert("request",
                new String[] {"user_id", "url"},
                new String[] {String.valueOf(userId), String.valueOf(url)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'request'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void createRequest(String url, String dataSource) {
        log.debug("createRequest called. url: " + url);
        int ret = insert("request",
                new String[] {"url"},
                new String[] {String.valueOf(url)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'request'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

}
