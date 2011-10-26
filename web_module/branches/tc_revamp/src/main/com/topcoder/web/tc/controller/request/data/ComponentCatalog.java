package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.CommaExpander;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.DataResource;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use only in connection with a TopCoder competition.
 *
 * @author dok
 * @version $Id: ComponentCatalog.java 70545 2008-05-13 21:32:30Z gpaul $
 *          Create Date: Apr 14, 2008
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class ComponentCatalog extends Base {


    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("dd_component_catalog");

        DataResource resource = new DataResource(r.getContentHandle(), Constants.TCS_OLTP_DATASOURCE_ID);
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            DataAccessInt da = getDataAccess(BasicData.getDataSource(Constants.TCS_OLTP_DATASOURCE_ID), true);
            CommandRunner cmd = new CommandRunner(da, r);

            DataFeeder df = new DataFeeder("component_catalog");

            // Add general project information
            RSCDataFeed compCatalog = new RSCDataFeed(null, "component", cmd, "dd_component_catalog");
            AllColumns ac = new AllColumns("N/A");
            ac.replace("category_list", new CommaExpander("category_list", "categories", "category"));
            compCatalog.add(ac);

            df.add(compCatalog);


            getResponse().setContentType("text/xml");

            df.writeXML(getResponse().getOutputStream());

            getResponse().flushBuffer();

        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

    /*
    component
      catalog
      name
      version
      description
      url to details
      categories
        category
     */

}
