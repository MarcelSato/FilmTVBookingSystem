package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = BookingEquipmentPK.class, versionField = "", table = "bookingEquipment")
@RooDbManaged(automaticallyDelete = true)
public class BookingEquipment {

    public static List<org.gre.filmtv.BookingEquipment> findEquipByBookingId() {
        TypedQuery<BookingEquipment> queryBE = entityManager().createQuery("SELECT o FROM BookingEquipment o", BookingEquipment.class);
        List<BookingEquipment> bes = queryBE.getResultList();
        return bes;
    }
}
