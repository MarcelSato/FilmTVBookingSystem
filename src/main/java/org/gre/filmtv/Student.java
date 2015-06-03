package org.gre.filmtv;

import java.util.List;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Student")
@RooDbManaged(automaticallyDelete = true)
public class Student {

    public static List<org.gre.filmtv.Student> findAllStudentsUserNames() {
        return entityManager().createQuery("SELECT o.username FROM Student o", Student.class).getResultList();
    }

    public static String checkStudentLogin(String uName, String uPassword) {
        try {
            return entityManager().createQuery("SELECT o.name FROM Student o WHERE o.username = :uName AND o.password = :uPassword", String.class).setParameter("uName", uName).setParameter("uPassword", uPassword).getSingleResult();
        } catch (Exception nr) {
            return "error";
        }
    }

    public static Object getStuId(String uName, String uPassword) {
        try {
            return entityManager().createQuery("SELECT o.studentId FROM Student o WHERE o.username = :uName AND o.password = :uPassword", Object.class).setParameter("uName", uName).setParameter("uPassword", uPassword).getSingleResult();
        } catch (Exception nr) {
            return "error";
        }
    }
}
