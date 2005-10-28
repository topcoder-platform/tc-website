/*
 * ContractingBase.java
 *
 * Created on October 1, 2004, 11:18 AM
 */

package com.topcoder.web.tc.controller.request.contracting;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.StringTokenizer;

import javax.naming.InitialContext;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;
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

            if (info == null) {
                info = getInfoFromDB();
            }

            info = updateContractingInfo(info);

            p.setObject(Constants.CONTRACTING_INFO, info);

            setDefaults(info);

            //check for errors based on previous page, hand off processing to
            //original processor if errors occur
            if (errorCheck()) {
                //errors occured
                ContractingBase errorProcessor = getOldProcessor();

                log.debug("ERRORS FOUND, using " + errorProcessor);
                errorProcessor.setRequest(getRequest());
                errorProcessor.setResponse(getResponse());
                errorProcessor.setAuthentication(getAuthentication());

                errorProcessor.contractingProcessing();
                errorProcessor.setNextPage();
                setNextPage(errorProcessor.getNextPage());
                setIsNextPageInContext(true);
            } else {

                contractingProcessing();

                setNextPage();
            }

            getRequest().setAttribute("isEdit", String.valueOf(info.isEdit()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected ContractingBase getOldProcessor() {
        if (getRequestParameter("previouspage").equals("preferences")) {
            return new Preferences();
        }
        return null;
    }

    protected final static String[] contractingPreferences = new String[]{"3", "4", "5", "6"};
    protected final static String[] permanentPreferences = new String[]{"8", "9"};
    protected final static String[] overallPreferences = new String[]{"10", "11", "14", "15", "16", "17", "20", "21", "22", "23"};

    protected boolean errorCheck() {
        if (getRequestParameter("previouspage") == null)
            return false;

        if (getRequestParameter("previouspage").equals("preferences")) {
            //if each checkbox is checked, they have to supply values to every
            //preference underneath it
            boolean good = false;
            if (info.getPreference(String.valueOf(Constants.PREFERENCE_CONTRACTING)) != null &&
                    info.getPreference(String.valueOf(Constants.PREFERENCE_CONTRACTING)).equals(String.valueOf(Constants.PREFERENCE_CONTRACTING_TRUE))) {
                good = true;
                //ids to check are 3,4,5,6
                for (int i = 0; i < contractingPreferences.length; i++) {
                    if (info.getPreference(contractingPreferences[i]) == null) {
                        addError(Constants.PREFERENCE_PREFIX + contractingPreferences[i], "This question is required.");
                    }
                }
            }

            if (info.getPreference(String.valueOf(Constants.PREFERENCE_PERMANENT)) != null &&
                    info.getPreference(String.valueOf(Constants.PREFERENCE_PERMANENT)).equals(String.valueOf(Constants.PREFERENCE_PERMANENT_TRUE))) {
                good = true;
                //ids to check are 3,4,5,6
                for (int i = 0; i < permanentPreferences.length; i++) {
                    if (info.getPreference(permanentPreferences[i]) == null) {
                        addError(Constants.PREFERENCE_PREFIX + permanentPreferences[i], "This question is required.");
                    }
                }
            }

            for (int i = 0; i < overallPreferences.length; i++) {
                if (info.getPreference(overallPreferences[i]) == null) {
                    addError(Constants.PREFERENCE_PREFIX + overallPreferences[i], "This question is required.");
                }
            }

            if (!good && !info.isEdit()) {
                addError(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_CONTRACTING, "Please indicate interest in either contract or permanent positions.");
            }

            try {
                ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                if ((!resumeServices.hasResume(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)) && (info.getResume() == null)) {
                    addError("Resume", "A resume is required.");
                }
            } catch (Exception e) {
                addError("Resume", "A resume is required.");
            }
            
            // user must select different priorities
            int[] priority = new int[] {21,22,23};
            for (int i = 0; i < priority.length; i++) {
            	String p1 = info.getPreference(Integer.toString(priority[i]));
            	for (int j = i+1; j < priority.length; j++) {
            		String p2 = info.getPreference(Integer.toString(priority[j]));
            		if (p1 == null || p2 == null) continue; // missing -- will get 'required' error
            		if (p1.equals(p2)) {
            			addError(Constants.PREFERENCE_PREFIX + priority[j], "You may not select the same priority twice.");
            		}
            	}
            	addError(Constants.PREFERENCE_PREFIX + priority[i], p1);
            }
            
            // user must enter a valid date for starting - id=14
            String date = info.getPreference("14");
            if (date != null) {
            	boolean valid = true;
            	int field = 0;
            	StringTokenizer tok = new StringTokenizer(date, "/");
            	if (tok.countTokens() == 3) {
            		while (tok.hasMoreTokens()) {
            			String token = tok.nextToken();
            			try {
							int value = Integer.parseInt(token);
							if (field == 0) {
								if (value < 1 || value > 12) valid = false;
							}
							else if (field == 1) {
								if (value < 1 || value > 31) valid = false;
							}
							else if (field == 2) {
								if (value < 2000 || value > 2020) valid = false;
							}
						}
						catch (NumberFormatException e) {
							valid = false;
						}
						field++;
            		}
            	}
            	else {
            		valid = false;
            	}
            	if (!valid) {
            		addError(Constants.PREFERENCE_PREFIX + "14", "Please enter a valid date in the format MM/DD/YYYY.");
            	}
            }
            
        }

        if (hasErrors())
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
        while (i.hasNext()) {
            String s = (String) i.next();
            setDefault(Constants.PREFERENCE_PREFIX + s, info.getPreference(s));
        }

        //load skill defaults
        i = info.getSkillNames();
        while (i.hasNext()) {
            String s = (String) i.next();
            setDefault(Constants.SKILL_PREFIX + s, info.getSkill(s));
        }

        //load note defaults
        i = info.getNoteNames();
        while (i.hasNext()) {
            String s = (String) i.next();
            setDefault(Constants.NOTE_PREFIX + s, info.getNote(s));
        }
    };

    protected abstract void setNextPage();

    protected ContractingInfo updateContractingInfo(ContractingInfo info) throws IOException {
        if (getRequestParameter("previouspage") != null && getRequestParameter("previouspage").equals("preferences")) {
            log.debug("LOADING DATA FROM REQUEST");
            info.clearPreferences();

            //get list of preferences
            Enumeration en = getRequest().getParameterNames();
            while (en.hasMoreElements()) {
                String param = (String) en.nextElement();
                if (param.startsWith(Constants.PREFERENCE_PREFIX)) {
                    //get id from end of string
                    String prefId = param.substring(Constants.PREFERENCE_PREFIX.length());

                    String val = getRequestParameter(param);

                    if (!val.equals("")) {
                        info.setPreference(prefId, val);
                        log.debug("SET PREFERENCE " + prefId + " TO " + val);
                    }
                }
            }

            //lookup two checkboxs, have to hardcode due to HTML limiations
            if (getRequestParameter(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_CONTRACTING) == null) {
                info.setPreference(String.valueOf(Constants.PREFERENCE_CONTRACTING), String.valueOf(Constants.PREFERENCE_CONTRACTING_FALSE));
            }

            if (getRequestParameter(Constants.PREFERENCE_PREFIX + Constants.PREFERENCE_PERMANENT) == null) {
                info.setPreference(String.valueOf(Constants.PREFERENCE_PERMANENT), String.valueOf(Constants.PREFERENCE_PERMANENT_FALSE));
            }

            //load resume, if attached
            if (getRequest() instanceof MultipartRequest) {
                MultipartRequest req = (MultipartRequest) getRequest();
                UploadedFile file = req.getUploadedFile("Resume");

                if (file != null && file.getContentType() != null) {
                    log.debug("FOUND RESUME");
                    //info.setResume(file);

                    byte[] fileBytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(fileBytes);


                    info.setResume(fileBytes);
                    info.setResumeContentType(file.getContentType());
                    info.setResumeFileName(file.getRemoteFileName());
                }
            }
        } else if (getRequestParameter("previouspage") != null && getRequestParameter("previouspage").equals("skills")) {
            //load skills
            log.debug("LOADING DATA FROM REQUEST");
            //info.clearSkills();

            //get list of preferences / notes
            Enumeration en = getRequest().getParameterNames();
            while (en.hasMoreElements()) {
                String param = (String) en.nextElement();
                if (param.startsWith(Constants.SKILL_PREFIX)) {
                    //get id from end of string
                    String skillId = param.substring(Constants.SKILL_PREFIX.length());

                    String val = getRequestParameter(param);

                    if (!val.equals("") && Integer.parseInt(val) != 0) {
                        info.setSkill(skillId, val);
                        log.debug("SET SKILL " + skillId + " TO " + val);
                    } else {
                        info.removeSkill(skillId);
                    }
                } else if (param.startsWith(Constants.NOTE_PREFIX)) {
                    //get id from end of string
                    String noteId = param.substring(Constants.NOTE_PREFIX.length());

                    String val = getRequestParameter(param);

                    if (!val.equals("")) {
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
        if (tmp == null)
            return null;

        info = (ContractingInfo) ((ContractingInfo) tmp).clone();
        return info;
    }

    protected void clearInfo() throws Exception {
        info = getInfoFromDB();

        p.removeObject(Constants.CONTRACTING_INFO);
    }

    protected ContractingInfo getInfoFromDB() throws Exception {
        ContractingInfo info = new ContractingInfo();

        log.debug("LOADING DATA FROM DB");

        info.setUserID(getUser().getId());

        InitialContext ctx = TCContext.getInitial();
        UserPreference prefbean = (UserPreference) createEJB(ctx, UserPreference.class);

        //load pref group list, then preferences in group
        Request r = new Request();
        r.setContentHandle("preference_groups");

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("preference_groups");
        for (int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(info.getUserID(), rsc.getIntItem(i, "preference_group_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscPrefs.size(); j++) {
                info.setEdit(true);
                if (rscPrefs.getIntItem(j, "preference_type_id") == Constants.PREFERENCE_TEXT_ANSWER) {
                    info.setPreference(rscPrefs.getStringItem(j, "preference_id"), rscPrefs.getStringItem(j, "value"));
                    log.debug("SET PREFERENCE " + rscPrefs.getStringItem(j, "preference_id") + " TO " + rscPrefs.getStringItem(j, "value"));
                } else {
                    info.setPreference(rscPrefs.getStringItem(j, "preference_id"), rscPrefs.getStringItem(j, "preference_value_id"));
                    log.debug("SET PREFERENCE " + rscPrefs.getStringItem(j, "preference_id") + " TO " + rscPrefs.getStringItem(j, "preference_value_id"));
                }
            }
        }

        /*if(!info.isEdit())
            return info;*/

        //load skills
        CoderSkill skillbean = (CoderSkill) createEJB(ctx, CoderSkill.class);

        r = new Request();
        r.setContentHandle("skill_types");

        rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_types");
        for (int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscSkills = skillbean.getSkillsByType(info.getUserID(), rsc.getIntItem(i, "skill_type_id"), DBMS.OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscSkills.size(); j++) {
                info.setSkill(rscSkills.getStringItem(j, "skill_id"), rscSkills.getStringItem(j, "ranking"));
                log.debug("SET SKILL " + rscSkills.getStringItem(j, "skill_id") + " TO " + rscSkills.getStringItem(j, "ranking"));
            }
        }

        //notes
        r = new Request();
        r.setContentHandle("contracting_user_notes");
        r.setProperty("uid", String.valueOf(info.getUserID()));

        rsc = (ResultSetContainer) getDataAccess().getData(r).get("contracting_user_notes");
        for (int i = 0; i < rsc.size(); i++) {
            info.setNote(rsc.getStringItem(i, "note_type_id"), rsc.getStringItem(i, "text"));
            log.debug("SET NOTE " + rsc.getStringItem(i, "note_type_id") + " TO " + rsc.getStringItem(i, "text"));
        }

        return info;
    }

}
