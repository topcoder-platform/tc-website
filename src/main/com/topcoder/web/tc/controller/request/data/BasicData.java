package com.topcoder.web.tc.controller.request.data;

import com.topcoder.web.common.PermissionException;
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
            RecordTag rootTag = new RecordTag("RootElement");
            StringBuffer buf = new StringBuffer(30000);
            ServletOutputStream o = getResponse().getOutputStream();
            getResponse().setContentType("text/xml");
            for(Iterator it = m.keySet().iterator(); it.hasNext();) {
                key = (String)it.next();
                rsc = (ResultSetContainer)m.get(key);
                rootTag.addTag(rsc.getTag(key, "ResultRow"));
                buf.append(rootTag.getXML(2));
            }
            o.write(asciiGetBytes(buf.toString()));
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

    private byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }

}
