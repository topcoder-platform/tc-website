/*
 * Page
 *
 * A class for representing the state of the current Page in the PageBuilder
 * Content Management web application.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.io.*;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.*;

class Page extends WebPageResource {
    List items;
    File file;

    static List createItems() {
        return new ArrayList();
    }

    Page() {
        super();
        initialize();
    }

    Page(Context context) throws NamingException, RemoteException, CreateException {
        super(context);
        initialize();
    }

    protected void initialize() {
        items = createItems();
        file = null;
    }

    Page(WebPageResource wpr) {
        this();
        sec = wpr.sec;
        sector = wpr.sector;
        sf = wpr.sf;
        sectorFile = wpr.sectorFile;
        wp = wpr.wp;
        webPage = wpr.webPage;
        isnew = wpr.isnew;
        inline = wpr.inline;
        file = new File(sectorFile.path, sectorFile.file);
    }

    public List getItems() {
        return items;
    }

    void setItems(List l) {
        items = l;
    }

    void setFile(File f) {
        if (file == null) {
            file = f;
            setFileName(f.getName());
            setPath(f.getParent());
        }
    }

    synchronized void read(Context context) throws IOException, SQLException,
            NamingException, CreateException {
        SQLException sqleSave = null;
        if (file == null) throw new IOException("No file attached");
        if (!file.exists()) throw new IOException("File doesn't exist");
        if (!(file.canRead() && file.canWrite()))
            throw new IOException("File not read/write-accessible");
        BufferedReader in = new BufferedReader(new FileReader(file));
        in.readLine();
        for (String line = in.readLine().trim();
             (line.length() > 0) &&
                (Character.isDigit(line.charAt(0)) || line.charAt(0) == '-');
             line = in.readLine().trim()) {
            StringTokenizer st = new StringTokenizer(line);
            try {
                Integer id = Integer.valueOf(st.nextToken());
                String type = st.nextToken();
                switch (type.charAt(0)) {
                    case 'c':
                        Resource cr = new ContentResource(context);
                        cr.load(id);
                        items.add(cr);
                        break;
                    case 'f':
                        Resource fr = new WebFileResource(context);
                        fr.load(id);
                        items.add(fr);
                        break;
                    case 'p':
                        Resource pr = new WebFileResource(context);
                        pr.load(id);
                        items.add(pr);
                        break;
                }
            } catch (SQLException sqle) {
                /* continue processing; we will rethrow this later */
                sqleSave = sqle;
            } catch (NumberFormatException nfe) {
                break;
            }

        }
        IOException ioeSave = null;
        try {
            in.close();
        } catch (IOException ioe) {
            ioeSave = ioe;
        } finally {
            /* throw any cached SQL exception in favor of any cached IO
               exception */
            if (sqleSave != null) throw sqleSave;
            if (ioeSave != null) throw ioeSave;
        }
    }

    void write() throws IOException, ResourceException {
        write(file);
    }

    synchronized void write(File f) throws IOException, ResourceException {
        if (f == null) throw new IOException("No file attached");
        if (!f.exists()) throw new IOException("File doesn't exist");
        if (!f.canWrite()) throw new IOException("File not write-accessible");
        PrintWriter out = new PrintWriter(new FileWriter(f));
        /* print header information */
        Resource r;
        out.println("<%-- DO NOT MODIFY THIS FILE BY HAND");
        for (int i = 0; i < items.size(); i++) {
            r = (Resource) items.get(i);
            out.print(r.getId().intValue());
            out.print(" ");
            out.print(r.getType());
            out.println();
        }
        out.println("--%>");
        out.println("<%@ page session='true' %>"); // ErrorPage?
        out.println("<jsp:useBean id='render' scope='session' type='com.topcoder.web.render.bean.RenderIfc' class='com.topcoder.web.render.bean.renderBean' />");
        out.println("<!-- Dynamically generated page, copyright TopCoder, Inc. -->");
        out.println("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>");
        out.println("<html xmlns='http://www.w3.org/1999/xhtml'>");
        out.println("<head>");
        out.println("<title>" + webPage.page_title + "</title>");

        /* print content */
        out.println("</head>");
        out.println("<body>");
        for (int i = 0; i < items.size(); i++) {
            r = (Resource) items.get(i);
            if (r.isFile()) {
                if (r.isInline()) {
                    out.print("<img src='<%=render.getFileURL(" +
                            r.getId() + ")%>'>");
                } else {
                    /* NOTE: shortcoming here: the RenderIfc interface doesn't
                       provide a means to retrieve the hyperlink text.  This
                       version of the code uses fixed link text from the sector
                       descripion */
                    out.print("<a href='<%=render.getFileURL(" +
                            r.getId() + "%>'>" +
                            r.getDesc() + "</a>");
                }
            } else {
                out.print("<%=render.getContent(" + r.getName() + ")%>");
            }
        }

        /* print trailer */
        out.println();
        out.println("</body>");
        out.println("</html>");
        out.close();
    }

    protected void finalize() {
        if (isnew && file != null && file.exists()) file.delete();
    }
}
