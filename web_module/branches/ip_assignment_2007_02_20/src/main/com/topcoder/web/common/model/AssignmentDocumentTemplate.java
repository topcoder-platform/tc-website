package com.topcoder.web.common.model;

import java.io.StringReader;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.UserProfileBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserDemographics;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile;


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

    public String transformTemplate(AssignmentDocument ad) {
        try {
            UserProfileBean upb = new UserProfileBean();
            UserProfile profile = upb.getUserProfile(ad.getUser().getId().longValue());

            //first we must form the xml from the info
            XMLDocument tc = new XMLDocument("TC");

            RecordTag a = new RecordTag("AssignmentDocument");

            
            a.addTag(new ValueTag("first_name", profile.getFirstName()));
            a.addTag(new ValueTag("last_name", profile.getLastName()));
            a.addTag(new ValueTag("address1", profile.getAddress1()));
            a.addTag(new ValueTag("address2", profile.getAddress2()));
            a.addTag(new ValueTag("address3", profile.getAddress3()));
            a.addTag(new ValueTag("city", profile.getCity()));
            a.addTag(new ValueTag("state_name", profile.getState()));
            a.addTag(new ValueTag("zip", profile.getZip()));
            a.addTag(new ValueTag("province", profile.getProvince()));
            a.addTag(new ValueTag("country_name", profile.getCountry()));

            // now fill in the holes with the user profile
            a.addTag(new ValueTag("email", profile.getEmail()));
            a.addTag(new ValueTag("home_phone", profile.getHomePhone()));
            a.addTag(new ValueTag("work_phone", profile.getWorkPhone()));
            a.addTag(new ValueTag("handle", profile.getHeader().getHandle()));
            a.addTag(new ValueTag("coder_type_desc", profile.getCoderTypeDesc()));

            Calendar date = Calendar.getInstance();
            date.setTime(new Date());
            a.addTag(new ValueTag("current_date", new SimpleDateFormat("MM/dd/yyyy").format(date.getTime())));
    
            tc.addTag(a);
    
            log.info(tc.getXML(false, 2));

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
