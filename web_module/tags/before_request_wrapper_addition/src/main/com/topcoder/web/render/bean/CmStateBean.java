/*
 * CMStateBean
 *
 * A JavaBean for storing the state of the PageBuilder Content Management
 * web application.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.render.common.config;
import com.topcoder.web.render.ejb.*;

import javax.ejb.CreateException;
import javax.naming.*;
import javax.servlet.http.*;
import java.io.*;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.*;


public class CmStateBean implements Serializable, HttpSessionBindingListener,
        AuthenticationIfc {

    private static Logger log = Logger.getLogger(CmStateBean.class);
    private final static int REQUIRED_ACCESS_LEVEL = 20;
    private final static boolean DEBUG = true;
    private final static String[] CONFIG_PROD_IP = {"cm_const.xml", "cma", "prod", "ip"};
    private final static String[] CONFIG_PROD_PORT = {"cm_const.xml", "cma", "prod", "port"};
    private final static String[] CONFIG_QA_IP = {"cm_const.xml", "cma", "qa", "ip"};
    private final static String[] CONFIG_QA_PORT = {"cm_const.xml", "cma", "qa", "port"};
    private final static String[] CONFIG_DEV_IP = {"cm_const.xml", "cma", "dev", "ip"};
    private final static String[] CONFIG_DEV_PORT = {"cm_const.xml", "cma", "dev", "port"};

    private static String PROD_IP = null;
    private static String PROD_PORT = null;
    private static String QA_IP = null;
    private static String QA_PORT = null;
    private static String DEV_IP = null;
    private static String DEV_PORT = null;

    public static String previewPath;
    public static String previewLink;
    protected static Context context = null;

    protected HttpSession session;
    private Integer userid;
    private boolean authenticated;
    protected Page currentPage;
    protected Integer sitePagesListSiteId;
    protected List resourceList, pageHits, resourceHits, statusList,
    contentGroupList, siteList, sitePagesList;
    protected Resource selectedResource;


    private void initEnvironments() {
        configProd();
        configQA();
        configDev();
    }

    private void configProd() {
        synchronized (this) {
            PROD_IP = config.get(CONFIG_PROD_IP);
            PROD_PORT = config.get(CONFIG_PROD_PORT);
            log.debug("PROD=" + PROD_IP + ":" + PROD_PORT);
        }
    }

    private void configQA() {
        synchronized (this) {
            QA_IP = config.get(CONFIG_QA_IP);
            QA_PORT = config.get(CONFIG_QA_PORT);
            log.debug("QA=" + QA_IP + ":" + QA_PORT);
        }
    }

    private void configDev() {
        synchronized (this) {
            DEV_IP = config.get(CONFIG_DEV_IP);
            DEV_PORT = config.get(CONFIG_DEV_PORT);
            log.debug("DEV=" + DEV_IP + ":" + DEV_PORT);
        }
    }

/* CmStateBean no-arg constructor */
    public CmStateBean() throws NamingException {
        if (context == null) {
            //context = com.topcoder.shared.util.TCContext.getInitial();
            context = new InitialContext();
        }
        session = null;
        currentPage = null;
        pageHits = resourceHits = null;
        statusList = contentGroupList = siteList = sitePagesList = null;
        resourceList = new Vector();
        authenticated = false;
        if (PROD_IP == null || PROD_PORT == null) configProd();
        if (QA_IP == null || QA_PORT == null) configQA();
        if (DEV_IP == null || DEV_PORT == null) configDev();
    }

/*
    createStatusList
    A method to create a new statusList and populate it with the current data
    from the web_status table.  The statusList will persist in this instance
    of the bean until this method is called again.
*/
    void createStatusList() {
        statusList = new ArrayList();
        WebStatusHome home;
        try {
            synchronized (context) {
                home = (WebStatusHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.WebStatus"),
                        WebStatusHome.class);
            }
            WebStatus retriever = home.create();
            String toGet = retriever.list();
            StatusObject template = new StatusObject();
            StringTokenizer st = new StringTokenizer(toGet);
            while (st.hasMoreElements()) {
                try {
                    template.status_id = Integer.valueOf(st.nextToken());
                    statusList.add(
                            new StatusObject(
                                    retriever.request(WebStatus.SELECT, template)));
                } catch (NumberFormatException nfe) {
                }
            }
        } catch (RemoteException re) { /* give up with truncated list */
        } catch (SQLException sqle) { /* give up with truncated list */
        } catch (CreateException ce) { /* give up with truncated list */
        } catch (NamingException ne) { /* give up with truncated list */
        }
    }

/*
    createContentGroupList
    A method to create a new contentGroupList and populate it with the current
    data from the web_content_group table.  The contentGroupList will persist
    in this instance of the bean until this method is called again.
*/
    void createContentGroupList() {
        contentGroupList = new ArrayList();
        WebContentGroupHome home;
        try {
            synchronized (context) {
                home = (WebContentGroupHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.WebContentGroup"),
                        WebContentGroupHome.class);
            }
            WebContentGroup retriever = home.create();
            String toGet = retriever.list();
            ContentGroupObject template = new ContentGroupObject();
            StringTokenizer st = new StringTokenizer(toGet);
            while (st.hasMoreElements()) {
                try {
                    template.content_group_id = Integer.valueOf(st.nextToken());
                    contentGroupList.add(
                            new ContentGroupObject(
                                    retriever.request(WebContentGroup.SELECT, template)));
                } catch (NumberFormatException nfe) {
                }
            }
        } catch (RemoteException re) { /* give up with truncated list */
        } catch (SQLException sqle) { /* give up with truncated list */
        } catch (CreateException ce) { /* give up with truncated list */
        } catch (NamingException ne) { /* give up with truncated list */
        }
    }

