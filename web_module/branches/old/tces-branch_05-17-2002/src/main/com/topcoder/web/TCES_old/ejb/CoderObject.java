package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the coder table.
 * @see com.topcoder.web.TCES.ejb.Coder
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderObject 
  implements Serializable {
	public Long	coder_id;
	public String	state_code;
	public String	country_code;
	public String	first_name;
	public String	last_name;
	public String	home_phone;
	public String	work_phone;
	public String	address1;
	public String	address2;
	public String	city;
	public String	zip;
	public String	middle_name;
	public String	activation_code;
	public Date	member_since;
	public String	notify;
	public String	quote;
	public String	employer_search;
	public String	relocate;
	public Date	modify_date;
	public Integer	referral_id;
	public Integer	editor_id;
	public String	notify_inquiry;
	public Long	referral_user_id;
	public Integer	language_id;
	public Integer	coder_type_id;
	public Integer	image;
	public Date	date_of_birth;
}
