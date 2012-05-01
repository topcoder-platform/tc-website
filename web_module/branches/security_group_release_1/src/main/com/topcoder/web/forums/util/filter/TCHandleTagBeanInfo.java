package com.topcoder.web.forums.util.filter;

import com.jivesoftware.util.JiveBeanInfo;

/**
 * BeanInfo class for the CodeHighlighter filter.
 */
public class TCHandleTagBeanInfo extends JiveBeanInfo {
    public static final String [] PROPERTY_NAMES = {
    };

    public TCHandleTagBeanInfo() {
        super();
    }

    public Class getBeanClass() {
        return com.topcoder.web.forums.util.filter.TCHandleTag.class;
    }

    public String [] getPropertyNames() {
        return PROPERTY_NAMES;
    }

    public String getName() {
        return "TCHandleTag";
    }
}