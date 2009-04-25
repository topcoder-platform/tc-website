package com.topcoder.web.forums.util.filter;

import com.jivesoftware.util.JiveBeanInfo;

/**
 * BeanInfo class for the URLConverter filter.
 */
public class TCURLConverterBeanInfo extends JiveBeanInfo {

    public static final String [] PROPERTY_NAMES = {
        "newWindowEnabled",
        "shortenLinks",
        "longLinkLen",
        "charsBeforeEllipsis",
        "charsAfterEllipsis"
    };

    public TCURLConverterBeanInfo() {
        super();
    }

    public Class getBeanClass() {
        return com.topcoder.web.forums.util.filter.TCURLConverter.class;
    }

    public String [] getPropertyNames() {
        return PROPERTY_NAMES;
    }

    public String getName() {
        return "TCURLConverter";
    }
}