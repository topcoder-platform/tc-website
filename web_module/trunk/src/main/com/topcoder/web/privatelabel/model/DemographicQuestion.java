package com.topcoder.web.privatelabel.model;

import com.topcoder.shared.util.logging.Logger;

import java.util.List;
import java.util.ArrayList;

public class DemographicQuestion extends Base {
    protected static Logger log = Logger.getLogger(DemographicQuestion.class);

    public static final int MULTIPLE_SELECT = 1;
    public static final int SINGLE_SELECT = 2;
    public static final int FREE_FORM = 3;

    private long demographicQuestionId;
    private String demographicQuestionText;
    private String demographicQuestionDesc;
    private String selectable;
    private List demographicAnswers;

    public DemographicQuestion() {}

    public Object clone() throws OutOfMemoryError {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setDemographicQuestionId(demographicQuestionId);
        ret.setDemographicQuestionText(demographicQuestionText);
        ret.setDemographicQuestionDesc(demographicQuestionDesc);
        ret.setSelectable(selectable);
        List list = new ArrayList(demographicAnswers.size());
        for (int i=0; i<demographicAnswers.size(); i++) {
            list.set(i, ((DemographicAnswer)demographicAnswers.get(i)).clone());
        }
        ret.setDemographicAnswers(list);
        return ret;
    }

    public long getDemographicQuestionId() {
        return demographicQuestionId;
    }

    public void setDemographicQuestionId(long demographicQuestionId) {
        this.demographicQuestionId = demographicQuestionId;
    }

    public String getDemographicQuestionText() {
        return demographicQuestionText;
    }

    public void setDemographicQuestionText(String demographicQuestionText) {
        this.demographicQuestionText = demographicQuestionText;
    }

    public String getDemographicQuestionDesc() {
        return demographicQuestionDesc;
    }

    public void setDemographicQuestionDesc(String demographicQuestionDesc) {
        this.demographicQuestionDesc = demographicQuestionDesc;
    }

    public List getDemographicAnswers() {
        List list = null;
        if (demographicAnswers!=null) {
            log.debug(demographicAnswers.size() + " answers found");
            list = new ArrayList(demographicAnswers.size());
            for (int i=0; i<demographicAnswers.size(); i++) {
                list.set(i, ((DemographicAnswer)demographicAnswers.get(i)).clone());
            }
            log.debug(list.size() + " answers generated");
        }
        return list;
    }

    public void setDemographicAnswers(List demographicAnswers) {
        this.demographicAnswers = demographicAnswers;
    }

    public int getAnswerType() {
        if (selectable.equals("M")) return MULTIPLE_SELECT;
        else if (selectable.equals("Y")) return SINGLE_SELECT;
        else if (selectable.equals("N")) return FREE_FORM;
        throw new RuntimeException("Invalid type found: " + selectable);
    }

    public void setSelectable(String selectable) {
        this.selectable = selectable;
    }
}
