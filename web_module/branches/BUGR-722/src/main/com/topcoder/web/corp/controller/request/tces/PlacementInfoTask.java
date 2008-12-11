package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.ContractingInfo;
import com.topcoder.web.common.model.ContractingResponse;
import com.topcoder.web.common.model.ContractingResponseGroup;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.UserPreference;

import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 43007 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 27, 2006
 */
public class PlacementInfoTask extends BaseTask {
    private static Logger log = Logger.getLogger(PlacementInfoTask.class);

    //campaign, job user

    protected void businessProcessing() throws TCWebException {
        try {
            //load preference groups
            ArrayList groups = new ArrayList();
            long memberId = Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM));
            long campaignId = Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM));
            long jobId = Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM));
            getRequest().setAttribute(TCESConstants.MEMBER_ID_PARAM, String.valueOf(memberId));

            getRequest().setAttribute("isRestrictedCampaign", String.valueOf(isRestrictedCampaign(campaignId)));

            Contact contact = (Contact) BaseProcessor.createEJB(getInitialContext(), Contact.class);
            getRequest().setAttribute(TCESConstants.COMPANY_ID, new Long(contact.getCompanyId(getUser().getId(), getOltp())));

            Map memberData = getInfo(memberId, campaignId, jobId);
            if (!getSessionInfo().isAdmin() && ((ResultSetContainer)memberData.get("TCES_Verify_Member_Access")).isEmpty()) {
                throw new NotAuthorizedException(" mid=" + memberId
                        + " jid=" + jobId
                        + " cid=" + campaignId
                        + "does not belong to uid=" + getUser().getId());
            }

            getRequest().setAttribute(TCESConstants.CAMPAIGN_ID_PARAM, String.valueOf(campaignId));
            getRequest().setAttribute(TCESConstants.MEMBER_ID_PARAM, String.valueOf(memberId));
            getRequest().setAttribute(TCESConstants.JOB_ID_PARAM, String.valueOf(jobId));

            Request dwDataRequest = new Request();
            dwDataRequest.setContentHandle("tces_member_profile");
            dwDataRequest.setProperty("mid", String.valueOf(memberId));
            Map dwResultMap = getDataAccess(DBMS.DW_DATASOURCE_NAME).getData(dwDataRequest);
            ResultSetContainer dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats");
            getRequest().setAttribute("is_ranked", String.valueOf(!dwRSC.isEmpty()));


            getRequest().setAttribute("memberData", memberData);
            ResumeServices rServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            getRequest().setAttribute("has_resume", String.valueOf(rServices.hasResume(memberId, DBMS.OLTP_DATASOURCE_NAME)));

            ContractingInfo info = getInfoFromDB(memberId);

            Request r = new Request();
            r.setContentHandle("preference_groups");

            ResultSetContainer rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("preference_groups");
            for (int i = 0; i < rsc.size(); i++) {

                String name = rsc.getStringItem(i, "preference_group_desc");

                //load preferences here
                Request rpref = new Request();
                rpref.setContentHandle("preferences_by_group");
                rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));

                ContractingResponseGroup g = new ContractingResponseGroup();

                g.setName(name);

                ResultSetContainer rscPref = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(rpref).get("preferences_by_group");
                for (int j = 0; j < rscPref.size(); j++) {

                    String text = rscPref.getStringItem(j, "preference_desc");
                    int type = rscPref.getIntItem(j, "preference_type_id");
                    int id = rscPref.getIntItem(j, "preference_id");

                    if (type == TCESConstants.PREFERENCE_TEXT_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                        String answer = info.getPreference(String.valueOf(id));

                        ContractingResponse rsp = new ContractingResponse();
                        rsp.setName(text);
                        rsp.setVal(answer);

                        g.addResponse(rsp);
                    }
                    else if (type != TCESConstants.PREFERENCE_SINGLE_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                        //look up answer
                        String answer = "";

                        Request rval = new Request();
                        rval.setContentHandle("preference_values");
                        rval.setProperty("prid", String.valueOf(rscPref.getIntItem(j, "preference_id")));

                        ResultSetContainer rscVal = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(rval).get("preference_values");

                        for (int x = 0; x < rscVal.size(); x++) {

                            if (info.getPreference(String.valueOf(id)).equals(String.valueOf(rscVal.getIntItem(x, "preference_value_id")))) {
                                answer = rscVal.getStringItem(x, "value");
                            }

                        }

                        ContractingResponse rsp = new ContractingResponse();
                        rsp.setName(text);
                        rsp.setVal(answer);

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
            r.setProperty("stid", String.valueOf(TCESConstants.SKILL_TYPE_TECHNOLOGIES));

            rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_list");
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
            getRequest().setAttribute("techNote", getNote(TCESConstants.TECH_NOTE_TYPE_ID, memberId));

            //database skill
            ArrayList dbSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(TCESConstants.SKILL_TYPE_DATABASES));

            rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_list");
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
            getRequest().setAttribute("dbNote", getNote(TCESConstants.DB_NOTE_TYPE_ID, memberId));

            //languages skill
            ArrayList langSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(TCESConstants.SKILL_TYPE_LANGUAGES));

            rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_list");
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
            getRequest().setAttribute("langNote", getNote(TCESConstants.LANGUAGE_NOTE_TYPE_ID, memberId));

            //os skill
            ArrayList osSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(TCESConstants.SKILL_TYPE_OS));

            rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_list");
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
            getRequest().setAttribute("osNote", getNote(TCESConstants.OS_NOTE_TYPE_ID, memberId));

            //industries skill
            ArrayList industrySkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(TCESConstants.SKILL_TYPE_INDUSTRIES));

            rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_list");
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
            getRequest().setAttribute("industryNote", getNote(TCESConstants.INDUSTRY_NOTE_TYPE_ID, memberId));

            getRequest().setAttribute("contractingInfo", info);




            ArrayList a = new ArrayList();
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId, TCESConstants.MAIN_NAME));
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId, TCESConstants.CAMPAIGN_DETAIL_NAME));
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId, TCESConstants.CAMPAIGN_INTEREST_NAME));
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.POSITION_INTEREST_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId + "&" +
                    TCESConstants.JOB_ID_PARAM + "=" + jobId, TCESConstants.POSITION_INTEREST_NAME));
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MEMBER_PROFILE_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId + "&" +
                    TCESConstants.JOB_ID_PARAM + "=" + jobId + "&" + TCESConstants.MEMBER_ID_PARAM +
                    "=" + memberId, TCESConstants.MEMBER_PROFILE_NAME));
            setTrail(a);



            setNextPage(TCESConstants.PLACEMENT_INFO_PAGE);
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
        r.setProperty(TCESConstants.USER_ID, String.valueOf(userId));
        r.setProperty("ntid", String.valueOf(noteTypeId));
        ResultSetContainer skillNote = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_note");
        if (skillNote.isEmpty())
            return "";
        else
            return skillNote.getStringItem(0, "text");

    }

    protected ContractingInfo getInfoFromDB(long userId) throws Exception {
        ContractingInfo info = new ContractingInfo();

        log.debug("LOADING DATA FROM DB");

        info.setUserID(userId);

        InitialContext ctx = getInitialContext();
        UserPreference prefbean = (UserPreference) createEJB(ctx, UserPreference.class);

        //load pref group list, then preferences in group
        Request r = new Request();
        r.setContentHandle("preference_groups");

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("preference_groups");
        for (int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(userId, rsc.getIntItem(i, "preference_group_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscPrefs.size(); j++) {
                info.setEdit(true);
                if (rscPrefs.getIntItem(j, "preference_type_id") == TCESConstants.PREFERENCE_TEXT_ANSWER) {
                    info.setPreference(rscPrefs.getStringItem(j, "preference_id"), rscPrefs.getStringItem(j, "value"));
                    log.debug("SET PREFERENCE " + rscPrefs.getStringItem(j, "preference_id") + " TO " + rscPrefs.getStringItem(j, "value"));
                } else {
                    info.setPreference(rscPrefs.getStringItem(j, "preference_id"), rscPrefs.getStringItem(j, "preference_value_id"));
                    log.debug("SET PREFERENCE " + rscPrefs.getStringItem(j, "preference_id") + " TO " + rscPrefs.getStringItem(j, "preference_value_id"));
                }
            }
        }

        if (info.getPreference(String.valueOf(TCESConstants.PREFERENCE_CONTRACTING))==null
                &&info.getPreference(String.valueOf(TCESConstants.PREFERENCE_PERMANENT))==null) {
            getRequest().setAttribute("hasInfo", String.valueOf(false));
        } else {
            getRequest().setAttribute("hasInfo", String.valueOf(true));
        }

        //load skills
        CoderSkill skillbean = (CoderSkill) createEJB(ctx, CoderSkill.class);

        r = new Request();
        r.setContentHandle("skill_types");

        rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("skill_types");
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

        rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("contracting_user_notes");
        for (int i = 0; i < rsc.size(); i++) {
            info.setNote(rsc.getStringItem(i, "note_type_id"), rsc.getStringItem(i, "text"));
            log.debug("SET NOTE " + rsc.getStringItem(i, "note_type_id") + " TO " + rsc.getStringItem(i, "text"));
        }

        return info;
    }

    private Map getInfo(long memberId, long campaignId, long jobId) throws Exception {
            Request r = new Request();
            r.setContentHandle("tces_member_profile");
            r.setProperty(TCESConstants.MEMBER_ID_PARAM, String.valueOf(memberId));
            r.setProperty(TCESConstants.CAMPAIGN_ID_PARAM, String.valueOf(campaignId));
            r.setProperty(TCESConstants.JOB_ID_PARAM, String.valueOf(jobId));
            r.setProperty(TCESConstants.USER_ID_PARAM, String.valueOf(getUser().getId()));

            return getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r);
        }

}
