package wpb.user;

import java.lang.reflect.Field;

import javax.persistence.*;
import org.hibernate.validator.constraints.*;

@Entity
@Table(name = "User")
public class User {

    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;
    
    @NotBlank
    @Column(name = "nick_name", unique = true, nullable = false)
	private String nickName;
	
    @Email
    @Column(name = "email")
	private String email;
    
    @Column(name = "password") 	
	private String password;
	
    @Column(name = "points") 	
	private int points;
	
    @Column(name = "billing_address")
	private String billingAddress;
	
    @Column(name = "phone_number")
	private String phoneNumber;
	
    @Column(name = "vip_status")
	private boolean vipStatus;

	@Enumerated(EnumType.STRING)
	@Column(name = "gender", nullable = false)
	private GenderType gender;

	public enum GenderType {
		female, male
	};

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public String getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public boolean isVipStatus() {
		return vipStatus;
	}

	public void setVipStatus(boolean vipStatus) {
		this.vipStatus = vipStatus;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickname) {
		this.nickName = nickname;
	}

	@Override
    //<editor-fold defaultstate="collapsed" desc="toString override">
    public String toString() {
        StringBuilder result = new StringBuilder();
        String newLine = System.getProperty("line.separator");

        result.append(this.getClass().getName());
        result.append(" {");
        result.append(newLine);

        //determine fields declared in this class only (no fields of superclass)
        Field[] fields = this.getClass().getDeclaredFields();

        //print field names paired with their values
        for (Field field : fields) {
            result.append("  ");
            try {
                result.append(field.getName());
                result.append(": ");
                //requires access to private field:
                result.append(field.get(this));
            } catch (IllegalAccessException ex) {
                System.out.println(ex);
            }
            result.append(newLine);
        }
        result.append("}");

		return result.toString();
	}
}