/*
    createSiteList
    A method to create a new siteList and populate it with the current
    data from the web_site table.  The siteList will persist
    in this instance of the bean until this method is called again.
*/
    void createSiteList() {
        siteList = new ArrayList();
        WebSiteHdrHome home;
        try {
            synchronized (context) {
                home = (WebSiteHdrHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.WebSiteHdr"),
                        WebSiteHdrHome.class);
            }
            WebSiteHdr retriever = home.create();
            String toGet = retriever.list();
            SiteObject template = new SiteObject();
            StringTokenizer st = new StringTokenizer(toGet);
            while (st.hasMoreElements()) {
                try {
                    template.site_hdr_id = Integer.valueOf(st.nextToken());
                    siteList.add(
                            new SiteObject(
                                    retriever.request(WebSiteHdr.SELECT, template)));
                } catch (NumberFormatException nfe) {
                }
            }
        } catch (RemoteException re) { /* give up with truncated list */
        } catch (SQLException sqle) { /* give up with truncated list */
        } catch (CreateException ce) { /* give up with truncated list */
        } catch (NamingException ne) { /* give up with truncated list */
        }
    }

/*
    createSitePagesList
    A method to create a new sitePagesList and populate it with the current
    data from the web_page table that are in the same primary site as the
    current page.  The sitePagesList will persist in this instance of the bean
    until this method is called again.

    This method is intended to support the site map features of the DB schema,
    but underlying DB support is not fully present so this is not implemented
    in the current CMA JSPs or state bean.
*/
    void createSitesPagesList() {
        sitePagesList = new ArrayList();
        if (currentPage == null) return;
        WebPageHome home;
        try {
            synchronized (context) {
                home = (WebPageHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.WebPage"),
                        WebPageHome.class);
            }
            WebPage retriever = home.create();
            String toGet = retriever.findBySiteHdrId(currentPage.getSiteId());
            PageObject template = new PageObject();
            StringTokenizer st = new StringTokenizer(toGet);
            while (st.hasMoreElements()) {
                try {
                    template.page_id = Integer.valueOf(st.nextToken());
                    siteList.add(
                            new PageObject(
                                    retriever.request(WebPage.SELECT, template)));
                } catch (NumberFormatException nfe) {
                }
            }
        } catch (RemoteException re) { /* give up with truncated list */
        } catch (SQLException sqle) { /* give up with truncated list */
        } catch (CreateException ce) { /* give up with truncated list */
        } catch (NamingException ne) { /* give up with truncated list */
        }
    }

/*
   getAuthenticationPage returns the URL of a page to which the current
   request may be forwarded for Authentication.  (I.e., this returns the
   link to an appropriate login page.)
 */
    public String getAuthenticationPage() {
        return "/CmDispatch?page=login";
    }

/* return a list of country codes */
    public List getCountries() {
        return new ArrayList();
    }

/* return a list of language codes */
    public List getLanguages() {
        return new ArrayList();
    }

/* return those resources that are not web pages */
    public List getNonPageResources() {
        if (resourceList == null) return new ArrayList();
        ArrayList rval = new ArrayList(resourceList);
        for (int i = 0; i < rval.size(); i++) {
            try {
                if ("page".equals(((Resource) rval.get(i)).getType())) rval.remove(i--);
            } catch (ResourceException re) {
                /* this should never happen; if it does, then we somehow have an
                   inappropriate Resource subclass in the resourceList */
            }
        }
        return rval;
    }

/* return the number of page hits */
    public int getNumPageHits() {
        return (currentPage == null) ? 0 : pageHits.size();
    }

/* return the number of resource hits */
    public int getNumResourceHits() {
        return (resourceHits == null) ? 0 : resourceHits.size();
    }

/* return the number of resources in the current list */
    public int getNumResources() {
        return (resourceList == null) ? 0 : resourceList.size();
    }

/* return true if the current page may be edited */
    public boolean isPageEditable() {
        /* the crippled CMA reports that the page cannot be edited.  This means the
           the _resource_list_ cannot be edited -- the page metadata in the DB
           can still be modified.

           return true;
        */
        return false;
    }

/* return a List containing the current page's list of resources */
    public List getPageContents() {
        return (currentPage == null) ? new ArrayList() : currentPage.getItems();
    }

/* Return the current page's description */
    public String getPageDesc() {
        String rval = (currentPage == null) ? null : currentPage.getDesc();
        return (rval == null) ? "" : rval;
    }

/* Return the current page's text */
    public String getPageText() {
        String rval = (currentPage == null) ? null : currentPage.getText();
        return (rval == null) ? "" : rval;
    }

/* Return the fully-qualified name of the current page's disk file */
    public String getPageFile() {
        if (currentPage == null)
            return "";
        else
            return currentPage.getPath() + "/" + currentPage.getFileName();
    }

/* return a list of page hits */
    public List getPageHits() {
        return (pageHits == null) ? new ArrayList() : pageHits;
    }

/* return the link field of the current page */
    public String getPageLink() {
        String rval = (currentPage == null) ? null : currentPage.getLink();
        return (rval == null) ? "" : rval;
    }

/* return the page name (as opposed to file name) field of the current page */
    public String getPageName() {
        String rval = (currentPage == null) ? null : currentPage.getName();
        return (rval == null) ? "" : rval;
    }

/* Return the name of the current page's web site */
    public String getPageSite() {
        if (currentPage == null) return "";
        List localSites = getSites();
        Integer pageSite = currentPage.getSiteId();
        SiteObject site;
        for (int i = 0; i < localSites.size(); i++) {
            site = (SiteObject) localSites.get(i);
            if (pageSite.equals(site.getId())) return site.toString();
        }
        return "";
    }

/* return the status field of the current page */
    public String getPageStatus() {
        String rval = (currentPage == null) ? null : currentPage.getStatus();
        return (rval == null) ? "" : rval;
    }

/* return the status_id field of the current page */
    public int getPageStatusIndex() {
        Integer rval = (currentPage == null) ? null : currentPage.getStatusIndex();
        return (rval == null) ? -1 : rval.intValue();
    }

