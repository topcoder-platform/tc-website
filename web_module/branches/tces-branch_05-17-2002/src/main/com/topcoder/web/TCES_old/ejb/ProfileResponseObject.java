package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_response table.
 * @see com.topcoder.web.TCES.ejb.ProfileResponse
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileResponseObject 
  implements Serializable {
	public Integer	response_id;
	public Integer	question_id;
	public Integer	profile_id;
	public Integer	answer_id;
	public String	text;
	public Integer	whatisthis;
	public Date	when;
}
