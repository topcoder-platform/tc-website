package com.topcoder.web.tc.view.tag;

import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.tc.model.ProblemRatingQuestion;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import java.util.Iterator;
import java.util.List;

public class ProblemRatingInput extends BaseTag {
    public static final String QUESTION = "question";
    public static final String ID = "questionID";
    public static final String COUNTER = "counter";
    protected static Logger log = Logger.getLogger(AnswerInput.class);

    private int counter;
    private ProblemRatingQuestion question;

    public ProblemRatingInput(){
        super();
    }

    public void setQuestion(ProblemRatingQuestion question){
        this.question = question;
    }

    public ProblemRatingQuestion getQuestion(){
        return question;
    }

    public int doStartTag() throws JspException{
        pageContext.setAttribute(QUESTION,question.getQuestion());
        pageContext.setAttribute(ID,String.valueOf(question.getID()));
        counter = 0;
        int ret = doAfterBody();
        if(ret==SKIP_BODY){
            System.out.println("WTF");
        }
        System.out.println(ret);
        return ret;
    }
    
    public int doAfterBody() throws JspException{
        counter++;
        if(counter==11){
            return SKIP_BODY;
        }else{
            pageContext.setAttribute(COUNTER,String.valueOf(counter));
            return EVAL_BODY_TAG;
        }
    }
}
