package com.topcoder.web.ejb.forums;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author mtong
 */
public interface ForumsLocalHome extends EJBLocalHome {
    
    public ForumsLocal create() throws CreateException;
}