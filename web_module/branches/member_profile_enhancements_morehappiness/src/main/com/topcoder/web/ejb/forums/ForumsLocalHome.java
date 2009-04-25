package com.topcoder.web.ejb.forums;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author mtong
 */
public interface ForumsLocalHome extends EJBLocalHome {
    
    public static final String EJB_REF_NAME = "java:/com.topcoder.web.ejb.forums.ForumsLocalHome";
    
    public ForumsLocal create() throws CreateException;
}