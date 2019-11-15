package wpb.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Methods for dealing with timestamps
 */
public class TimestampUtils {

	/**
	 * Return an ISO 8601 combined date and time string for specified date/time
	 * 
	 * @param date
	 *            Date
	 * @return String with format "yyyy-MM-dd'T'HH:mm:ss'Z'"
	 */
	public static String getISO8601String(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ITALIAN);
		dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+1:00"));
		return dateFormat.format(date);
	}
}
