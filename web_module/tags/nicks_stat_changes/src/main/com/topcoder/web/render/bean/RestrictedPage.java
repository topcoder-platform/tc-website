// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3)
// Source File Name:   RestrictedPage.java

package com.topcoder.web.render.bean;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.io.*;
import java.rmi.RemoteException;

// Referenced classes of package com.topcoder.web.render.bean:
//            Page, ResourceException, Resource, WebPageResource

class RestrictedPage extends Page {

    RestrictedPage() {
    }

    RestrictedPage(Context context)
            throws NamingException, RemoteException, CreateException {
        super(context);
    }

    RestrictedPage(WebPageResource webpageresource) {
        super(webpageresource);
    }

    synchronized void write(File file)
            throws IOException, ResourceException {
        if (super.isnew) {
            if (file == null)
                throw new IOException("No file attached");
            if (!file.exists())
                throw new IOException("File doesn't exist");
            if (!file.canWrite())
                throw new IOException("File not write-accessible");
            PrintWriter printwriter = new PrintWriter(new FileWriter(file));
            printwriter.println("<%@ page session='true' %>");
            printwriter.println("<jsp:useBean id='render' scope='session' type='com.topcoder.web.render.bean.RenderIfc' class='com.topcoder.web.render.bean.renderBean' />");
            printwriter.println("<!-- Dynamically generated page, copyright TopCoder, Inc. -->");
            printwriter.println("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>");
            printwriter.println("<html xmlns='http://www.w3.org/1999/xhtml'>");
            printwriter.println("<head>");
            printwriter.println("<title>" + super.webPage.page_title + "</title>");
            printwriter.println("</head>");
            printwriter.println("<body>");
            printwriter.println("</body>");
            printwriter.println("</html>");
            printwriter.close();
        }
    }
}
