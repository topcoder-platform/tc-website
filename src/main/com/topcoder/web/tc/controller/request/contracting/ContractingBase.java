/*
 * ContractingBase.java
 *
 * Created on October 1, 2004, 11:18 AM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.shared.security.Persistor;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import java.util.Enumeration;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.tc.model.ContractingInfo;
/**
 *
 * @author  rfairfax
 */
abstract public class ContractingBase extends BaseProcessor {
     
    protected Persistor p; 
    protected ContractingInfo info;
    protected static Logger log = Logger.getLogger(ContractingBase.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified())
                throw new PermissionException(getUser(), new ClassResource(this.getClass())); 
            
            p = new SessionPersistor(getRequest().getSession(true));

            info = getInfoFromPersistor();
            
            if(info == null) {
                info = getInfoFromDB();
            }
            
            info = updateContractingInfo(info);
            
            p.setObject(Constants.CONTRACTING_INFO, info);
            
            setDefaults(info);
            
            contractingProcessing();  
            
            setNextPage();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected static DataAccessInt getDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
       return dAccess;
    }
    
    protected void setDefaults(ContractingInfo info) {
        
        
    };
    
    protected abstract void setNextPage();
    
    protected ContractingInfo updateContractingInfo(ContractingInfo info) {
        if(getRequestParameter("dataToLoad") != null && getRequestParameter("dataToLoad").equals("preferences")) {
            log.debug("LOADING DATA FROM REQUEST");
            info.clearPreferences();
            
            //get list of preferences 
            Enumeration en = getRequest().getParameterNames();
            while(en.hasMoreElements()) {
                String param = (String)en.nextElement();
                if(param.startsWith(Constants.PREFERENCE_PREFIX)) {
                    //get id from end of string
                    String prefId = param.substring(Constants.PREFERENCE_PREFIX.length());
                        
                    String val = getRequestParamater(param);
                    
                    info.setPreference(prefId, val);
                    log.debug("SET PREFERENCE " + prefId + " TO " + val);
                }
            }
        } else {
            log.debug("NO DATA TO LOAD FROM REQUEST");
            log.debug("FIELD IS " + getRequestParameter("dataToLoad"));
        }
        
        return info;
    }
    
    public String getRequestParameter(String param) {
        return getRequest().getParameter(param);
    }
    
    public boolean hasRequestParameter(String param) {
        return getRequest().getParameter(param) != null;
    }
    
    protected abstract void contractingProcessing() throws TCWebException;

    protected ContractingInfo getInfoFromPersistor() {
        ContractingInfo info = null;
        
        log.debug("LOADING DATA FROM PERSISTOR");
        
        info = (ContractingInfo)p.getObject(Constants.CONTRACTING_INFO);
        return info;
    }
    
    protected ContractingInfo getInfoFromDB() {
        ContractingInfo info = new ContractingInfo();
        
        log.debug("LOADING DATA FROM DB");
        
        info.setUserID(getUser().getId());
        
        return info;
    }
    
}
