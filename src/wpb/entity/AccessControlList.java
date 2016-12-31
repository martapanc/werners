package wpb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import wpb.enums.Section;

@Entity
@Table(name = "access_control_list")
public class AccessControlList {

    @Enumerated(value = EnumType.STRING)
    @Column(name = "section")
    private Section section;
            
    @ManyToOne(targetEntity = Role.class)
    @JoinColumn(name = "user_type_id")
    private Role role;
    
    @Column(name = "view_permission")
    private boolean viewPermission;
    
    @Column(name = "insert_permission")
    private boolean insertPermission;
    
    @Column(name = "update_permission")
    private boolean updatePermission;
    
    @Column(name = "delete_Permission")
    private boolean deletePermission;

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

    public boolean hasViewPermission() {
        return viewPermission;
    }

    public void setViewPermission(boolean canView) {
        this.viewPermission = canView;
    }

    public boolean hasInsertPermission() {
        return insertPermission;
    }

    public void setInsertPermission(boolean canInsert) {
        this.insertPermission = canInsert;
    }

    public boolean hasUpdatePermission() {
        return updatePermission;
    }

    public void setUpdatePermission(boolean canUpdate) {
        this.updatePermission = canUpdate;
    }

    public boolean hasDeletePermission() {
        return deletePermission;
    }

    public void setDeletePermission(boolean canDelete) {
        this.deletePermission = canDelete;
    }

}
