package com.topcoder.web.privatelabel.model;

import java.util.List;
import java.util.ArrayList;

public class DemographicResponse extends Base {
    private long questionId;
    private long answerId;
    private String text;

    public DemographicResponse() {}

    public Object clone() throws OutOfMemoryError {
        DemographicResponse ret = new DemographicResponse();
        ret.setQuestionId(questionId);
        ret.setText(text);
        ret.setAnswerId(answerId);
        return ret;
    }
    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