/* return the system field of the current page */
    public String getPageSystem() {
        String rval = (currentPage == null) ? null : currentPage.getSystem();
        return (rval == null) ? "" : rval;
    }

/* return the page_title field of the current page */
    public String getPageTitle() {
        String rval = (currentPage == null) ? null : currentPage.getTitle();
        return (rval == null) ? "" : rval;
    }

/* return the parameter list stored in the params argument and associated
   with key parm */
    protected final static String[] getParameters(String parm, Map params) {
        return (String[]) params.get(parm);
    }

/* return a list of resource hits */
    public List getResourceHits() {
        return (resourceHits == null) ? new ArrayList() : resourceHits;
    }

/* return a list of current resources */
    public List getResources() {
        return resourceList;
    }

/* returns the selected resource */
    public Resource getSelectedResource() {
        return selectedResource;
    }

/* return a list pages on the same site as the current page */
    public List getSitePages() {
        return new ArrayList();
    }

/* return a list of known web sites */
    public List getSites() {
        if (siteList == null) createSiteList();
        return siteList;
    }

/* return a list of web statuses */
    public List getStatuses() {
        if (statusList == null) createStatusList();
        return statusList;
    }

/* Get a single-valued parameter associated with key parm from Map params */
    protected final static String getUniqueParameter(String parm, Map params) {
        String[] values = getParameters(parm, params);
        return (values == null) ? null : values[0];
    }

/* return a list of web content groups */
    public List getWebGroups() {
        if (contentGroupList == null) createContentGroupList();
        return contentGroupList;
    }

/*
   isAuthenticated returns true if the current session is associated with
   an authenticated user, and false otherwise.
 */
    public boolean isAuthenticated() {
        return authenticated;
    }

/* returns true if and only if a page has been loaded */
    public boolean isPageLoaded() {
        return currentPage != null;
    }

