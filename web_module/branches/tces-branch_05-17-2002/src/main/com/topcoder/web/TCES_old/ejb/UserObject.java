package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the user table.
 * @see com.topcoder.web.TCES.ejb.User
 * @author Phil Selby, May 22nd, 2002
 */

public class UserObject 
  implements Serializable {
	public Long	user_id;
	public String	handle;
	public String	password;
	public String	status;
	public Integer	user_type_id;
	public String	email;
	public String	logged_in;
	public String	terms;
	public Date	last_login;
}
