package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.DemographicAnswer;
import com.topcoder.common.web.data.DemographicAssignment;
import com.topcoder.common.web.data.DemographicQuestion;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class Demographic
        extends BodyTagSupport {
    public static final String QUESTION_ID = "demographicQuestionId";
    public static final String QUESTION = "demographicQuestion";
    public static final String ANSWER = "demographicAnswer";
    public static final String DESCRIPTION = "demographicDescription";
    public static final String PREFIX = "demo_";
    public static final String DESC_PREFIX = "desc_";
    public static final int DEFAULT_CODER_TYPE = 1;

    DemographicAnswer DECLINE;

    int coderType;

    Iterator demo;

    private String ccsclass;
    private boolean optional;
    private int size;
    private boolean selectedOnly;
    private Map selectedValues;

    public Demographic() {
        super();
        init();
    }

    void init() {
        DECLINE = new DemographicAnswer();
        DECLINE.setDemographicAnswerId(0);
        DECLINE.setDemographicAnswerText("Decline to Answer");
        coderType = DEFAULT_CODER_TYPE;
        demo = null;
        ccsclass = null;
        optional = false;
        size = 1;
        selectedOnly = false;
        selectedValues = null;
    }

    public void setClass(String ccsclass) {
        this.ccsclass = ccsclass;
    }

    public void setOptional(String optional) {
        this.optional = optional != null && (optional.equalsIgnoreCase("yes") || optional.equalsIgnoreCase("true"));
    }

    public void setSize(String size) {
        this.size = Integer.parseInt(size);
    }

    public void setSelectedValues(Map selectedValues) {
        this.selectedValues = selectedValues;
    }

    public void setSelectedOnly(String selectedOnly) {
        this.selectedOnly = selectedOnly != null && (selectedOnly.equalsIgnoreCase("yes") || selectedOnly.equalsIgnoreCase("true"));
    }

    public void setCoderType(String coderType) {
        try {
            this.coderType = Integer.parseInt(coderType);
        } catch (Exception e) {
            this.coderType = DEFAULT_CODER_TYPE;
        }
    }

    public int doStartTag()
            throws JspException {
        demo = getDemographicAssignments().iterator();
        return doAfterBody();
    }

    public int doAfterBody()
            throws JspException {
        if (demo.hasNext()) {
            DemographicAssignment assignment = (DemographicAssignment) demo.next();
            DemographicQuestion question = assignment.getDemographicQuestion();
            String questionId = Integer.toString(question.getDemographicQuestionId());
            ArrayList answers = new ArrayList();
            answers.addAll(question.getDemographicAnswers());
            String answer = "";
            String description = "";
            if (question.getDemographicQuestionDesc() != null) {
                description = question.getDemographicQuestionDesc();
            }
            if (question.getSelectable().equals("N")) {
                answer = buildText(questionId);
                answer += buildDesc(question);
            } else {
                if (optional && !existingOptionalAnswer(question.getDemographicAnswers())) {
                    answers.add(DECLINE);
                }
                if (selectedOnly) {
                    answer = getSelected(answers, questionId);
                } else {
                    boolean multiple = question.getSelectable().equals("M");
                    answer = buildSelect(answers, questionId, multiple);
                    answer += buildDesc(question);
                }
            }
            pageContext.setAttribute(QUESTION_ID, Integer.toString(question.getDemographicQuestionId()), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(QUESTION, question.getDemographicQuestionText(), PageContext.PAGE_SCOPE);
            pageContext.setAttribute(ANSWER, answer, PageContext.PAGE_SCOPE);
            pageContext.setAttribute(DESCRIPTION, description, PageContext.PAGE_SCOPE);
            return EVAL_BODY_TAG;
        } else {
            if (bodyContent != null && bodyContent.getEnclosingWriter() != null) {
                try {
                    bodyContent.writeOut(bodyContent.getEnclosingWriter());
                } catch (Exception e) {
                    throw new JspException(e.toString());
                }
            }
            return SKIP_BODY;
        }
    }

    public int doEndTag()
            throws JspException {
        demo = null;
        return EVAL_PAGE;
    }

    ArrayList getDemographicAssignments()
            throws JspException {
        ArrayList demographicAssignments = new ArrayList();
        Context context = null;
        try {
            DataCache cache = Cache.get();
            demographicAssignments.addAll(cache.getDemographicAssignments(coderType));
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return demographicAssignments;
    }

    String getOptionValue(Object o) {
        return "" + ((DemographicAnswer) o).getDemographicAnswerId();
    }

    String getOptionText(Object o) {
        return ((DemographicAnswer) o).getDemographicAnswerText();
    }

    String getSelected(ArrayList options, String selectedKey) {
        String result = "";
        ArrayList selectedValueList = getSelectedValues(selectedKey);
        if (selectedValueList != null) {
            StringBuffer buf = new StringBuffer(200);
            for (int i = 0; i < selectedValueList.size(); i++) {
                String valueText = (String) selectedValueList.get(i);
                for (int j = 0; j < options.size(); j++) {
                    Object option = options.get(j);
                    String optionValue = getOptionValue(option);
                    String optionText = getOptionText(option);
                    if (valueText != null && optionValue != null && valueText.equals(optionValue)) {
                        if (i > 0) buf.append(", ");
                        buf.append(optionText);
                    }
                }
            }
            result = buf.toString();
        }
        return result;
    }


    String buildDesc(DemographicQuestion question)
            throws JspException {
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"hidden\"");
        s.append(" name=\"");
        s.append(DESC_PREFIX);
        s.append(question.getDemographicQuestionId());
        s.append("\"");
        if (question.getDemographicQuestionText() != null) {
            s.append(" value=\"");
            s.append(question.getDemographicQuestionText());
            s.append("\"");
        }
        s.append("\\>");
        return s.toString();
    }


    String buildText(String selectedKey)
            throws JspException {
        ArrayList selectedValueList = getSelectedValues(selectedKey);
        String valueText = null;
        if (selectedValueList != null) {
            valueText = (String) selectedValueList.get(0);
        }
        if (selectedOnly) return valueText;
        StringBuffer s = new StringBuffer(500);
        s.append("<input type=\"text\" size=\"40\" maxlength=\"255\"");
        if (selectedKey != null) {
            s.append(" name=\"");
            s.append(PREFIX);
            s.append(selectedKey);
            s.append("\"");
        }
        if (ccsclass != null) {
            s.append(" class=\"" + ccsclass + "\"");
        }
        if (valueText != null) {
            s.append(" value=\"");
            s.append(valueText);
            s.append("\"");
        }
        s.append("\\>");
        return s.toString();
    }


    String buildSelect(ArrayList options, String selectedKey, boolean multiple)
            throws JspException {
        HashSet selectedValueHash = null;
        ArrayList selectedValueList = getSelectedValues(selectedKey);
        if (selectedValueList != null) {
            selectedValueHash = new HashSet(selectedValueList);
        }
        //String selectedValue = getSelectedValue(selectedKey);

        StringBuffer s = new StringBuffer(2000);
        s.append("<select");
        if (selectedKey != null) {
            s.append(" name=\"");
            s.append(PREFIX);
            s.append(selectedKey);
            s.append("\"");
        }
        if (ccsclass != null) {
            s.append(" class=\"");
            s.append(ccsclass);
            s.append("\"");
        }
        if (multiple && size > 1) {
            s.append(" size=\"");
            s.append(size);
            s.append("\"");
        }
        if (multiple) {
            s.append(" multiple");
        }

        s.append(">\n");
        if (options != null) {
            //////////// BEG -ADDED BY SB ///////////////
            if (!multiple) s.append("<option value=\"\"></option>");
            //////////// END -ADDED BY SB ///////////////
            for (int i = 0; i < options.size(); i++) {
                Object option = options.get(i);
                String optionValue = getOptionValue(option);
                String optionText = getOptionText(option);
                s.append("<option value=\"");
                s.append(optionValue);
                s.append("\"");
                if (selectedValueHash != null && selectedValueHash.contains(optionValue)) {
                    s.append(" selected");
                }
                s.append(">");
                s.append(optionText);
                s.append("</option>\n");
            }
        }
        s.append("</select>\n");
        return s.toString();
    }


    private ArrayList getSelectedValues(String key) {
        if (selectedValues != null && key != null) {
            return (ArrayList) selectedValues.get(key);
        }
        return null;
    }

/*
    String getSelectedValue(String key)
    {
        if (selectedValues != null && key != null)
        {
            return (String) selectedValues.get(key);
        }
        return null;
    }
*/

    private boolean existingOptionalAnswer(ArrayList answers) {
        for (int i = 0; i < answers.size(); i++) {
            DemographicAnswer answer = (DemographicAnswer) answers.get(i);
            if (answer.getDemographicAnswerText().compareToIgnoreCase(DECLINE.getDemographicAnswerText()) == 0) {
                return true;
            }
        }
        return false;
    }

}
