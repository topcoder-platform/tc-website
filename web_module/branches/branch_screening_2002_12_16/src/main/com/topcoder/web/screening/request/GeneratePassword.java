package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.CandidateInfo;

public class GeneratePassword extends BaseProcessor {
    private final int maxPasswordSize;

    public GeneratePassword() {
        maxPasswordSize = Integer.parseInt(Constants.MAX_PASSWORD_SIZE);
    }

    public void process() throws Exception {
        CandidateInfo info = new CandidateInfo();

        info.setPassword(generatePassword());

        getRequest().setAttribute(Constants.CANDIDATE_INFO, info);

        setNextPage(Constants.CANDIDATE_SETUP_PAGE);
        setNextPageInContext(true);
    }

    private String generatePassword() {
        StringBuffer newPass = new StringBuffer();
        for(int i = 0; i < maxPasswordSize; ++i) {
            newPass.append(
                Constants.VALID_CHAR_LIST.charAt(
                    rand(Constants.VALID_CHAR_LIST.length())));
        }
        
        return newPass.toString();
    }

    private int rand(int max) {
        return (int)Math.floor(Math.random()*max);
    }
}
