/*
 * GraphTag.java
 *
 * Created on May 31, 2005, 4:43 PM
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
public class GraphTag extends TagSupport {
    
    private String title = "";
    
    public void setTitle(String s) {
        title = s;
    }
    
    private String annotationText = "";
    
    public void setAnnotationText(String s) {
        annotationText = s;
    }
    
    private int annotation = -1;
    
    public void setAnnotation(int i ) {
        annotation = i;
    }
    
    private int graphAreaHeight = 300;
    
    public void setGraphAreaHeight(int v) {
        graphAreaHeight = v;
    }
    
    private int barWidth = 25;
    
    public void setBarWidth(int v) {
        barWidth = v;
    }
                
    private int yUnitSize = 1;
    
    private List colors = null;
    
    public void setColors(List l) {
        colors = l;
    }
            
    private int xAxisSections = 0;
    
    private List barValues = null;
    
    public void setBarValues(List l) {
        barValues = l;
    }
    
    public int doStartTag() throws JspException {
        //initialize / calc some values
        xAxisSections = colors.size();
        //find max value for y_unit_size
        int max = 0;
        for(int i = 0; i < xAxisSections; i++) {
            int b = ((Integer)barValues.get(i)).intValue();
            if(b > max)
                max = b;
        }
        
        StringBuffer buffer = new StringBuffer("");
        
        //draw the start of the table
        buffer.append("<table align='left' class='graph' cellspacing=0 cellpading=0>");
        
        //draw title
        if(!title.equals("")) {
            buffer.append("<tr>");
            buffer.append("<td class='title' colspan='" + ((xAxisSections)) + "'>");
            buffer.append(title);
            buffer.append("</td>");
            buffer.append("</tr>");
        }
        
        //draw out labels / bars
        buffer.append("<tr>");

        //draw out bars
        //divider

        for(int j = 0; j < xAxisSections; j++) {
            buffer.append("<td class='bucket'>");
            //calc height based on value
            int h = 0;
            double b = ((Integer)barValues.get(j)).doubleValue();
            if(b != 0) {
                h = (int)Math.floor((b / max) * (graphAreaHeight) );
            }
            if(h==0) {
                h = 2; //always draw something
            }
            
            if((annotation - 1) == j) {
                buffer.append("<img src='/i/corp/arrow.gif' alt='' border='0'/>");
            }
            
            buffer.append("<div class='label'>" + ((Integer)barValues.get(j)).intValue() + "</div>");
            buffer.append("<div class='bar' style='background:" + (String)colors.get(j) + "; width:" + barWidth + "px;height:" + h + "px'></div>");
            buffer.append("</td>");

        }

        buffer.append("</tr>");
                
        
        buffer.append("</table>");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        
        return SKIP_BODY;
    }
}
