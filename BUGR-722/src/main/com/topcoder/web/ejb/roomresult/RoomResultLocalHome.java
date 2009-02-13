package com.topcoder.web.ejb.roomresult;

import javax.ejb.EJBLocalHome;
import javax.ejb.CreateException;

/**
 * @author dok
 * @version $Revision: 43007 $ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface RoomResultLocalHome extends EJBLocalHome {

    public RoomResultLocal create() throws CreateException;
}
