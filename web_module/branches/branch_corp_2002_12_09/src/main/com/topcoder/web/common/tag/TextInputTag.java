package com.topcoder.web.common.tag;

public class TextInputTag extends BaseTag {
	private String value;
	private int size = -1;
	private int maxlength = -1;	
	
	public int doStartTag() {
		StringBuffer ret = new StringBuffer();
		try {
			ret.append("<input type=\"text\" name=\"").append(name).append("\" ");
			if( size >= 0 ) {
				ret.append("size=\"").append(size).append("\" ");
			}
			if( maxlength >= 0 ) {
				ret.append("maxlength=\"").append(maxlength).append("\" ");
			}

            if(value == null) {
                value = (String) getDefaultValue();
            }
			if( value != null ) {
				ret.append("value=\"").append(value).append("\" ");
			}
			ret.append("/>");
			pageContext.getOut().print(ret.toString());
		}
		catch (java.io.IOException ioe) {
		}
		return SKIP_BODY;
	}
	
	/**
	 * Sets the value.
	 * @param value The value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * Sets the maxlength.
	 * @param maxlength The maxlength to set
	 */
	public void setMaxlength(int maxlength) {
		this.maxlength = maxlength;
	}

	/**
	 * Sets the size.
	 * @param size The size to set
	 */
	public void setSize(int size) {
		this.size = size;
	}
}
