package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.security.NotAuthorizedException;

import java.util.*;

/**
 * @author dok
 * @version $Revision: 43007 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2006
 */
public class ViewSearchTask extends BaseTask {

    protected void businessProcessing() throws Exception {

        String campaignId = getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM);
        if (StringUtils.isNumber(campaignId)) {
            if (hasAccess(Long.parseLong(campaignId))) {
                Request r = new Request();
                r.setContentHandle("TCES_Campaign_Info");
                r.setProperty(TCESConstants.CAMPAIGN_ID_PARAM, campaignId);
                getRequest().setAttribute(TCESConstants.CAMPAIGN_ID_PARAM, campaignId);
                getRequest().setAttribute("campaignName",
                        ((ResultSetContainer) getDataAccess(getOltp()).getData(r).get("TCES_Campaign_Info")).getStringItem(0, "campaign_name"));
                ArrayList a = new ArrayList();
                a.add(new TrailItem(getSessionInfo().getServletPath() +
                        "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                        TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId, TCESConstants.MAIN_NAME));
                a.add(new TrailItem(getSessionInfo().getServletPath() +
                        "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                        TCESConstants.CAMPAIGN_ID_PARAM + "=" + campaignId, TCESConstants.CAMPAIGN_DETAIL_NAME));
                setTrail(a);
                getRequest().setAttribute("oltpDb", getOltp());
                searchProcessing();
            } else {
                throw new NotAuthorizedException(" cid=" + String.valueOf(campaignId) +
                        "does not belong to uid=" + String.valueOf(getUser().getId()));
            }
        } else {
            throw new TCWebException("Invalid campaign id specified " + campaignId);
        }


    }

    protected void searchProcessing() throws Exception {
        String campaignId = getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM);
        setDefault(TCESConstants.CAMPAIGN_ID_PARAM, campaignId);
        loadDefaults(getRequest());
        setNextPage(TCESConstants.SEARCH_PAGE);
        setIsNextPageInContext(true);
    }

    protected boolean hasAccess(long campaignId) throws Exception {
        if (getSessionInfo().isAdmin()) {
            return true;
        } else {
            Request r = new Request();
            r.setContentHandle("TCES_Verify_Campaign_Access");
            r.setProperty(TCESConstants.CAMPAIGN_ID_PARAM, String.valueOf(campaignId));
            r.setProperty(TCESConstants.USER_ID_PARAM, String.valueOf(getUser().getId()));
            return !((ResultSetContainer) getDataAccess(getOltp()).getData(r).get("TCES_Verify_Campaign_Access")).isEmpty();
        }


    }

    private void loadDefaults(TCRequest request) throws Exception {
        Request r = new Request();
        r.setContentHandle("tces_profile_search");
        DataAccessInt dataAccess = getDataAccess(getOltp(), true);
        Map m = dataAccess.getData(r);
        request.setAttribute("resultMap", m);
        ResultSetContainer languages = (ResultSetContainer) m.get("languages");
        ResultSetContainer demographic_questions = (ResultSetContainer) m.get("tces_demographic_questions");
        ResultSetContainer demographic_answers = (ResultSetContainer) m.get("demographics_answers");
        ResultSetContainer skill_types = (ResultSetContainer) m.get("skill_types");
        ResultSetContainer skills = (ResultSetContainer) m.get("skills");
        Enumeration e = request.getParameterNames();
        Map sel = new HashMap();
        Map skillMap = new HashMap();
        Map skillSetMap = new HashMap();
        Map demo = new HashMap();

        String[] textFields = {"handle", "email", "firstname", "lastname", "zipcode", "city", "school",
                "maxdayssincerating", "minevents", "mindays", "maxdays", "minrating", "maxrating", "mindesrating",
                "maxdesrating", "mindevrating", "maxdevrating"};
        String[] checkBoxes = {"count", "pro", "stud", "resume", "travel", "auth", "casesensitive"};
        boolean[] checkBoxDefaults = {false, true, true, false, false, false, false};

        boolean revise = "on".equals(request.getParameter("revise"));

        //setting language check boxes to be checked
        for (int i = 0; !revise && i < languages.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow lang = languages.getRow(i);
            setDefault("lang_" + lang.getIntItem("language_id"), "true");
        }
        //setting default values for all the text fields
        for (int i = 0; i < textFields.length; i++) {
            setDefault(textFields[i], request.getParameter(textFields[i]));
        }

        //setting default values for the rest of the check boxes
        for (int i = 0; i < checkBoxes.length; i++) {
            setDefault(checkBoxes[i], isOn(request.getParameter(checkBoxes[i]), !revise && checkBoxDefaults[i]));
        }

        while (e.hasMoreElements()) {
            String p = e.nextElement().toString();
            String[] v = request.getParameterValues(p);
            if (p.startsWith("skillset")) {//set all previously selected skills
                List l = new ArrayList();
                for (int i = 0; i < v.length; i++) {
                    int idx = v[i].indexOf("_");
                    int idx2 = v[i].indexOf("_", idx + 1);
                    int skillLevel = Integer.parseInt(v[i].substring(idx + 1, idx2));
                    String name = v[i].substring(idx2 + 1);
                    l.add(new ListSelectTag.Option(v[i], name + " >= " + skillLevel));
                }
                skillSetMap.put(p, l);
            } else if (p.equals("states") || p.equals("country") || p.equals("countryoforigin")) {
                //set a few more selections
                Set s = new HashSet();
                s.addAll(Arrays.asList(v));
                sel.put(p, s);
            } else if (p.startsWith("lang_")) {
                //language checkboxes
                setDefault(p, isOn(request.getParameter(p), !revise));
            }
        }
        //build all the demo tables
        ResultSetContainer.ResultSetRow row = null;
        for (int i = 0, j = 0; i < demographic_questions.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow question = demographic_questions.getRow(i);
            List answers = new ArrayList();

            Set s = new HashSet();
            long questionId = question.getLongItem("demographic_question_id");
            String[] v = request.getParameterValues("demo_" + questionId);
            if (v != null) {
                s.addAll(Arrays.asList(v));
            }

            for (Iterator it = demographic_answers.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                if (row.getLongItem("demographic_question_id") == questionId) {
                    answers.add(new ListSelectTag.Option(row.getStringItem("demographic_answer_id"),
                            row.getStringItem("demographic_answer_text"),
                            s.contains(row.getStringItem("demographic_answer_id"))));
                }
            }
            demo.put(new Long(questionId), answers);
        }

        //build all the skill tables
        ResultSetContainer.ResultSetRow skill = skills.getRow(0);
        for (int i = 0, j = 0; i < skill_types.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow type = skill_types.getRow(i);
            List l = new ArrayList();
            int skillType = type.getIntItem("skill_type_id");
            while (skill.getIntItem("skill_type_id") == skillType) {
                String text = skill.getStringItem("skill_desc");
                l.add(new ListSelectTag.Option(skill.getStringItem("skill_id"), text));
                if (++j == skills.getRowCount()) {
                    break;
                } else {
                    skill = skills.getRow(j);
                }
            }
            skillMap.put(new Integer(type.getIntItem("skill_type_id")), l);
        }

        request.setAttribute("selected", sel);
        request.setAttribute("demoMap", demo);
        request.setAttribute("skillMap", skillMap);
        request.setAttribute("skillSetMap", skillSetMap);
    }

    private String isOn(String s, boolean defaultValue) {
        return (defaultValue || "on".equals(s)) ? "true" : "false";
    }


}
