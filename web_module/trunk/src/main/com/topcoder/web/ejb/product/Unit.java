package com.topcoder.web.ejb.product;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for Unit table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface Unit extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.product.UnitBean#createUnit
     */
    void createUnit(long productId, long unitTypeId, int numUnits)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.UnitBean#getNumUnits
     */
    int getNumUnits(long productId, long unitTypeId)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.UnitBean#setNumUnits
     */
    void setNumUnits(long productId, long unitTypeId, int numUnits)
            throws RemoteException, EJBException;

    /**
     *
     * @see com.topcoder.web.ejb.product.UnitBean#getUnitDescription
     */
    public String getUnitDescription(long productId, long unitTypeId)
            throws RemoteException, EJBException;
}
