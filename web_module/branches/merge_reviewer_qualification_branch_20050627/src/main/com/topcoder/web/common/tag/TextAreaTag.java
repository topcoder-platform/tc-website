package com.topcoder.web.common.tag;


public class TextAreaTag extends BaseTag {
    private int cols = -1;
    private int rows = -1;
    private String wrap = null;
    private String text = null;
    private String onChange = null;
    private boolean readOnly = false;
    private String styleClass = null;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer(150);

        ret.append("<TEXTAREA ");
        if (cols >= 0) {
            ret.append("COLS=\"").append(cols).append("\" ");
        }
        if (rows >= 0) {
            ret.append("ROWS=\"").append(rows).append("\" ");
        }
        if (wrap != null) {
            ret.append("WRAP=\"").append(wrap).append("\" ");
        }
        if (name != null) {
            ret.append("NAME=\"").append(name).append("\" ");
        }
        if (onChange != null) {
            ret.append("ONCHANGE=\"").append(onChange).append("\" ");
        }
        if (styleClass != null) {
            ret.append("CLASS=\"").append(styleClass).append("\" ");
        }
        if (readOnly) {
            ret.append("READONLY");
        }
        ret.append(">");
        if (text == null) {
            text = getDefaultValue() == null ? null : getDefaultValue().toString();
        }
        if (text != null) {
            ret.append(text);
        }
        ret.append("</TEXTAREA>");

        try {
            pageContext.getOut().print(ret.toString());
        } catch (java.io.IOException ioe) {
        }
        return SKIP_BODY;
    }


    public void setCols(int cols) {
        this.cols = cols;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setWrap(String wrap) {
        this.wrap = wrap;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setOnChange(String onChange) {
        this.onChange = onChange;
    }

    public void setReadOnly(boolean readOnly) {
        this.readOnly = readOnly;
    }

    public void setClass(String styleClass) {
        this.styleClass = styleClass;
    }

    protected void init() {
        this.cols = -1;
        this.rows = -1;
        this.wrap = null;
        this.text = null;
        this.onChange = null;
        this.readOnly = false;
        this.styleClass = null;

    }
}
