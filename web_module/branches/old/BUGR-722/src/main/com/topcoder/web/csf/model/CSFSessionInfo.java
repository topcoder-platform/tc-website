package com.topcoder.web.csf.model;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.security.WebAuthentication;

import java.util.Set;
import java.util.TimeZone;

/**
 * @author dok
 * @version $Revision: 60454 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class CSFSessionInfo extends SessionInfo {
    private static final Logger log = Logger.getLogger(CSFSessionInfo.class);


    public CSFSessionInfo() {
        super();
    }

    public CSFSessionInfo(TCRequest request, WebAuthentication authentication, Set groups) throws Exception {
        super(request, authentication, groups);
    }


    public String getTimezone() {
        if (timezone == null) {
            try {
                timezone = loadTimezone();
            } catch (Exception e) {
                timezone = TimeZone.getDefault().getID();
                log.error("Could not load timezone from db, using : " + timezone);
            }
        }
        return timezone;
    }

    private String loadTimezone() throws Exception {
        CachedDataAccess tzDai = new CachedDataAccess(DBMS.CSF_DATASOURCE_NAME);
        Request tzReq = new Request();
        tzReq.setContentHandle("user_timezone");
        tzReq.setProperty(WebConstants.USER_ID, String.valueOf(getUserId()));
        return ((ResultSetContainer) tzDai.getData(tzReq).get("user_timezone")).getStringItem(0, "timezone_desc");
    }

}
