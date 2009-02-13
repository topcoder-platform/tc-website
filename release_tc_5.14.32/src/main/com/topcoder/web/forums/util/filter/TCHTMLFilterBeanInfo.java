package com.topcoder.web.forums.util.filter;

import com.jivesoftware.util.JiveBeanInfo;

/**
 * BeanInfo class for the TCHTML filter.
 */
public class TCHTMLFilterBeanInfo extends JiveBeanInfo  {

    public static final String [] PROPERTY_NAMES = {
        "onlyFilterBlocksEnabled",
        "blockStart",
        "blockEnd",
        "stripDisallowedTags",
        "allowSymbols",
        "allowedTagsString",
        "disallowedTagsString",
        "allowedAttributesString",
        "disallowedKeywordsString",
        "restrictImageWidth",
        "maxImageWidth"
    };

    public TCHTMLFilterBeanInfo() {
        super();
    }

    public Class getBeanClass() {
        return com.topcoder.web.forums.util.filter.TCHTMLFilter.class;
    }

    public String [] getPropertyNames() {
        return PROPERTY_NAMES;
    }

    public String getName() {
        return "TCHTMLFilter";
    }
}