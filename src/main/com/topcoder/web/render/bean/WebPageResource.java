/*
 * WebPageResource
 *
 * A JavaBean extending SectorFileResource and representing a WebPage and its
 * associated SectorFile and Sector.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebPage;
import com.topcoder.web.render.ejb.WebPageHome;
import com.topcoder.web.render.ejb.WebPageObject;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;

class WebPageResource extends SectorFileResource {
    protected WebPageObject webPage;
    protected WebPage wp;

    public WebPageResource() {
        super();
        initialize();
    }

    WebPageResource(Context context) throws NamingException, RemoteException, CreateException {
        super(context);
        initialize();
    }

    private void initialize() {
        webPage = new WebPageObject();
    }

    void connect(Context context) throws NamingException, RemoteException, CreateException {
        super.connect(context);
        WebPageHome home;
        synchronized (context) {
            home = (WebPageHome) javax.rmi.PortableRemoteObject.narrow(
                    context.lookup("com.topcoder.web.render.ejb.WebPage"),
                    WebPageHome.class);
        }
        wp = home.create();
    }

    void store(Integer user) throws RemoteException, SQLException {
        boolean localNew = isnew;
        super.store(user);
        webPage.modify_by = sectorFile.modify_by;
        if (localNew) {
            webPage.page_id = sector.sector_id;
            webPage.page_path = sectorFile.path;
            wp.request(WebPage.INSERT, webPage);
        } else {
            wp.request(WebPage.UPDATE, webPage);
        }
    }

    void load(Integer id) throws RemoteException, SQLException {
        webPage.page_id = id;
        webPage = wp.request(WebPage.SELECT, webPage);
        super.load(id);
    }

    void delete() {
        if (isnew) return;
        try {
            wp.request(WebPage.DELETE, webPage);
        } catch (Exception ex) {
        }
        super.delete();
    }

    public String toString() {
        return "web page: " + getFileName();
    }

    public String getName() {
        return webPage.page_name;
    }

    void setName(String n) {
        webPage.page_name = n;
    }

    public String getType() {
        return "page";
    }

    public String getFileName() {
        return sectorFile.file;
    }

    void setFileName(String fn) {
        sectorFile.file = fn;
    }

    public Integer getStatusIndex() {
        return webPage.status_id;
    }

    void setStatusIndex(Integer inx) {
        webPage.status_id = inx;
    }

    public String getTitle() {
        return webPage.page_title;
    }

    void setTitle(String t) {
        webPage.page_title = t;
    }

    public Integer getSortNumber() {
        return webPage.sort_number;
    }

    void setSortNumber(Integer n) {
        webPage.sort_number = n;
    }

    public Integer getSiteId() {
        return webPage.site_hdr_id;
    }

    void setSiteId(Integer id) {
        webPage.site_hdr_id = id;
    }

    public String getLanguage() {
        return webPage.language_cd;
    }

    void setLanguage(String l) {
        webPage.language_cd = l;
    }

    public String getCountry() {
        return webPage.country_code;
    }

    void setCountry(String c) {
        webPage.country_code = c;
    }

    public String getText() {
        return "";
    }

    void setText(String text) {
    }

}
