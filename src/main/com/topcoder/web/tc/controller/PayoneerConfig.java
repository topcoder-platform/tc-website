package com.topcoder.web.tc.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public enum PayoneerConfig {
    INSTANCE(
            PayoneerConfig.getString("base_api_url"),
            PayoneerConfig.getString( "partner_id"),
            PayoneerConfig.getString( "program_id"),
            PayoneerConfig.getString("username"),
            PayoneerConfig.getString("password"),
            PayoneerConfig.getString("login_url"),
            Boolean.valueOf( PayoneerConfig.getString("enable_v4")),
            Arrays.asList(Optional.ofNullable(StringUtils.split( PayoneerConfig.getString("v4_users"), ',')).orElse(new String[0]))
    );


    private String baseApiUrl = "";
    private String partnerId = "";
    private String programId = "";
    private String username = "";
    private String password = "";
    private String loginUrl = "";
    private boolean v4Enabled = false;
    private List v4Users = null;
    private PayoneerConfig(String baseApiUrl, String partnerId, String programId, String username, String password, String loginUrl, boolean v4Enabled, List v4Users){
        this.baseApiUrl=baseApiUrl;
        this.partnerId=partnerId;
        this.programId=programId;
        this.username=username;
        this.password=password;
        this.loginUrl=loginUrl;
        this.v4Enabled=v4Enabled;
        this.v4Users=v4Users;
    }

    public String getBaseApiUrl() {
        return baseApiUrl;
    }

    public String getPartnerId() {
        return partnerId;
    }

    public String getProgramId() {
        return programId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getLoginUrl() {
        return loginUrl;
    }

    public boolean isV4Enabled() {
        return v4Enabled;
    }

    public List getV4Users() {
        return v4Users;
    }
    private static Logger log = Logger.getLogger(PayoneerConfig.class);
    private static String getString(String str)  {

        try {
            return ConfigManager.getInstance().getString("com.topcoder.web.tc.controller.PayoneerService", "base_api_url");
        } catch (UnknownNamespaceException e) {
            log.error("UnknownNamespaceException while trying to initialize PayoneerConfig singleton",e);
            throw new RuntimeException(e);
        }

    }


}
