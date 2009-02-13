package com.topcoder.web.common.model;

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.topcoder.shared.docGen.xml.XMLDocument;


/**
 * @author pulky
 */
public class AssignmentDocumentTemplate extends Base {

    private Long id;
    private String text;

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
            log.error("we got excepted trying to get transform xml assignment document to text");
            e.printStackTrace();
        }
    
        return null;

    }
}
