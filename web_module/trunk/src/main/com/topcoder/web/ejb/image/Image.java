package com.topcoder.web.ejb.image;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public interface Image extends EJBObject {
    long createImage(String fileName, int imageTypeId, long pathId, String dataSource) throws RemoteException;

    void setFileName(long imageId, String fileName, String dataSource) throws RemoteException;
    void setImageTypeId(long imageId, int imageTypeId, String dataSource) throws RemoteException;
    void setPathId(long imageId, long pathId, String dataSource) throws RemoteException;
    void setLink(long imageId, String link, String dataSource) throws RemoteException;
    void setHeight(long imageId, int height, String dataSource) throws RemoteException;
    void setWidth(long imageId, int width, String dataSource) throws RemoteException;

    String getFileName(long imageId, String dataSource) throws RemoteException;
    int getImageTypeId(long imageId, String dataSource) throws RemoteException;
    long getPathId(long imageId, String dataSource) throws RemoteException;
    String getLink(long imageId, String dataSource) throws RemoteException;
    int getHeight(long imageId, String dataSource) throws RemoteException;
    int getWidth(long imageId, String dataSource) throws RemoteException;


}
