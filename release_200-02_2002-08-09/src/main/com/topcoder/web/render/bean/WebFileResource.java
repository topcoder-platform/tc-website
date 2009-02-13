/*
 * WebFileResource
 *
 * A JavaBean extending SectorFileResource and representing a WebFile and its
 * associated SectorFile and Sector.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.*;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;

class WebFileResource extends SectorFileResource {
    protected WebFileObject webFile;
    protected WebFile wf;

    public WebFileResource() {
        super();
        initialize();
    }

    WebFileResource(Context context) throws NamingException, RemoteException, CreateException {
        super(context);
        initialize();
    }

    private void initialize() {
        inline = true;
        webFile = new WebFileObject();
    }

    void connect(Context context) throws NamingException, RemoteException, CreateException {
        super.connect(context);
        WebFileHome home;
        synchronized (context) {
            home = (WebFileHome) javax.rmi.PortableRemoteObject.narrow(
                    context.lookup("com.topcoder.web.render.ejb.WebFile"),
                    WebFileHome.class);
        }
        wf = home.create();
    }

    void store(Integer user) throws RemoteException, SQLException {
        boolean localNew = isnew;
        super.store(user);
        webFile.modify_by = sectorFile.modify_by;
        if (localNew) {
            webFile.file_id = sector.sector_id;
            webFile.file_desc = sector.sector_desc;
            wf.request(WebFile.INSERT, webFile);
        } else {
            wf.request(WebFile.UPDATE, webFile);
        }
    }

    void load(Integer id) throws RemoteException, SQLException {
        webFile.file_id = id;
        webFile = wf.request(WebFile.SELECT, webFile);
        super.load(id);
    }

    void delete() {
        if (isnew) return;
        try {
            wf.request(WebFile.DELETE, webFile);
        } catch (Exception ex) {
        }
        super.delete();
    }

    public String toString() {
        return "file: " + getName();
    }

    public String getType() {
        return "file";
    }

    public Integer getHeight() {
        return webFile.image_height;
    }

    void setHeight(Integer h) {
        webFile.image_height = h;
    }

    public Integer getWidth() {
        return webFile.image_width;
    }

    void setWidth(Integer w) {
        webFile.image_width = w;
    }
}

