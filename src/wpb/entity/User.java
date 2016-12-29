package wpb.entity;

import javax.persistence.*;
import org.hibernate.validator.constraints.*;

@Entity
@Table(name = "User")
public class User extends Restaurant {
   
    @Column(name = "nick_name", nullable = false)
	private String nickName;
    
    @ManyToOne(targetEntity = Role.class)
    @JoinColumn(name = "role_id")
    private Role role;
    
	// @Email
	@Column(name = "email", nullable = false, unique=true)
	private String email;

	@Column(name = "password", nullable = false)
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
	@Column(name = "gender")
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

	public Role getUserType() {
		return role;
	}

	public void setUserType(Role userType) {
		this.role = userType;
	}

	public GenderType getGender() {
		return gender;
	}

	public void setGender(GenderType gender) {
		this.gender = gender;
	}

}
