package com.topcoder.web.ejb.product;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface Unit extends EJBObject {
    void createUnit(long productId, long unitTypeId, int numUnits);
    int getNumUnits(long productId, long unitTypeId);
    void setNumUnits(long productId, long unitTypeId, int numUnits);
}