/* create a temporary JSP based on the current page to use for previewing
   and store the temp file name in the params map with key "page" so that
   the CMA will display the temp page */
    protected void preparePreview(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        if (currentPage == null) {
            putUniqueParameter("message", "no page loaded", params);
            putUniqueParameter("page", "blank", params);
            return;
        }
/* The crippled CMA must preview the live page rather than a temporary.
    File f = new File(previewPath, session.getId()+currentPage.getFileName());
    try {
        f.createNewFile();
        f.deleteOnExit();
        currentPage.write(f);
    } catch (IOException ioe) {
        putUniqueParameter("message", "An error occured: " + ioe.getMessage(), params);
        putUniqueParameter("page", "blank", params);
        return;
    } catch (SecurityException se) {
        putUniqueParameter("message", "An error occured: " + se.getMessage(), params);
        putUniqueParameter("page", "blank", params);
        return;
    } catch (ResourceException re) {
        putUniqueParameter("message", "An error occured: " + re.getMessage(), params);
        putUniqueParameter("page", "blank", params);
        return;
    }
    String s = previewLink + f.getName();
    putUniqueParameter("page", s.substring(0,s.length()-4), params);
*/
        String s = currentPage.getLink();
        if (s == null) {
            putUniqueParameter("message", "No link specified for the current page.", params);
            putUniqueParameter("page", "blank", params);
            return;
        } else {
            putUniqueParameter("page", s, params);
            putUniqueParameter("pageAsIs", "", params);
        }
    }

    protected void processEditPageForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        if (currentPage == null) {
            putUniqueParameter("message", "no page loaded", params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        try {
            currentPage.setCountry(getUniqueParameter("country", params));
            currentPage.setLanguage(getUniqueParameter("language", params));
            currentPage.setSystem(getUniqueParameter("system", params));
            currentPage.setLink(getUniqueParameter("link", params));
            currentPage.setStatus(getUniqueParameter("filestatus", params));
            currentPage.setName(getUniqueParameter("name", params));
            currentPage.setTitle(getUniqueParameter("title", params));
            currentPage.setDesc(getUniqueParameter("desc", params));
            /* added for "Steve hoke" to save JSP text */
            currentPage.setText(getUniqueParameter("text", params));
            try {
                String stat = getUniqueParameter("webstatus", params);
                currentPage.setStatusIndex((stat == null) ?
                        new Integer(0) :
                        Integer.valueOf(stat));
            } catch (NumberFormatException nfe) {
                currentPage.setStatusIndex(new Integer(0));
            }
/*  Setting the parent must be done in the web_page_path table; EJBs currently
    do not support this.
        try {
            currentPage.setParent(Integer.valueOf(getUniqueParameter("parent", params)));
        } catch (NumberFormatException nfe) {
            currentPage.setParent(new Integer(0));
        }
*/
            try {
                currentPage.setSortNumber(Integer.valueOf(getUniqueParameter("order", params)));
            } catch (NumberFormatException nfe) {
                currentPage.setSortNumber(new Integer(0));
            }
        } catch (ResourceException re) {
            /* if this ever happens it means that currentPage has the wrong class */
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            re.printStackTrace(pw);
            putUniqueParameter("message", "Internal Error", params);
            putUniqueParameter("page", "blank", params);
            throw new IllegalStateException(sw.toString());
        } catch (NullPointerException npe) {
            npe.printStackTrace();
            putUniqueParameter("message", "Incomplete form data", params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        /* Now apply edits to the item list */
        List pageItems = currentPage.getItems();
        /* First resource replacements: */
        int removed = 0;
        int initialSize = pageItems.size();
        for (int i = 0; i < initialSize; i++) {
            String val = getUniqueParameter("r" + i, params);
            if (val == null) continue; /* This should not happen with the v1.0
                                          editPage JSP, but it should be safe to
                                          ignore it in any case. */
            int inx;
            int effective = i - removed;
            try {
                inx = Integer.parseInt(val);
                if (inx < 0) {
                    pageItems.remove(effective);
                    removed++;
                } else {
                    if (inx >= resourceList.size()) continue; /* This should not happen.
                                                                 We ignore the bad data if
                                                                 it does. */
                    Object o = resourceList.get(inx);
                    /* Replace the current resource with the specified one if they're
                       different. */
                    if (pageItems.get(effective).equals(o)) continue;
                    pageItems.remove(effective);
                    pageItems.add(effective, o);
                }
            } catch (NumberFormatException nfe) {
                putUniqueParameter("message", "Warning: form data was garbled", params);
            }
        }
        /* Next resource movements: */
        /* ill-defined semantics, especially when combined with additions and deletions
        for (int i = 0; i < pageItems.size(); i++) {
            String val = getUniqueParameter("m"+i, params);
            if (val == null) continue;
            try {
                int inx = Integer.parseInt(val) + 1;
                if (inx < 0) continue;
                if (inx < i)
                    pageItems.add(inx, pageItems.remove(i));
                else if ( inx > i+1 && inx < pageItems.size() )
                    pageItems.add(inx - 1, pageItems.remove(i));
            } catch (NumberFormatException nfe) {
                putUniqueParameter("message", "Warning: form data was garbled", params);
            }
        }
        */
        String[] additions = getParameters("add", params);
        if (additions == null) return;
        String after = getUniqueParameter("after", params);
        int ainx;
        if (after == null)
            ainx = pageItems.size();
        else {
            int maxinx = pageItems.size();
            try {
                ainx = Integer.parseInt(after) + 1;
                ainx = Math.max(0, Math.min(ainx, maxinx)); // clamp to valid values
            } catch (NumberFormatException nfe) {
                /* this should never happen, but the following is a reasonable
                   strategy if it does */
                ainx = maxinx;
            }
        }
        for (int i = 0; i < additions.length; i++) {
            int rinx;
            try {
                rinx = Integer.parseInt(additions[i]);
                if (rinx < 0 || rinx >= resourceList.size()) continue;
                pageItems.add(ainx++, resourceList.get(rinx));
            } catch (NumberFormatException nfe) {
                /* This also should not happen.  It should be safe to just ignore
                   the bad data with a warning if it did happen. */
                putUniqueParameter("message", "Warning: form data was garbled", params);
            }
        }
    }


    protected void processEditResourceFormProd(Map params, String url) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        if (selectedResource == null) {
            putUniqueParameter("message", "You must select a resource first", params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        try {
            selectedResource.connect(com.topcoder.shared.util.TCContext.getInitial(url));
            log.debug("CONNECTED TO " + url);
            processEditResourceFormParams(params);
            selectedResource.storeProd(userid);
        } catch (Exception e) {
            e.printStackTrace();
            throw new AuthenticationException("processEditResourceFormProd:  Unable to get connection to prod...");
        } finally {
            try {
                //selectedResource.connect ( com.topcoder.shared.util.TCContext.getInitial() );
                selectedResource.connect(new InitialContext());
                log.debug("CONNECTED TO LOCAL ... ");
            } catch (Exception eCx) {
                eCx.printStackTrace();
                throw new AuthenticationException("processEditResourceFormProd:  Connection to CM lost while updating prod...");
            }
        }
    }


    protected void processEditResourceForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        if (selectedResource == null) {
            putUniqueParameter("message", "You must select a resource first", params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        processEditResourceFormParams(params);
        try {
            selectedResource.store(userid);
        } catch (Exception ex) {
            putUniqueParameter("message", "Warning: " + ex.getClass().getName() +
                    " caught.  Attempting to synchronize resource data.", params);
            putUniqueParameter("page", "blank", params);
            try {
                selectedResource.load(selectedResource.getId());
            } catch (Exception e) {
            }
        }

    }


    private void processEditResourceFormParams(Map params) throws AuthenticationException {
        String val;
        try {
            val = getUniqueParameter("name", params);
            if (val != null) selectedResource.setName(val);
            val = getUniqueParameter("desc", params);
            if (val != null) selectedResource.setDesc(val);
            val = getUniqueParameter("system", params);
            if (val != null) selectedResource.setSystem(val);
            val = getUniqueParameter("path", params);
            if (val != null) selectedResource.setPath(val);
            val = getUniqueParameter("link", params);
            if (val != null) selectedResource.setLink(val);
            val = getUniqueParameter("filestatus", params);
            if (val != null) selectedResource.setStatus(val);
            val = getUniqueParameter("height", params);
            if (val != null)
                try {
                    selectedResource.setHeight(Integer.valueOf(val));
                } catch (NumberFormatException nfe) {
                    putUniqueParameter("message", "Warning: height not changed (expected a number)", params);
                }
            val = getUniqueParameter("width", params);
            if (val != null)
                try {
                    selectedResource.setWidth(Integer.valueOf(val));
                } catch (NumberFormatException nfe) {
                    putUniqueParameter("message", "Warning: width not changed (expected a number)", params);
                }
            val = getUniqueParameter("group", params);
            if (val != null)
                try {
                    selectedResource.setGroupIndex(Integer.valueOf(val));
                } catch (NumberFormatException nfe) {
                    putUniqueParameter("message", "Warning: group not changed (form data garbled)", params);
                }
            val = getUniqueParameter("webstatus", params);
            if (val != null)
                try {
                    selectedResource.setStatusIndex(Integer.valueOf(val));
                } catch (NumberFormatException nfe) {
                    putUniqueParameter("message", "Warning: status not changed (form data garbled)", params);
                }
            val = getUniqueParameter("content", params);
            if (val != null) selectedResource.setContent(val);
        } catch (ResourceException re) {
            /* This should not happen.  If it does, possible causes are
               (1) The JSP did not present the correct form view for the selected
                   resource to the client
               (2) The client did not use the form at all
            */
            putUniqueParameter("message", "Internal Error", params);
            putUniqueParameter("page", "blank", params);
        } catch (Exception ex) {
            putUniqueParameter("message", "Warning: " + ex.getClass().getName() +
                    " caught.  Attempting to synchronize resource data.", params);
            putUniqueParameter("page", "blank", params);
            try {
                selectedResource.load(selectedResource.getId());
            } catch (Exception e) {
            }
        }
    }


    protected void processFindResourcesForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        String field = getUniqueParameter("field", params);
        if (field == null) {
            putUniqueParameter("message", "Form data missing or invalid" +
                    (DEBUG ? " [field]" : ""), params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        String term = getUniqueParameter(field, params);
        if (term == null) {
            putUniqueParameter("message", "Form data missing or invalid" +
                    (DEBUG ? " [ field " + field + "]" : ""), params);
            putUniqueParameter("page", "blank", params);
            return;
        }
        while ((term.length() > 0) && (term.charAt(0) == '%')) {
            term = term.substring(1);
        }
        for (int len = term.length();
             (len > 0) && (term.charAt(len - 1) == '%');
             len = term.length()) {
            term = term.substring(0, len - 1);
        }
        if ((!"group".equals(field)) && term.length() < 2) {
            putUniqueParameter("message", "Search term '" + term + "' is too short",
                    params);
            putUniqueParameter("page", "loadResources", params);
            return;
        }
        String hits = null;
        ContentResource cr;
        WebFileResource wfr;
        WebPageResource wpr;
        try {
            cr = new ContentResource(context);
            wfr = new WebFileResource(context);
            wpr = new WebPageResource(context);
            if ("name".equals(field)) {
                hits = cr.wc.findByContentName("%" + term + "%") + " ";
                hits += wfr.sf.findByFile("%" + term + "%") + " ";
                hits += wpr.wp.findByPageName("%" + term + "%");
            } else if ("desc".equals(field)) {
                Resource r = new Resource(context);
                hits = r.sec.findBySectorDesc("%" + term + "%");
            } else if ("group".equals(field)) {
                try {
                    hits = cr.wc.findByContentGroupId(Integer.valueOf(term));
                } catch (NumberFormatException nfe) {
                    putUniqueParameter("message", "Internal error in search term", params);
                    putUniqueParameter("page", "blank", params);
                    return;
                }
            } else {
                /* This should not happen during normal usage of the CMA */
                putUniqueParameter("message", "Unrecognized search field" +
                        (DEBUG ? " '" + field + "'" : ""), params);
                putUniqueParameter("page", "blank", params);
                return;
            }
        } catch (RemoteException re) {
            putUniqueParameter("page", "blank", params);
            if (DEBUG) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                re.printStackTrace(pw);
                String s = sw.toString();
                int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                if (atat >= 0) s = s.substring(0, atat);
                putUniqueParameter("message", "Error: " + s, params);
            } else {
                String s = re.toString();
                int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                if (atat >= 0) s = s.substring(0, atat);
                putUniqueParameter("message", "Error: " + s, params);
            }
            return;
        } catch (Exception ex) {
            putUniqueParameter("page", "blank", params);
            if (DEBUG) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                ex.printStackTrace(pw);
                putUniqueParameter("message", "Error: " + sw, params);
            } else {
                putUniqueParameter("message", "Error: " + ex, params);
            }
            return;
        }
        Set hitSet = new HashSet();
        Integer id;
        StringTokenizer st = new StringTokenizer(hits);

        /* This is a potential problem area: */
        while (st.hasMoreElements()) {
            id = Integer.valueOf(st.nextToken());
            try {
                cr.load(id);
                hitSet.add(cr);
                cr = new ContentResource(context);
            } catch (Exception re1) {
                try {
                    wfr.load(id);
                    hitSet.add(wfr);
                    wfr = new WebFileResource(context);
                } catch (Exception re2) {
                    try {
                        wpr.load(id);
                        hitSet.add(wpr);
                        wpr = new WebPageResource(context);
                    } catch (Exception re3) {
                        if (DEBUG) {
                            StringWriter sw = new StringWriter();
                            PrintWriter pw = new PrintWriter(sw);
                            re1.printStackTrace(pw);
                            pw.println();
                            re2.printStackTrace(pw);
                            pw.println();
                            re3.printStackTrace(pw);
                            pw.println();
                            putUniqueParameter("message", "Warning: could not load one or more resources; details:\n" +
                                    sw, params);
                        } else {
                            putUniqueParameter("message", "Warning: could not load one or more resources", params);
                        }
                    }
                }
            }
        }
        resourceHits = new ArrayList();
        resourceHits.addAll(hitSet);
        if (resourceHits.size() == 0 && getUniqueParameter("message", params) == null) {
            putUniqueParameter("message", "No hits for '" + term + "'", params);
        }
    }

/*
   processForm
   Invokes the appropriate form processor method based on the "submit"
   parameter in the supplied parmeters.
   Potential gotcha: this implementation silently drops update requests it
   doesn't recognize (unknown value of the "submit" parameter)
 */
    public void processForm(Map params) throws AuthenticationException {
        String form = getUniqueParameter("submit", params);
        if ("login".equals(form))
            processLoginForm(params);
        else if ("logout".equals(form))
            processLogout();
        else if ("Apply Edit".equals(form))
            processEditPageForm(params);
        else if ("Save Page".equals(form))
            saveCurrentPage(params);
        else if ("Save Modifications".equals(form))
            processEditResourceForm(params);
        else if ("Move to Production".equals(form))
            processEditResourceFormProd(params, "t3://" + PROD_IP + ":" + PROD_PORT);
        else if ("Move to QA".equals(form))
            processEditResourceFormProd(params, "t3://" + QA_IP + ":" + QA_PORT);
        else if ("Move to Development".equals(form))
            processEditResourceFormProd(params, "t3://" + DEV_IP + ":" + DEV_PORT);
        else if ("Find Page".equals(form))
            processLoadPageForm(params);
        else if ("Create Page".equals(form))
            processNewPageForm(params);
        else if ("Create File Resource".equals(form))
            processNewFileResourceForm(params);
        else if ("Create Stored Content Resource".equals(form))
            processNewStoredResourceForm(params);
        else if ("Load Page".equals(form))
            processPageHitsForm(params);
        else if ("Release Selected".equals(form))
            processReleaseResourcesForm(params);
        else if ("Release All".equals(form))
            releaseAllResources();
        else if ("Load Resources".equals(form))
            processResourceHitsForm(params);
        else if ("Find Resources".equals(form))
            processFindResourcesForm(params);
        else if ("Edit Resource".equals(form))
            processSelectResourceForm(params);
        else if ("preview".equals(form)) preparePreview(params);
    }

    protected void processLoadPageForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        String data = getUniqueParameter("target", params);
        if (data != null) {
            while ((data.length() > 0) && (data.charAt(0) == '%')) {
                data = data.substring(1);
            }
            for (int len = data.length();
                 (len > 0) && (data.charAt(len - 1) == '%');
                 len = data.length()) {
                data = data.substring(0, len - 1);
            }
        }
        if (data == null || data.length() < 2) {
            putUniqueParameter("message", "The search string was too short.", params);
            putUniqueParameter("page", "loadPage", params);
            return;
        }
        data = "%" + data + "%";
        String field = getUniqueParameter("field", params);

        /* look up the pages */
        WebPageResource wpSearcher = null;
        String hits;
        boolean searchingFiles = false;
        try {
            wpSearcher = new WebPageResource(context);
            if ("pname".equals(field)) {
                hits = wpSearcher.wp.findByPageName(data);
            } else if ("title".equals(field)) {
                hits = wpSearcher.wp.findByPageTitle(data);
            } else {
                SectorFileResource sfSearcher = new SectorFileResource(context);
                searchingFiles = true;
                if ("fname".equals(field)) {
                    hits = sfSearcher.sf.findByFile(data);
                } else if ("link".equals(field)) {
                    hits = sfSearcher.sf.findByLink(data);
                } else {
                    putUniqueParameter("message", "unrecognized search field", params);
                    putUniqueParameter("page", "loadPage", params);
                    return;
                }
            }
        } catch (RemoteException re) {
            putUniqueParameter("page", "blank", params);
            if (DEBUG) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                re.printStackTrace(pw);
                String s = sw.toString();
                int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                if (atat >= 0) s = s.substring(0, atat);
                putUniqueParameter("message", "Error: " + s, params);
            } else {
                String s = re.toString();
                int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                if (atat >= 0) s = s.substring(0, atat);
                putUniqueParameter("message", "Error: " + s, params);
            }
            putUniqueParameter("page", "blank", params);
            return;
        } catch (Exception ex) {
            if (DEBUG) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                ex.printStackTrace(pw);
                putUniqueParameter("message", "Error:\n" + sw, params);
            } else {
                putUniqueParameter("message", ex.toString(), params);
            }
            putUniqueParameter("page", "blank", params);
            return;
        }
        pageHits = new ArrayList();
        StringTokenizer st = new StringTokenizer(hits);
        while (st.hasMoreElements()) {
            try {
                wpSearcher.load(Integer.valueOf(st.nextToken()));
                pageHits.add(wpSearcher);
                wpSearcher = new WebPageResource(context);
            } catch (RemoteException re) {
                putUniqueParameter("page", "blank", params);
                if (DEBUG) {
                    String s = re.toString();
                    int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                    if (atat >= 0) s = s.substring(0, atat);
                    putUniqueParameter("message", "Error: " + s, params);
                }
            } catch (Exception ex) {
                if (DEBUG)
                    putUniqueParameter("message", "Warning: one or more hits could not be loaded as web pages.\nGot "
                            + ex + "\nThis may be normal.", params);
            }
        }

        /* Special treatment for zero or one hit */
        switch (pageHits.size()) {
            case 0: /* go to blank page; add "no hits" message if no other message */
                putUniqueParameter("page", "blank", params);
                if (getUniqueParameter("message", params) == null)
                    putUniqueParameter("message", "No hits.", params);
                break;
            case 1: /* load the single hit and go straight to the edit page */
                putUniqueParameter("page", "editPage", params);
                putUniqueParameter("selected", "0", params);
                processPageHitsForm(params);
        }
    }

    protected void processLoginForm(Map params) throws
            AuthenticationException {
        String handle = getUniqueParameter("handle", params);
        String password = getUniqueParameter("password", params);
        if (handle == null || password == null)
            throw
                    new AuthenticationException("credentials incomplete");
        try {
            UserHome userHome;
            User userBean;
            synchronized (context) {
                userHome = (UserHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.User"),
                        UserHome.class);
            }
            userBean = userHome.create();
            String userIdStr = userBean.findByHandle(handle);
            if (userIdStr.indexOf(' ') >= 0) {
                throw new AuthenticationException("handle is not unique");
            }
            UserObject userObj = new UserObject();
            userObj.user_id = Integer.valueOf(userIdStr);
            userObj = userBean.request(User.SELECT, userObj);
            if (!pwMatch(password, userObj.password)) {
                throw new AuthenticationException("authentication failed");
            }
            authenticated = false;
            userid = userObj.user_id;
            /* User Authentication Successful, now check access before setting
               the authenticated flag to true */
            String groups = null;
            GroupUserHome groupUserHome;
            GroupUser groupUserBean;
            synchronized (context) {
                groupUserHome = (GroupUserHome) javax.rmi.PortableRemoteObject.narrow(
                        context.lookup("com.topcoder.web.render.ejb.GroupUser"),
                        GroupUserHome.class);
            }
            groupUserBean = groupUserHome.create();
            groups = groupUserBean.findByUserId(userid);
            if (groups != null && groups.length() > 0) {
                GroupHome groupHome;
                Group groupBean;
                synchronized (context) {
                    groupHome = (GroupHome) javax.rmi.PortableRemoteObject.narrow(
                            context.lookup("com.topcoder.web.render.ejb.Group"),
                            GroupHome.class);
                }
                groupBean = groupHome.create();
                GroupObject groupObj = new GroupObject();
                int maxAccess = 0;
                StringTokenizer st = new StringTokenizer(groups);
                while (st.hasMoreElements()) {
                    groupObj.group_id = Integer.valueOf(st.nextToken());
                    groupObj = groupBean.request(Group.SELECT, groupObj);
                    if (groupObj.access_id != null)
                        maxAccess = Math.max(maxAccess, groupObj.access_id.intValue());
                }
                if (maxAccess >= REQUIRED_ACCESS_LEVEL) {
                    authenticated = true;
                    putUniqueParameter("message", "Welcome to PageBuilder", params);
                } else {
                    putUniqueParameter("message", "User does not have sufficient access",
                            params);
                    putUniqueParameter("page", "login", params);
                }
            }
        } catch (NumberFormatException nfe) {
            putUniqueParameter("message", "Bad numeric data obtained from database: " +
                    nfe.getMessage() + " -- cannot log in", params);
            putUniqueParameter("page", "login", params);
        } catch (RemoteException re) {
            putUniqueParameter("message", "Cannot obtain database interface: " +
                    re.getMessage() + " -- cannot log in", params);
            putUniqueParameter("page", "login", params);
        } catch (NamingException ne) {
            putUniqueParameter("message", "Database server internal naming error: " +
                    ne.getClass().getName() + ": " + ne.getMessage(), params);
            putUniqueParameter("page", "login", params);
        } catch (CreateException ce) {
            putUniqueParameter("message", "Database interface could not be instantiated "
                    + ce.getMessage() + " -- cannot log in", params);
            putUniqueParameter("page", "login", params);
        } catch (SQLException sqle) {
            putUniqueParameter("message", "Database error: " + sqle.getMessage() +
                    " -- cannot log in", params);
            putUniqueParameter("page", "login", params);
        }
    }

    protected void processLogout() {
        authenticated = false;
        if (session != null) session.invalidate();
    }

    protected void processNewFileResourceForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        WebFileResource wfr = null;
        try {
            wfr = new WebFileResource(context);
            wfr.setDesc(getUniqueParameter("desc", params));
            wfr.setName(getUniqueParameter("name", params));
            wfr.setSystem(getUniqueParameter("system", params));
            wfr.setPath(getUniqueParameter("path", params));
            wfr.setLink(getUniqueParameter("link", params));
            wfr.setStatus(getUniqueParameter("status", params));
            try {
                wfr.setHeight(Integer.valueOf(getUniqueParameter("height", params)));
            } catch (NumberFormatException nfe) {
                wfr.setHeight(new Integer(0));
            }
            try {
                wfr.setWidth(Integer.valueOf(getUniqueParameter("width", params)));
            } catch (NumberFormatException nfe) {
                wfr.setWidth(new Integer(0));
            }
            wfr.setCountry(getUniqueParameter("country", params));
            wfr.store(userid);
            resourceList.add(wfr);
        } catch (RemoteException re) {
            putUniqueParameter("page", "blank", params);
            String s = re.toString();
            int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
            if (atat >= 0) s = s.substring(0, atat);
            putUniqueParameter("message", "Error: " + s, params);
            try {
                wfr.delete();
            } catch (Exception e) {
            }
        } catch (Exception ex) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Warning: " + ex, params);
            try {
                wfr.delete();
            } catch (Exception e) {
            }
        }
    }

    protected void processNewPageForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        String path = getUniqueParameter("fpath", params);
        if (path == null || path.length() == 0) {
            putUniqueParameter("message", "File path must not be empty", params);
            putUniqueParameter("page", "newPage", params);
            return;
        }
        String name = getUniqueParameter("fname", params);
        if (name == null || name.length() == 0) {
            putUniqueParameter("message", "File name must not be empty", params);
            putUniqueParameter("page", "newPage", params);
            return;
        }
        File f = new File(path, name + ".jsp");
        try {
            if (!f.createNewFile()) {
                putUniqueParameter("page", "blank", params);
                putUniqueParameter("message", "Error: file " + f.toString() + " already exists.", params);
                return;
            }
            /* The crippled CMA uses a RestrictedPage instead of a Page for
               currentPage.
                currentPage = new Page(context);
            */
            //currentPage = new RestrictedPage(context);
            currentPage = new JSPPage(context);
            currentPage.setFile(f);
            currentPage.setSiteId(Integer.valueOf(getUniqueParameter("site", params)));
            putUniqueParameter("message", "New page created", params);
        } catch (IOException ioe) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "I/O Error: " + ioe.getMessage(), params);
        } catch (SecurityException se) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Security Violation: " + se.getMessage(), params);
        } catch (NamingException ne) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Error: " + ne.getClass().getName() + ": " +
                    ne.getMessage(), params);
        } catch (CreateException ce) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Create Exception: " + ce.getMessage(), params);
        }
    }

    protected void processNewStoredResourceForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        ContentResource wcr = null;
        try {
            wcr = new ContentResource(context);
            wcr.setName(getUniqueParameter("name", params));
            wcr.setDesc(getUniqueParameter("desc", params));
            try {
                wcr.setGroupIndex(Integer.valueOf(getUniqueParameter("group", params)));
            } catch (NumberFormatException nfe) {
                wcr.setGroupIndex(new Integer(0));
            }
            try {
                wcr.setStatusIndex(Integer.valueOf(getUniqueParameter("statusInx", params)));
            } catch (NumberFormatException nfe) {
                wcr.setStatusIndex(new Integer(0));
            }
            wcr.setContent(getUniqueParameter("content", params));
            wcr.setLanguage(getUniqueParameter("language", params));
            wcr.setCountry(getUniqueParameter("country", params));
            wcr.store(userid);
            resourceList.add(wcr);
        } catch (RemoteException re) {
            putUniqueParameter("page", "blank", params);
            String s = re.toString();
            int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
            if (atat >= 0) s = s.substring(0, atat);
            putUniqueParameter("message", "Error: " + s, params);
            try {
                wcr.delete();
            } catch (Exception e) {
            }
        } catch (Exception ex) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Warning: " + ex, params);
            try {
                wcr.delete();
            } catch (Exception e) {
            }
        }
    }

    protected void processPageHitsForm(Map params) throws AuthenticationException {
        log.debug("processPageHitsForm called...");
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        int pageInx;
        String sel = getUniqueParameter("selected", params);
        if (pageHits == null || sel == null ||
                (pageInx = Integer.parseInt(sel)) >= pageHits.size()) {
            putUniqueParameter("message", "Internal error with page hits", params);
            putUniqueParameter("page", "blank", params);
        } else {
            /* The crippled CMA uses a RestrictedPage instead of a Page for
               currentPage.
                currentPage = new Page((WebPageResource) pageHits.get(pageInx));
            */
            //currentPage = new RestrictedPage((WebPageResource) pageHits.get(pageInx));
            log.debug("creating new JSP...");
            currentPage = new JSPPage((WebPageResource) pageHits.get(pageInx));
            try {
                log.debug("reading JSP code...");
                currentPage.read(context);
                log.debug("JSP code: \n\n" + currentPage.getText());
                Set unique = new HashSet(currentPage.getItems());
                unique.removeAll(resourceList);
                resourceList.addAll(unique);
            } catch (IOException ioe) {
                putUniqueParameter("message", "I/O Exception reading file: " + ioe.getMessage(), params);
                putUniqueParameter("page", "blank", params);
            } catch (SQLException sqle) {
                putUniqueParameter("message", "SQL Exception reading file: " + sqle.getMessage(), params);
                putUniqueParameter("page", "blank", params);
            } catch (NamingException ne) {
                putUniqueParameter("message", "Error: " + ne.getClass().getName() + ": " +
                        ne.getMessage(), params);
                putUniqueParameter("page", "blank", params);
            } catch (CreateException ce) {
                putUniqueParameter("message", "Create Exception reading file: " + ce.getMessage(), params);
                putUniqueParameter("page", "blank", params);
            }
        }
    }

    protected void processReleaseResourcesForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        String[] selected = getParameters("resources", params);
        if (selected == null) {
            putUniqueParameter("message", "No resources selected", params);
            return;
        }
        ArrayList selectionList = new ArrayList();
        int rinx;
        for (int i = 0; i < selected.length; i++) {
            rinx = Integer.parseInt(selected[i]);
            if (rinx >= 0 && rinx < resourceList.size()) {
                selectionList.add(resourceList.get(rinx));
            }
        }
        if (currentPage != null) selectionList.removeAll(currentPage.getItems());
        if (selectionList.size() == 0) {
            putUniqueParameter("message", "No resources removed", params);
            return;
        }
        resourceList.removeAll(selectionList);
    }

    protected void processResourceHitsForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        String[] hitlist = getParameters("resources", params);
        if (hitlist != null) {
            ArrayList list = new ArrayList();
            for (int i = 0; i < hitlist.length; i++) {
                try {
                    list.add(resourceHits.get(Integer.parseInt(hitlist[i])));
                } catch (NumberFormatException nfe) {
                }
            }
            list.removeAll(resourceList);
            resourceList.addAll(list);
        }
    }

    protected void processSelectResourceForm(Map params) throws AuthenticationException {
        if (!authenticated) throw new AuthenticationException("Not Authenticated");
        try {
            selectedResource = (Resource) resourceList.get(
                    Integer.parseInt(
                            getUniqueParameter("selected", params)));
        } catch (NumberFormatException nfe) {
            putUniqueParameter("page", "blank", params);
            putUniqueParameter("message", "Invalid form data", params);
        }
    }

