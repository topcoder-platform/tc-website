package com.topcoder.web.common.datafeed;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import org.xml.sax.helpers.AttributesImpl;

import javax.xml.transform.sax.TransformerHandler;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use only in connection with a TopCoder competition.
 * <p/>
 * This class takes command delimited data and turns it into a list of xml elements.
 * So, a,b,c will get written to the xml stream as
 * &lt;tagName&gt;a&lt;/tagName&gt;
 * &lt;tagName&gt;b&lt;/tagName&gt;
 * &lt;tagName&gt;c&lt;/tagName&gt;
 *
 * @author dok
 * @version $Id$
 *          Create Date: Apr 15, 2008
 */
public class CommaExpander implements RSCElement {
    private String field;
    private String tagName;
    private String childTagName;

    public CommaExpander(String columnName, String tagName, String childTagName) {
        this.field = columnName;
        this.tagName = tagName;
        this.childTagName = childTagName;
    }

    public void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception {
        hd.startElement("", "", tagName, new AttributesImpl());

        String value = row.getStringItem(field);
        if (value != null) {
            for (String s : value.split(",")) {
                hd.startElement("", "", childTagName, new AttributesImpl());
                hd.characters(s.toCharArray(), 0, s.length());
                hd.endElement("", "", childTagName);
            }
        }

        hd.endElement("", "", tagName);

    }
}
