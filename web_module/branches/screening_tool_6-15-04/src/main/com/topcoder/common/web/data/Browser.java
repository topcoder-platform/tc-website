package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public final class Browser implements Serializable, TagRenderer {

    private String appCodeName;     //The coder name of the browser.
    private String appName;         //The application name of the browser.  Example: "Netscape", "Microsoft".
    private String appVersion;      //The platform and version of the browser.  Example: "3","4".
    private String language;        //The default language of the browser.  Navigator 4 only.
    private String mimeTypes[];     //The array of supported MIME types.  Javascript 1.1 Navigator only.
    private String platform;        //The operating system the browser is running under.  Javascript 1.2.
    private String plugins[];       //The array of installed plugins.  Javascript 1.1 Navigator only.
    private String systemLanguage;  //The default language of the underlying system.  IE4 only.
    private String userAgent;       //The HTTP user agent value.  Example: "Mac".
    private String userLanguage;    //The language of the current user.  IE4 only.

    public Browser() {
        appCodeName = "";
        appName = "";
        appVersion = "";
        language = "";
        mimeTypes = new String[0];
        platform = "";
        plugins = new String[0];
        systemLanguage = "";
        userAgent = "";
        userLanguage = "";
    }


    public boolean validBrowser() {
        return ((isNS() || isIE()) && getVersion() > 3);
    }

    public boolean isMac() {
        return (userAgent.indexOf("Mac") > -1);
    }

    public boolean isIE() {
        return (appName.indexOf("Microsoft") > -1);
    }

    public boolean isNS() {
        return (appName.indexOf("Netscape") > -1);
    }

    public int getVersion() {
        int result = 0;
        if (appVersion.length() > 0 && Character.isDigit(appVersion.charAt(0)))
            result = Integer.parseInt(new Character(appVersion.charAt(0)).toString());
        return result;
    }


    //Set
    public void setAppCodeName(String appCodeName) {
        this.appCodeName = appCodeName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public void setMimeTypes(String[] mimeTypes) {
        this.mimeTypes = mimeTypes;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public void setPlugins(String[] plugins) {
        this.plugins = plugins;
    }

    public void setSystemLanguage(String systemLanguage) {
        this.systemLanguage = systemLanguage;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public void setUserLanguage(String userLanguage) {
        this.userLanguage = userLanguage;
    }


    // Get
    public String getAppCodeName() {
        return this.appCodeName;
    }

    public String getAppName() {
        return this.appName;
    }

    public String getAppVersion() {
        return this.appVersion;
    }

    public String getLanguage() {
        return this.language;
    }

    public String[] getMimeTypes() {
        return this.mimeTypes;
    }

    public String getPlatform() {
        return this.platform;
    }

    public String[] getPlugins() {
        return this.plugins;
    }

    public String getSystemLanguage() {
        return this.systemLanguage;
    }

    public String getUserAgent() {
        return this.userAgent;
    }

    public String getUserLanguage() {
        return this.userLanguage;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Browser");
            result.addTag(new ValueTag("AppCodeName", appCodeName));
            result.addTag(new ValueTag("AppName", appName));
            result.addTag(new ValueTag("AppVersion", appVersion));
            result.addTag(new ValueTag("Language", language));
            RecordTag mimeTypeTags = new RecordTag("MimeTypes");
            for (int i = 0; i < mimeTypes.length; i++) {
                mimeTypeTags.addTag(new ValueTag("MimeType", mimeTypes[i]));
            }
            result.addTag(mimeTypeTags);
            result.addTag(new ValueTag("Platform", platform));
            RecordTag plugInTags = new RecordTag("Plugins");
            for (int i = 0; i < plugins.length; i++) {
                plugInTags.addTag(new ValueTag("Plugin", plugins[i]));
            }
            result.addTag(plugInTags);
            result.addTag(new ValueTag("SystemLanguage", systemLanguage));
            result.addTag(new ValueTag("UserAgent", userAgent));
            result.addTag(new ValueTag("UserLanguage", userLanguage));
        } catch (Exception e) {
            throw new Exception("common.Browser getXML ERROR: " + e);
        }
        return result;
    }
}

