// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.gre.filmtv.BookingEquipmentPK;

privileged aspect BookingEquipmentPK_Roo_Json {
    
    public String BookingEquipmentPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static BookingEquipmentPK BookingEquipmentPK.fromJsonToBookingEquipmentPK(String json) {
        return new JSONDeserializer<BookingEquipmentPK>().use(null, BookingEquipmentPK.class).deserialize(json);
    }
    
    public static String BookingEquipmentPK.toJsonArray(Collection<BookingEquipmentPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<BookingEquipmentPK> BookingEquipmentPK.fromJsonArrayToBookingEquipmentPKs(String json) {
        return new JSONDeserializer<List<BookingEquipmentPK>>().use(null, ArrayList.class).use("values", BookingEquipmentPK.class).deserialize(json);
    }
    
}