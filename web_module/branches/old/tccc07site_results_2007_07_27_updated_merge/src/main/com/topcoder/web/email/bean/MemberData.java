package com.topcoder.web.email.bean;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.Serializable;
import java.io.StringReader;
import java.util.*;

/**
 * Bean to store information about an address list member
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 */

public class MemberData
        implements Serializable {
    private static Logger log = Logger.getLogger(MemberData.class);
    protected int id;
    // maps field names to values
    protected Map fieldValueMap;

    public MemberData() {
        fieldValueMap = new HashMap();
    }


    /**
     * This method validates the fields of this MemberData object.
     * Returns an empty ArrayList if there are no errors.  Otherwise
     * returns an ArrayList of error messages.
     *
     * @return ArrayList		list of error messages
     */

    public ArrayList validate() {
        ArrayList errors = new ArrayList();

        String emailAddress = (String) fieldValueMap.get(EmailConstants.EMAIL_ADDRESS_TAG);
        if (emailAddress == null) {
            errors.add("Required '" + EmailConstants.EMAIL_ADDRESS_TAG + "' field is not present.");
        } else {
            boolean emailValid = Utilities.isEmailAddressValid(emailAddress);

            if (!emailValid) {
                errors.add("'" + emailAddress + "' appears to be an invalid e-mail address.");
            }
        }

        return errors;
    }


    public void setId(String id) {
        try {
            this.id = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            this.id = 0;
        }
    }

    public String getId() {
        return "" + id;
    }


    /**
     * Returns a MemberData object constructed from the specified XML.
     * XML should be structured as follows:
     *
     * <member>
     *   <field0>value</field0>
     *   <field1>value</field1>
     *   ...
     * </member>
     *
     * where "member" is whatever EmailConstants.MEMBER_TAG is.  Throws an
     * Exception if something goes wrong in the parsing process.
     *
     * @param XML	the String containing the XML member data
     *
     * @return MemberData	the MemberData object represented by the XML
     *
     * @throws Exception
     */

    public static MemberData loadFromXML(String XML)
            throws Exception {
        MemberData memberData = new MemberData();

        // parse xml
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(false);
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(new InputSource(new StringReader(XML)));

        Node memberNode = doc.getElementsByTagName(EmailConstants.MEMBER_TAG).item(0);
        NodeList children = memberNode.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            retrieveFields(children.item(i), "", memberData);
        }

        return memberData;
    }

    /**
     * Follows all paths from the given node down to a leaf node, keeping
     * track of the path as it goes, and using that path as the field name
     * for the member data.
     *
     * @param node		the root Node
     * @param tagHierarchy	the path so far (tag names separated by /)
     * @param memberData	the MemberData object to add the field to
     *
     */

    private static void retrieveFields(Node node, String tagHierarchy, MemberData memberData) {
        if (node.getNodeType() == Node.ELEMENT_NODE) {
            // keep going down and updating the tagHierarchy...
            NodeList children = node.getChildNodes();
            for (int i = 0; i < children.getLength(); i++) {
                Node childNode = children.item(i);
                String newTagHierarchy = tagHierarchy;
                ;
                if (tagHierarchy.length() > 0) {
                    newTagHierarchy += EmailConstants.TAG_DELIMITER;
                }
                newTagHierarchy += node.getNodeName();
                retrieveFields(childNode, newTagHierarchy, memberData);
            }
        } else if (node.getNodeType() == Node.TEXT_NODE) {
            // we've found the value - but check if it's empty or not
            String value = node.getNodeValue().trim();
            if (value.length() > 0) {
                memberData.setValue(tagHierarchy, value);
            }
        }
    }


    public Map getFieldValueMap() {
        return fieldValueMap;
    }

    public String getValue(String field) {
        String value = (String) fieldValueMap.get(field);
        return (value == null ? "" : value);
    }

    public void setValue(String field, String value) {
        fieldValueMap.put(field, value);
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(2000);

        for (Iterator i = fieldValueMap.keySet().iterator(); i.hasNext();) {
            Object field = i.next();
            Object value = fieldValueMap.get(field);

            sb.append(field.toString());
            sb.append(": ");
            sb.append(value);
            sb.append("\n");
        }

        return sb.toString();
    }


    /**
     * Returns the member data as XML.
     *
     * @return String	member data as XML
     */

    public String toXML() {
        // maps tags to Tag objects - keyed by tagname (for example, "name" or "name/first")
        Map tagMap = new HashMap();

        XMLDocument memberXML = new XMLDocument(EmailConstants.MEMBER_TAG);

        for (Iterator i = fieldValueMap.keySet().iterator(); i.hasNext();) {
            String field = (String) i.next();

            String value = (String) fieldValueMap.get(field);

            List tagHierarchyList = Utilities.tokenize(field, EmailConstants.TAG_DELIMITER);

            RecordTag parentTag = memberXML;
            String tagHierarchy = "";
            for (Iterator j = tagHierarchyList.iterator(); j.hasNext();) {
                String nextTag = (String) j.next();
                if (tagHierarchy.length() > 0) {
                    tagHierarchy += EmailConstants.TAG_DELIMITER;
                }
                tagHierarchy += nextTag;

                // check if we've seen this tag yet
                RecordTag tag = (RecordTag) tagMap.get(tagHierarchy);
                // if not, create it.. make it a ValueTag if it's a leaf
                if (tag == null) {
                    if (!j.hasNext()) {
                        ValueTag valueTag = new ValueTag(nextTag, value);
                        parentTag.addTag(valueTag);
                    } else {
                        tag = new RecordTag(nextTag);
                        parentTag.addTag(tag);
                        tagMap.put(tagHierarchy, tag);
                    }
                }
                parentTag = tag;
            }
        }

        return memberXML.getXML(2);
    }
}
