package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.DataValue;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.DataValue</code>
 * @author Greg Paul
 */
public class DataValueRenderer implements ElementRenderer {

    private DataValue dataValue;

    public DataValueRenderer() {
        this.dataValue = null;
    }

    public DataValueRenderer(DataValue dataValue) {
        this.dataValue = dataValue;
    }

    public void setElement(Element element) throws Exception {
        dataValue = (DataValue) element;
    }

    public String toHTML(Language language) {
        return BaseRenderer.encodeHTML(toPlainText(language));
    }

    public String toPlainText(Language language) {
        return breakIt(dataValue.encode());
    }
    
    private String breakIt(String s) {
        int breakLen = 80;
        StringBuffer out = new StringBuffer(s);
        char ch;
        if (s.length() > breakLen) {
            out = new StringBuffer(s.length());
            out.append("\n");
            if(s.charAt(0)=='{' && s.indexOf('"')==-1){
                //must be an int[]
                int last = 0;
                for(int i = 0; i<s.length(); i++){
                    ch = s.charAt(i);
                    if(ch==',' && out.length()-last > breakLen-12){
                        out.append(",\n ");
                        last = out.length();
                    }else{
                        out.append(ch);
                    }
                }
            }else{
                for (int i = 0; i < s.length(); i++) {
                    if (s.charAt(i) == '\"' && s.length() > i+1 && s.charAt(i + 1) == ',') {
                        out.append("\",\n ");
                        i += 2;
                    } else {
                        out.append(s.charAt(i));
                    }
                }
            }
        }
        return out.toString();
    }
}
