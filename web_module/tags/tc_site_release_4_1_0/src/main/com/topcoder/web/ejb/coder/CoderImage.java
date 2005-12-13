package com.topcoder.web.ejb.coder;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public interface CoderImage extends EJBObject {


    void createCoderImage(long coderId, long imageId, boolean display, String dataSource) throws RemoteException;
    void setDisplayFlag(long coderId, long imageId, boolean display, String dataSource) throws RemoteException;
    boolean display(long coderId, long imageId, String dataSource) throws RemoteException;

    ResultSetContainer getImages(long coderId, int imageTypeId, String dataSource) throws RemoteException;

}
