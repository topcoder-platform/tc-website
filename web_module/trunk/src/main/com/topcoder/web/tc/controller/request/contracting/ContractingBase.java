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
import java.util.Iterator;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.tc.model.ContractingInfo;

import com.topcoder.web.common.MultipartRequest;
import com.topcoder.servlet.request.*;

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
            
            //check for errors based on previous page, hand off processing to
            //original processor if errors occur
            if(errorCheck()) {
                //errors occured
                ContractingBase errorProcessor = getOldProcessor();
                
                log.debug("ERRORS FOUND, using " + errorProcessor);
                errorProcessor.setRequest(getRequest());
                errorProcessor.setResponse(getResponse());
                
                errorProcessor.contractingProcessing();
                errorProcessor.setNextPage();
                setNextPage(errorProcessor.getNextPage());
                setIsNextPageInContext(true);
            } else {
            
                contractingProcessing();  
            
                setNextPage();
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected ContractingBase getOldProcessor() {
        if(getRequestParameter("previouspage").equals("preferences"))
        {
            return new Preferences();
        }
        return null;
    }
    
    protected final static String[] contractingPreferences = new String[] { "3", "4", "5", "6"};
    protected final static String[] permanentPreferences = new String[] { "8", "9"};
    
    protected boolean errorCheck() {
        if(getRequestParameter("previouspage") == null)
            return false;
        
        if(getRequestParameter("previouspage").equals("preferences"))
        {
            //if each checkbox is checked, they have to supply values to every
            //preference underneath it
            boolean good = false;
            if(info.getPreference(Constants.PREFERENCE_CONTRACTING) != null &&
                info.getPreference(Constants.PREFERENCE_CONTRACTING).equals(Constants.PREFERENCE_CONTRACTING_TRUE))
            {
                good = true;
                //ids to check are 3,4,5,6
                for(int i = 0 ; i < contractingPreferences.length; i++) {
                    if(info.getPreference(contractingPreferences[i]) == null) {
                        addError(Constants.PREFERENCE_PREFIX + contractingPreferences[i], "This question is required.");
                    }
                }
            }
            
            if(info.getPreference(Constants.PREFERENCE_PERMANENT) != null &&
                info.getPreference(Constants.PREFERENCE_PERMANENT).equals(Constants.PREFERENCE_PERMANENT_TRUE))
            {
                good = true;
                //ids to check are 3,4,5,6
                for(int i = 0 ; i < permanentPreferences.length; i++) {
                    if(info.getPreference(permanentPreferences[i]) == null) {
                        addError(Constants.PREFERENCE_PREFIX + permanentPreferences[i], "This question is required.");
                    }
                }
            }
            
            if(!good) {
                addError(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_CONTRACTING, "Please indicate interest in either contract or permanent positions.");
            }
            
        }
        
        if(hasErrors())
                return true;
        return false; 
    }
    
    protected static DataAccessInt getDataAccess() throws Exception { 
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
       return dAccess;
    }
    
    protected void setDefaults(ContractingInfo info) {
        //load preference defaults
        Iterator i = info.getPreferenceNames();     
        while(i.hasNext()) {
            String s = (String)i.next();
            setDefault(Constants.PREFERENCE_PREFIX + s, info.getPreference(s)); 
        }
        
        //load skill defaults
        i = info.getSkillNames();     
        while(i.hasNext()) {
            String s = (String)i.next();
            setDefault(Constants.SKILL_PREFIX + s, info.getSkill(s)); 
        }
        
        //load note defaults
        i = info.getNoteNames();     
        while(i.hasNext()) {
            String s = (String)i.next();
            setDefault(Constants.NOTE_PREFIX + s, info.getNote(s)); 
        }
    };
    
    protected abstract void setNextPage();
    
    protected ContractingInfo updateContractingInfo(ContractingInfo info) {
        if(getRequestParameter("previouspage") != null && getRequestParameter("previouspage").equals("preferences")) {
            log.debug("LOADING DATA FROM REQUEST");
            info.clearPreferences();
            
            //get list of preferences 
            Enumeration en = getRequest().getParameterNames();
            while(en.hasMoreElements()) {
                String param = (String)en.nextElement();
                if(param.startsWith(Constants.PREFERENCE_PREFIX)) {
                    //get id from end of string
                    String prefId = param.substring(Constants.PREFERENCE_PREFIX.length());
                        
                    String val = getRequestParameter(param);
                    
                    if(!val.equals("")) {
                        info.setPreference(prefId, val);
                        log.debug("SET PREFERENCE " + prefId + " TO " + val);
                    }
                }
            }
            
            //lookup two checkboxs, have to hardcode due to HTML limiations
            if(getRequestParameter(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_CONTRACTING) == null) {
                info.setPreference(Constants.PREFERENCE_CONTRACTING, Constants.PREFERENCE_CONTRACTING_FALSE);
            }
            
            if(getRequestParameter(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_PERMANENT) == null) {
                info.setPreference(Constants.PREFERENCE_PERMANENT, Constants.PREFERENCE_PERMANENT_FALSE);
            }
            
            //load resume, if attached
            if(getRequest() instanceof MultipartRequest) {
                MultipartRequest req = (MultipartRequest)getRequest();
                UploadedFile file = req.getUploadedFile("Resume"); 

                if (file != null && file.getContentType() != null) {
                    log.debug("FOUND RESUME");
                    info.setResume(file); 
                }
            }
        } else if(getRequestParameter("previouspage") != null && getRequestParameter("previouspage").equals("skills")) {
            //load skills
            log.debug("LOADING DATA FROM REQUEST");
            //info.clearSkills();
            
            //get list of preferences / notes
            Enumeration en = getRequest().getParameterNames();
            while(en.hasMoreElements()) {
                String param = (String)en.nextElement();
                if(param.startsWith(Constants.SKILL_PREFIX)) {
                    //get id from end of string
                    String skillId = param.substring(Constants.SKILL_PREFIX.length());
                        
                    String val = getRequestParameter(param);
                    
                    if(!val.equals("") && Integer.parseInt(val) != 0) {
                        info.setSkill(skillId, val);
                        log.debug("SET SKILL " + skillId + " TO " + val);
                    } else {
                        info.removeSkill(skillId);
                    }
                } else if(param.startsWith(Constants.NOTE_PREFIX)) {
                    //get id from end of string
                    String noteId = param.substring(Constants.NOTE_PREFIX.length());
                        
                    String val = getRequestParameter(param);
                    
                    if(!val.equals("")) {
                        info.setNote(noteId, val);
                        log.debug("SET NOTE " + noteId + " TO " + val);
                    } else {
                        info.removeNote(noteId);
                    }
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
        
        Object tmp = p.getObject(Constants.CONTRACTING_INFO);
        if(tmp == null)
            return null;
        
        info = (ContractingInfo)((ContractingInfo)tmp).clone();
        return info;
    }
    
    protected void clearInfo() {
        info = null;
        
        p.removeObject(Constants.CONTRACTING_INFO);
    }
    
    protected ContractingInfo getInfoFromDB() {
        ContractingInfo info = new ContractingInfo();
        
        log.debug("LOADING DATA FROM DB");
        
        info.setUserID(getUser().getId());
        
        return info;
    }
    
}
