// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.gre.filmtv.ProgCourse;
import org.gre.filmtv.ProgCoursePK;

privileged aspect ProgCourse_Roo_Jpa_Entity {
    
    declare @type: ProgCourse: @Entity;
    
    declare @type: ProgCourse: @Table(name = "progCourse");
    
    @EmbeddedId
    private ProgCoursePK ProgCourse.id;
    
    public ProgCoursePK ProgCourse.getId() {
        return this.id;
    }
    
    public void ProgCourse.setId(ProgCoursePK id) {
        this.id = id;
    }
    
}
