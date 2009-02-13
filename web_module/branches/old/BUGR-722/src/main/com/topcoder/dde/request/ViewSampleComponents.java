package com.topcoder.dde.request;

import java.util.Collection;

import javax.rmi.PortableRemoteObject;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalogHome;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

/**
 * @author  pulky
 * @version  $Revision: 67715 $ $Date$
 * Create Date: Feb 7, 2005
 */
public class ViewSampleComponents extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            LocalDDECompCatalogHome compCatalogHome = (LocalDDECompCatalogHome) PortableRemoteObject.narrow(
                    getInitialContext().lookup(LocalDDECompCatalogHome.EJB_REF_NAME), LocalDDECompCatalogHome.class);
            Collection<LocalDDECompCatalog> publicComponents = (Collection<LocalDDECompCatalog>) compCatalogHome.findPublic();

            ComponentManagerHome componentManagerHome = (ComponentManagerHome) PortableRemoteObject.narrow(
                    getInitialContext().lookup(ComponentManagerHome.EJB_REF_NAME), ComponentManagerHome.class);
            ComponentManager compMgr = componentManagerHome.create();

            int maxPublicDownloads = compMgr.getMaxPublicDownloads();
            int numberDownloads = compMgr.getNumberComponentsDownloaded(getUser().getId());

            getRequest().setAttribute("max_downloads", maxPublicDownloads);                
            getRequest().setAttribute("remaining_downloads", (maxPublicDownloads - numberDownloads) < 0 ? 0 : (maxPublicDownloads - numberDownloads));                
            getRequest().setAttribute("public_components", publicComponents);                
            setNextPage("/catalog/samples.jsp");

            setIsNextPageInContext(true);
        }
    }
}
