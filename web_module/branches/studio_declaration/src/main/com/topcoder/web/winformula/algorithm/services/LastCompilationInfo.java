/*
 * LastCompilationInfo
 * 
 * Created Aug 4, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class LastCompilationInfo {
    private String code;
    private int languageId;
    
    public LastCompilationInfo(int languageId, String code) {
        this.languageId = languageId;
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public int getLanguageId() {
        return languageId;
    }
}
