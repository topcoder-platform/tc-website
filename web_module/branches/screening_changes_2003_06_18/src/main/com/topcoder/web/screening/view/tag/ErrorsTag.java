package com.topcoder.web.screening.view.tag;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.topcoder.web.screening.common.Constants;

public class ErrorsTag extends TagSupport {
    private String name;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param name
     */
    public void setName( String val )
    {
        name = val;
    }

    /** 
     * Method specific to JSP Tags.  
     * Writes out the error messages in the errorMap if it exists.  If name
     * is set, writes out that specific one, if it doesn't then writes out
     * all errors in the map seperated by &lt;br&gt;
     * 
     * @return The JSP Tag specific return specifying the next action
     *          (Should always return SKIP_BODY)
     * @throws JspException Thrown if there is IO trouble writing out the tag.
     */
    public int doStartTag() throws JspException {
        ServletRequest request = pageContext.getRequest();

        Map errorMap = (Map)request.getAttribute(Constants.ERRORS);

        JspWriter out = pageContext.getOut();
        if(errorMap != null) {
            //print out all errors in a row
            try {

                if(name == null) {
                    for(Iterator i = errorMap.keySet().iterator(); 
                        i.hasNext();) {
                        Object key = i.next();
                        out.println(key + " - " + errorMap.get(key) + "<br>");
                    }
                }
                else {
                    if(errorMap.containsKey(name)) {
                        out.print(errorMap.get(name));
                    }
                }
            }
            catch(IOException e) {
                throw new JspException(e.getMessage());
            }
        }

        return SKIP_BODY;
    }
}
