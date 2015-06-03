package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Equipment")
@RooDbManaged(automaticallyDelete = true)
public class Equipment {

    public static List<java.lang.Object[]> findAllEquipmentByCat(Object a) {
        TypedQuery<Object[]> queryEquip = entityManager().createQuery("SELECT a FROM Equipment AS a, CatEqui AS b, Category AS c" + " WHERE c.categoryId = b.categoryId " + " AND b.equipmentId = a.equipmentId " + " AND c.categoryId = :var", Object[].class);
        queryEquip.setParameter("var", a);
        List<Object[]> equipment = queryEquip.getResultList();
        return (equipment);
    }

    public static List<java.lang.Object[]> getEquipmentDetails(Object a) {
        TypedQuery<Object[]> queryEquip = entityManager().createQuery("SELECT a FROM Equipment AS a WHERE a.equipmentId = :var", Object[].class);
        queryEquip.setParameter("var", a);
        List<Object[]> equipment = queryEquip.getResultList();
        return (equipment);
    }
}
