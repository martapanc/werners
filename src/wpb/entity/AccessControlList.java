package wpb.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import wpb.enums.Permission;

@Entity
@Table(name = "access_control_list")
public class AccessControlList {

    @Enumerated(value = EnumType.STRING)
    @Column(name = "permission")
    private Permission permission;
    
    @ManyToOne(targetEntity = UserType.class)
    @JoinColumn(name = "user_type_id")
    private UserType userType;
    
    @Column(name = "can_view")
    private boolean canView;
    
    @Column(name = "can_insert")
    private boolean canInsert;
    
    @Column(name = "can_update")
    private boolean canUpdate;
    
    @Column(name = "can_delete")
    private boolean canDelete;

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public boolean isCanView() {
        return canView;
    }

    public void setCanView(boolean canView) {
        this.canView = canView;
    }

    public boolean isCanInsert() {
        return canInsert;
    }

    public void setCanInsert(boolean canInsert) {
        this.canInsert = canInsert;
    }

    public boolean isCanUpdate() {
        return canUpdate;
    }

    public void setCanUpdate(boolean canUpdate) {
        this.canUpdate = canUpdate;
    }

    public boolean isCanDelete() {
        return canDelete;
    }

    public void setCanDelete(boolean canDelete) {
        this.canDelete = canDelete;
    }

}
