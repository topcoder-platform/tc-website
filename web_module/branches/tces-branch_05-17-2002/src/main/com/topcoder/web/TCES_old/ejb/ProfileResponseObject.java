package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

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
