package com.topcoder.web.common.tag;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;

abstract class PageTag extends TagSupport {
    public static final int DEFAULT_NROWS = 50;
    

    protected String servletPath = null;
    protected ResultSetContainer rsc = null;
    protected String styleClass = null;
    protected String text = getDefaultText();
    
    protected abstract int getPageDelta();
    protected abstract String getDefaultText();
    protected abstract boolean displayLink();
    
    
    public String getServletPath() {
        return servletPath;
    }
    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }
    public ResultSetContainer getList() {
        return rsc;
    }
    public void setList(ResultSetContainer rsc) {
        this.rsc = rsc;
    }
    public String getStyleClass() {
        return styleClass;
    }
    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }


    
    public int doStartTag() throws JspException {
        String tag;
        if (displayLink()) {
            tag = "<a href=\"" + getPageLink() + (styleClass != null? "\" class=\""+ styleClass + "\"": "") + ">" + getText() + "</a>"; 
        } else {
            tag = getText();
        }

        try {
            pageContext.getOut().print(tag);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
    
    @SuppressWarnings("unchecked")
    private String getPageLink() {
        HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
        
        Integer srObj = (Integer) defaults.get(DataAccessConstants.START_RANK);
        Integer nrObj = (Integer) defaults.get(DataAccessConstants.NUMBER_RECORDS);

        int sr = srObj == null? 1 : srObj;
        int nr = nrObj == null? DEFAULT_NROWS : nrObj;
  
        sr += nr * getPageDelta(); 
        if (sr < 1) sr = 1;
        
        StringBuffer buf = new StringBuffer(100);
        buf.append(servletPath + "?");
        
        add(buf, DataAccessConstants.START_RANK, sr + "");
        add(buf, DataAccessConstants.NUMBER_RECORDS, nr + "");
        
        
        for (Enumeration<String> e = pageContext.getRequest().getParameterNames(); e.hasMoreElements();) {
            String key = e.nextElement();
            
            if (key.equals(DataAccessConstants.START_RANK) || key.equals(DataAccessConstants.NUMBER_RECORDS)) continue;
            
            for(String value : pageContext.getRequest().getParameterValues(key)) {
                add(buf, key, value);
            }
        }
        return buf.toString();
    }

    private void add(StringBuffer buf, String key, String val) {
        if (val != null) {
            buf.append("&amp;");
            buf.append(key);
            buf.append("=");
            buf.append(val);
        }
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.servletPath = null;
        this.rsc = null;
        return super.doEndTag();
    }
}

