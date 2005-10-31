package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.tc.model.ContractingResponse;
import com.topcoder.web.tc.model.ContractingResponseGroup;

import javax.naming.InitialContext;
import java.util.ArrayList;

/**
 * User: dok
 * Date: Oct 27, 2004
 */
public class PlacementInfoDetail extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            //load preference groups
            ArrayList groups = new ArrayList();
            long userId = Long.parseLong(getRequest().getParameter("uid"));
            ContractingInfo info = getInfoFromDB(userId);

            Request r = new Request();
            r.setContentHandle("preference_groups");

            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("preference_groups");
            for (int i = 0; i < rsc.size(); i++) {

                String name = rsc.getStringItem(i, "preference_group_desc");

                //load preferences here
                Request rpref = new Request();
                rpref.setContentHandle("preferences_by_group");
                rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));

                ContractingResponseGroup g = new ContractingResponseGroup();

                g.setName(name);

                ResultSetContainer rscPref = (ResultSetContainer) getDataAccess().getData(rpref).get("preferences_by_group");
                for (int j = 0; j < rscPref.size(); j++) {

                    String text = rscPref.getStringItem(j, "preference_desc");
                    int type = rscPref.getIntItem(j, "preference_type_id");
                    int id = rscPref.getIntItem(j, "preference_id");
                    
                    if (type == Constants.PREFERENCE_TEXT_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                    	String answer = info.getPreference(String.valueOf(id));
                    	
                    	ContractingResponse rsp = new ContractingResponse();
                        rsp.setName(text);
                        rsp.setVal(answer + "-A");

                        g.addResponse(rsp);
                    }
                    else if (type != Constants.PREFERENCE_SINGLE_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                        //look up answer
                        String answer = "";

                        Request rval = new Request();
                        rval.setContentHandle("preference_values");
                        rval.setProperty("prid", String.valueOf(rscPref.getIntItem(j, "preference_id")));

                        ResultSetContainer rscVal = (ResultSetContainer) getDataAccess().getData(rval).get("preference_values");

                        for (int x = 0; x < rscVal.size(); x++) {

                            if (info.getPreference(String.valueOf(id)).equals(String.valueOf(rscVal.getIntItem(x, "preference_value_id")))) {
                                answer = rscVal.getStringItem(x, "value");
                            }

                        }

                        ContractingResponse rsp = new ContractingResponse();
                        rsp.setName(text);
                        rsp.setVal(answer + "-B");

                        g.addResponse(rsp);
                    }

                }

                if (g.getResponses().size() != 0) {
                    groups.add(g);
                }
            }

            getRequest().setAttribute("prefs", groups);

            //tech skill
            ArrayList techSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_TECHNOLOGIES));

            rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if (info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    techSkills.add(resp);
                }
            }

            getRequest().setAttribute("techSkills", techSkills);
            getRequest().setAttribute("techNote", getNote(Constants.TECH_NOTE_TYPE_ID, userId));

            //database skill
            ArrayList dbSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_DATABASES));

            rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if (info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    dbSkills.add(resp);
                }
            }

            getRequest().setAttribute("dbSkills", dbSkills);
            getRequest().setAttribute("dbNote", getNote(Constants.DB_NOTE_TYPE_ID, userId));

            //languages skill
            ArrayList langSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_LANGUAGES));

            rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if (info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    langSkills.add(resp);
                }
            }

            getRequest().setAttribute("langSkills", langSkills);
            getRequest().setAttribute("langNote", getNote(Constants.LANGUAGE_NOTE_TYPE_ID, userId));

            //os skill
            ArrayList osSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_OS));

            rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if (info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    osSkills.add(resp);
                }
            }

            getRequest().setAttribute("osSkills", osSkills);
            getRequest().setAttribute("osNote", getNote(Constants.OS_NOTE_TYPE_ID, userId));

            //industries skill
            ArrayList industrySkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_INDUSTRIES));

            rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if (info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    industrySkills.add(resp);
                }
            }
            getRequest().setAttribute("industrySkills", industrySkills);
            getRequest().setAttribute("industryNote", getNote(Constants.INDUSTRY_NOTE_TYPE_ID, userId));

            Request noteRequest = new Request();
            noteRequest.setContentHandle("has_notes");
            noteRequest.setProperty(Constants.USER_ID, String.valueOf(userId));
            ResultSetContainer hasNotesRSC = (ResultSetContainer) getDataAccess().getData(noteRequest).get("has_notes");
            getRequest().setAttribute("has_notes", new Boolean(hasNotesRSC.getStringItem(0, "has_notes").equals("1")));

            ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);

            User user = (User) createEJB(getInitialContext(), User.class);
            getRequest().setAttribute(Constants.HANDLE, user.getHandle(userId, DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute("has_resume", String.valueOf(resumeServices.hasResume(userId, DBMS.OLTP_DATASOURCE_NAME)));
            getRequest().setAttribute("contractingInfo", info);


            setNextPage(Constants.PLACEMENT_INFO_DETAIL);
            setIsNextPageInContext(true);

        } catch (TCWebException tce) {
            throw tce;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected String getNote(int noteTypeId, long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("skill_note");
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty("ntid", String.valueOf(noteTypeId));
        ResultSetContainer skillNote = (ResultSetContainer) getDataAccess().getData(r).get("skill_note");
        if (skillNote.isEmpty())
            return "";
        else
            return skillNote.getStringItem(0, "text");

    }

    protected ContractingInfo getInfoFromDB(long userId) throws Exception {
        ContractingInfo info = new ContractingInfo();

        log.debug("LOADING DATA FROM DB");

        info.setUserID(userId);

        InitialContext ctx = TCContext.getInitial();
        UserPreference prefbean = (UserPreference) createEJB(ctx, UserPreference.class);

        //load pref group list, then preferences in group
        Request r = new Request();
        r.setContentHandle("preference_groups");

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("preference_groups");
        for (int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(userId, rsc.getIntItem(i, "preference_group_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscPrefs.size(); j++) {
                info.setEdit(true);
                info.setPreference(rscPrefs.getStringItem(j, "preference_id"), rscPrefs.getStringItem(j, "preference_value_id"));
                log.debug("SET PREFERENCE " + rscPrefs.getStringItem(j, "preference_id") + " TO " + rscPrefs.getStringItem(j, "preference_value_id"));
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
            ResultSetContainer rscSkills = skillbean.getSkillsByType(userId, rsc.getIntItem(i, "skill_type_id"), DBMS.OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscSkills.size(); j++) {
                info.setSkill(rscSkills.getStringItem(j, "skill_id"), rscSkills.getStringItem(j, "ranking"));
                log.debug("SET SKILL " + rscSkills.getStringItem(j, "skill_id") + " TO " + rscSkills.getStringItem(j, "ranking"));
            }
        }

        //notes
        r = new Request();
        r.setContentHandle("contracting_user_notes");
        r.setProperty("uid", String.valueOf(userId));

        rsc = (ResultSetContainer) getDataAccess().getData(r).get("contracting_user_notes");
        for (int i = 0; i < rsc.size(); i++) {
            info.setNote(rsc.getStringItem(i, "note_type_id"), rsc.getStringItem(i, "text"));
            log.debug("SET NOTE " + rsc.getStringItem(i, "note_type_id") + " TO " + rsc.getStringItem(i, "text"));
        }

        return info;
    }


}
