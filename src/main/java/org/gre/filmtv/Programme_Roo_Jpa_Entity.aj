// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.gre.filmtv.Programme;

privileged aspect Programme_Roo_Jpa_Entity {
    
    declare @type: Programme: @Entity;
    
    declare @type: Programme: @Table(name = "Programme");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "programmeID")
    private Integer Programme.programmeId;
    
    public Integer Programme.getProgrammeId() {
        return this.programmeId;
    }
    
    public void Programme.setProgrammeId(Integer id) {
        this.programmeId = id;
    }
    
}