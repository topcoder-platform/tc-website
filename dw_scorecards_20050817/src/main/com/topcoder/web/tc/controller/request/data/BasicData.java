package com.topcoder.web.tc.controller.request.data;

import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ResultSetContainerConverter;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.model.DataResource;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.docGen.xml.RecordTag;

import javax.servlet.http.HttpUtils;
import javax.servlet.ServletOutputStream;
import java.util.Map;
import java.util.Iterator;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 13, 2005
 */
public class BasicData extends Base {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));

        DataResource resource = new DataResource(r.getContentHandle());
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            //for now we'll assume they're gettin data from the warehouse, perhaps that'll change later
            Map m = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);
            ResultSetContainer rsc = null;
            String key = null;
            Iterator it = m.keySet().iterator();
            //we're just giving them one thing at a time so the command should only have
            //one query associated with it.
            
            getResponse().setContentType("text/xml");
            
            if (it.hasNext()) {
                key = (String)it.next();
                rsc = (ResultSetContainer)m.get(key);
                ResultSetContainerConverter.writeXML(rsc, r.getContentHandle(), getResponse().getOutputStream());
            }
            
            getResponse().flushBuffer();
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

}
