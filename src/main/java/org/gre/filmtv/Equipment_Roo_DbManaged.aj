// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import org.gre.filmtv.Equipment;

privileged aspect Equipment_Roo_DbManaged {
    
    @Column(name = "name", length = 20)
    @NotNull
    private String Equipment.name;
    
    @Column(name = "description", length = 50)
    @NotNull
    private String Equipment.description;
    
    @Column(name = "level", length = 15)
    @NotNull
    private String Equipment.level;
    
    @Column(name = "quantity")
    @NotNull
    private Integer Equipment.quantity;
    
    @Column(name = "booked")
    @NotNull
    private Integer Equipment.booked;
    
    public String Equipment.getName() {
        return name;
    }
    
    public void Equipment.setName(String name) {
        this.name = name;
    }
    
    public String Equipment.getDescription() {
        return description;
    }
    
    public void Equipment.setDescription(String description) {
        this.description = description;
    }
    
    public String Equipment.getLevel() {
        return level;
    }
    
    public void Equipment.setLevel(String level) {
        this.level = level;
    }
    
    public Integer Equipment.getQuantity() {
        return quantity;
    }
    
    public void Equipment.setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    public Integer Equipment.getBooked() {
        return booked;
    }
    
    public void Equipment.setBooked(Integer booked) {
        this.booked = booked;
    }
    
}
