package com.topcoder.web.ejb.messagehistory;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author mtong
 */

public interface MessageHistoryLocalHome extends EJBLocalHome {
    
    public static final String EJB_REF_NAME = "java:/com.topcoder.web.ejb.messagehistory.MessageHistoryLocalHome";
    
    public MessageHistoryLocal create() throws CreateException;
}