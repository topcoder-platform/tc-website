/*
 * ContentResource
 *
 * A JavaBean extending Resource and representing a WebContent and its
 * associated Sector.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebContent;
import com.topcoder.web.render.ejb.WebContentHome;
import com.topcoder.web.render.ejb.WebContentObject;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;

class ContentResource extends Resource {

    protected WebContentObject webContent;
    protected WebContent wc;

    public ContentResource() {
        super();
        initialize();
    }

    ContentResource(Context context) throws NamingException, RemoteException, CreateException {
        super(context);
        initialize();
    }

    private void initialize() {
        webContent = new WebContentObject();
        inline = true;
    }

    void connect(Context context) throws NamingException, RemoteException, CreateException {
        super.connect(context);
        WebContentHome home;
        synchronized (context) {
            home = (WebContentHome)
                    javax.rmi.PortableRemoteObject.narrow(
                            context.lookup("com.topcoder.web.render.ejb.WebContent"),
                            WebContentHome.class);
        }
        wc = home.create();
    }

    void store(Integer user) throws RemoteException, SQLException {
        boolean localNew = isnew;
        super.store(user);
        webContent.modify_by = user;
        if (localNew) {
            webContent.content_id = sector.sector_id;
            wc.request(WebContent.INSERT, webContent);
        } else {
            wc.request(WebContent.UPDATE, webContent);
        }
    }

    void storeProd(Integer user) throws RemoteException, SQLException {
        System.out.println("sector id = " + sector.sector_id);
        super.storeProd(user);
        webContent.modify_by = user;
        boolean found = false;
        webContent.content_id = sector.sector_id;
        try {
            //WebContentObject temp = new WebContentObject();
            //System.out.println ( "locating content sector id " + webContent.content_id );
            //temp.content_id = sector.sector_id;
            //wc.request(WebContent.SELECT, temp);
            String temp = wc.findByContentName(webContent.content_name);
            if (temp != null && !temp.equals("")) found = true;
        } catch (Exception findException) {
            //findException.printStackTrace();
            System.out.println("ContentResource.storeProd:  content not found... inserting");
        }
        if (found) {
            System.out.println("content found... updating");
            wc.request(WebContent.UPDATE, webContent);
        } else {
            wc.request(WebContent.INSERT, webContent);
        }
    }


    void load(Integer id) throws RemoteException, SQLException {
        webContent.content_id = id;
        webContent = wc.request(WebContent.SELECT, webContent);
        super.load(id);
    }

    void delete() {
        if (isnew) return;
        try {
            wc.request(WebContent.DELETE, webContent);
        } catch (Exception ex) {
        }
        super.delete();
    }

    public String toString() {
        return "content: " + getName();
    }

    public String getName() {
        return webContent.content_name;
    }

    void setName(String n) {
        if (n == null || n.length() == 0) n = " ";
        webContent.content_name = (n.length() > 50) ? n.substring(0, 50) : n;
    }

    public String getType() {
        return "content";
    }

    public boolean isFile() {
        return false;
    }

    public Integer getGroupIndex() {
        return webContent.content_group_id;
    }

    void setGroupIndex(Integer inx) {
        webContent.content_group_id = inx;
    }

    public Integer getStatusIndex() {
        return webContent.status_id;
    }

    void setStatusIndex(Integer inx) {
        webContent.status_id = inx;
    }

    public String getContent() {
        return webContent.content.toString();
    }

    void setContent(String c) {
        if (c == null) c = "";
        webContent.content = c;
    }

    public String getLanguage() {
        return webContent.language_cd;
    }

    void setLanguage(String l) {
        webContent.language_cd = l;
    }

    public String getCountry() {
        return webContent.country_code;
    }

    void setCountry(String c) {
        webContent.country_code = c;
    }
}

