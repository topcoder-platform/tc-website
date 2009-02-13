package com.topcoder.web.common.tag;


public class TextAreaTag extends BaseTag {
    private int cols = -1;
    private int rows = -1;
    private String wrap = null;
    private String text = null;
    private String onChange = null;
    private String onKeyDown = null;
    private String onKeyUp = null;
    private boolean readOnly = false;
    private String styleClass = null;

    public int doStartTag() {
        StringBuffer ret = new StringBuffer(150);

        ret.append("<textarea ");
        if (id != null) {
            ret.append("id=\"").append(id).append("\" ");
        }
        if (cols >= 0) {
            ret.append("cols=\"").append(cols).append("\" ");
        }
        if (rows >= 0) {
            ret.append("rows=\"").append(rows).append("\" ");
        }
        if (wrap != null) {
            ret.append("wrap=\"").append(wrap).append("\" ");
        }
        if (name != null) {
            ret.append("name=\"").append(name).append("\" ");
        }
        if (onChange != null) {
            ret.append("onchange=\"").append(onChange).append("\" ");
        }
        if (onKeyDown != null) {
            ret.append("onkeydown=\"").append(onKeyDown).append("\" ");
        }
        if (onKeyUp != null) {
            ret.append("onkeyup=\"").append(onKeyUp).append("\" ");
        }
        if (styleClass != null) {
            ret.append("class=\"").append(styleClass).append("\" ");
        }
        if (readOnly) {
            ret.append("readonly");
        }
        ret.append(">");
        if (text == null) {
            text = getDefaultValue() == null ? null : getDefaultValue().toString();
        }
        if (text != null) {
            ret.append(text);
        }
        ret.append("</textarea>");

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

    public void setOnKeyDown(String onKeyDown) {
        this.onKeyDown = onKeyDown;
    }

    public void setOnKeyUp(String onKeyUp) {
        this.onKeyUp = onKeyUp;
    }

    public void setReadOnly(boolean readOnly) {
        this.readOnly = readOnly;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    protected void init() {
        this.cols = -1;
        this.rows = -1;
        this.wrap = null;
        this.text = null;
        this.onChange = null;
        this.onKeyDown = null;
        this.onKeyUp = null;
        this.readOnly = false;
        this.styleClass = null;
    }
}
