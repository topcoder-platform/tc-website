package com.topcoder.web.ejb.messagehistory;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 * @author mtong
 */

public interface MessageHistoryLocalHome extends EJBHome {
    
    public static final String EJB_REF_NAME = "java:/com.topcoder.web.ejb.messagehistory.MessageHistoryLocalHome";
    
    public MessageHistoryLocal create() throws CreateException;
}