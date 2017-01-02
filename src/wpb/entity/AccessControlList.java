package wpb.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import wpb.enums.Section;

@Entity
@Table(name = "access_control_list")
public class AccessControlList extends Restaurant {

    @Enumerated(value = EnumType.STRING)
    @Column(name = "section")
    private Section section;
            
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_TYPE_ID")
	@NotNull
    private Role role;
    
    @Column(name = "view_permission")
    private Boolean viewPermission;
    
    @Column(name = "insert_permission")
    private Boolean insertPermission;
    
    @Column(name = "update_permission")
    private Boolean updatePermission;
    
    @Column(name = "delete_Permission")
    private Boolean deletePermission;

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role userType) {
        this.role = userType;
    }

    public Boolean hasViewPermission() {
        return viewPermission;
    }

    public void setViewPermission(boolean canView) {
        this.viewPermission = canView;
    }

    public Boolean hasInsertPermission() {
        return insertPermission;
    }

    public void setInsertPermission(boolean canInsert) {
        this.insertPermission = canInsert;
    }

    public Boolean hasUpdatePermission() {
        return updatePermission;
    }

    public void setUpdatePermission(boolean canUpdate) {
        this.updatePermission = canUpdate;
    }

    public Boolean hasDeletePermission() {
        return deletePermission;
    }

    public void setDeletePermission(boolean canDelete) {
        this.deletePermission = canDelete;
    }

}
