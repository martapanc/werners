package wpb.entity;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "User")
public class User extends Restaurant {
  
	
    @Column(name = "full_name", nullable = false)
	private String fullName;
    
    //@ManyToOne(targetEntity = Role.class, fetch=FetchType.EAGER)
    //@JoinColumn(name = "role_id")
    @ManyToOne(cascade = CascadeType.REFRESH, optional=false)
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
    
    @Column(name = "avatar", nullable=false)
	private String avatar;
    
    @Column(name = "creation_date", nullable=false)
    private Timestamp creationDate;

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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullname) {
		this.fullName = fullname;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Timestamp getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Timestamp creation_date) {
		this.creationDate = creation_date;
	}

}
