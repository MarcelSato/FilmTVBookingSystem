package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Course")
@RooDbManaged(automaticallyDelete = true)
public class Course {

    public static List<java.lang.Object[]> findAllCoursesByStudent(Object a) {
        TypedQuery<Object[]> queryCourse = entityManager().createQuery("SELECT o.courseId, o.courseCode, o.courseName FROM Course AS o, Student AS c, Programme AS a, ProgCourse AS b" + " WHERE c.studentId = :stuId " + " AND c.programmeId = a.programmeId " + " AND a.programmeId = b.programmeId " + " AND b.courseId = o.courseId", Object[].class);
        queryCourse.setParameter("stuId", a);
        List<Object[]> courses = queryCourse.getResultList();
        return courses;
    }

    public static String getCourseName(int cId) {
        return entityManager().createQuery("SELECT o.courseName FROM Course o WHERE o.courseId = :id", String.class).setParameter("id", cId).getSingleResult();
    }
}
