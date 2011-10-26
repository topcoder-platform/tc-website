package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.dao.TCDAOUtil;
import com.topcoder.web.tc.model.Nomination;
import com.topcoder.web.tc.validation.NominationValidator;

/**
 * @author dok
 * @version $Revision: 63559 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class SubmitProfessorNomination extends ViewProfessorNomination {
    protected void profProcessing(Event e) throws Exception {

        String name = getRequest().getParameter(Constants.FULL_NAME);
        String school = getRequest().getParameter(Constants.SCHOOL_NAME);
        String url = getRequest().getParameter(Constants.URL);
        String field = getRequest().getParameter(Constants.FIELD_OF_INSTRUCTION);
        String otherField = getRequest().getParameter(Constants.OTHER_FIELD_OF_INSTRUCTION);
        String email = getRequest().getParameter(Constants.EMAIL);
        String text = getRequest().getParameter(Constants.NOMINATION_TEXT);

        ValidationResult nameResult = new NonEmptyValidator("Please enter your professor's name.").validate(new StringInput(name));
        if (!nameResult.isValid()) {
            addError(Constants.FULL_NAME, nameResult.getMessage());
        }

        ValidationResult schoolResult = new NonEmptyValidator("Please enter your professor's school.").validate(new StringInput(school));
        if (!schoolResult.isValid()) {
            addError(Constants.SCHOOL_NAME, schoolResult.getMessage());
        }

        ValidationResult fieldResult = new NonEmptyValidator("Please choose your professor's field of instruction.").validate(new StringInput(field));
        if (!fieldResult.isValid()) {
            addError(Constants.FIELD_OF_INSTRUCTION, fieldResult.getMessage());
        }

        if ("Other".equals(field)) {
            ValidationResult otherFieldResult = new NonEmptyValidator("Please enter your professor's field of instruction.").validate(new StringInput(otherField));
            if (!otherFieldResult.isValid()) {
                addError(Constants.OTHER_FIELD_OF_INSTRUCTION, otherFieldResult.getMessage());
            }
        }

        ValidationResult emailResult = new NonEmptyValidator("Please enter your professor's email address.").validate(new StringInput(email));
        if (!emailResult.isValid()) {
            addError(Constants.EMAIL, emailResult.getMessage());
        }

        ValidationResult textResult = new NominationValidator().validate(new StringInput(text));
        if (!textResult.isValid()) {
            addError(Constants.NOMINATION_TEXT, textResult.getMessage());
        }

        if (hasErrors()) {
            setDefault(Constants.FULL_NAME, name);
            setDefault(Constants.SCHOOL_NAME, school);
            setDefault(Constants.URL, url);
            setDefault(Constants.FIELD_OF_INSTRUCTION, field);
            setDefault(Constants.OTHER_FIELD_OF_INSTRUCTION, otherField);
            setDefault(Constants.EMAIL, email);
            setDefault(Constants.NOMINATION_TEXT, text);
            getRequest().setAttribute("event", e);
            setNextPage("/tournaments/tccc07/professor/nominationForm.jsp");
            setIsNextPageInContext(true);
        } else {
            Nomination n = new Nomination();
            n.setEvent(e);
            n.setEmailAddress(email);
            if ("Other".equals(field)) {
                n.setFieldOfInstruction(otherField);
            } else {
                n.setFieldOfInstruction(field);
            }
            n.setName(name);
            n.setNominator(DAOUtil.getFactory().getUserDAO().find(getUser().getId()));
            n.setSchoolName(school);
            if (!"".equals(StringUtils.checkNull(url).trim())) {
                n.setSchoolURL(url);
            }
            n.setText(text);
            TCDAOUtil.getFactory().getNominationDAO().saveOrUpdate(n);

            setNextPage("/tc?module=Static&d1=tournaments&d2=tccc07&d3=professor&d4=nominationSuccess");
            setIsNextPageInContext(false);
        }


    }
}
