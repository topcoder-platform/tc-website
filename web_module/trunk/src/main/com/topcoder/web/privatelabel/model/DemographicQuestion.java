package com.topcoder.web.privatelabel.model;

import com.topcoder.shared.util.logging.Logger;

import java.util.*;

public class DemographicQuestion extends Base {
    protected static Logger log = Logger.getLogger(DemographicQuestion.class);

    public static final int MULTIPLE_SELECT = 1;
    public static final int SINGLE_SELECT = 2;
    public static final int FREE_FORM = 3;

    private long id;
    private String text;
    private String desc;
    private String selectable;
    private boolean required;
    private TreeMap answers;

    public DemographicQuestion() {}

    public Object clone() throws OutOfMemoryError {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(id);
        ret.setText(text);
        ret.setDesc(desc);
        ret.setSelectable(selectable);
        ret.setRequired(required);
        TreeMap list = new TreeMap();
        DemographicAnswer a = null;
        for (Iterator it = answers.values().iterator(); it.hasNext();) {
            a = (DemographicAnswer)it.next();
            list.put(new Long(a.getAnswerId()), a.clone());
        }
        ret.setAnswers(list);
        return ret;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
            for (Iterator it = answers.values().iterator(); it.hasNext();) {
                list.add(((DemographicAnswer)it.next()).clone());
            }
        }
        return list;
    }

    public void setAnswers(List answers) {
        this.answers = new TreeMap();
        DemographicAnswer a = null;
        for (Iterator it = answers.iterator(); it.hasNext();) {
            a = (DemographicAnswer)it.next();
            this.answers.put(new Long(a.getAnswerId()), a.clone());
        }
    }

    private void setAnswers(TreeMap answers) {
        this.answers = answers;
    }

    public DemographicAnswer getAnswer(long answerId) {
        DemographicAnswer ret = (DemographicAnswer)answers.get(new Long(answerId));
        return (DemographicAnswer)ret.clone();
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

    public boolean isRequired() {
        return required;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }
}
