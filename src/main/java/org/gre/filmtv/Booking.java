package org.gre.filmtv;

import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(versionField = "", table = "Booking")
@RooDbManaged(automaticallyDelete = true)
public class Booking {

    public static List<org.gre.filmtv.Booking> findLastBooking() {
        return entityManager().createQuery("SELECT o FROM Booking o ORDER BY o.bookingId DESC", Booking.class).setMaxResults(1).getResultList();
    }

    public static List<org.gre.filmtv.Booking> findBookingsByStudent(Object a) {
        TypedQuery<Booking> queryCourse = entityManager().createQuery("SELECT o FROM Booking As o WHERE o.studentId = :stuId ", Booking.class);
        queryCourse.setParameter("stuId", a);
        List<Booking> bookings = queryCourse.getResultList();
        return bookings;
    }
}
