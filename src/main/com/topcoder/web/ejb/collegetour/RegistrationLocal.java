package com.topcoder.web.ejb.collegetour;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public interface RegistrationLocal extends EJBLocalObject {
    
    void create(long eventId, long coderId, String dataSource);

}
