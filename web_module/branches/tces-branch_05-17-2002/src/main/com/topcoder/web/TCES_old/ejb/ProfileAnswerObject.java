package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_answer table.
 * @see com.topcoder.web.TCES.ejb.ProfileAnswer
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileAnswerObject 
  implements Serializable {
	public Integer	answer_id;
	public Integer	question_id;
	public String	text;
}
