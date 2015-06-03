package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Tutor")
@RooDbManaged(automaticallyDelete = true)
public class Tutor {

    public static List<java.lang.Object[]> getTut(Object a) {
        TypedQuery<Object[]> queryTutor = entityManager().createQuery("SELECT o.tutorId, o.tutorName FROM Tutor AS o, TutCourse AS c, Course AS a WHERE o.tutorId = c.tutorId " + " AND a.courseId = c.courseId AND a.courseId = :var", Object[].class);
        queryTutor.setParameter("var", a);
        List<Object[]> tutors = queryTutor.getResultList();
        return (tutors);
    }

    public static String getTutorName(int tId) {
        return entityManager().createQuery("SELECT o.tutorName FROM Tutor o WHERE o.tutorId = :id", String.class).setParameter("id", tId).getSingleResult();
    }
}
