/*
 * SkillInput.java
 *
 * Created on October 6, 2004, 9:47 AM
 */

package com.topcoder.web.tc.view.tag;

/**
 *
 * @author  rfairfax
 */

import com.topcoder.web.tc.model.Skill;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.*;
import java.io.IOException;

public class SkillInput extends BaseTag {
    protected static Logger log = Logger.getLogger(SkillInput.class);

    private String cssclass;
    private Skill skill;

    /** Creates a new instance of SkillInput */
    public SkillInput() {
        super();
        cssclass = null;
    }

     public void setClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public int doStartTag()
            throws JspException {
        if (skill != null) {
            StringBuffer output = new StringBuffer(1000);
            setName(Constants.SKILL_PREFIX+skill.getID());

            output.append(buildRadios());

            try {
                pageContext.getOut().print(output.toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }


    private String buildRadios() {
        StringBuffer s = new StringBuffer(2000);
        String checkVal = "0";
        try {
            int n = Integer.parseInt(String.valueOf(getDefaultValue()));
            if(n <= 5) {
                checkVal = String.valueOf(n);
            }
        } catch(Exception e) {}

        for(int i = 0; i <= 5; i++) {
            s.append("<td valign=top align=center ");
            if (cssclass != null) {
                s.append(" class=\"");
                s.append(cssclass);
                s.append("\"");
            }
            s.append(">\n");

            s.append("<input type=\"radio\" name=\"");
            s.append(name);
            s.append("\" value=\"");
            s.append(i);
            s.append("\" ");
            if(checkVal.equals(String.valueOf(i))) {
                s.append("checked ");
            }

            s.append("/>");
            s.append("</td>\n");
        }
        return s.toString();
    }

    protected void init() {
        this.cssclass=null;
        this.skill=null;

    }
}
