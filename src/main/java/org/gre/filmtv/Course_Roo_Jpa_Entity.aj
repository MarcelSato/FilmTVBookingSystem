// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.gre.filmtv.Course;

privileged aspect Course_Roo_Jpa_Entity {
    
    declare @type: Course: @Entity;
    
    declare @type: Course: @Table(name = "Course");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "courseID")
    private Integer Course.courseId;
    
    public Integer Course.getCourseId() {
        return this.courseId;
    }
    
    public void Course.setCourseId(Integer id) {
        this.courseId = id;
    }
    
}
