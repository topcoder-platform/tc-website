package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class UserObject
        implements Serializable {
    public Integer user_id;
    public String handle;
    public String password;
    public String status;
    public Integer user_type_id;
    public String email;
    public String logged_in;
    public String terms;
    public Date last_login;
    public Integer path_id;
}
