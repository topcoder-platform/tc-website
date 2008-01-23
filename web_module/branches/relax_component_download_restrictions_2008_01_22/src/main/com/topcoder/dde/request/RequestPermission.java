package com.topcoder.dde.request;

import java.util.Map;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;

/**
 * @author  pulky
 * @version  $Revision$ $Date$
 */
public class RequestPermission extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {

            String code = StringUtils.checkNull(getRequest().getParameter("code"));
            
            log.debug("code: " + code);
            
            if (!"".equals(code)) {    
                ResultSetContainer rsc = getData(code);            

                if (rsc.size() > 0) {
                    PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome)
                    getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                    PrincipalMgrRemote principalMgr = principalMgrHome.create();
            
                    for (ResultSetRow rsr : rsc) {
                        principalMgr.addUserToGroup(principalMgr.getGroup(rsr.getLongItem("group_id")), principalMgr.getUser(getUser().getId()), new TCSubject(0));
                    }
                } else {
                    // if the code is not found, throw permission exception
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
                
                setNextPage("/catalog/index.jsp");
            } else {
                setNextPage("/catalog/requestPermission.jsp");
            }
            setIsNextPageInContext(false);
        }
    }

    private ResultSetContainer getData(String code) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "code_groups";

            r.setContentHandle(queryName);
            r.setProperty("code", code);

            DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }
}
