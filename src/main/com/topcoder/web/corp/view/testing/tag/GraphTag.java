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
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author rfairfax
 */
public class GraphTag extends TagSupport {
    
    private static int GRAPH_AREA_HEIGHT = 180; //in pixels
    private static int Y_AXIS_SECTIONS = 6;
    private static String[] Y_AXIS_LABELS = new String[] { "6", "5", "4", "3", "2", "1" };
    private static int Y_UNIT_SIZE = 1;
            
    private static int X_AXIS_SECTIONS = 6;
    
    private static String[] X_AXIS_LABELS = new String[] { "1", "2", "3", "4", "5", "6" };
    
    private static int[] BAR_VALUES = new int[] { 1,2,3,4,5,6 };
    
    private static int BAR_WIDTH = 25; // in pixels
    
    public int doStartTag() throws JspException {
        StringBuffer buffer = new StringBuffer("");
        
        //draw the start of the table
        buffer.append("<table style='border:1px black solid;' cellspacing=0 cellpading=0>");
        
        //draw out labels / bars
        for(int i = 0; i < Y_AXIS_SECTIONS; i++) {
            buffer.append("<tr>");
            buffer.append("<td valign=center style='height:" + (GRAPH_AREA_HEIGHT / Y_AXIS_SECTIONS) + "px'>");
            buffer.append(Y_AXIS_LABELS[i]);
            buffer.append("</td>");
            
            if(i==0) {
                //draw out bars
                //divider
                buffer.append("<td style='height:" + GRAPH_AREA_HEIGHT + "px' rowspan='" + Y_AXIS_SECTIONS + "'><div style='width:1px;background:black;height:100%;'></div></td>");
                
                for(int j = 0; j < X_AXIS_SECTIONS; j++) {
                    buffer.append("<td valign='bottom' rowspan='" + Y_AXIS_SECTIONS + "' style='height:" + GRAPH_AREA_HEIGHT + "px' align=center>");
                    //calc height based on value
                    int h = 0;
                    if(BAR_VALUES[j] != 0) {
                        h = BAR_VALUES[j] * (GRAPH_AREA_HEIGHT / Y_AXIS_SECTIONS) - ((GRAPH_AREA_HEIGHT / Y_AXIS_SECTIONS) / 2);
                    }
                    buffer.append("<div style='background:blue; width:" + BAR_WIDTH + "px;height:" + h + "px'></div>");
                    buffer.append("</td>");
                    
                    buffer.append("<td valign='bottom' rowspan='" + Y_AXIS_SECTIONS + "' style='height:" + GRAPH_AREA_HEIGHT + "px' align=center>");
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
        buffer.append("<td colspan=" + (Y_AXIS_SECTIONS * 2) + ">");
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
        
        for(int i = 0; i < X_AXIS_SECTIONS; i++) {
            buffer.append("<td valign='bottom' >");
            buffer.append(X_AXIS_LABELS[i]);
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
