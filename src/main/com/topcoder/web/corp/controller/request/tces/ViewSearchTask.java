package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.common.TCRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2006
 */
public class ViewSearchTask extends BaseTask {

    private long campaignId;

    protected void businessProcessing() throws Exception {

        setCampaignId(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        setNextPage(TCESConstants.SEARCH_PAGE);
        setIsNextPageInContext(true);
        
    }

    public long getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(long campaignId) {
        this.campaignId = campaignId;
    }


    private void getProfileSearch(TCRequest request) throws Exception {
        Request r = new Request();
        r.setContentHandle("profile_search");
        DataAccessInt dataAccess = getDataAccess(getOltp(), true);
        Map m = dataAccess.getData(r);
        request.setAttribute("resultMap", m);
        ResultSetContainer languages = (ResultSetContainer) m.get("languages");
        ResultSetContainer demographic_questions = (ResultSetContainer) m.get("demographics_questions");
        ResultSetContainer demographic_answers = (ResultSetContainer) m.get("demographics_answers");
        ResultSetContainer skill_types = (ResultSetContainer) m.get("skill_types");
        ResultSetContainer skills = (ResultSetContainer) m.get("skills");
        Enumeration e = request.getParameterNames();
        Map sel = new HashMap();
        Map skillMap = new HashMap();
        Map skillSetMap = new HashMap();
        Map demo = new HashMap();

        String[] textFields = {"handle", "email", "firstname", "lastname", "zipcode", "city", "company", "school",
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
            //todo setDefault(checkBoxes[i], isOn(request.getParameter(checkBoxes[i]), !revise && checkBoxDefaults[i]));
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
            } else if (p.equals("states") || p.equals("country") || p.equals("countryoforigin") || p.equals("notifications")) {
                //set a few more selections
                Set s = new HashSet();
                s.addAll(Arrays.asList(v));
                sel.put(p, s);
            } else if (p.startsWith("lang_")) {
                //language checkboxes
                //todo setDefault(p, isOn(request.getParameter(p), !revise));
            }
        }
        //build all the demo tables
        ResultSetContainer.ResultSetRow answer = demographic_answers.getRow(0);
        for (int i = 0, j = 0; i < demographic_questions.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow question = demographic_questions.getRow(i);
            List l = new ArrayList();
            int questionId = question.getIntItem("demographic_question_id");
            Set s = new HashSet();
            String[] v = request.getParameterValues("demo_" + questionId);
            if (v != null) {
                s.addAll(Arrays.asList(v));
            }
            while (answer.getIntItem("demographic_question_id") == questionId) {
                String text = answer.getStringItem("demographic_answer_text");
                String answerId = answer.getStringItem("demographic_answer_id");
                l.add(new ListSelectTag.Option(answerId, text, s.contains(answerId)));
                if (++j == demographic_answers.getRowCount()) {
                    break;
                } else {
                    answer = demographic_answers.getRow(j);
                }
            }
            demo.put(new Integer(questionId), l);
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



}
