/*
 * SectorFileResource
 *
 * A JavaBean extending Resource and representing a SectorFile and its
 * associated Sector.
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

class SectorFileResource extends Resource {
    protected SectorFileObject sectorFile;
    protected SectorFile sf;

    public SectorFileResource() {
        super();
        initialize();
    }

    SectorFileResource(Context context) throws NamingException, RemoteException, CreateException {
        super(context);
        initialize();
    }

    private void initialize() {
        sectorFile = new SectorFileObject();
    }

    void connect(Context context) throws NamingException, RemoteException, CreateException {
        super.connect(context);
        SectorFileHome home;
        synchronized (context) {
            home = (SectorFileHome) javax.rmi.PortableRemoteObject.narrow(
                    context.lookup("com.topcoder.web.render.ejb.SectorFile"),
                    SectorFileHome.class);
        }
        sf = home.create();
    }

    void store(Integer user) throws RemoteException, SQLException {
        boolean localNew = isnew;
        super.store(user);
        sectorFile.modify_by = user;
        if (localNew) {
            sectorFile.sector_id = sector.sector_id;
            sf.request(SectorFile.INSERT, sectorFile);
        } else {
            sf.request(SectorFile.UPDATE, sectorFile);
        }
    }

    void load(Integer id) throws RemoteException, SQLException {
        sectorFile.sector_id = id;
        sectorFile = sf.request(SectorFile.SELECT, sectorFile);
        super.load(id);
    }

    void delete() {
        if (isnew) return;
        try {
            sf.request(SectorFile.DELETE, sectorFile);
        } catch (Exception ex) {
        }
        super.delete();
    }

    public String getName() {
        return sectorFile.file;
    }

    void setName(String n) {
        sectorFile.file = n;
    }

    public boolean isFile() {
        return true;
    }

    public String getSystem() {
        return sectorFile.system;
    }

    void setSystem(String sys) {
        sectorFile.system = sys;
    }

    public String getPath() {
        return sectorFile.path;
    }

    void setPath(String p) {
        sectorFile.path = p;
    }

    public String getLink() {
        return sectorFile.link;
    }

    void setLink(String ln) {
        sectorFile.link = ln;
    }

    public String getStatus() {
        return sectorFile.status;
    }

    void setStatus(String st) {
        sectorFile.status = st;
    }

    public String getCountry() {
        return sectorFile.country_code;
    }

    void setCountry(String c) {
        sectorFile.country_code = c;
    }
}

