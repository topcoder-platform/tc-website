package com.topcoder.web.ejb.pacts.assignmentdocuments;

import java.io.Serializable;
import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.topcoder.shared.docGen.xml.XMLDocument;


/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 */
public class AssignmentDocumentTemplate implements Serializable, Cloneable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    private Long id;
    private String name;
    private String text;
    private Boolean current;

    public AssignmentDocumentTemplate() {
    }

    public AssignmentDocumentTemplate(Long id) {
        setId(id);
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param text the text to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * sets the current
     */
    public void setCurrent(Boolean current) {
        this.current = current;
    }

    /**
     * @return the current
     */
    public Boolean getCurrent() {
        return current;
    }

    public String transformTemplate(AssignmentDocument ad, XMLDocument tc) {
        try {
            TransformerFactory tFactory = TransformerFactory.newInstance();
            StringReader xmlIn = new StringReader(tc.getXML(false));
            StringReader xslIn = new StringReader(text);
            Source xmlSource = new StreamSource(xmlIn);
            Source xslSource = new StreamSource(xslIn);
            // Generate the transformer.
            Transformer transformer = tFactory.newTransformer(xslSource);
            // Perform the transformation, sending the output to the response.
            StringWriter res = new StringWriter();
            transformer.transform(xmlSource, new StreamResult(res));

            return res.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }
}
