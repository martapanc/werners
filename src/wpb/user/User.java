package wpb.user;

import javax.persistence.*;
import org.hibernate.validator.constraints.*;

import wpb.Restaurant;

@Entity
@Table(name = "User")
public class User extends Restaurant {
   
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

}
