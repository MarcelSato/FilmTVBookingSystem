// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.gre.filmtv.Tutor;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Tutor_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Tutor.entityManager;
    
    public static final EntityManager Tutor.entityManager() {
        EntityManager em = new Tutor().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Tutor.countTutors() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Tutor o", Long.class).getSingleResult();
    }
    
    public static List<Tutor> Tutor.findAllTutors() {
        return entityManager().createQuery("SELECT o FROM Tutor o", Tutor.class).getResultList();
    }
    
    public static Tutor Tutor.findTutor(Integer tutorId) {
        if (tutorId == null) return null;
        return entityManager().find(Tutor.class, tutorId);
    }
    
    public static List<Tutor> Tutor.findTutorEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Tutor o", Tutor.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Tutor.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Tutor.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Tutor attached = Tutor.findTutor(this.tutorId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Tutor.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Tutor.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Tutor Tutor.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tutor merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}