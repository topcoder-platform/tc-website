/*
 * Resource
 *
 * A JavaBean for encapsulating sector objects, and several descendant beans.
 * These contain interfaces to the EJBs that manage the database.
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

public class Resource implements java.io.Serializable {
    private static java.util.Random rand = new java.util.Random();
    protected SectorObject sector;
    protected Sector sec;
    protected boolean inline;
    protected boolean isnew;

    public Resource() {
        initialize();
    }

    Resource(Context context) throws NamingException, RemoteException, CreateException {
        initialize();
        connect(context);
    }

    public int hashCode() {
        return getId().intValue();
    }

    private void initialize() {
        sector = new SectorObject();
        sec = null;
        isnew = true;
        inline = false;
    }

    void connect(Context context) throws NamingException, RemoteException, CreateException {
        SectorHome home;
        synchronized (context) {
            home = (SectorHome) javax.rmi.PortableRemoteObject.narrow(
                    context.lookup("com.topcoder.web.render.ejb.Sector"),
                    SectorHome.class);
        }
        sec = home.create();
    }

    void store(Integer user) throws RemoteException, SQLException {
        if (isnew) {
            /* This is what the code _should_ look like: */
            sector.sector_id = null; // This shouldn't be necessary, but just in case...
            sec.request(Sector.INSERT, sector);
            /* */
            /* This is a mighty kludge:
            SQLException sqleSave = null;
            for (int count = 0; count < 3; count++) {
                try {
                    sector.sector_id = new Integer(rand.nextInt());
                    sec.request(Sector.INSERT, sector );
                    sqleSave = null;
                    break;
                } catch (SQLException sqle) {
                    sqleSave = sqle;
                }
            }
            if (sqleSave != null) throw sqleSave;
            end of kludge */
            isnew = false;
        } else {
            sec.request(Sector.UPDATE, sector);
        }
    }


    void storeProd(Integer user) throws RemoteException, SQLException {
        boolean found = false;
        try {
            //SectorObject temp = new SectorObject();
            //temp.sector_id = sector.sector_id;
            //sec.request(Sector.SELECT, temp);
            String temp = sec.findBySectorDesc(sector.sector_desc);
            if (temp != null && !temp.equals("")) found = true;
        } catch (Exception findException) {
            //findException.printStackTrace();
            System.out.println("Resource.storeProd: sector " + sector.sector_id + " not found... inserting");
        }
        if (found) {
            System.out.println("sector " + sector.sector_id + " found... updating");
            sec.request(Sector.UPDATE, sector);
        } else {
            sec.request(Sector.INSERT, sector);
        }
    }


    void load(Integer id) throws RemoteException, SQLException {
        sector.sector_id = id;
        sector = sec.request(Sector.SELECT, sector);
        isnew = false;
    }

    void delete() {
        if (isnew) return;
        try {
            sec.request(Sector.DELETE, sector);
        } catch (Exception ex) {
        }
        isnew = true;
    }

    public boolean equals(Object o) {
        if (getClass().isInstance(o))
            return getId().equals(((Resource) o).getId());
        return false;
    }

    public final Integer getId() {
        return sector.sector_id;
    }

    public String getName() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setName(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getType() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getDesc() {
        return sector.sector_desc;
    }

    void setDesc(String d) throws ResourceException {
        sector.sector_desc = d;
    }

    public boolean isFile() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public boolean isInline() throws ResourceException {
        return inline;
    }

    void setInline(boolean in) throws ResourceException {
        inline = in;
    }

    public String getSystem() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setSystem(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getPath() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setPath(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getLink() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setLink(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getStatus() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setStatus(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public Integer getHeight() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setHeight(Integer h) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public Integer getWidth() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setWidth(Integer w) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public Integer getGroupIndex() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setGroupIndex(Integer inx) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public Integer getStatusIndex() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setStatusIndex(Integer inx) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    public String getContent() throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }

    void setContent(String c) throws ResourceException {
        throw new ResourceException("Method not supported on this resource type");
    }
}

