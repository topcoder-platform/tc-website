// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3)
// Source File Name:   JSPPage.java

package com.topcoder.web.render.bean;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.io.*;
import java.rmi.RemoteException;
import java.sql.SQLException;

// Referenced classes of package com.topcoder.web.render.bean:
//            Page, ResourceException, Resource, WebPageResource

class JSPPage extends Page {

    private StringBuffer text;

    private void init() {
        text = new StringBuffer(20000);
        text.append("<%-- CREATED BY CMA --%>\n");
        text.append("<%@ page session='true' %>\n"); // ErrorPage?
        text.append("<jsp:useBean id='render' scope='session' type='com.topcoder.web.render.bean.RenderIfc' class='com.topcoder.web.render.bean.renderBean' />\n");
        text.append("<!-- Dynamically generated page, copyright TopCoder, Inc. -->\n");
        text.append("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>\n");
        text.append("<HTML xmlns='http://www.w3.org/1999/xhtml'>\n");
        text.append("<HEAD>\n");
        text.append("<TITLE>" + webPage.page_title + "</TITLE>\n");
        text.append("</HEAD>\n");
        text.append("<BODY>\n");
        text.append("</BODY>\n");
        text.append("</HTML>\n");
    }


    JSPPage() {
        init();
    }


    JSPPage(Context context)
            throws NamingException, RemoteException, CreateException {
        super(context);
        init();
    }


    JSPPage(WebPageResource webpageresource) {
        super(webpageresource);
        init();
    }

    void setText(String text) {
        this.text.delete(0, this.text.length());
        this.text.append(text);
    }

    public String getText() {
        return text.toString();
    }

    synchronized void read(Context context)
            throws IOException, SQLException, NamingException, CreateException {
        SQLException sqleSave = null;
        IOException ioeSave = null;
        if (file == null) throw new IOException("No file attached");
        if (!file.exists()) throw new IOException("File doesn't exist");
        if (!(file.canRead() && file.canWrite())) throw new IOException("File not read/write-accessible");
        BufferedReader in = null;
        try {
            in = new BufferedReader(new FileReader(file));
            this.text.delete(0, text.length());
            for (
                    String line = in.readLine();
                    line != null;
                    line = in.readLine()
                    ) {
                text.append(line.trim());
                text.append("\n");
            }
        } finally {
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
    }


    synchronized void write(File f)
            throws IOException, ResourceException {
        PrintWriter out = null;
        try {
            if (f == null) throw new IOException("No file attached");
            if (!f.exists()) throw new IOException("File doesn't exist");
            if (!f.canWrite()) throw new IOException("File not write-accessible");
            out = new PrintWriter(new FileWriter(f));
            out.println(text.toString());
        } catch (IOException ioe) {
            throw ioe;
        } finally {
            if (out != null)
                try {
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
        }
    }
}
