package com.topcoder.web.privatelabel.model;

import com.topcoder.shared.util.logging.Logger;

import java.util.List;
import java.util.ArrayList;

public class DemographicQuestion extends Base {
    protected static Logger log = Logger.getLogger(DemographicQuestion.class);

    public static final int MULTIPLE_SELECT = 1;
    public static final int SINGLE_SELECT = 2;
    public static final int FREE_FORM = 3;

    private long questionId;
    private String text;
    private String desc;
    private String selectable;
    private List answers;

    public DemographicQuestion() {}

    public Object clone() throws OutOfMemoryError {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setQuestionId(questionId);
        ret.setText(text);
        ret.setDesc(desc);
        ret.setSelectable(selectable);
        List list = new ArrayList(answers.size());
        for (int i=0; i<answers.size(); i++) {
            list.set(i, ((DemographicAnswer)answers.get(i)).clone());
        }
        ret.setAnswers(list);
        return ret;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List getAnswers() {
        List list = null;
        if (answers!=null) {
            list = new ArrayList(answers.size());
            for (int i=0; i<answers.size(); i++) {
                list.add(((DemographicAnswer)answers.get(i)).clone());
            }
        }
        return list;
    }

    public void setAnswers(List answers) {
        this.answers = answers;
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
