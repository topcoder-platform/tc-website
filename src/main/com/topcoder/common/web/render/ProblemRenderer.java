package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;
import java.awt.Color;


public class ProblemRenderer implements ElementRenderer {

    private Problem problem = null;   
    private Color backgroundColor = null; 
    private Color foregroundColor = null; 

    private static final String LEGAL = "This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2002, TopCoder, Inc.  All rights reserved.  ";

    public ProblemRenderer(Problem problem) {
        this.problem = problem;
    }
    
    public String toHTML(Language language) {
        StringBuffer html = new StringBuffer("<html>");
//        html.append("<body bgcolor=\"#000000\" text=\"#ffffff\">");
        html.append("<body");
        if (backgroundColor != null) {
            html.append(" bgcolor=\"#");
            html.append(rgbColor(backgroundColor));
            html.append("\"");
        }
        if (foregroundColor != null) {
            html.append(" text=\"#");
            html.append(rgbColor(foregroundColor));
            html.append("\"");
        }
        html.append(">");

        if (!problem.getProblemText().equals("")) {
            html.append(problem.getProblemText());
            html.append("<hr>");
        }
        ProblemComponent[] problemComponents = problem.getProblemComponents();
        for(int i = 0; i < problemComponents.length; i++) {
          html.append(new ProblemComponentRenderer(problemComponents[i]).toHTML(language));
          html.append("<hr>");
        }
        html.append("<p>");
        html.append(LEGAL);
        html.append("</p>");
        html.append("</body></html>");

        return html.toString();
    }
  
    public String toPlainText(Language language) {
        StringBuffer text = new StringBuffer(1000);

        if (!problem.getProblemText().equals("")) {
            text.append(problem.getProblemText());
            text.append("\n\n\n");
        }
        
        ProblemComponent[] problemComponents = problem.getProblemComponents();
        for(int i = 0; i < problemComponents.length; i++) {
          text.append(new ProblemComponentRenderer(problemComponents[i]).toPlainText(language));
          text.append("\n\n\n");
        }

        text.append(LEGAL);
        return text.toString();

    }


    private String rgbColor(Color c) {
        String red = lpad(Integer.toString(c.getRed(), 16), '0', 2);
        String green = lpad(Integer.toString(c.getGreen(), 16), '0', 2);
        String blue = lpad(Integer.toString(c.getBlue(), 16), '0', 2);
        return red+green+blue;
    }

    private String lpad(String s, char c, int len) {
        StringBuffer buf = new StringBuffer(len);
        for (int i=0; i<len-s.length(); i++) {
            buf.append(c);
        }
        buf.append(s);
        return buf.toString();
    }


    public void setBackgroundColor(Color backgroundColor) { 
        this.backgroundColor = backgroundColor;
    }

    public void setForegroundColor(Color foregroundColor) { 
        this.foregroundColor = foregroundColor;
    }
    /**
     * Utility function for encoding HTML entities in text.  All occurrences of the &lt;, &gt;,
     * and &amp; characters are converted to &amp;lt;, &amp;gt;, and &amp;amp;, respectively.
     */
    static public String encodeHTML(String text) {
        StringBuffer buf = new StringBuffer(text.length());

        for(int i = 0; i < text.length(); i++) {
            switch(text.charAt(i)) {
                case '&':
                    buf.append("&amp;");
                    break;
                case '<':
                    buf.append("&lt;");
                    break;
                case '>':
                    buf.append("&gt;");
                    break;
                case '"':
                    buf.append("&quot;");
                    break;
                default:
                    buf.append(text.charAt(i));
            }
        }
        return buf.toString();
    }

}
 
