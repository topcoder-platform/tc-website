package com.topcoder.web.ejb.product;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * EJB object for ProductUnit table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface ProductUnit extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.product.ProductUnitBean#createProductUnit
     */
    void createProductUnit(long productId, long unitId, int numUnits)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.ProductUnitBean#getNumUnits
     */
    int getNumUnits(long productId, long unitId)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.ProductUnitBean#getUnits
     */
    ResultSetContainer getUnits(long productId)
            throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.product.ProductUnitBean#setNumUnits
     */
    void setNumUnits(long productId, long unitId, int numUnits)
            throws RemoteException, EJBException;

}
