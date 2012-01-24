package com.topcoder.web.ejb.product;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for Unit table get/set functions
 *
 * @author Greg Paul
 * @version $Revision$
 */
public interface Unit extends EJBObject {
    /**
     * @see com.topcoder.web.ejb.product.UnitBean#createUnit
     */
    long createUnit(int unitTypeId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.UnitBean#getUnitDesc
     */
    String getUnitDesc(long unitId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.UnitBean#getUnitTypeId
     */
    int getUnitTypeId(long unitId) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.UnitBean#setUnitDesc
     */
    void setUnitDesc(long unitId, String unitDesc) throws RemoteException, EJBException;

    /**
     * @see com.topcoder.web.ejb.product.UnitBean#setUnitTypeId
     */
    void setUnitTypeId(long unitId, int unitTypeId) throws RemoteException, EJBException;

}
