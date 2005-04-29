package com.topcoder.web.tc.view.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.tag.BaseTag;

import javax.servlet.jsp.JspException;

public class Counter extends BaseTag {
    protected static Logger log = Logger.getLogger(AnswerInput.class);

    private int min;
    private int max;
    private int inc;
    private int cur;

    public Counter() {
        super();
        min = 1;
        max = 10;
        inc = 1;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setInc(int inc) {
        this.inc = inc;
    }

    public int getMin() {
        return min;
    }

    public int getMax() {
        return max;
    }

    public int getInc() {
        return inc;
    }

    public int doStartTag() throws JspException {
        if (max < min) {
            return wrapItUp();
        } else {
            cur = min;
            pageContext.setAttribute(getId(), String.valueOf(cur));
            return EVAL_BODY_TAG;
        }
    }

    public int doAfterBody() throws JspException {
        cur += inc;
        if (cur > max) {
            return wrapItUp();
        } else {
            pageContext.setAttribute(getId(), String.valueOf(cur));
            return EVAL_BODY_TAG;
        }
    }

    private int wrapItUp() throws JspException {
        if (bodyContent != null && bodyContent.getEnclosingWriter() != null) {
            try {
                bodyContent.writeOut(bodyContent.getEnclosingWriter());
            } catch (Exception e) {
                throw new JspException(e.toString());
            }
        }
        return SKIP_BODY;
    }

    protected void init() {
        this.min = 1;
        this.max = 10;
        this.inc = 1;
        this.cur = 0;

    }
}
