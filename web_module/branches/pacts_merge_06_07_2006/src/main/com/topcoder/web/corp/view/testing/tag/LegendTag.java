/*
 * LegendTag.java
 *
 * Created on June 6, 2005, 4:30 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.corp.view.testing.tag;

import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author rfairfax
 */
public class LegendTag extends TagSupport {
    
    private List colors = null;
    
    public void setColors(List l) {
        colors = l;
    }
    
    private List text = null;
    
    public void setText(List l) {
        text = l;
    }
    
    public int doStartTag() throws JspException {
        
        StringBuffer buffer = new StringBuffer("");
        
        //draw the start of the table
        buffer.append("<table class='graphLegend' cellspacing='0' cellpadding='0'><tr><td class='title' colspan='7'>Legend</td></tr>");
        
        for(int j = 0; j < colors.size(); j++) {
            buffer.append("<tr><td><div class='bar' style='background:" + colors.get(j) + "; width: 20px; height:10px' /></td><td class='label'>" + text.get(j) + "</td></tr>");
        }

        buffer.append("<tr><td align='center'><img src='/i/corp/arrow.gif' alt='' border='0'></td><td class='label'>Candidate's Score</td></tr>");
        
        buffer.append("</table>");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        
        return SKIP_BODY;
    }
}
