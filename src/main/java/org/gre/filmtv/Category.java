package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Category")
@RooDbManaged(automaticallyDelete = true)
public class Category {

    public static List<java.lang.Object[]> getCat(Object a) {
        TypedQuery<Object[]> queryCategory = entityManager().createQuery("SELECT a.categoryId, a.catName FROM Category AS a, Course AS b, CatCourse AS c " + " WHERE b.courseId = c.courseId " + " AND a.categoryId = c.categoryId " + " AND b.courseId = :var", Object[].class);
        queryCategory.setParameter("var", a);
        List<Object[]> categories = queryCategory.getResultList();
        return (categories);
    }
}
