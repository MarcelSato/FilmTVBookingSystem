// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.gre.filmtv.Course;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Course_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Course.entityManager;
    
    public static final EntityManager Course.entityManager() {
        EntityManager em = new Course().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Course.countCourses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Course o", Long.class).getSingleResult();
    }
    
    public static List<Course> Course.findAllCourses() {
        return entityManager().createQuery("SELECT o FROM Course o", Course.class).getResultList();
    }
    
    public static Course Course.findCourse(Integer courseId) {
        if (courseId == null) return null;
        return entityManager().find(Course.class, courseId);
    }
    
    public static List<Course> Course.findCourseEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Course o", Course.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Course.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Course.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Course attached = Course.findCourse(this.courseId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Course.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Course.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Course Course.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Course merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
