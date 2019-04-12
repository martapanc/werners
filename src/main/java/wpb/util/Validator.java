package wpb.util;

import java.io.*;
import java.text.*;
import java.util.*;

public class Validator {
	
	private static final String EMAIL_REGEX = "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	private static Scanner in;
	
	
    public static boolean validateEmail(String s) {
    	
       return s.matches(EMAIL_REGEX);
    }

    public static Date parseDate(String dateStr) {
        Date d = null;
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd MMMM yyyy");
        try {
            d = sdf.parse(dateStr);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return d;
    }
	
}
