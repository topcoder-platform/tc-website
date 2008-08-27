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
public class RequestPermissionSubmit extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            if ("POST".equals(getRequest().getMethod())) {
                String code = StringUtils.checkNull(getRequest().getParameter("code"));
                
                if (!"".equals(code)) {    
                    ResultSetContainer rsc = getData(code);            
    
                    if (rsc.size() > 0) {
                    	// if the code exists, add this user to the corresponding group
                        PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome)
                        getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                        PrincipalMgrRemote principalMgr = principalMgrHome.create();
    
                        ResultSetRow rsr = rsc.iterator().next();
                        principalMgr.addUserToGroup(principalMgr.getGroup(rsr.getLongItem("group_id")), principalMgr.getUser(getUser().getId()), new TCSubject(0));
    
                        setNextPage(rsr.getStringItem("next_page"));
                        setIsNextPageInContext(true);
                    } else {
                        getRequest().setAttribute("message", "Invalid code entered");
                        setNextPage("/util/requestPermission.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    getRequest().setAttribute("message", "You must enter a valid code");
                    setNextPage("/util/requestPermission.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        }
    }

    private ResultSetContainer getData(String code) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "code_details";

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
