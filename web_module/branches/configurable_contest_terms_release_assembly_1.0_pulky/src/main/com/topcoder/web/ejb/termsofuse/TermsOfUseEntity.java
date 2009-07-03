package com.topcoder.web.ejb.termsofuse;

import java.io.Serializable;

public class TermsOfUseEntity implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * 
     */
    private Long termsOfUseId;
    
    /**
     * 
     */
    private String termsText;
    
    /**
     * 
     */
    private Integer termsOfUseTypeId;
    
    /**
     * 
     */
    private String title;
    
    /**
     * 
     */
    private Integer electronicallySignable;
    
    /**
     * 
     */
    private String url;

    /**
     * 
     */
    public TermsOfUseEntity() {
        super();
    }

    /**
     * @param electronicallySignable
     * @param termsOfUseId
     * @param termsOfUseTypeId
     * @param termsText
     * @param title
     * @param url
     */
    public TermsOfUseEntity(Long termsOfUseId, String termsText, Integer termsOfUseTypeId,
             String title, Integer electronicallySignable, String url) {
        super();
        this.electronicallySignable = electronicallySignable;
        this.termsOfUseId = termsOfUseId;
        this.termsOfUseTypeId = termsOfUseTypeId;
        this.termsText = termsText;
        this.title = title;
        this.url = url;
    }

    /**
     * @return the termsOfUseId
     */
    public Long getTermsOfUseId() {
        return termsOfUseId;
    }
    
    /**
     * @param termsOfUseId the termsOfUseId to set
     */
    public void setTermsOfUseId(Long termsOfUseId) {
        this.termsOfUseId = termsOfUseId;
    }
    
    /**
     * @return the termsText
     */
    public String getTermsText() {
        return termsText;
    }
    
    /**
     * @param termsText the termsText to set
     */
    public void setTermsText(String termsText) {
        this.termsText = termsText;
    }
    
    /**
     * @return the termsOfUseTypeId
     */
    public Integer getTermsOfUseTypeId() {
        return termsOfUseTypeId;
    }
    
    /**
     * @param termsOfUseTypeId the termsOfUseTypeId to set
     */
    public void setTermsOfUseTypeId(Integer termsOfUseTypeId) {
        this.termsOfUseTypeId = termsOfUseTypeId;
    }
    
    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }
    
    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    /**
     * @return the electronicallySignable
     */
    public Integer getElectronicallySignable() {
        return electronicallySignable;
    }
    
    /**
     * @param electronicallySignable the electronicallySignable to set
     */
    public void setElectronicallySignable(Integer electronicallySignable) {
        this.electronicallySignable = electronicallySignable;
    }
    
    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }
    
    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }
}
