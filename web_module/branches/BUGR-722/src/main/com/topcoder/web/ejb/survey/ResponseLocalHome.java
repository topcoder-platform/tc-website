package com.topcoder.web.ejb.survey;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision: 43007 $ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface ResponseLocalHome extends EJBLocalHome {

    public ResponseLocalHome create() throws CreateException;
}
