package com.topcoder.web.ejb.image;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision: 63581 $ $Date$
 *          Create Date: Apr 6, 2005
 */
public interface Image extends EJBObject {
    long createImage(String fileName, int imageTypeId, long pathId, String dataSource) throws RemoteException;

    void setFileName(long imageId, String fileName, String dataSource) throws RemoteException;

    void setImageTypeId(long imageId, int imageTypeId, String dataSource) throws RemoteException;

    void setPathId(long imageId, long pathId, String dataSource) throws RemoteException;

    void setLink(long imageId, String link, String dataSource) throws RemoteException;

    void setHeight(long imageId, int height, String dataSource) throws RemoteException;

    void setWidth(long imageId, int width, String dataSource) throws RemoteException;

    String getFileName(long imageId, String dataSource) throws RowNotFoundException, RemoteException;

    int getImageTypeId(long imageId, String dataSource) throws RowNotFoundException, RemoteException;

    long getPathId(long imageId, String dataSource) throws RowNotFoundException, RemoteException;

    String getLink(long imageId, String dataSource) throws RowNotFoundException, RemoteException;

    int getHeight(long imageId, String dataSource) throws RowNotFoundException, RemoteException;

    int getWidth(long imageId, String dataSource) throws RowNotFoundException, RemoteException;


}
