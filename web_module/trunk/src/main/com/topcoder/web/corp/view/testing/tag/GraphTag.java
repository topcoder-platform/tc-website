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
            
    private int yAxisSections = 0;
    
    public void setYAxisSections(int v) {
        yAxisSections = v;
    }
    
    private int yUnitSize = 1;
    
    private List xAxisLabels = null;
    
    public void setXAxisLabels(List l) {
        xAxisLabels = l;
    }
            
    private int xAxisSections = 0;
    
    private List barValues = null;
    
    public void setBarValues(List l) {
        barValues = l;
    }
    
    public int doStartTag() throws JspException {
        //initialize / calc some values
        xAxisSections = xAxisLabels.size();
        //find max value for y_unit_size
        int max = 0;
        for(int i = 0; i < xAxisSections; i++) {
            int b = ((Integer)barValues.get(i)).intValue();
            if(b > max)
                max = b;
        }
        
        yUnitSize = max / yAxisSections;
        if(yUnitSize < 1)
            yUnitSize = 1;
        
        while((yUnitSize * yAxisSections) < max) {
            yUnitSize++;
        }
        
        StringBuffer buffer = new StringBuffer("");
        
        //draw the start of the table
        buffer.append("<table style='border:1px black solid;' cellspacing=0 cellpading=0>");
        
        //draw title
        if(!title.equals("")) {
            buffer.append("<tr>");
            buffer.append("<td align=center colspan='" + (2 + (xAxisSections * 2)) + "'>");
            buffer.append(title);
            buffer.append("</td>");
            buffer.append("</tr>");
        }
        if(annotation != -1) {
            buffer.append("<tr>");
            buffer.append("<td>");
            buffer.append("&nbsp;");
            buffer.append("</td>");
            buffer.append("<td>");
            buffer.append("&nbsp;");
            buffer.append("</td>");
            for(int i = 0; i < xAxisSections; i++) {
                if(i == annotation) {
                    buffer.append("<td align=center>");
                    if(!annotationText.equals("")) {
                        buffer.append(annotationText);
                        buffer.append("<br>");
                    }
                    buffer.append("|<br>V");
                    buffer.append("</td>");
                } else {
                    buffer.append("<td>");
                    buffer.append("&nbsp;");
                    buffer.append("</td>");
                }
                
                buffer.append("<td>");
                buffer.append("&nbsp;");
                buffer.append("</td>");
            }
            buffer.append("</tr>");
        }
        
        //draw out labels / bars
        for(int i = 0; i < yAxisSections; i++) {
            buffer.append("<tr>");
            buffer.append("<td valign=top style='height:" + (graphAreaHeight / yAxisSections) + "px'>");
            buffer.append(yUnitSize * (yAxisSections - i));
            buffer.append("</td>");
            
            if(i==0) {
                //draw out bars
                //divider
                buffer.append("<td style='height:" + graphAreaHeight + "px' rowspan='" + yAxisSections + "'><div style='width:1px;background:black;height:100%;'></div></td>");
                
                for(int j = 0; j < xAxisSections; j++) {
                    buffer.append("<td valign='bottom' rowspan='" + yAxisSections + "' style='height:" + graphAreaHeight + "px' align=center>");
                    //calc height based on value
                    int h = 0;
                    double b = ((Integer)barValues.get(j)).doubleValue();
                    if(b != 0) {
                        h = (int)Math.floor((b / yUnitSize) * (graphAreaHeight / yAxisSections) );
                    }
                    buffer.append("<div style='background:blue; width:" + barWidth + "px;height:" + h + "px'></div>");
                    buffer.append("</td>");
                    
                    buffer.append("<td valign='bottom' rowspan='" + yAxisSections + "' style='height:" + graphAreaHeight + "px' align=center>");
                    buffer.append("&nbsp;");
                    buffer.append("</td>");
                }
            }
            
            buffer.append("</tr>");
        }
        
        //corner / bottom bar
        buffer.append("<tr>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");                            
        buffer.append("<td colspan=" + ((xAxisSections * 2)) + ">");
        buffer.append("<div style='height:1px;width=100%;background:black;'></div>");
        buffer.append("</td>");
        buffer.append("</tr>");
        
        //labels
        buffer.append("<tr>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");
        
        for(int i = 0; i < xAxisSections; i++) {
            buffer.append("<td valign='bottom' align='center' >");
            buffer.append((String)xAxisLabels.get(i));
            buffer.append("</td>");
            buffer.append("<td valign='bottom' style='width:10px'>");
            buffer.append("&nbsp;");
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
