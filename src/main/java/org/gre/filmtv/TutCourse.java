package org.gre.filmtv;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = TutCoursePK.class, versionField = "", table = "tutCourse")
@RooDbManaged(automaticallyDelete = true)
public class TutCourse {
}
