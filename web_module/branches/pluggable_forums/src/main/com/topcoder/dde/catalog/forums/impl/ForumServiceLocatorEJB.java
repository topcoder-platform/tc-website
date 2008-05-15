package com.topcoder.dde.catalog.forums.impl;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;

import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.forums.ForumServiceLocator;
import com.topcoder.dde.catalog.forums.ForumsServiceCreationException;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsHome;

public class ForumServiceLocatorEJB implements ForumServiceLocator {

	public Forums createForumService() throws ForumsServiceCreationException {
		try {
            Context context = TCContext.getInitial(ApplicationServer.FORUMS_HOST_URL);
            ForumsHome forumsHome = (ForumsHome) context.lookup(ForumsHome.EJB_REF_NAME);
            return forumsHome.create();
        } catch (NamingException e) {
            throw new ForumsServiceCreationException(
                    "Failed to connect to forums server EJB: "
                            + e.toString(), e);
        } catch (CreateException e) {
            throw new ForumsServiceCreationException(e.toString(), e);
        } catch (RemoteException e) {
            throw new ForumsServiceCreationException(e.toString(), e);
        }
	}

}