/* store a single-value parameter in the parameter map */
    protected final static void putUniqueParameter(String key, String parm, Map params) {
        String[] p = new String[1];
        p[0] = parm;
        params.put(key, p);
    }

/*
  pwMatch()
  returns true if the provided password string matches the string from the DB.
  This version just checks whether the two strings are equal, but this method
  can be overridden if a more sophisticated technique is required (e.g. if the
  passwords are stored encrypted in the database.
*/
    protected boolean pwMatch(String pwEntered, String pwRetrieved) {
        return pwEntered.equals(pwRetrieved);
    }

    protected void releaseAllResources() {
        if (currentPage == null)
            resourceList.clear();
        else
            resourceList.retainAll(currentPage.getItems());
    }

    protected void saveCurrentPage(Map params) {
        if (currentPage == null) {
            putUniqueParameter("message", "No page loaded", params);
            putUniqueParameter("page", "blank", params);
        } else
            try {
                currentPage.write();
                currentPage.store(userid);
            } catch (RemoteException re) {
                currentPage.delete(); // Clears junk from the database
                String s = re.toString();
                int atat = s.indexOf("at "); // Quick and dirty -- could match in the wrong place
                if (atat >= 0) s = s.substring(0, atat);
                putUniqueParameter("message", "Got " + s +
                        "\nDid you 'Apply edit' at least once?",
                        params);
                putUniqueParameter("page", "blank", params);
            } catch (Exception ex) {
                currentPage.delete(); // Clears junk from the database
                putUniqueParameter("message", "Got " + ex +
                        "\nDid you 'Apply Edit' at least once?",
                        params);
                putUniqueParameter("page", "blank", params);
            }
    }

/* A method required by the HTTPSessionBindingListener interface.  This method
   allows the CMA to obtain a reference to the session to which it is bound. */
    public void valueBound(HttpSessionBindingEvent event) {
        session = event.getSession();
    }

/* A method required by the HTTPSessionBindingListener interface.  This method
   seeks to assure that there will be no barrier to garbage collecting
   invalidated session objects or discarded CmStateBean objects by clearing
   the bean's internal reference to its session when it is unbound from the
   session. */
    public void valueUnbound(HttpSessionBindingEvent event) {
        session = null;
    }

}
